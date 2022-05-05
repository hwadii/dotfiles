vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- general
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("x", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-k>", "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set("n", "<esc>", "<cmd>noh<return><esc>")
vim.keymap.set("n", "<C-/>", "<cmd>set hlsearch!<cr>")
vim.keymap.set("n", "<A-[>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<A-]>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "[t", "gT")
vim.keymap.set("n", "]t", "gt")
vim.keymap.set("t", "<M-[>", "<C-\\><C-n>")

-- telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>tt", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<Leader>s", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<Leader>tg", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<localleader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<Leader>th", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<Leader>tc", "<cmd>Telescope git_commits<cr>")
vim.keymap.set("n", "<Leader>to", "<cmd>Telescope lsp_document_symbols<cr>")
vim.keymap.set("n", "<Leader>tr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<Leader>te", "<cmd>Telescope resume<cr>")
vim.keymap.set("n", "<Leader>t;", "<cmd>Telescope neoclip<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- git
vim.keymap.set("n", "<Leader>gs", "<cmd>Git<cr>")
vim.keymap.set("n", "<Leader>gc", "<cmd>Git commit<cr>")
vim.keymap.set("n", "<Leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<Leader>gl", "<cmd>Git log<cr>")
vim.keymap.set("n", "<Leader>gd", "<cmd>Git diff<cr>")
vim.keymap.set("n", "<Leader>gb", "<cmd>Git blame<cr>")
vim.keymap.set("n", "<Leader>ga", "<cmd>Git branch<cr>")

-- colorizer
vim.keymap.set("n", "<Leader>c", "<cmd>ColorizerToggle<cr>")

-- custom commands

vim.api.nvim_create_user_command('Gpf', 'Git push --force-with-lease', {})
vim.api.nvim_create_user_command('Gpff', 'Git push --force', {})
vim.api.nvim_create_user_command('Gupa', 'Git pull --rebase --autostash', {})
vim.api.nvim_create_user_command('Gh', '!gh', {})
vim.api.nvim_create_user_command('Gbr', '!gh browse', {})
vim.api.nvim_create_user_command('Gpr', '!gh pr view --web', {})
