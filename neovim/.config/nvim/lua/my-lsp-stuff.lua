-- Native LSP-Setup
-- TODO: explore :Telescope lsp_references and the likes ...

-- this has to be done before setting up the LSP-Servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- setup keys the same way for all languages
local function setupKeymaps()
   vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) --in "n"ormalmode, on pressing "K", call vim.ls..., on the current buffer
   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) --in "n"ormalmode, on pressing "gd", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) --in "n"ormalmode, on pressing "gt", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   vim.keymap.set("n", "gm", vim.lsp.buf.implementation, {buffer=0}) --in "n"ormalmode, on pressing "gm", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0}) --in "n"ormalmode, on pressing "<leader>df", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) --in "n"ormalmode, on pressing "<leader>dl", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   -- note: use <c-q> to populate to quickfix list
   vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0}) --in "n"ormalmode, on pressing "<leader>db", call vim.ls..., on the current buffer, <c-t> brings you back (:help tagstack)
   vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {buffer=0}) --in "n"ormalmode, on pressing "<leader>rr", call vim.ls..., on the current buffer
end
-- GO
-- 1. get gopls
-- 2. tell nvim to use it
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = setupKeymaps,
} -- connect to server

-- Elixir
-- 1. get ElixirLS
-- git clone git@github.com:elixir-lsp/elixir-ls.git
-- 2. compile and install it
-- cd elixir-ls && mkdir rel
-- mix deps.get && mix compile
-- mix elixir_ls.release -o release
require'lspconfig'.elixirls.setup{
    cmd = { vim.loop.os_homedir().."/git-repos/running/elixir-ls/release/language_server.sh" };
    on_attach = setupKeymaps,
}

-- csharp
require'lspconfig'.omnisharp.setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    setupKeymaps()
  end,
  cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(pid) },
}

-- lua
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.env.HOME .. '/.local/share/nvim/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/".. "lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = setupKeymaps,
    --on_attach = custom_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
