"maps accidental key strokes on commands to their actual commands
:command Q :q
:command Qa :qa
:command QA :qa
:command Xa :xa
:command XA :xa
:command W :w
:command Wa :wa
:command WA :wa

"maps jj and kk to the escape key
:imap jj <Esc>
:imap kk <Esc>
:imap jk <Esc>
:imap kj <Esc>

"turns on synatx highlighting
syntax on
colorscheme inkpot

"underlines the cursor line
hi CursorLine cterm=underline

"underline the current tab
hi TabLineSel cterm=underline

"allows to hide unsaved buffers
set hidden

"folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"tab stop and indent width at 4 and automatic indenting
"set ts=4
"set shiftwidth=4
"set smartindent
"bhvr settings
set expandtab
set ts=4
set shiftwidth=4
set smartindent

"set line numbers
set number

"set autocompletion for various languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"maps auto complete to ctrl+space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set laststatus=2

"Enable indent folding
set foldenable
"set fdm=indent

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"Set line numbering to take up 5 spaces
set numberwidth=5 
set cursorline

"Turn on spell checking with English dictionary
set spell
set spelllang=en
set spellsuggest=9 "show only 9 suggestions for misspelled words

"change the highlighting for spell checks 
hi clear SpellBad
hi SpellBad cterm=underline

"run ctags on the current directory and make a ctags file called .vim_ctags
echo 'generating ctags for all child folders, ctrl-c to cancel'
call system('exec ctags -f `pwd`/.vim_ctags -h \"`pwd`.php\" -R --exclude=\"`pwd`\.svn\" --exclude=\"`pwd`\.cvs\" --exclude=\"`pwd`\.git\" --exclude=\"`pwd`\.hg\" --totals=no --tag-relative=yes --PHP-kinds=+cf --regex-PHP="/abstract class ([^ ]*)/\1/c,class/" --regex-PHP="/interface ([^ ]*)/\1/c,class/" --regex-PHP="/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f,function/"')

"set vim tags to use the vim_ctags file
set tags=.vim_ctags

"add some extra commands to refresh ctags
command RefreshTags :call system('exec ctags -f `pwd`/.vim_ctags -h \"`pwd`.php\" -R --exclude=\"`pwd`\.svn\" --exclude=\"`pwd`\.cvs\" --exclude=\"`pwd`\.git\" --exclude=\"`pwd`\.hg\" --totals=no --tag-relative=yes --PHP-kinds=+cf --regex-PHP="/abstract class ([^ ]*)/\1/c,class/" --regex-PHP="/interface ([^ ]*)/\1/c,class/" --regex-PHP="/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f,function/"')
command RefreshCtags :call system('exec ctags -f `pwd`/.vim_ctags -h \"`pwd`.php\" -R --exclude=\"`pwd`\.svn\" --exclude=\"`pwd`\.cvs\" --exclude=\"`pwd`\.git\" --exclude=\"`pwd`\.hg\" --totals=no --tag-relative=yes --PHP-kinds=+cf --regex-PHP="/abstract class ([^ ]*)/\1/c,class/" --regex-PHP="/interface ([^ ]*)/\1/c,class/" --regex-PHP="/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f,function/"')
command Ctags :exec ":set tags=.vim_ctags"
command SetCtags :exec ":set tags=.vim_ctags"
command SetTags :exec ":set tags=.vim_ctags"
"command Getctags 
"command Gettags 
"command Generatectags 
"command Generatetags 

"delete tags file after quiting vim
au VimLeave * call system('rm .vim_ctags')
