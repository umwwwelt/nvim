local curl = require("plenary.curl")

local function get_openai_budget()
	local openai_admin_key = os.getenv("OPENAI_ADMIN_KEY")

	if not openai_admin_key then
		return "🔒 OPENAI_ADMIN_KEY non défini"
	end

	local today = os.time()
	local first_day = os.time({ year = os.date("%Y"), month = os.date("%m"), day = 1 })

	-- Mettre à jour l'URL pour utiliser le bon endpoint
	local usage_url = "https://api.openai.com/v1/organization/usage/completions?start_time="
		.. first_day
		.. "&end_time="
		.. today

	local usage_resp = curl.get(usage_url, {
		headers = {
			["Authorization"] = "Bearer " .. openai_admin_key,
		},
	})

	local ok1, usage_json = pcall(vim.fn.json_decode, usage_resp.body or "")

	-- print(vim.inspect(usage_json))
	if not ok1 then
		return "⚠️ Erreur décodage JSON OpenAI"
	end

	-- Initialiser les compteurs de tokens
	local total_input_tokens = 0
	local total_output_tokens = 0

	-- Itérer sur tous les éléments du tableau data
	for _, item in ipairs(usage_json.data) do
		if item.results and item.results[1] then
			local result = item.results[1]
			total_input_tokens = total_input_tokens + (result.input_tokens or 0)
			total_output_tokens = total_output_tokens + (result.output_tokens or 0)
		end
	end

	-- Calculer le coût total
	local cost_per_million_input = 2.5
	local cost_per_million_output = 10.0

	local cost_input = (total_input_tokens / 1e6) * cost_per_million_input
	local cost_output = (total_output_tokens / 1e6) * cost_per_million_output
	local total_cost = cost_input + cost_output

	if total_input_tokens + total_output_tokens == 0 then
		return "⚠️ Données de facturation indisponibles"
	end

	return string.format("💰 OpenAI : %.2f $", total_cost)
end

local function get_anthropic_budget()
	local anthropic_admin_key = os.getenv("ANTHROPIC_ADMIN_KEY")

	if not anthropic_admin_key then
		return "🔒 ANTHROPIC_ADMIN_KEY non défini"
	end

	-- Obtenir le premier jour du mois courant
	local today = os.date("*t")
	local first_day = os.date("%Y-%m-01")
	local last_day = os.date("%Y-%m-%d")

	-- L'endpoint correct de l'API Anthropic pour les coûts
	local usage_url = "https://api.anthropic.com/v1/usage_summary"
		.. "?start_date="
		.. first_day
		.. "&end_date="
		.. last_day

	local usage_resp = curl.get(usage_url, {
		headers = {
			["x-api-key"] = anthropic_admin_key,
			["anthropic-version"] = "2024-01-01", -- Mise à jour de la version de l'API
		},
	})

	local ok, usage_json = pcall(vim.fn.json_decode, usage_resp.body or "")

	print(vim.inspect(usage_json))
	if not ok then
		return "⚠️ Erreur décodage JSON Anthropic"
	end

	-- Les prix sont en crédits par 1K tokens (approximatif, à ajuster selon les tarifs réels)
	local cost_per_k_input = 0.0025 -- $0.0025 par 1K tokens input (Claude-3)
	local cost_per_k_output = 0.008 -- $0.008 par 1K tokens output (Claude-3)

	local total_cost = 0
	if usage_json.total_usage then -- Changement de la structure JSON
		total_cost = usage_json.total_usage.amount_usd or 0
	end

	if total_cost == 0 then
		return "⚠️ Données de facturation Anthropic indisponibles"
	end

	return string.format("🤖 Anthropic : %.2f $", total_cost)
end

-- Fonction qui combine les deux budgets
local function get_total_budget()
	local openai_result = get_openai_budget()
	local anthropic_result = get_anthropic_budget()

	return openai_result .. "\n" .. anthropic_result
end

return {
	get_openai_budget = get_openai_budget,
	get_anthropic_budget = get_anthropic_budget,
	get_total_budget = get_total_budget,
}
