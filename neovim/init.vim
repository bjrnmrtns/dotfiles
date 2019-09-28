set nocompatible

" Load gruvbox color scheme
let g:gruvbox_contrast_dark = "soft"
set t_Co=256
set background=dark
colorscheme gruvbox
if has("syntax")
    syntax on
endif

" Keep tmux navigation when in vi windows
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Additional configuration
set tabstop=4
set shiftwidth=4
set expandtab
set list
set number
set timeoutlen=300
:imap jj <Esc>

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" YCM configuration
let g:ycm_confirm_extra_conf = 0
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<cr>
