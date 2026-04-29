return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    style = "moon",
    transparent = false,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end
}
