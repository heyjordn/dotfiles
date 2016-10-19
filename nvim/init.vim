"/' _ `\/\ \/\ \\/\ \ /' __` __`\     /\`'__\/'___\ 
"/\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \  __\ \ \//\ \__/ 
"\ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\/\_\\ \_\\ \____\
" \/_/\/_/\/__/    \/_/\/_/\/_/\/_/\/_/ \/_/ \/____/
"    The only way to make sense of it is to jump in.
"
"    Author: Pr0x1m4


"Vim-Plug/Plugins{{{
call plug#begin('~/.config/nvim/plugged')
"Plugin : vim-easy-align{{{

Plug 'junegunn/vim-easy-align'

"}}}
"Plugin : Ultisnips{{{
"Description: Ultisnips with snippet collections
"
"Benefits: Got the snips on deck

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' "Ultisnips with snippets

"}}}
"Plugin : NERDTree{{{
"Description: NERDTree allows you to navigate and open files in               "
"             nvim through a neat interface.                                  "
"Benefits: Easy to find files and with some tweaking, awesome highlighting    "

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "File explorer

  " NERDTress File highlighting function
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
"}}}
"Plugin : ctrlpvim{{{
"Description: ctrlp file finder for finding files, for you files that need finding
"
"Benefits: Easy to find files

Plug 'ctrlpvim/ctrlp.vim'

"}}}
"Plugin : vim-airline{{{
"Description: awesome status bar
"
"Benefits: Really great for showing info "

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "just guess

  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'gruvbox'

"}}}
"Plugin : gruvbox{{{
"Description: wicked vim theme               "

Plug 'morhetz/gruvbox'

"}}}
"Plugin : deocomplete + goodies{{{
"Description: AUTOCOMPLETE               "
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
  augroup deogroup
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif "closes deoplete scratch pad
  augroup END
"  if exists('g:plugs["tern_for_vim"]') "Check for tern and then set omnifunc
"    let g:tern_show_argument_hints = 'on_hold'
"    let g:tern_show_signature_in_pum = 1
"    augroup terngroup
"      autocmd!
"      autocmd FileType javascript setlocal omnifunc=tern#Complete
"    augroup END
"  endif
"}}}
"Plugin : neomake{{{
"Description: Linting!               "

Plug 'benekastah/neomake'
"  augroup neogroup
"    autocmd!
"    autocmd! BufWritePost * Neomake
"  augroup END
  let g:neomake_open_list = 2
  let g:neomake_warning_sign = {
        \ 'text': 'W',
        \ 'texthl': 'WarningMsg',
        \ }
  let g:neomake_error_sign = {
        \ 'text': 'E',
        \ 'texthl': 'ErrorMsg',
        \ }

  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_python_enabled_makers = ['pep8']
  let g:neomake_java_enabled_makers = ['javac']
"}}}
"Plugin : emmet-vim{{{

Plug 'mattn/emmet-vim'

"}}}
"Plugin : vim-polyglot{{{
Plug 'sheerun/vim-polyglot'
"}}}
"Plugin : vim-indent-guides{{{                                                    "
"Description: Highlights tabs and such                                        "
"Benefits: Easier to read source                                              "
Plug 'nathanaelkane/vim-indent-guides'
  let g:indentLine_enabled = 1
  let g:indent_guides_guide_size = 1
"}}}
"Plugin : vim-devicons{{{                                                    "

Plug 'ryanoasis/vim-devicons' "priceless icons

"}}}
"Plugin : vim-surround{{{                                                    "

Plug 'tpope/vim-surround'

"}}}
"Plugin : goyo.vim{{{                                                         "

Plug 'junegunn/goyo.vim'

"}}}
"Plugin : vim-autoclose{{{                                                         "

Plug 'Townk/vim-autoclose'

"}}}
"Plugin : vimstartify{{{                                                     "

Plug 'mhinz/vim-startify'
let g:startify_custom_header = [
      \ '    _____    _ __    ___    __  _ /\_\     ___ ___       __     ',
      \ '   /\  __`\ /\` __\ / __`\ /\ \/ \ /\ \  /  __` __`\   / __`\   ',
      \ '   \ \ \L\ \\ \ \/ /\ \L\ \ />  </ \ \ \ /\ \/\ \/\ \ /\ \L\.\_ ',
      \ '    \ \ ,__/ \ \_\ \ \____/ /\_/\_\ \ \_\\ \_\ \_\ \_\\ \__/.\_\',
      \ '     \ \ \/   \/_/  \/___/  \//\/_/  \/_/ \/_/\/_/\/_/ \/__/\/_/',
      \ '      \ \_\                                               ',
      \ '       \/_/                                               ',
      \ '           The only way to make sense of it is to jump in.',
      \ ]
"}}}
"Plugin : vim-prolog{{{                                                     "

Plug 'adimit/prolog.vim'
"}}}
call plug#end()
"}}}
" Nvim Config {{{

  colorscheme gruvbox "ooo colours
  set background=dark "I got sensitive eyes
  set number
  set laststatus=2
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set lbr "Setting line break 
  set tw=500
  set ai  "Auto indent
  set si  "Smart indent
  set wrap
  syntax sync minlines=200 
  set noswapfile "get outta here swap, no one likes you >.>
  
  set foldmethod=marker
"}}}

"Specify file extension and foreground colour to highlight
call NERDTreeHighlightFile('jade', '35', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', '244', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', '209', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', '39', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'yellow', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')    
call NERDTreeHighlightFile('rb', 'red', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('hbs', '208', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('java', '139', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'yellow', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('png', '209', 'none', '#ff00ff', '#151515')
let g:filetype_pl="prolog"
"autocmd FileType java setlocal omnifunc=javacomplete#Complete



