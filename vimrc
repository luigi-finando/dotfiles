set nocompatible              " be iMproved, required
"""Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'myusuf3/numbers.vim'
"Plugin 'xuhdev/vim-latex-live-preview'
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
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'posva/vim-vue'
"Plugin 'sirver/UltiSnips'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
"Plugin 'gabrielelana/vim-markdown'
Plugin 'chrisbra/csv.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""general
filetype plugin on
set number
set numberwidth=2
set mouse=a

""gvim
set guioptions-=r
set guioptions-=T
set guioptions-=m
set guifont=Ubuntu\Mono\ 14

syntax on
set list listchars=tab:→\ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨

""vim airline
let g:airline_theme='ubaryd'

"set background=dark
colorscheme xoria256
" only good light theme
"colorscheme autumnleaf
"utocmd BufEnter *.rb colorscheme dracula
"
"utocmd Filetype html colorscheme kkruby
"utocmd BufEnter *.sass colorscheme xoria256
"utocmd BufEnter *.css colorscheme xoria256
"
"utocmd BufEnter *.tex colorscheme darkburn
"utocmd Filetype bib colorscheme sadek1
"utocmd BufEnter *.md colorscheme fruidle
"utocmd BufEnter *.MARKDOWN colorscheme fruidle

map <F5> :setlocal spell! spelllang=pt<CR>

let g:tex_flavor = "latex"

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

let g:goyo_width = 100
let g:goyo_height = 60
let g:goyo_linenr = 0

let g:limelight_conceal_ctermfg = 'gray'

"indentation
au BufNewFile,BufRead *.vue set filetype=vue
autocmd Filetype htmldjango set filetype=html
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype tex setlocal ts=2 sw=2 expandtab
autocmd Filetype py setlocal ts=2 sw=2 expandtab

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
"nmap º :NERDTreeToggle<CR>
"imap º <Esc>:NERDTreeToggle<CR>

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

"" snippets caseiros
"salvar selecao
vnoremap <leader>s :w $SNIPPET_FOLDER/
"tab complete para editar snippets
noremap <leader>snip :tabedit /home/luis/Templates/vim_snippets/

autocmd FileType bib nnoremap <leader>book :-1r $SNIPPET_FOLDER/book.bib<CR>
autocmd FileType bib nnoremap <leader>art :-1r $SNIPPET_FOLDER/artigo.bib<CR>

autocmd FileType tex noremap <leader>new :-1r $SNIPPET_FOLDER/newarticle.tex

autocmd FileType markdown noremap <leader>new :-1r $SNIPPET_FOLDER/markdown_basic.md<CR>

autocmd FileType html noremap <leader>new :-1r $SNIPPET_FOLDER/html.html<CR>
autocmd FileType html noremap <leader>table :-1r $SNIPPET_FOLDER/table.html<CR>
autocmd FileType eruby noremap <leader>ht :-1r $SNIPPET_FOLDER/table.html<CR>

"""bib files

"autocmd FileType bib colorscheme colorsbox-stbright
"AltGr + i

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
autocmd FileType html nnoremap <leader>h2 i<h2></h2><Esc>F<i
autocmd FileType html nnoremap <leader>p i<p></p><Esc>F<i
autocmd FileType html nnoremap <leader>bold i<b></b><Esc>F<i
autocmd FileType html nnoremap <leader>it i<i></i><Esc>F<i
autocmd FileType html nnoremap <leader>big i<big></big><Esc>F<i
autocmd FileType html nnoremap <leader>sm i<small></small><Esc>F<i
autocmd FileType html nnoremap <leader>br i</br><Esc>

autocmd FileType html nnoremap <leader>d i<div></div><Esc>F<i
autocmd FileType html nnoremap <leader>dc i<div class=""></div><Esc>F"i
autocmd FileType html nnoremap <leader>l i<ul><Enter><li><++></li><Enter></ul><Esc>F"i
autocmd FileType html nnoremap <leader>a i<a href=""></a><Esc>F"i
autocmd FileType html nnoremap <leader>img i<img src=""><Esc>F"i

autocmd FileType html nnoremap <leader>{{ i{{ }}<Esc>hi
autocmd FileType html nnoremap <leader>{% i{%  %}<Esc>hi

""erb ruby
autocmd FileType eruby nnoremap <leader>% i<%<Space>%><Esc>F%i
autocmd FileType eruby nnoremap <leader>= i<%=<Space>%><Esc>F%i
autocmd FileType eruby nnoremap <leader>h1 i<%= content_tag(:h1, <++>) %><Esc>2F<
autocmd FileType eruby nnoremap <leader>h2 i<%= content_tag(:h2, <++>) %><Esc>2F<
autocmd FileType eruby nnoremap <leader>p i<%= content_tag(:p, <++>) %><Esc>2F<
autocmd FileType eruby nnoremap <leader>d i<div></div><Esc>F<i
autocmd FileType eruby nnoremap <leader>dc i<div class=""></div><Esc>F"i
autocmd FileType eruby nnoremap <leader>u i<ul><Enter><li><++></li><Enter></ul><Esc>F"i
autocmd FileType eruby nnoremap <leader>{{ i{{ }}<Esc>hi
autocmd FileType eruby nnoremap <leader>{% i{%  %}<Esc>hi
autocmd FileType eruby nnoremap <leader>l i<%= link_to "<++>", <++> %><Esc>4F<

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
