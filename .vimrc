" Run python scripts in normal mode after pressing <Space> twice
" Stores the program, then ENTER=<CR> [Carriage Return] -> Run python3 in terminal with file name (%)
" The script activates itself automatically, only when running a python script 'autocmd FileType python'
" References:
" 1) https://stackoverflow.com/questions/18948491/running-python-code-in-vim
" 2) https://stackoverflow.com/questions/8373710/vim-on-mac-os-x-function-key-mapping-not-working
autocmd FileType python map <SPACE><SPACE> :w<CR>:!clear;python3 %<CR>

" Run sh/bash scripts in normal mode after pressing <Space> twice
" Stores the program, then ENTER=<CR> [Carriage Return] -> Run in terminal with file name (%)
" The script activates itself automatically, only when running a sh/bash script 'autocmd FileType sh'
" The script must have the file extension .sh or be represented as a sh/bash script with a shebang '#!/bin/bash'
" References:
" 1) https://stackoverflow.com/questions/18948491/running-python-code-in-vim
" 2) https://stackoverflow.com/questions/8373710/vim-on-mac-os-x-function-key-mapping-not-working
autocmd FileType sh map <SPACE><SPACE> :w<CR>:!clear;./%<CR>

" Map <SPACE>g in normal mode to saving the current file and then running in the terminal 
" ga -p <current file name>
" ga stands for gitAutomator, which will ask for a commit message and will commit the current file
" without pushing the commits to the remote repo, because we are using the -p flag
map <SPACE>g :w<CR>:!ga -p %:t<CR>

" the same as above, but this time the commits will be pushed
" <SPACE>p stands for Push
map <SPACE>p :w<CR>:!ga %:t<CR> 

" Set backspace key as backspace, this change was necessary after updating vim with homebrew
set backspace=2
" activate clipboard yank in Mac OS
set clipboard=unnamed 

" activate numbering of lines per default
set nu
" activate syntax highlighting default, so that for example
" shell scripts will after the shebang get automatic highlighting
syntax on

" if text is searched it will be highlighted throughout the whole text
set hlsearch

" sets the number of columns occupied by a tab character. The default is 8 columns. Setting the value to 4 (which is a common practice) allows long lines to fit more easily on the screen.
set tabstop=4

" 'Levels of indentation', where a level of indentation is shiftwidth columns of whitespace. That is, the shift-left-right commands, the formatting commands, and the behavior of vim with cindent or autoindent set is determined by this setting.
" Reference: https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
set shiftwidth=4

" turns on the “auto indent” feature. This causes vim to indent a new line the same amount as the line just typed. This speeds up typing on many kinds of program- ming constructs. To stop indentation, type Ctrl-d.
set autoindent

" --------------------------------------------------------
" Enhanced keyboard mappings
" in normal mode F1 will save the file
nmap <F1> :w<CR>
" in insert mode F1 will exit insert, save, enters insert again
imap <F1> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
" save and build using make with <F8>
map <F8> :w<CR>:make<CR>
" clean using make with <S-F8>
" DISABLED, because it is not working with Shift 
" map <S-F8> :make clean<CR>
" save, build and run using make with <F9>
map <F9> :w<CR>:!make run<CR>
