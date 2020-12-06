require('globals')
require('lsp_config')
local fn = vim.fn
local opt = vim.opt

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system(string.format(
      'git clone %s %s',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    ))
  fn.system('packadd packer.nvim')
end

require('plugins')
vim.cmd [[colorscheme plain]]
opt.encoding = 'utf-8'
opt.t_Co = '256'
opt.background = 'dark'
opt.termguicolors = true
opt.briopt = 'shift:2'
opt.completeopt = 'menuone,noinsert,noselect'
opt.cursorline = true
opt.expandtab = true
opt.fileformats = 'unix,dos,mac'
opt.formatoptions = 'jcrqnl'
opt.fillchars = { eob = "~" }
opt.hidden = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.lazyredraw = true
opt.linebreak = true
opt.mouse = 'a'
opt.backup = false
opt.joinspaces = false
opt.swapfile = false
opt.writebackup = false
opt.number = true
opt.pumheight = 20
opt.redrawtime = 10000
opt.report = 0
opt.rnu = true
opt.shiftwidth = 2
opt.shortmess = 'atOI'
vim.api.nvim_set_option('showbreak', '↳ ')
opt.signcolumn = 'yes'
opt.smartcase = true -- make search case insensitive by default
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true  -- Splitting a window will put the new window below the current
opt.splitright = true  -- Splitting a window will put the new window right of the current
opt.t_ut = ''
opt.tabstop = 2
opt.undofile = true        -- Persistent undo
opt.undolevels = 1000      -- Maximum number of changes that can be undone
opt.undoreload = 10000     -- Maximum number lines to save for undo on a buffer reload
opt.updatetime = 300
opt.wildmenu = true
opt.wildoptions = 'pum'
opt.winminheight = 0
opt.pumblend = 17

if vim.g.vim_better_default_enable_folding == 1 then
  opt.foldenable = true
  opt.foldmarker = '{,}'
  opt.foldlevel = 0
  opt.foldmethod = 'marker'
  opt.foldlevelstart = 99
end

vim.g.gitgutter_sign_modified = '!!'
vim.g.gitgutter_sign_modified_removed = '!_'
vim.g.vim_better_default_enable_folding = 1
vim.cmd [[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank {higroup='IncSearch', timeout=1000}]]
vim.g.mapleader = ','
vim.g.maplocalleader = ' '
