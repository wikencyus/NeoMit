return {
  "folke/which-key.nvim",
  lazy = false,
  opts = {},
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}