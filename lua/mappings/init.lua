local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>n', ':NeoTreeRevealToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fd', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fa', ':Telescope buffers<CR>', opts)
map('n', '<leader>gr', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gd', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>gg', ':Gitsigns next_hunk<CR>', opts)
map('n', '==', ':vertical Git<CR>', opts)
