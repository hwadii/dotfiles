local telescope = require('telescope.builtin')
local file_browser = require('telescope').extensions.file_browser
local map = vim.keymap.set
local various = require('wadii.various')
local treesj = require('treesj')
local oil = require('oil')

-- general
map('n', '<A-j>', '<cmd>m .+1<CR>==')
map('n', '<A-k>', '<cmd>m .-2<CR>==')
map("x", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
map("x", "<A-k>", "<cmd>m '<-2<CR>gv=gv")
map('n', '<esc>', '<cmd>noh<return><esc>')
map('n', '<C-/>', '<cmd>set hlsearch!<cr>')
map('n', '<A-[>', '<cmd>vertical resize -5<cr>')
map('n', '<A-]>', '<cmd>vertical resize +5<cr>')
map('n', '<Left>', 'gT')
map('n', '<Right>', 'gt')
map('t', '<M-[>', '<C-\\><C-n>')
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- telescope
map('n', '<C-p>', telescope.find_files)
map('n', '<Leader>sf', telescope.find_files)
map('n', '-', oil.open, { desc = "Open parent directory" })
map('n', '<Leader>?', telescope.builtin)
map('n', '<Leader>/', telescope.live_grep)
map('n', '<Leader>sw', function() telescope.grep_string({ search = vim.fn.input("Grep For > ") }) end)
map('n', '<localleader><localleader>', telescope.buffers)
map('n', '<Leader>s?', telescope.oldfiles)
map('n', '<Leader>sc', telescope.git_commits)
map('n', '<Leader>se', telescope.resume)
map('n', '<Leader>s"', telescope.registers)
map('n', '<Leader>s-', function() file_browser.file_browser({ path = '%:p:h', select_buffer = true }) end)
map('n', '<C-s>', telescope.current_buffer_fuzzy_find)

-- git
map('n', '<Leader>gs', '<cmd>Git<cr>')
map('n', '<Leader>gc', '<cmd>Git commit<cr>')
map('n', '<Leader>gp', '<cmd>Git! push<cr>')
map('n', '<Leader>gl', '<cmd>Git log<cr>')
map('n', '<Leader>gd', '<cmd>Git diff<cr>')
map('n', '<Leader>gb', '<cmd>Git blame<cr>')
map('n', '<Leader>ga', '<cmd>Git branch<cr>')
map('n', '<Leader>gr', '<cmd>Gr<cr>', { silent = true })

-- colorizer
map('n', '<Leader>cc', '<cmd>CccHighlighterToggle<cr>')
map('n', '<Leader>cp', '<cmd>CccPick<cr>')

-- various
map('n', '<Leader>L', various.yank_current_path)
map('n', '<Leader>B', various.remove_bomb)

map('n', 'gJ', treesj.join)
map('n', 'gS', treesj.split)

-- custom commands
vim.api.nvim_create_user_command('Gpf', 'Git! push --force-with-lease', {})
vim.api.nvim_create_user_command('Gpff', 'Git! push --force', {})
vim.api.nvim_create_user_command('Gupa', 'Git pull --rebase --autostash', {})
vim.api.nvim_create_user_command('Gh', '!gh <f-args>', { nargs = 1 })
vim.api.nvim_create_user_command('Gbr', 'Gh browse', {})
vim.api.nvim_create_user_command('Gpr', 'Gh p', {})
vim.api.nvim_create_user_command('Gr', 'Gh r', {})
