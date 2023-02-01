local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Is using a standard Neovim install, i.e. built from source or using a
    -- provided appimage.
    use 'lewis6991/impatient.nvim'

    use 'famiu/bufdelete.nvim'
    use "mhinz/vim-startify"
    use "mbbill/undotree"
    use "mg979/vim-visual-multi"
    use "MattesGroeger/vim-bookmarks"
    --==========================
    -- Motion and Text Object
    --==========================
    use "vim-scripts/argtextobj.vim"
    use 'vim-scripts/ReplaceWithRegister'
    use 'tommcdo/vim-exchange'
    use 'michaeljsmith/vim-indent-object'
    use "numToStr/Comment.nvim" -- gcc和gc注释
    use {
        'kana/vim-textobj-entire',
        requires = {
            'kana/vim-textobj-user'
        }
    }
    use "ggandor/leap.nvim"
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use( "Pocco81/auto-save.nvim")
    use "djoshea/vim-autoread"



    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
    use "nvim-treesitter/nvim-treesitter" -- 语法高亮
    use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    }
    -- 自动补全
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-buffer"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path" -- 文件路径
    use "f3fora/cmp-spell"
    use 'voldikss/vim-translator'

    -- snippets
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "rafamadriz/friendly-snippets"

    use "windwp/nvim-autopairs" -- 自动补全括号
    use "tpope/vim-surround"


    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })
    use 'j-hui/fidget.nvim'
    --==========================
    -- 外观
    --==========================
    -- 主题
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-lualine/lualine.nvim',  -- 状态栏
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
    }
    use "lewis6991/gitsigns.nvim" -- 左则git提示
    use "lukas-reineke/indent-blankline.nvim"
    -- 放到最后才能显示图标
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
