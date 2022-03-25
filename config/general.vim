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
" 拼写检查
" setlocal spell spelllang=en_us,cjk

" ===================== Start of Keybindings Settings =====================
" 定义快捷键到行首和行尾
" inoremap <C-a> ^
" inoremap <C-e> $
vnoremap y "+y
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
" colorscheme NeoSolarized
"colorscheme solarized

" ===================== start of plugin settings =====================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
