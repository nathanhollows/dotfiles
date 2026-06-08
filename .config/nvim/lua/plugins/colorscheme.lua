return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "auto"
      opts.options.section_separators = { left = "\xee\x82\xb4", right = "\xee\x82\xb6" }
      opts.options.component_separators = { left = "\xee\x82\xb5", right = "\xee\x82\xb7" }
      opts.sections = opts.sections or {}
      opts.sections.lualine_z = {}
      return opts
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
