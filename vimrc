" vimrc @erodrigufer
"
" --------------------------------------------------------
"  				General configuration
" --------------------------------------------------------
" Necessary to use buffers effectively, otherwise  vim stops the user before 
" changing between buffers and not saving a buffer
set hidden
set encoding=utf-8
" Set backspace key as backspace, this change was necessary after updating vim 
" with homebrew
set backspace=2
" activate clipboard yank in Mac OS
set clipboard=unnamed 

" supress all bells
set belloff=all

" activate numbering of lines per default
" set nu

" Activate hybrid line numbering.
set number relativenumber

" activate syntax highlighting default, so that for example
" shell scripts will after the shebang get automatic highlighting
syntax on

" if text is searched it will be highlighted throughout the whole text
set hlsearch
" by pressing <Leader> (backslash) and space, the current search will not be 
" highlighted anymore
map <silent> <Leader><Space> :noh<CR>

" sets the number of columns occupied by a tab character. 
" The default is 8 columns. Setting the value to 4 (which is a common practice) 
" allows long lines to fit more easily on the screen.
set tabstop=4

" 'Levels of indentation', where a level of indentation is shiftwidth columns 
" of whitespace. That is, the shift-left-right commands, the formatting 
" commands, and the behavior of vim with cindent or autoindent set is 
" determined by this setting.
" Reference: https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
set shiftwidth=4

" turns on the “auto indent” feature. This causes vim to indent a new line the 
" same amount as the line just typed. This speeds up typing on many kinds of 
" programming constructs. To stop indentation, type Ctrl-d.
"set autoindent

" indentation depending on the language being written
set smartindent

" incremental search, starts searching right away when writing a search query
set incsearch

" add a colour column at 100 characters, to limit program width
set colorcolumn=80
highlight ColorColumn ctermbg=lightcyan guibg=blue

" this makes possible to do undo/redo changes, after closing vim or even after
" restarting the computer (persistent undo/redo)
if has('persistent_undo')		" check if your vim version supports feature
	set undodir=~/.vim/undo		" directory where the undo files will be stored
	set undofile				" turn on the feature
endif

" Properly configuring Omnicomplete
" Reference: 
" https://stackoverflow.com/questions/35837990/how-to-trigger-omnicomplete-auto-completion-on-keystrokes-in-insert-mode
" I removed the !pumvisible() part from the original answer, so that the auto-
" complete function updates every time I press a key with the whole menu. Before
" this change I was not seeing the whole suggestions pop-up window the whole 
" time
" Automatically call Omnicomplete on character pressed in insert mode, the
" characters which are recognized are the whole alphabet and period '.'
function! OpenCompletion()
	if ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z') || (v:char == '.'))
		call feedkeys("\<C-x>\<C-o>", "n")
	endif
endfunction
" If filetype (&ft) equals go enable the autocompletion with every key pressed
if &ft=='go'
	autocmd InsertCharPre * call OpenCompletion()
endif
" Show function preview below the screen
" set splitbelow
set completeopt+=menuone,noselect,noinsert

" --------------------------------------------------------
" 				General remaps
" --------------------------------------------------------
" nnoremap: in normal mode non-recursive remap
" non-recursive because the key will not be remaped inside the remap
" for example if remapping n, it will not have the same meaning 
" inside the remap
" Yank till the end of the line with Y
nnoremap Y y$
" Remove the newline from the 'yy' yank
nnoremap yy 0y$
" n=next | zz=center cursor on the screen | zv=open folds for this line
nnoremap n nzzzv
nnoremap N Nzzzv
" mz=set a mark | J=move the line below to the end of the current line | 
" `z=move
" back to where you put the mark originally
nnoremap J mzJ`z

" --------------------------------------------------------
" 				Remaps for buffers
" --------------------------------------------------------
" Pressing Leader+b let's the user switch to another buffer with fzf
nnoremap <Leader>b :Buffers<CR> 
" Switch to previous buffer
nnoremap <Leader>[ :bp<CR>
" Switch to next buffer
nnoremap <Leader>] :bn<CR>
" Open new buffer with a particular file, wait for user input on file name
nnoremap <Leader>= :Files<CR>
" Close only the current buffer without closing all other buffers
" Reference:
" https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
nnoremap <Leader>; :b#<bar>bd#<CR>

" --------------------------------------------------------
" 				Remaps for window managing
" --------------------------------------------------------
" <bar> denotes | ('pipe')
" <silent> do not show command after executing
" Vertical split of window 
nnoremap <silent> <Leader><bar> :vs<CR> 
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
" <BS> Backspace
" :%bdelete := delete all buffers
" Close all buffers, and close vim if changes are safe to close window.
" nnoremap <silent> <Leader><BS> :%bdelete<CR>:q<CR>
" Close any preview windows that have been open.
nnoremap <silent> <Leader><BS> :pc<CR>

" --------------------------------------------------------
" 				Plugings section
" --------------------------------------------------------
" Automatic installation of 'Plug' if it missing in the system
" Reference:
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" The '--sync' call stops the vimrc initialization until PlugInstall is done
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run ':PlugInstall' after saving and sourcing the .vimrc file to install a
" new plugin
" Automatic installation of missing plugins
" Reference: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs),'!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" THE plugin for Go development
" vim-go needs to install binaries
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Required for ':GoDecls' abd ':GoDeclsDir'
Plug 'ctrlpvim/ctrlp.vim'

" vim-airline, status bar UI
Plug 'vim-airline/vim-airline'

" VCS Git integration
Plug 'tpope/vim-fugitive'

" Git commit browser
Plug 'junegunn/gv.vim'

" Show VCS diff in sign column
Plug 'mhinz/vim-signify'

" Vim/Tmux pane navigation integration
Plug 'christoomey/vim-tmux-navigator'

" Filesystem navigator pane
Plug 'preservim/nerdtree'

" Markdown preview
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Generate TOC (Table of Contents) in Markdown files
Plug 'mzlogin/vim-markdown-toc'

" Install fzf in Vim as well
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comment and un-comment more easily, works in almost all languages.
" Use gcc to comment/un-comment a line, or gc+movement.
Plug 'tpope/vim-commentary'

" emmet-vim improves the HTML/CSS workflow.
Plug 'mattn/emmet-vim'

" Automatically re-name HTML tags.
Plug 'AndrewRadev/tagalong.vim'

" Change 'surrounds' of objects more easily: tags, ', ", ] or any symbol.
Plug 'tpope/vim-surround'

call plug#end()

" --------------------------------------------------------
" 			General configurations for plugins
" --------------------------------------------------------
" vim-airline
" Display all buffers when there is only one tab open
let g:airline#extensions#tabline#enabled = 1

" vim-markdown-toc
" In the TOC cycle through different symbols for the different levels (*, -
" and +)
let g:vmt_cycle_list_item_markers = 1

" emmet-vim
" Enable emmet-vim just for HTML, CSS and Go HTML templates.
let g:user_emmet_install_global = 0
autocmd FileType html,css,gohtmltmpl EmmetInstall
" Redefine trigger key to Control-X
let g:user_emmet_leader_key='<C-X>'

" tagalong.vim
" The plugin should also be active with Go HTML template files.
let g:tagalong_additional_filetypes = ['gohtmltmpl']
let g:tagalong_verbose = 1

" --------------------------------------------------------
" 				Key mappings for plugins
" --------------------------------------------------------
" NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Mapping to open NERDTree
nnoremap <Leader>t :NERDTree<CR>  
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1

" junegunn/gv.vim
" Open the commit history for the current file
nnoremap <Leader>g :GV!<CR>

" --------------------------------------------------------
" 				Go IDE section
" --------------------------------------------------------
" Check: https://github.com/fatih/vim-go/wiki/Tutorial#build-it
" For more tips on how to improve vim for golang
"
" Enable colourful syntax highlighting
" Highlight types
let g:go_highlight_types = 1 
let g:go_highlight_extra_types = 1
" Highlight struct fields
let g:go_highlight_fields = 1
" Highlight functions and functions' calls
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" Highlight operator
let g:go_highlight_operators = 1
" Highlight build tags
let g:go_highlight_build_constraints = 1
" Use vim 8.2 popup windows for Go Doc
" Press K over an identifier and a pop-up window with the docs will show up
let g:go_doc_popup_window = 1
" Change color of autocompletion pop-up window
hi Pmenu ctermbg=lightcyan
" Enable lsp for Go by using gopls (autocompletion)
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls-remote=auto'}
" Continually show the type information of the object under the cursor.
let g:go_auto_type_info = 1
" Delay before running some jobs, e.g. showing the type info of an object
" under the cursor (in [ms]). 
let g:go_updatetime = 300

" --------------------------------------------------------
" 				Go-specific key bindings
" --------------------------------------------------------
" Rename the identifier under the cursor to a desired new name. Very useful, 
" because it automatically renames the identifier across the whole package.
autocmd FileType go nmap <Leader>r <Plug>(go-rename)
" Show all the declarations (methods, functions, types) in the current
" directory and jump directly to them.
autocmd FileType go nmap <Leader>, <Plug>(go-decls-dir)
" Save the current file and perform a build of the package.
autocmd FileType go nmap <SPACE><SPACE> :w!<CR><Plug>(go-vet)<Plug>(go-build)

" --------------------------------------------------------
"  				gitAutomator integration
" --------------------------------------------------------
" Map <SPACE>g in normal mode to saving the current file and 
" then running in the terminal 'ga -p <current file name>'
" ga stands for gitAutomator, which will ask for a commit message and 
" will commit the current file
" without pushing the commits to the remote repo (-p flag)
map <SPACE>g :w<CR>:!ga -p %:t<CR>

" the same as above, but this time the commits will be pushed
" <SPACE>p stands for Push
map <SPACE>p :w<CR>:!ga %:t<CR> 

" use gitAutomator to push, use the 'w' flag to open the GitHub Actions job 
" status after pushing
map <SPACE>w :w<CR>:!ga -w %:t<CR>

" --------------------------------------------------------
" 			Config for markdown files
" --------------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown
" buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use only in markdown files
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as parameter
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: the cursor position always appears in the middle of the preview
" 			page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of
" 			  the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default:
" v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
\ 'mkit': {},
\ 'katex': {},
\ 'uml': {},
\ 'maid': {},
\ 'disable_sync_scroll': 0,
\ 'sync_scroll_type': 'middle',
\ 'hide_yaml_meta': 0,
\ 'sequence_diagrams': {},
\ 'flowchart_diagrams': {},
\ 'content_editable': v:false,
\ 'disable_filename': 0
\ }

" use a custom markdown style, it must be an absolute path like:
" '/Users/username/markdown.css' or expanded ('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style, it must be an absolute path like:
" '/Users/username/highlight.css' or expanded ('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start the server or a random one for empty
let g:mkdp_port = ''
" preview page title ${name} will be replace with the file's name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes, these filetypes will have MarkdownPreview commands
let g:mkdp_filetypes = ['markdown']

autocmd FileType markdown nmap <silent> <Leader>m <Plug>MarkdownPreview
autocmd FileType markdown nmap <silent> <SPACE>m <Plug>MarkdownPreviewStop
" --------------------------------------------------------
" 			Enhanced mappings for F-Keys
" --------------------------------------------------------
" in normal mode F1 will save the file and exit
nmap <F1> :wq!<CR>
" in insert mode F1 will exit insert, save, and exit vim
imap <F1> <ESC>:wq!<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, and return to insert mode
imap <F2> <ESC>:w<CR>i
" Map <F3> in normal mode to saving the current file and then 
" running in the terminal 'ga -p <current file name>'
" ga stands for gitAutomator, which will ask for a commit message and will 
" commit the current file
" without pushing the commits to the remote repo (-p flag)
map <F3> :w<CR>:!ga -p %:t<CR>
" the same as above, but this time the commits will be pushed
" <F4> stands for Push
map <F4> :w<CR>:!ga %:t<CR> 
" use gitAutomator to push, use the 'w' flag to open the GitHub Actions job 
" status after pushing
map <F5> :w<CR>:!ga -w %:t<CR>
" save and build using make with
map <F9> :w<CR>:make<CR>
" clean using make with <S-F8>
" DISABLED, because it is not working with Shift 
" map <S-F8> :make clean<CR>
" save, build and run using make with
map <F10> :w<CR>:!make run<CR>

" --------------------------------------------------------
" 				C-specific key bindings
" --------------------------------------------------------
" switch between header/source with (only on C files)
" Reference explaining key mapping:
" https://stackoverflow.com/questions/22144668/vim-help-in-understanding-x123x
autocmd FileType c map <F8> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" Insert a comment in C
" add ' /* c */ and then go back 2 words and substitute the letter 'c' to 
" insert a comment
autocmd FileType c,cpp map <BS> :call AddComment()<CR>bbs

" This functions adds '/* c */' right after the current cursor position
function AddComment()
" normal! is like typing the following letters in normal mode
" so 'a' will append '/* c */' to the current cursor position
	:normal! a/* c */
endfunction

" --------------------------------------------------------
" 				python-specific key bindings
" --------------------------------------------------------
" Run python scripts in normal mode after pressing <Space> twice
" Stores the program, then ENTER=<CR> [Carriage Return] -> Run python3 in 
" terminal with file name (%)
" The script activates itself automatically, only when running a python 
" script 'autocmd FileType python'
" References:
" 1) https://stackoverflow.com/questions/18948491/running-python-code-in-vim
" 2) https://stackoverflow.com/questions/8373710/vim-on-mac-os-x-function-key-mapping-not-working
autocmd FileType python map <SPACE><SPACE> :w<CR>:!clear;python3 %<CR>

" --------------------------------------------------------
" 				shell-specific key bindings
" --------------------------------------------------------
" Run sh/bash scripts in normal mode after pressing <Space> twice
" Stores the program, then ENTER=<CR> [Carriage Return] 
" -> Run in terminal with file name (%)
" The script activates itself automatically, only when running a 
" sh/bash script 'autocmd FileType sh'
" The script must have the file extension .sh or be represented as a sh/bash 
" script with a shebang '#!/bin/bash'
" References:
" 1) https://stackoverflow.com/questions/18948491/running-python-code-in-vim
" 2) https://stackoverflow.com/questions/8373710/vim-on-mac-os-x-function-key-mapping-not-working
autocmd FileType sh map <SPACE><SPACE> :w<CR>:!clear;./%<CR>

" --------------------------------------------------------
" 				markdown-specific key bindings
" --------------------------------------------------------
" use markdownConverter to create html version of currently opened markdown file
" and open html in browser
autocmd FileType markdown map <F8> :w<CR>:!markdownConverter --html %:t <CR>

" --------------------------------------------------------
" 					tmux integration
" --------------------------------------------------------
" Configure tmux to show file name on pane, after accessing file
" Check for more info: 
" https://vi.stackexchange.com/questions/3897/how-to-label-tmux-tabs-with-the-name-of-the-file-edited-in-vim
" It goes back to normal automatic pane-renaming after leaving vim
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '[vim]" . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")
