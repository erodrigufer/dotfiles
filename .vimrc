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
" ga <current file name>
" ga stands for gitAutomator, which will ask for a commit message and will commit the current file
map <SPACE>g :w<CR>:!ga %:t

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
set tabstop=2

" turns on the “auto indent” feature. This causes vim to indent a new line the same amount as the line just typed. This speeds up typing on many kinds of program- ming constructs. To stop indentation, type Ctrl-d.
set autoindent

" --------------------------------------------------------
func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " activate numbering of lines
  set nu
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  " In order to unlock the dictionary corrections
  " unlock the next two lines!
  "
  " setlocal spell spelllang=de,en
  " set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  "
  " complete+=s makes autocompletion search the thesaurus
  " set complete+=s
endfu
com! WP call WordProcessor()

" --------------------------------------------------------
func! CPP()
" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif
endfu
com! CPP call CPP()


