" __  ____   __  ___ _   _ ___ _______     _____ __  __  
"|  \/  \ \ / / |_ _| \ | |_ _|_   _\ \   / /_ _|  \/  | 
"| |\/| |\ V /   | ||  \| || |  | |  \ \ / / | || |\/| | 
"| |  | | | |    | || |\  || |  | |_  \ V /  | || |  | | 
"|_|  |_| |_|   |___|_| \_|___| |_(_)  \_/  |___|_|  |_| 
                                                        


" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
"切换buffer不需要保存
set hidden
" 剪贴板共享
" set clipboard+=unnamedplus

" ===================== Start of Keybindings Settings =====================
" 定义快捷键到行首和行尾
nmap <C-a> ^
nmap <C-e> $
inoremap jj <ESC>
" 设置快捷键将选中文本块复制至系统剪贴板
" nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
" nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ===================== Start of Plugin List=====================
call plug#begin('~/.comfig/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
" Plug 'airblade/vim-gitgutter'
" Plug 'APZelos/blamer.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'voldikss/vim-floaterm'
Plug 'fadein/vim-FIGlet'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
" Plug 'puremourning/vimspector'
"Plug 'codota/tabnine-vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree'
" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

Plug 'iamcco/markdown-preview.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/argtextobj.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tommcdo/vim-exchange'
"主题插件
Plug 'overcache/NeoSolarized'
Plug 'jacoborus/tender.vim'
" colorscheme tender
Plug 'rakr/vim-one'
" colorscheme one
Plug 'drewtempelmeyer/palenight.vim'
" colorscheme palenight
Plug 'KeitaNakamura/neodark.vim'
" colorscheme neodark
Plug 'crusoexia/vim-monokai'
" colorscheme monokai
Plug 'morhetz/gruvbox'
" colorscheme gruvbox

"状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'ap/vim-buftabline'
"Plug 'glepnir/spaceline.vim'
" Use the icon plugin for better behavior
"Plug 'ryanoasis/vim-devicons'
" 插件列表结束
call plug#end()
" ===================== Start of Theme Settings =====================
" 支持真彩色
set termguicolors
" 配色方案
set background=dark
"colorscheme tender
"colorscheme one
"colorscheme palenight
"colorscheme neodark
"colorscheme monokai
"colorscheme gruvbox
colorscheme NeoSolarized
"colorscheme solarized

" 设置状态栏主题风格

" ==
" == vim-airline
" ==
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>
" ==
" == spaceline.vim
" ==
"let g:spaceline_seperate_style = 'arrow'
"let g:spaceline_colorscheme = 'dracula'
"let g:spaceline_custom_vim_status = {"n": "🅝 ","V":"🅥 ","v":"🅥 ","\<C-v>": "🅥 
"			\,"i":"🅘 ","R":"🅡 ","s":"🅢 ","t":"🅣 ","c":"🅒 ","!":"SE"}


" ===================== start of plugin settings =====================
" ===
" === fzf
" ===
" the straightforward way to use fzf.vim is appending this line to your vimrc
"source /usr/share/doc/fzf/examples/fzf.vim
" find file
noremap \ :FZF<CR>
" find history
noremap <C-h> :MRU<CR>
" find lines containing keywords
noremap <C-l> :LinesWithPreview<CR>
" find buffer
noremap <C-b> :Buffers<CR>
noremap <C-t> :BTags<CR>
noremap <leader>h :History:<CR>
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --sort'}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())


" ==
" == Git-Gutter
" ==
" let g:gitgutter_signs = 0
" let g:gitgutter_sign_allow_clobber = 0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
" " autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ==
" == lazygit.nvim
" ==
noremap <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_scaling_factor = 1 "  factor for floating window

" ==
" === lazygit.nvim
" ===
noremap <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support=
" ==
" == Undotree
" ==
nnoremap un :UndotreeToggle<CR>

" ==
" == NERDTree
" ==
nmap tt :NERDTreeToggle<CR>
" ==
" == Vimspector
" ==
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools' ]
" let g:vimspector_enable_mappings = 'HUMAN'
"2. 添加快捷键<leader>db快速生成.vimspector.json
"vimspector
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"let g:vimspector_base_dir=expand('~/.vim/.vimspectorjson')
"function! s:read_template_into_buffer(template)
"    " has to be a function to avoid the extra space fzf#run insers otherwise
"    execute '0r ~/.vim/.vimspectorjson/'.a:template
"endfunction
"command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
"            \   'source': 'ls -1 ~/.vim/.vimspectorjson',
"            \   'down': 20,
"            \   'sink': function('<sid>read_template_into_buffer')
"            \ })
"noremap <leader>db :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
"sign define vimspectorBP text=☛ texthl=Normal
"sign define vimspectorBPDisabled text=☞ texthl=Normal
""sign define vimspectorPC text=¶ texthl=SpellBad

" ===
" === startify
" ===
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
" ==
" == nerdcommenter
" ==
"创建默认映射
" let g:NERDCreateDefaultMappings = 1
" let g:NERDSpaceDelims = 1 


" ==
" == floaterm
" ==
noremap <leader>ra :FloatermNew ranger<CR>
" noremap <leader>lg :FloatermNew lazygit<CR>
" ==
" == markdown
" ==
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-m> <Plug>MarkdownPreviewToggle
" 指定浏览器路径
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_browser = 'chrome'
let g:mkdp_auto_start = 1
let g:mkdp_command_for_global = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_to_the_world = 1
" ==
" == blamer.nvim
" ==
" let g:blamer_enabled = 1
" let g:blamer_delay = 100
" let g:blamer_prefix = ' 鹿 '
" highlight Blamer guifg=lightgrey
" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mi <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==
" == coc.nvim
" ==
let g:coc_global_extensions = ['coc-pairs','coc-explorer','coc-lightbulb','coc-git','coc-translator','coc-json','coc-clangd','coc-python','coc-vimlsp','coc-snippets','coc-sh','coc-marketplace','coc-flutter-tools']

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
"使用Tab进行选择补全
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 使用`[g` 和 `]g`去导航诊断
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code 导航.
" 列出定义列表
nmap <silent> gd <Plug>(coc-definition)
" 转至类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 待办事项清单
nmap <silent> gi <Plug>(coc-implementation)
" 列出参考列表
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" 按住光标时突出显示符号及其引用。
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" 将codeAction应用到所选区域。
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ===
" ===
"coc-translator
" ===
" ===
" 弹出翻译窗口
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>r <Plug>(coc-translator-r)
vmap <Leader>r <Plug>(coc-translator-rv)
" ===
" ===
" coc-git
" ===
" ===
noremap <leader>gf :CocCommand git.foldUnchanged<CR>
" navigate chunks of current buffer
nmap <Leader>- <Plug>(coc-git-prevchunk)
nmap <Leader>= <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nmap tt :CocCommand explorer<CR>
" ompile function
noremap <leader>rr :call CompileRunGcc()<CR>
function! CompileRunGcc()
  execute "w"
  if &filetype == 'c'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!gcc % -o build/%<"
    execute "!time ./build/%<"
  endif
endfunction
