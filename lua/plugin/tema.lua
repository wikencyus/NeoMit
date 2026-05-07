return {
  {"catppuccin/nvim", name="catppuccin", priority=1000},
  {"Shatur/neovim-ayu"},
  {"ellisonleao/gruvbox.nvim"},
  {"folke/tokyonight.nvim"},
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function ()
      require("themery").setup({
        themes = {"gruvbox", "ayu", "tokyonight", "catppuccin"},
        livePreview = true,
      })
    end
  },
}
