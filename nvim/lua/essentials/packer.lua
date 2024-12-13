vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope for searching files and more
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Rose-pine theme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine') -- Corrected the colorscheme name
        end
    })

    -- Treesitter for better syntax highlighting
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    -- Which-key setup
    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup {
                -- Add your own configuration options here
            }
        end
    }

    -- LSP, completion and snippet setup
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    -- Mason setup
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }

    -- mason-lspconfig setup
    use {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",  -- Ensure mason-lspconfig loads after mason.nvim
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright" },  -- Example LSP servers
            })
        end
    }

end)

