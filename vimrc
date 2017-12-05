set nocompatible              " be iMproved, required
"""Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'matze/vim-tex-fold'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""general
filetype on
set number
set numberwidth=2
set mouse=a

syntax on
set list listchars=tab:→\ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set background=dark
colorscheme CandyPaper 

map <F5> :setlocal spell! spelllang=pt<CR>

let g:tex_flavor = "latex"
""vim airline
let g:airline_theme='term'

""vim markdown-=preview
let g:vim_markdown_no_default_key_mappings = 0
let g:vim_markdown_folding_disabled = 1

""vim live previwer
let g:livepreview_previewer = 'mupdf'

""vim mardown
let vim_markdown_preview_browser='Chromium'
let vim_markdown_preview_pandoc=1

"goyo e limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:goyo_width = 120
let g:goyo_height = 85
let g:goyo_linenr = 0


"let g:limelight_conceal_ctermfg = 1

"remaps all

"AltGr+g
nmap ŋ :Goyo<CR>
imap ŋ <Esc>:Goyo<CR>i

"AltGr+\
nmap º :NERDTreeToggle<CR>
imap º <Esc>:NERDTreeToggle<CR>

nnoremap <Up> gk
nnoremap <Down> gj

"jump points
nnoremap <leader>. i<++><Esc>
inoremap ;. <++><Esc>

nnoremap <leader>; /<++><Enter>"_c4l
inoremap ;; <Esc>/<++><Enter>"_c4l

"general text remaps
nnoremap <leader>{ i{}<Esc>i
inoremap ;{ {}<Esc>i

nnoremap <leader>[ i[]<Esc>i
inoremap ;[ []<Esc>i

nnoremap <leader>( bi(<Esc>ea)
inoremap ;( ()<Esc>i

nnoremap <leader>" bi"<Esc>ea"
inoremap ;" ""<Esc>i

"""bib files

autocmd FileType bib colorscheme DevC++
"AltGr + i
autocmd Filetype bib nnoremap ² /@<CR>
autocmd Filetype bib inoremap ² <Esc>/@<CR>
autocmd Filetype bib map → i@<++>{<++>,<Enter>author="<++>",<Enter><Esc>>>ititle="<++>",<Enter><Esc>>>iaddress="<++>",<Enter><Esc>>>ipublisher="<++>",<Enter><Esc>>>iyear="<++>",<Enter>}<Esc>kv3k>2k0
autocmd Filetype bib nnoremap <leader>= i="",<Esc>F"i
autocmd Filetype bib inoremap ;= ="",<Esc>F"i

"tex files

autocmd FileType tex colorscheme jellyx

autocmd FileType tex inoremap ;a <Esc>:/begin{document}<Enter>2ki

autocmd Filetype tex inoremap ;" ``"<++><Esc>F"
autocmd Filetype tex nnoremap <leader>" bi``<Esc>ea"

autocmd Filetype tex inoremap ;b \textbf{}<++><Esc>4hi
autocmd Filetype tex nnoremap <leader>b bi\textbf{<Esc>ea}

autocmd Filetype tex inoremap ;i \textit{}<++><Esc>4hi
autocmd Filetype tex nnoremap <leader>i bi\textit{<Esc>ea}

autocmd Filetype tex inoremap ;e \emph{}<++><Esc>4hi
autocmd Filetype tex inoremap <leader>e b\emph{<Esc>ea}

autocmd Filetype tex nnoremap <leader>g i\gls{<Esc>eli}<Esc>
autocmd Filetype tex nnoremap <leader>l i\glslink{<++>}{<Esc>eli}<Esc>2F{i
autocmd Filetype tex nnoremap <leader>h i\newglossaryentry{<++>}{name=<++>,description={<++>}}<Esc>3F{i
autocmd Filetype tex nnoremap <leader>c i\begin{center}<Enter><++><Enter>\end{center}<Enter><++><Esc>3kF\i
autocmd Filetype tex nnoremap <leader>p i\begin{poem}{}{}{}<Enter><++><Enter>\end{poem}<Enter><++><Esc>3kF\i
autocmd FileType tex nnoremap <leader>v i\begin{verse}<Enter><++><Enter>\end{verse}<Enter><++><Esc>3kF\i

""html
autocmd FileType html nnoremap <leader>h1 i<h1></h1><++><Esc>2F<
autocmd FileType html nnoremap <leader>p i<p></p><++><Esc>2F<
autocmd FileType html nnoremap <leader>br i<br></br><++><Esc>2F<
autocmd FileType html nnoremap <leader>b i<bold></bold><++><Esc>2F<

