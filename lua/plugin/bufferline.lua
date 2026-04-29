return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            text_align = "left",
            highlight = "Directory",
            separator = true,
          },
          {
            filetype = "snacks_layout_box",
          },
        },
      },
    },
  },
}