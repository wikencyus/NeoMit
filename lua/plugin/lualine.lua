return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" }, 
      },
      sections = {
        lualine_a = { { "mode", fmt = function(str) return " " .. str .. " " end } },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          -- "diagnostics",
          {
            function()
              local clients = vim.lsp.get_clients()
              if #clients > 0 then
                return "󰌘 " .. clients[1].name
              end
              return ""
            end,
            cond = function()
              return #vim.lsp.get_clients() > 0
            end,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { { "location", padding = { left = 1, right = 1 } } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree" },
    })
  end,
}