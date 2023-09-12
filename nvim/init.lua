-- Load the vimrc in this directory
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Linewise toggle using C-/ in all modes (incl visual selection)
local commentApi = require('Comment.api')
vim.keymap.set('n', 'C-/', commentApi.locked('toggle.linewise.current'))
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
vim.keymap.set('x', 'C-/', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  commentApi.locked('toggle.linewise')(vim.fn.visualmode())
end)

-- Configure telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  }
}

require('lspconfig').ocamllsp.setup{}
require'lspconfig'.tsserver.setup {}

-- Taken directly from lspconfig docs
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

--- My weird things
vim.keymap.set("n", "<C-c>l", vim.diagnostic.goto_next, bufopts)

vim.keymap.set('n', '<A-f>', function()
      vim.lsp.buf.format { async = true }
end, opts)

vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
end, opts)

