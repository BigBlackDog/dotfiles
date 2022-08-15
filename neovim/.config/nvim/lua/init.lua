local nvim_lsp = require'lspconfig'

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end

nvim_lsp.gopls.setup{
  on_attach=on_attach_vim,
  root_dir=nvim_lsp.util.root_pattern('.git');
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Enable underline, use default values
  underline = false,
  -- Disable a feature
  update_in_insert = false,
  -- Enable virtual text, override spacing to 4
  virtual_text = {
    spacing = 4,
    prefix = '  ',
  },
  -- Use a function to dynamically turn signs off
  -- and on, using buffer local variables
  signs = function(bufnr, client_id)
    local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
    -- No buffer local variable set, so just enable by default
    if not ok then
      return true
    end
    return result
  end,
}
)

require('lualine').setup()
