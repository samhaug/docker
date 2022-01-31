syntax on
set number
set cursorline
set cursorcolumn
set colorcolumn=80

set tabstop=4    
set expandtab    
set shiftwidth=4 
set cindent     
set number
set hlsearch

set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf


function AddTemplate(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = $USER
    let substDict["date"] = strftime("%Y %b %d %X")
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

autocmd BufNewFile *.c  call AddTemplate("~/.vim/template/skeleton.c")
autocmd BufNewFile *.sh call AddTemplate("~/.vim/template/skeleton.sh")
autocmd BufNewFile *.py call AddTemplate("~/.vim/template/skeleton.py")





