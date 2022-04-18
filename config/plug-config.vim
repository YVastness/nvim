colorscheme NeoSolarized
" 设置状态栏主题风格

" ==
" == vim-airline
" ==
" let g:airline#extensions#tabline#enabled = 1
" nnoremap <C-j> :bnext<CR>
" nnoremap <C-k> :bprev<CR>
" ==
" == spaceline.vim
" ==
"let g:spaceline_seperate_style = 'arrow'
"let g:spaceline_colorscheme = 'dracula'
"let g:spaceline_custom_vim_status = {"n": "🅝 ","V":"🅥 ","v":"🅥 ","\<C-v>": "🅥 
"			\,"i":"🅘 ","R":"🅡 ","s":"🅢 ","t":"🅣 ","c":"🅒 ","!":"SE"}


" lua插件配置
set termguicolors
lua << EOF
require("bufferline").setup{
  options = {
    --numbers = "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    --numbers = "both",
    --- @deprecated, please specify numbers as a function to customize the styling
    --number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    --number_style = "none",
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match("%.md") then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 15,
    max_prefix_length = 12, -- prefix used when a buffer is de-duplicated
    tab_size = 15,
    --diagnostics = false | "nvim_lsp" | "coc",
    diagnostics = "coc",
    diagnostics_update_in_insert = false,
    --[[diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,]]
    -- rest of config ...

    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      --如果是defx则隐藏
      local finded, _ = string.find(vim.bo[buf_number].filetype, "defx")
      if finded ~= nil then
        return false
      end
      return true
    end,
    --offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
    --show_buffer_icons = true | false, -- disable filetype icons for buffers
    show_buffer_icons = true, -- disable filetype icons for buffers
    --show_buffer_close_icons = true | false,
    show_buffer_close_icons = false,
    --show_close_icon = true | false,
    show_close_icon = false,
    --show_tab_indicators = true | false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    --separator_style = "slant" | "thick" | "thin" | {"any", "any"},
    separator_style = "thin",
    --enforce_regular_tabs = false | true,
    enforce_regular_tabs = false,
    --always_show_bufferline = true | false,
    always_show_bufferline = true
    --[[sort_by = "id" | "extension" | "relative_directory" | "directory" | "tabs" | function(buffer_a, buffer_b)
        -- add custom logic
        return buffer_a.modified > buffer_b.modified
      end]]
  }
}
require('lualine').setup{
options = { theme = 'modus-vivendi' }
}
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" ==
" == bufferline.nvim
" ==
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><C-k> :BufferLineCycleNext<CR>
nnoremap <silent><C-j> :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><A-j> :BufferLineMoveNext<CR>
nnoremap <silent><A-k> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
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

" ===
" === lazygit.nvim
" ===
" noremap <leader>lg :LazyGit<CR>
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
" nmap tt :NERDTreeToggle<CR>
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
noremap <leader>ra :FloatermNew --height=0.9 --width=0.9 ranger<CR>
noremap <leader>gw :FloatermNew --height=0.9 --width=0.9 glow -p %:t<CR>
noremap <leader>rr :FloatermNew --height=0.9 --width=0.5 --position=topright --autoclose=0 gcc % -o %< && ./%<<CR>
noremap <leader>te :FloatermToggle<CR>

" noremap <leader>lg :FloatermNew lazygit<CR>
" ==
" == markdown
" ==
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-m> <Plug>MarkdownPreviewToggle
" 指定浏览器路径
"let g:mkdp_preview_options = {
"    \ 'mkit': {},
"    \ 'katex': {},
"    \ 'uml': {},
"    \ 'maid': {},
"    \ 'disable_sync_scroll': 0,
"    \ 'sync_scroll_type': 'middle',
"    \ 'hide_yaml_meta': 1,
"    \ 'sequence_diagrams': {},
"    \ 'flowchart_diagrams': {},
"    \ 'content_editable': v:false,
"    \ 'disable_filename': 0
"    \ }
let g:mkdp_browser = 'msedge'
"let g:mkdp_auto_start = 1
"let g:mkdp_command_for_global = 1
"let g:mkdp_echo_preview_url = 1
"let g:mkdp_open_to_the_world = 1
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
" ===
" === vim-quickrun
" ===
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}
let g:quickrun_no_default_key_mappings = 1
" nmap <Leader>rr <Plug>(quickrun)
map <M-r> :QuickRun<CR>

" ===
" === Telescope
" ===
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
