call plug#begin('~/.config/nvim/bundle/')
" Theme
Plug 'junegunn/seoul256.vim'
" QoL
Plug 'justinmk/vim-dirvish'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ledger/vim-ledger'
" Modern web dev
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/loupe'

call plug#end()

set encoding=utf-8
scriptencoding utf-8
set termguicolors
let g:seoul256_background = 233
colorscheme seoul256

set t_Co=256
set background=dark
filetype plugin indent on
syntax on

" coc stuff
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set showbreak=↳\ 
set breakindentopt=shift:2
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set ffs=unix,dos,mac
set autoread
set number
set rnu
set inccommand=nosplit
set backspace=start,eol,indent
set breakindent
set linebreak
set noswapfile
set mouse=a
set shellcmdflag=-ic
set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷-                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set ignorecase
set smartcase " make search case insensitive by default
set redrawtime=10000
set completeopt=menuone,noinsert,noselect

set splitbelow  " Splitting a window will put the new window below the current
set splitright  " Splitting a window will put the new window right of the current

let maplocalleader = "\<space>"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-python',
            \ 'coc-tsserver',
            \ 'coc-prettier',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-angular',
            \ 'coc-solargraph',
            \ 'coc-rls',
            \ ]

nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
inoremap <silent><C-d> <Del>
inoremap <C-c> <esc>
nnoremap <silent><esc> :noh<return><esc>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent><leader>p :Prettier<return>
nmap <leader>o <Plug>(coc-rename)
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History!<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>l :Lines!<CR>
nnoremap <C-s> :<C-u>BLines<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>ts <Plug>(coc-codeaction)
nnoremap <leader><leader> <c-^>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>fp gqap

nmap <leader>gs :Gina status -s<cr>
nmap <leader>gc :Gina commit<cr>
" nmap <leader>ga :Gwrite<cr>
nmap <leader>gp :Gina push<cr>
nmap <leader>gl :Gina log<cr>
nmap <leader>gd :Gina diff<cr>
nmap <leader>gb :Gina blame<cr>
nmap <leader>ge <Plug>(gina-blame-echo)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent><nowait> <localleader>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <localleader>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <localleader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <localleader>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <localleader>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <localleader>p  :<C-u>CocListResume<CR>
nmap <silent> <localleader>i <Plug>(coc-diagnostic-info)

au Filetype ruby set colorcolumn=140
au Filetype typescript,javascript set colorcolumn=120
au Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4
au FileType text call SetProseOptions()
au FileType tex call SetProseOptions()
au FileType markdown call SetProseOptions()
au Filetype gina-commit call SetProseOptions()
au FileType help set nolist

function SetProseOptions()
  setlocal spell
  setlocal spelllang=en
  setlocal textwidth=80
  " set conceallevel=2
endfunction

hi Todo gui=bold,italic cterm=bold,italic
hi Comment gui=italic cterm=italic
hi htmlItalic gui=italic cterm=italic
hi htmlBold gui=bold cterm=bold
hi CocErrorVirtualText ctermfg=3 guifg=#a8ff60 cterm=bold,italic gui=bold,italic
hi CocInfoVirtualText ctermfg=130 guifg=DarkOrange3 cterm=bold,italic gui=bold,italic
hi VertSplit cterm=NONE gui=NONE

let g:fzf_layout = { 'down': '~40%' }
let s:fzf_options = '--preview "bat --style numbers,changes --color=always --decorations=always {} | head -500"'

inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
command! -bang -nargs=? -complete=dir Files
  \ call fzf#run(fzf#wrap(
  \   {
  \     'source': 'fd -E".git" --hidden --type f .\* '.(empty(<q-args>) ? '' : shellescape(<q-args>)),
  \     'down': '40%',
  \     'options': s:fzf_options
  \   }, <bang>0))

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank {higroup="IncSearch", timeout=1000}

nnoremap <silent> <localleader>g  :Goyo<CR>
nnoremap <silent> <leader>hl :GitGutterLineHighlightsToggle<CR>
let g:gitgutter_sign_modified = '!!'
let g:gitgutter_sign_modified_removed = '!_'
let g:ledger_align_at = 52

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "ruby", "bash", "markdown", "javascript", "css", "html", "jsdoc", "json", "yaml", "python" },
  highlight = {
    enable = true,
    custom_captures = {
      ["TextYankPost"] = "IncSearch",
    }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
