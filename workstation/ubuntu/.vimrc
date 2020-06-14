tabdo set nowrap
map t :tabn<Enter>
map r :tabp<Enter>
tabdo set number
tabdo set ignorecase
tabdo set smartcase
tabdo set incsearch
tabdo set tabpagemax=100
tabdo set hlsearch
tabdo set autoindent
tabdo set tabstop=4
tabdo set softtabstop=4
tabdo set shiftwidth=4
tabdo set expandtab

"folding settings
"set foldmethod=indent
"set foldnestmax=2
"set nofoldenable
"set foldlevel=1
"Then you can toggle folding with za. You can fold everything with zM and unfold everything with zR. zm and zr can be used to get those folds just right. Always remember the almighty help file at “help :folding” if you get stuck.

vnoremap s y:/<C-r>"<CR>
map 0 "0p
map <Tab> :setlocal autoindent<Enter>
map <s-tab> :setlocal noautoindent<Enter>
map w <C-w><C-w>
map <C-u> gU
map <C-l> gu
map <ENTER> <C-f>
map \ <C-b>
map <End> $
map ; $i<Right>;<Esc>
map <C-t> :TComment<Enter>
map l $
map <C-d> o<ESC>i/**<CR> * Enter Description<CR>*<CR>* Param List<CR>* @param string $paramName1<CR>* @param string $paramName1<CR>*<CR>*<CR>* @return <CR>*/<ESC>>10<up><down><down>eebvee
command Syntaxsync call SyntaxSync()
command Psr2 call PhpCsFixerFixFile()

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

tabdo set timeoutlen=0
tabdo set vb

tabdo set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
tabdo set laststatus=2
tabdo set mousehide
tabdo set scrolloff=8
tabdo set incsearch
tabdo set synmaxcol=2048

if &diff
    " diff mode
    tabdo set diffopt+=iwhite
endif

"function! convDevConf()
"    :%s/\/var\/www\//\/home\/rob\/sandbox\//g
"    :%s/.com/.rob.devserver/g
"endfunction

set formatoptions-=r

colorscheme default

highlight DiffAdd cterm=none ctermfg=green ctermbg=black
highlight DiffDelete cterm=none ctermfg=darkred ctermbg=black
highlight DiffChange cterm=none ctermfg=none ctermbg=black
highlight DiffText cterm=none ctermfg=black ctermbg=darkyellow

hi Comment ctermfg=23

autocmd BufRead,BufNewFile *.ts set filetype=javascript

"psr2 (php-cs-fixer) fixer start
if !&diff
    autocmd BufWritePost *.php silent! call RunAfterSaveProcess()
    autocmd BufWritePost *.php nested :edit 
endif

let g:php_cs_fixer_config_file = '/home/rbaldessari/.vim/.php_cs.dist'

function RunAfterSaveProcess()
    call PhpCsFixerFixFile()
endfunction
"psr2 (php-cs-fixer) fixter end

function SyntaxSync()
    syntax sync fromstart
endfunction
