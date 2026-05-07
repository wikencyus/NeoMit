return {
  "Pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    execution_message = {
      message = function() return "sv!" end,
    },
    debounce_delay = 500,
  },
  keys = {
    { "<leader>uv", "<cmd>ASToggle<CR>", desc = "Toggle Autosave" },
  },
}

