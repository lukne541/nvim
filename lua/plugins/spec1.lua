return {
  { 
    "danymat/neogen", 
    config = true,
    version = "*" 
  },
	{
    'nvim-lualine/lualine.nvim',
	  lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup { options = { theme = 'auto' }}
    end,
    },
	{
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
  },
	{ "folke/todo-comments.nvim", opts = {} },
	{ 'neoclide/coc.nvim', branch = 'release', },
        {
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "MunifTanjim/nui.nvim",
	      "nvim-tree/nvim-web-devicons", 
	    },
	    lazy = false 
	},
	{ -- Highlight, edit, and navigate code
         'nvim-treesitter/nvim-treesitter',
	 event = { "BufReadPost", "BufNewFile" },
	 lazy = false,
         build = ':TSUpdate',
         main = 'nvim-treesitter.configs', -- Sets main module to use for opts
         -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
         opts = {
           ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
         -- Autoinstall languages that are not installed
         auto_install = true,
         highlight = {
           enable = true,
         },
         indent = { enable = true, disable = { 'ruby' } },

    },
  },
}
