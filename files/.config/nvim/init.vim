call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch'
" syntax
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'vim-scripts/loremipsum'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'arecarn/vim-selection'
Plug 'arecarn/vim-crunch'
Plug 'tpope/vim-endwise'
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
" javascript
Plug 'editorconfig/editorconfig-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
" typescript
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'
" elm
Plug 'pbogut/deoplete-elm'
Plug 'ElmCast/elm-vim'
" vuejs
Plug 'posva/vim-vue'
" jade/pug
Plug 'digitaltoad/vim-pug'
" haskell
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
" org-mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" python
Plug 'python-mode/python-mode'
" c++
Plug 'Rip-Rip/clang_complete'
" i3
Plug 'PotatoesMaster/i3-vim-syntax'
" xml
Plug 'othree/xml.vim'
" LaTeX
Plug 'lervag/vimtex'
" notes
Plug 'vimwiki/vimwiki'
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
" api blueprint
Plug 'kylef/apiblueprint.vim'
" purescirpt
Plug 'purescript-contrib/purescript-vim'
call plug#end()

" leaders
let mapleader="\<Space>"
let maplocalleader=","
" sets
filetype plugin on
syntax on
set mouse=a
set timeoutlen=1500
set linebreak
set noswapfile
set ignorecase
set smartcase
set updatetime=250
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert
set cursorline
set nocursorcolumn
set lazyredraw
set nohlsearch
set helpheight=99999
set clipboard=unnamedplus
set noshowmode
set hidden
set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
set t_Co=256
colorscheme gruvbox
set background=dark
set number
set relativenumber
set scrolloff=3
set autoread
" indentation
set expandtab
set shiftwidth=4
set softtabstop=4
" for termite/st
set termguicolors
" different cursors for different modes for VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x and others) 
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" some functions
function! ScratchBuffer()
    if bufexists('Scratch')
        b Scratch
    else
        enew
        silent file Scratch
        setl buftype=nofile
        nnoremap <buffer> <silent> <leader>pt :e .<cr>
    endif
endfunction
" keymaps
nnoremap <silent> <C-c> :Commentary<cr>j
nnoremap <silent> <leader>at a<C-R>=strftime('%Y-%m-%d')<cr><esc>
vnoremap <silent> <leader>at c<C-R>=strftime('%Y-%m-%d')<cr><esc>
nnoremap <silent> <leader>aT a<C-R>=strftime('%Y-%m-%dT%T%z')<cr><esc>
vnoremap <silent> <leader>aT c<C-R>=strftime('%Y-%m-%dT%T%z')<cr><esc>
noremap <silent> <leader>br :bufdo bd<cr>:call ScratchBuffer()<cr>
noremap <silent> <leader>bs :call ScratchBuffer()<cr>
noremap <silent> <leader>bd :bd!<cr>
noremap <silent> <leader>bD :silent! w \| %bd \| e#<cr>
noremap <silent> <leader>c :call ScratchBuffer()<cr>
noremap <silent> <leader>wd :q<cr>
noremap <silent> <leader>wD :q!<cr>
noremap <silent> <leader>wv :vsplit<cr>
noremap <silent> <leader>wt :tabe<cr>
noremap <silent> <leader>wm :only<cr>
noremap <silent> <leader>fw :silent! w<cr>
noremap <silent> <leader>fW :silent! wa<cr>
noremap <silent> <leader>fu :set undoreload=0<cr>:e<cr>
noremap <silent> <leader>fe :e!<cr>
noremap <silent> <leader>fE :silent! bufdo e!<cr>
noremap <silent> <leader>fn :let @+ = expand('%')<cr>
noremap <silent> <leader>fp :let @+ = expand('%:p:h')<cr>
noremap <silent> <leader>fP :let @+ = expand('%:p')<cr>
noremap <silent> <leader>fc :execute 'e' expand('%:r').'_.'.expand('%:e')<cr>
noremap <silent> <leader>fT :set filetype=
noremap <silent> <leader>qq :qa<cr>
noremap <silent> <leader>qQ :qa!<cr>
noremap <silent> <leader>qw :wqa<cr>
noremap <silent> <leader>qW :wqa!<cr>
noremap <silent> <leader>vD :tabe ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vd :e ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vs :so $MYVIMRC<cr>
noremap <silent> <leader>vi :PlugInstall<cr>
noremap <silent> <leader>vc :PlugClean<cr>
noremap <silent> <leader>vp :so $MYVIMRC<cr>:PlugInstall<cr>
noremap <silent> <leader>vu :PlugUpdate<cr>
noremap <silent> <leader>fD :call DeleteFileAndBuffer()<cr>
function! DeleteFileAndBuffer()
    if confirm('Delete this buffer and file?', "&Yes\n&No", 0) == 1
        call delete(expand('%'))
        bdelete!
    endif
endfunction
noremap <silent> <leader>fd :call delete(expand('%'))<cr>:set modified<cr>
noremap <silent> <leader>fm :Rename<space>
noremap <silent> <M-h> :bprevious<cr>
noremap <silent> <M-l> :bnext<cr>
noremap <silent> <leader>gs :MagitOnly<cr>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gvnnoremap <silent> <A-h> :bnext<cr>
nnoremap <silent> <A-l> :bprevious<cr>
nnoremap <silent> <leader>V ggvG$<cr>
noremap <silent> <leader>au :MundoToggle<cr>
noremap <silent> <leader>r :reg<cr>
noremap <silent> <leader>hh :tab h<space>
noremap <silent> <leader>hH :exe 'tab h ' . expand("<cword>")<cr>
noremap <silent> <leader>hb :map<space>
noremap <silent> <leader>as :Snippets<cr>
noremap <silent> <leader>hc :Commands<cr>
noremap <silent> <leader><tab> :b#<cr>
noremap Y y$
for i in range(1, 9)
    " <leader>{n} for window switching
    execute "noremap <silent> <leader>" . i . " :" . i . "wincmd W<cr>"
    " g{n} and M-{n} for tab switch
    execute "noremap g" . i . " " . i . "gt"
    execute "noremap <m-" . i . "> " . i . "gt"
endfor
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <cr> i<cr><esc>

" long lines
noremap k gk
noremap gk k
noremap j gj
noremap gj j
noremap 0 g0
noremap g0 0
noremap $ g$
noremap g$ $
noremap ^ g^
noremap g^ ^

" completion tab behaviour
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
let g:UltiSnipsExpandTrigger='<C-P>'
" completion enter behaviour
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
    return deoplete#mappings#smart_close_popup() . "\<cr>"
endfunction

" translator
let g:trans_dir = "~/apps/trans/"
function! Trans()
    exe system("mkdir -p " . g:trans_dir)
    let l:word = tolower(expand("<cword>"))
    let l:word_path = g:trans_dir . l:word . ".txt"
    if !filereadable(expand(l:word_path))
        if system("command -v trans") == ''
            echo("No trans executeble found.")
        else
            exe system("trans -no-ansi en: " . l:word . ">" . l:word_path)
        endif
    endif
    exe "e" fnameescape(l:word_path)
endfunction
noremap <silent> <leader>ad :call Trans()<cr>
noremap <silent> <leader>aD :tab sb<cr>:call Trans()<cr>

" lyrics
let g:lyrics_dir = "~/apps/lyrics/"
function! Lyrics()
    exe system("mkdir -p " . g:lyrics_dir)
    let l:song_name = substitute(tolower(getline('.')), " ", "_", "g")
    let l:song_path = g:lyrics_dir . l:song_name . ".txt"
    if !filereadable(expand(l:song_path))
        if system("command -v clyrics") == ''
            echo("No clyrics executeble found.")
        else
            exe system("clyrics " . l:song_name . ">" . l:song_path)
        endif
    endif
    exe "e" fnameescape(l:song_path)
endfunction
noremap <silent> <leader>al :call Lyrics()<cr>
noremap <silent> <leader>aL :tab sb<cr>:call Lyrics()<cr>

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
function! s:CombineSelection(line1, line2, cp)
    execute 'let char = "\u'.a:cp.'"'
    execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
vnoremap <silent> <leader>tO :Overline<cr>
vnoremap <silent> <leader>tU :Underline<cr>
vnoremap <silent> <leader>tD :DoubleUnderline<cr>
vnoremap <silent> <leader>tS :Strikethrough<cr>
noremap <silent> <leader>tl :set spelllang=
" snake to camel case
noremap <silent> <leader>tc :s#_\(\l\)#\u\1#g<cr>
" snake to pascal case
noremap <silent> <leader>tC :s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g<cr>
" camel to snake case
noremap <silent> <leader>ts :s#\C\(\<\u[a-z0-9]\+\\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<cr>

" global settings
" no comment formatting
au BufEnter * silent! set formatoptions-=cro
" transparency
hi Normal guibg=NONE ctermbg=NONE

" modes
function! ToggleVar(var, message)
    if a:var
        if a:message != ''
            echo a:message.' mode OFF'
        endif
        return 0
    else
        if a:message != ''
            echo a:message.' mode ON'
        endif
        return 1
    endif
endfunction
" autosave buffers on focus loss mode
let autoSaveMode = 1
nnoremap <silent> <leader>ms :let autoSaveMode=ToggleVar(autoSaveMode, 'autosave buffers')<cr>
au FocusLost * silent! exe autoSaveMode?'wa':''
" highlight symbol under cursor mode
let highlightSymbolMode = 0
nnoremap <silent> <leader>mH :let highlightSymbolMode=ToggleVar(highlightSymbolMode, 'symbol highlight')<cr>
au CursorHold * exe highlightSymbolMode?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none'
" hlsearch mode
nnoremap <silent> <leader>mh :call ToggleVar(&hlsearch, 'hlsearch')<cr>:set hlsearch!<cr>
" spellchecker mode
set spellcapcheck=
set spelllang=en
au FileType text setl spell
nnoremap <silent> <leader>mc :call ToggleVar(&spell, 'spellchecker')<cr>:set spell!<cr>
" strip trailing whitespaces mode
let stripTrailingWhitespacesMode = 1
nnoremap <silent> <leader>mw :let stripTrailingWhitespacesMode=ToggleVar(stripTrailingWhitespacesMode, 'strip trailing whitespaces')<cr>
au BufWritePre * silent! exe stripTrailingWhitespacesMode?'%s/\s\+$//e':''
" show interface mode
let showInterfaceMode = 1
function! ToggleInterface(if_show)
    if a:if_show == 0
        set nonumber
        set norelativenumber
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        set number
        set relativenumber
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <silent> <leader>mi :let showInterfaceMode=ToggleVar(showInterfaceMode, '')<cr>:call ToggleInterface(g:showInterfaceMode)<cr>
" toggle table mode
let g:table_mode_map_prefix = '<Leader>T'
nnoremap <silent> <leader>mt :TableModeToggle<cr>
" toggle read on focus mode
let readOnFocusMode = 1
nnoremap <silent> <leader>mr :let readOnFocusMode=ToggleVar(readOnFocusMode, 'read on focus')<cr>
au FocusGained * silent! exe readOnFocusMode?'checkt':''

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('around', 'rank', 20)
call deoplete#custom#set('buffer', 'rank', 32)
au FileType markdown,tex,vimwiki,text let b:deoplete_disable_auto_complete = 1
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_section_a = airline#section#create([])
let g:airline_section_z = airline#section#create([])
" NERDTree
let g:NERDTreeNotificationThreshold = 500
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
noremap <silent> <leader>ft :NERDTree<cr>
" noremap <silent> <leader>pt :exe filereadable(expand('%')) ? 'NERDTreeFind' : 'NERDTree'<cr>
noremap <silent> <leader>pt :exe filereadable(expand('%')) ? 'NERDTreeFind' : 'NERDTree'<cr>
let g:NERDTreeMapOpenRecursively = "go"
let g:NERDTreeMapPreview = "O"
" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
noremap <silent> <leader>ww :Windows!<cr>
noremap <silent> <leader>pf :GFiles!<cr>
noremap <silent> <leader>sf :call fzf#vim#ag_raw(". --hidden -U --ignore '.git*'", {'options': '--delimiter : --nth 4..'}, 1)<cr>
noremap <silent> <leader>ff :FZF!<cr>
nmap <silent> <leader>fs <leader>ff
noremap <silent> <leader>fa :FZF! -x ~<cr>
noremap <silent> <leader>sp :call fzf#vim#ag_raw(". --hidden --ignore '.git*'", {'options': '--delimiter : --nth 4..'}, 1)<cr>
noremap <silent> <leader>ss :BLines!<cr>
nmap <silent> <leader>sl <leader>ss
noremap <silent> <leader>s: :History:!<cr>
noremap <silent> <leader>sc :History:!<cr>
noremap <silent> <leader>s/ :History/!<cr>
nnoremap <silent> <leader>/ :exe '/' . expand("<cword>")<cr>
vnoremap / y/<C-R>"<CR>
noremap <silent> <leader>fr :History!<cr>
noremap <silent> <leader>fR :tabe<cr>:History!<cr>
" easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap <leader>d <plug>MoveMotionPlug
xmap <leader>d <plug>MoveMotionXPlug
nmap <leader>dd <plug>MoveMotionLinePlug
nmap <leader>D <plug>MoveMotionEndOfLinePlug
" somehow it did not work in scratch buffer
nmap <silent> s <plug>SubstituteOverMotionMap
nmap <silent> ss <plug>SubstituteLine
nmap <silent> S s$
vmap s S

" vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_path = '~/Dropbox/vimwiki'
let g:vimwiki_path_html = g:vimwiki_path . '/html'
let g:vimwiki_template_path = g:vimwiki_path . '/templates'
let g:vimwiki_template_ext = '.html'
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_ext = '.md'
let g:vjournal = {}
let g:vjournal.path = g:vimwiki_path
let g:vjournal.ext = g:vimwiki_ext
let g:vjournal.syntax = g:vimwiki_syntax
let g:vjournal.path_html = g:vimwiki_path_html
let g:vjournal.diary_rel_path = 'journal/'
let g:vjournal.diary_index = 'journal_index'
let g:vjournal.diary_header = 'Journal'
let g:vjournal.template_path = g:vimwiki_template_path
let g:vjournal.template_ext = g:vimwiki_template_ext
let g:vdiary = {}
let g:vdiary.path = g:vimwiki_path
let g:vdiary.ext = g:vimwiki_ext
let g:vdiary.syntax = g:vimwiki_syntax
let g:vdiary.path_html = g:vimwiki_path_html
let g:vdiary.diary_rel_path = 'diary/'
let g:vdiary.diary_index = 'diary_index'
let g:vdiary.diary_header = 'Diary'
let g:vdiary.template_path = g:vimwiki_template_path
let g:vdiary.template_ext = g:vimwiki_template_ext
let g:vimwiki_list = [g:vjournal, g:vdiary]
nmap <silent> <leader>ow <plug>VimwikiIndex
nmap <silent> <leader>oW <plug>VimwikiTabIndex
nmap <silent> <leader>os <plug>VimwikiUISelect
nmap <silent> <leader>oi <plug>VimwikiDiaryIndex
function! VimwikiMakeDiaryNoteFixed(count)
    if a:count == 2
        set spell
    endif
    echo a:count
    let g:vimwiki_current_idx=v:count1 - 1
    VimwikiMakeDiaryNote
endfunction
nmap <silent> <leader>od :<c-u>:call VimwikiMakeDiaryNoteFixed(v:count)<cr>
nmap <silent> <leader>oD :<C-U>let g:vimwiki_current_idx=v:count1 - 1<cr><plug>VimwikiTabMakeDiaryNote
nmap <silent> <leader>oy <plug>VimwikiMakeYesterdayDiaryNote
nmap <silent> <leader>og <plug>VimwikiDiaryGenerateLinks
nmap <silent> <leader>or <plug>VimwikiRenameLink
nmap <silent> <leader>oq <plug>VimwikiDeleteLink
nmap <silent> <leader>ot :VimwikiTOC<cr>
nmap <silent> <leader>on :exe "e" g:vimwiki_main.path . '/notes.md'<cr>
" markdown
set conceallevel=2
let g:vim_markdown_folding_disabled = 1

" calculator
nnoremap <silent> <leader>ac :,Crunch!<cr>
nnoremap <silent> <leader>ae :,Crunch<cr>
vnoremap <silent> <leader>ac :,Crunch!<cr>
vnoremap <silent> <leader>ae :Crunch<cr>
" indentLine
let g:indentLine_enabled = 0
" au FileType html,vue let g:indentLine_enabled = 1

" languages
au FileType javascript,vue setl softtabstop=2 shiftwidth=2
" format
au FileType sh au BufWritePre * :Autoformat
au FileType javascript au BufWritePre * :call JsBeautify()<cr>
au FileType json au BufWritePre * :call JsonBeautify()<cr>
au FileType jsx au BufWritePre * :call JsxBeautify()<cr>
au FileType html au BufWritePre * :call HtmlBeautify()<cr>
au FileType css au BufWritePre * :call CSSBeautify()<cr>
" ts
let g:nvim_typescript#type_info_on_hold=1
let g:nvim_typescript#signature_complete=1
au FileType typescript noremap <buffer> K :TSDoc<cr>
au FileType typescript noremap <buffer> <M-cr> :TSImport<cr>
au FileType typescript noremap <buffer> <C-b> :TSDef<cr>
au FileType typescript noremap <buffer> <C-S-b> :TSTypeDef<cr>
" elm
let g:elm_format_autosave = 1
au FileType elm nmap <buffer> K :ElmShowDocs<cr>
" vuejs
let g:vue_disable_pre_processors = 1
" haskell
let g:necoghc_enable_detailed_browse = 1
au FileType haskell nnoremap <buffer> <silent> ,t :w<cr>:GhcModType<cr>
au FileType haskell nnoremap <buffer> <silent> ,c :GhcModTypeClear<cr>
" elixir
let g:alchemist_tag_disable = 1
let g:mix_format_on_save = 1
