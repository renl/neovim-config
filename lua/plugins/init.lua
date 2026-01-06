return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- Override nvim-treesitter to disable auto-installation
  -- Note: On Windows, treesitter requires a C compiler (gcc/clang recommended)
  -- See: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Completely override ensure_installed to empty array
      opts.ensure_installed = {}
      -- Uncomment below if you have a C compiler properly configured:
      -- opts.ensure_installed = { "vim", "lua", "vimdoc", "html", "css", "markdown", "markdown_inline" }
      return opts
    end,
  },

  -- Render markdown beautifully inside Neovim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      heading = {
        enabled = true,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      },
      code = {
        enabled = true,
        style = "full",
        border = "thin",
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
      quote = { enabled = true },
      pipe_table = { enabled = true, style = "full" },
    },
  },

  -- Live preview in browser (optional - requires Node.js)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
