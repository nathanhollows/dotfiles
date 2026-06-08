return {
  -- Disable Enter as completion accept; use Tab / Ctrl-Y instead
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<CR>"] = {},
      },
    },
  },

  -- Disable scroll/jump animations and indentation highlighting
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      animate = { enabled = false },
      indent = { animate = { enabled = false } },
    },
  },

  -- Seamless navigation between nvim splits and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Telescope file browser extension
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>se",
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
        desc = "File Browser",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },

  -- ltex LSP: grammar/spell checking for LaTeX, Markdown, etc.
  -- debounce_text_changes prevents "checking document" on every keypress
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          flags = { debounce_text_changes = 2000 },
          settings = {
            ltex = {
              enabled = { "latex", "tex", "bib", "markdown" },
              language = "en-NZ",
            },
          },
        },
        templ = {},
      },
    },
  },

  -- templ: treesitter highlighting for .templ files
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "templ" })
    end,
  },
}
