local model_name = "gpt-4o"
local url = "https://api.openai.com/v1/chat/completions"
local api_key_name = "OPENAI_API_KEY"
local system_prompt = "You are my helpful assistant coder. Try to be as non-verbose as possible and stick to the important things. Avoid describing your own code unnecessarily, I only want you to output code mainly and limit describing it."

local function openai_data_handler(data_stream)
    if data_stream:match '"delta":' then
        local json = vim.json.decode(data_stream)
        if json.choices and json.choices[1] and json.choices[1].delta then
            return json.choices[1].delta.content
        end
    end
end

local function make_openai_curl_args(history, prompt)
    local api_key = os.getenv(api_key_name)
    local data = {
        messages = { { role = 'system', content = system_prompt }, { role = 'user', content = history .. prompt } },
        model = model_name,
        temperature = 0.7,
        stream = true,
    }
    local args = { '-N', '-X', 'POST', '-H', 'Content-Type: application/json', '-d', vim.json.encode(data) }
    if api_key then
        table.insert(args, '-H')
        table.insert(args, 'Authorization: Bearer ' .. api_key)
    end
    table.insert(args, url)
    return args
end

require("jarvis").setup({
    cache_limit=1000,
    data_handler=openai_data_handler,
    make_curl_args=make_openai_curl_args,
})

vim.keymap.set({ 'n', 'v' }, '<leader>lc', function() require("jarvis").interact("chat") end, { desc = 'ask jarvis' })
vim.keymap.set({ 'n', 'v' }, '<leader>la', function() require("jarvis").interact("prompt") end, { desc = 'ask jarvis' })
