local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  { -- fやtコマンドで一回か2回で飛べる文字をハイライト
    "unblevable/quick-scope",
    event = "BufReadPost",
	},

  { -- 同じ文字をハイライト
		"RRethy/vim-illuminate",
		event = "BufReadPost",
	},

  { -- todoなどのコメントをハイライト、telescopeで検索
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		wants = {
			"plenary.nvim",
			"telescope.nvim",
		},
		config = function() require("plugins.configs.todo_comments") end,
	},

  { -- markした行を行番号の左にサイン
		"chentoast/marks.nvim",
		event = "CursorMoved",
		config = function() require("plugins.configs.marks") end,
	},

  { -- 無駄の空白の赤ハイライト
		"ntpeters/vim-better-whitespace",
		event = "BufReadPost",
		setup = function() require("plugins.configs.whitespace") end,
	},

  { -- editorconfigの使用
		"editorconfig/editorconfig-vim",
		opt = true,
	},

  { -- エラー等一覧表示
		"folke/trouble.nvim",
    cmd = { "TroubleToggle" },
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function() require("trouble").setup() end,
	},

  { -- カーソル移動をどこでも一発で
		"phaazon/hop.nvim",
		branch = "v2",
    cmd = { "HopWord", "HopVertical", "HopAnywhere" },
		config = function()
      require("hop").setup()
    end,
	},

  { -- j,k長押しでカーソル加速
		"rhysd/accelerated-jk",
		event = "CursorMoved",
		config = function()
      vim.keymap.set({ "n" }, "j", "<Plug>(accelerated_jk_gj)")
      vim.keymap.set({ "n" }, "k", "<Plug>(accelerated_jk_gk)")
    end,
	},

}

return plugins
