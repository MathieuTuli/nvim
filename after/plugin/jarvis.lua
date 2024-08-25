-- local model_name = "gpt-4o"
local model_name = "claude-3-5-sonnet-20240620"
-- local url = "https://api.openai.com/v1/chat/completions"
-- local url = "https://api.anthropic.com/v1/messages"
local url = "localhost:8080/v1/chat/completions"
local api_key_name = "ANTHROPIC_API_KEY"
local system_prompt = "You are my helpful assistant coder. Try to be as non-verbose as possible and stick to the important things. Avoid describing your own code unnecessarily, I only want you to output code mainly and limit describing it. Avoid reprinting my code at all costs, I want to see changes or re-written functions, but never just re-print my code or code from past interactions unless absolutely necessary."

local function data_handler(data_stream, event_state)
    if data_stream:match '"delta":' then
        local json = vim.json.decode(data_stream)
        if json.choices and json.choices[1] and json.choices[1].delta then
            return json.choices[1].delta.content
        end
    end
end

local function make_openai_curl_args(history, prompt)
    -- ARGS 
    -- history: a table of {{role=..., content=...}} 
    --          role: can be either "assistant" or "user"
    --          content: is a string of the relevant content
    -- prompt: is the string of the current prompt
    local api_key = os.getenv(api_key_name)
    local messages = {
        { role = 'system', content = system_prompt },
    }
    for _, row in ipairs(history) do
        table.insert(messages, { role=row.role, content=row.content })
    end
    table.insert(messages, { role='user', content=prompt })
    local data = {
        messages = messages,
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

local function make_mlx_llm_curl_args(history, prompt)
    -- ARGS 
    -- history: a table of {{role=..., content=...}} 
    --          role: can be either "assistant" or "user"
    --          content: is a string of the relevant content
    -- prompt: is the string of the current prompt
    local messages = {
        { role = 'system', content = system_prompt },
    }
    for _, row in ipairs(history) do
        table.insert(messages, { role=row.role, content=row.content })
    end
    table.insert(messages, { role='user', content=prompt })
    local data = {
        messages = messages,
        temperature = 0.7,
        stream = true,
    }
    local args = { '-N', '-X', 'POST', '-H', 'Content-Type: application/json', '-d', vim.json.encode(data) }
    table.insert(args, url)
    return args
end


local function make_anthropic_curl_args(history, prompt)
    -- ARGS 
    -- history: a table of {{role=..., content=...}} 
    --          role: can be either "assistant" or "user"
    --          content: is a string of the relevant content
    -- prompt: is the string of the current prompt
    local api_key = os.getenv(api_key_name)
    -- local messages = {
    --     { role = 'system', content = system_prompt },
    -- }
    local messages = {}
    for _, row in ipairs(history) do
        table.insert(messages, { role=row.role, content=row.content })
    end
    table.insert(messages, { role='user', content=prompt })
    local data = {
        system = system_prompt,
        messages = messages,
        model = model_name,
        stream = true,
        max_tokens = 4096,
    }
    local args = { '-N', '-X', 'POST', '-H', 'content-type: application/json', '-d', vim.json.encode(data) }
    if api_key then
        table.insert(args, '-H')
        table.insert(args, 'x-api-key: ' .. api_key)
        table.insert(args, '-H')
        table.insert(args, 'anthropic-version: 2023-06-01')
    end
    table.insert(args, url)
    print(vim.inspect(args))
    return args
end

local function anthropic_data_handler(data_stream, event_state)
    if event_state == 'content_block_delta' then
        local json = vim.json.decode(data_stream)
        if json.delta and json.delta.text then
            return json.delta.text
        end
    end
end

require("jarvis").setup({
    -- defaults
    data_handler=data_handler,
    make_curl_args=make_mlx_llm_curl_args,
    -- prune_after = 30,
    -- cache_limit = 1000,
    -- keymaps = {
    --     close = "<esc>", -- close the ui
    --     new_chat = "<C-n>", -- create new persistent, file-agnostic chat file
    --     switch_window = "<C-s>", -- switch between prompt and history window
    --     run = "<C-e>", -- run model
    --     copy_and_close = "<C-y>" -- copy visual selection in history window and close
    -- },
})

vim.keymap.set({ 'n', 'v' }, '<leader>lc', function() require("jarvis").interact("chat") end, { desc = 'ask jarvis' })
vim.keymap.set({ 'n', 'v' }, '<leader>la', function() require("jarvis").interact("prompt") end, { desc = 'ask jarvis' })
