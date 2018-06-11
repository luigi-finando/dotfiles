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
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'posva/vim-vue'
Plugin 'sirver/UltiSnips'
Plugin 'tpope/vim-rails'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'gabrielelana/vim-markdown'
Plugin 'chrisbra/csv.vim'

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
colorscheme seoul256

map <F5> :setlocal spell! spelllang=pt<CR>

let g:tex_flavor = "latex"

""vim airline
let g:airline_theme='bubblegum'

""vim-markdown
let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 0

""vim markdown-=preview
let g:vim_markdown_no_default_key_mappings = 0
let g:vim_markdown_folding_disabled = 1

""vim mardown
let vim_markdown_preview_pandoc=1

"goyo and limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:goyo_width = 120
let g:goyo_height = 85
let g:goyo_linenr = 0

let g:limelight_conceal_ctermfg = 'gray'

"indentation
au BufNewFile,BufRead *.erb set filetype=html
au BufNewFile,BufRead *.vue set filetype=vue
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype html.erb setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype tex setlocal ts=2 sw=2 expandtab

"remaps all

"removes 'xx' as delete fold
nnoremap <expr> x ((foldclosed('.')==-1)?('x'):('zx'))

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

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
nnoremap <leader>{ bi{<Esc>ea}<Esc>
inoremap ;{ {}<Esc>i

nnoremap <leader>[ bi[<Esc>ea]<Esc>
inoremap ;[ []<Esc>i

nnoremap <leader>( bi(<Esc>ea)
inoremap ;( ()<Esc>i

nnoremap <leader>" bi"<Esc>ea"
inoremap ;" ""<Esc>i

nnoremap <leader>' bi'<Esc>ea'
inoremap ;' ''<Esc>i

nnoremap <leader>< bi<<Esc>ea>
inoremap ;< <><Esc>i

"""bib files

"autocmd FileType bib colorscheme colorsbox-stbright
"AltGr + i
autocmd Filetype bib nnoremap ² /@<CR>
autocmd Filetype bib inoremap ² <Esc>/@<CR>
autocmd Filetype bib map → i@<++>{<++>,<Enter>author="<++>",<Enter><Esc>>>ititle="<++>",<Enter><Esc>>>iaddress="<++>",<Enter><Esc>>>ipublisher="<++>",<Enter><Esc>>>iyear="<++>",<Enter>}<Esc>kv3k>2k0
autocmd Filetype bib nnoremap <leader>= i="",<Esc>F"i
autocmd Filetype bib inoremap ;= ="",<Esc>F"i

"tex files

autocmd FileType tex inoremap ;a <Esc>:/begin{document}<Enter>2ki

autocmd Filetype tex inoremap ;" ``"<++><Esc>F"
autocmd Filetype tex nnoremap <leader>" bi``<Esc>ea"

autocmd Filetype tex inoremap ;b \textbf{}<++><Esc>4hi
autocmd Filetype tex nnoremap <leader>b bi\textbf{<Esc>ea}

autocmd Filetype tex inoremap ;i \textit{}<++><Esc>4hi
autocmd Filetype tex nnoremap <leader>i bi\textit{<Esc>ea}

autocmd Filetype tex inoremap ;e \emph{}<++><Esc>4hi
autocmd Filetype tex nnoremap <leader>e b\emph{<Esc>ea}

autocmd Filetype tex nnoremap <leader>g i\gls{<Esc>eli}<Esc>
autocmd Filetype tex nnoremap <leader>l i\glslink{<++>}{<Esc>eli}<Esc>2F{i
autocmd Filetype tex nnoremap <leader>h i\newglossaryentry{<++>}{name=<++>,description={<++>}}<Esc>3F{i
autocmd Filetype tex nnoremap <leader>c i\begin{center}<Enter><++><Enter>\end{center}<Enter><++><Esc>3kF\i
autocmd Filetype tex nnoremap <leader>p i\begin{poem}{}{}{}<Enter><++><Enter>\end{poem}<Enter><++><Esc>3kF\i
autocmd FileType tex nnoremap <leader>v i\begin{verse}<Enter><++><Enter>\end{verse}<Enter><++><Esc>3kF\i

autocmd FileType tex nnoremap © i\vspace{12pt}\begin{adjustwidth}{4cm}{}<Enter>{\small{\setstretch{1}<Enter>.<Enter>\cite[p. <++>]{<++>}\par}}<Enter>\end{adjustwidth}\vspace{12pt}<Esc>2k0xxli

autocmd FileType tex nnoremap ® i\begin{envromance*}{<++>}<Enter><++><Enter>\end{envromance*}<Esc>2k0

""html
autocmd FileType html nnoremap <leader>h1 i<h1></h1><Esc>F<i
autocmd FileType html nnoremap <leader>h2 i<h1></h2><Esc>F<i
autocmd FileType html nnoremap <leader>p i<p></p><Esc>F<i
autocmd FileType html nnoremap <leader>br i</br><Esc>
autocmd FileType html nnoremap <leader>d i<div></div><Esc>F<i
autocmd FileType html nnoremap <leader>dc i<div class=""></div><Esc>F"i
autocmd FileType html nnoremap <leader>a i<a href=""></a><Esc>F"i
autocmd FileType html nnoremap <leader>{{ i{{ }}<Esc>hi
autocmd FileType html nnoremap <leader>{% i{%  %}<Esc>hi

""erb ruby
autocmd FileType html nnoremap <leader><% i<%<Space>%><Esc>F%i
autocmd FileType html nnoremap <leader><= i<%=<Space>%><Esc>F%i

""vue
autocmd FileType vue nnoremap <leader>h1 i<h1></h1><++><Esc>2F<
autocmd FileType vue nnoremap <leader>p i<p></p><++><Esc>2F<
autocmd FileType vue nnoremap <leader>br i</br><Esc>
autocmd FileType vue nnoremap <leader>b i<bold></bold><++><Esc>2F<
autocmd FileType vue nnoremap <leader>d i<div></div><++><Esc>2F<

autocmd FileType js nnoremap <leader>h1 i<h1></h1><Esc>F<i
autocmd FileType js nnoremap <leader>p i<p></p><Esc>F<i
autocmd FileType js nnoremap <leader>br i</br><Esc>
autocmd FileType js nnoremap <leader>d i<div></div><Esc>F<i
autocmd FileType js nnoremap <leader>dc i<div class=""></div><Esc>F"i
autocmd FileType js nnoremap <leader>a i<a href=""></a><Esc>F"i
