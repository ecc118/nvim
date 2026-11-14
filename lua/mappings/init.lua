local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>n', function()
  local file = vim.fn.expand('%:t')
  vim.cmd('Explore')
  if file ~= '' then
    vim.fn.search([[\V\(\^\|\s\)]] .. vim.fn.escape(file, [[\]]) .. [[\[*@/]\=\(\s\|\$\)]], 'w')
  end
end, opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fd', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fa', ':Telescope buffers<CR>', opts)
map('n', '<leader>gr', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gd', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>gg', ':Gitsigns next_hunk<CR>', opts)
map('n', '<leader>r', '<cmd>source %<CR>', opts)
map('n', '==', ':vertical Git<CR>', opts)
map('n', '<C-w>q', '<cmd>bd<CR>', opts)
map('n', '<C-w><C-q>', '<cmd>bd<CR>', opts)
map('n', '<C-w>.', '<cmd>bn<CR>', opts)
map('n', '<C-w><C-.>', '<cmd>bn<CR>', opts)
map('n', '<C-w>,', '<cmd>bp<CR>', opts)
map('n', '<C-w><C-,>', '<cmd>bp<CR>', opts)
