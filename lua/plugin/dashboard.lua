return {
  "nvimdev/dashboard-nvim",
  enabled = true,
  opts = function ()
      local logo = [[
███╗   ███╗██╗████████╗███████╗██╗   ██╗
████╗ ████║██║╚══██╔══╝██╔════╝██║   ██║
██╔████╔██║██║   ██║   ███████╗██║   ██║
██║╚██╔╝██║██║   ██║   ╚════██║██║   ██║
██║ ╚═╝ ██║██║   ██║   ███████║╚██████╔╝
╚═╝     ╚═╝╚═╝   ╚═╝   ╚══════╝ ╚═════╝ 
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { desc = "Mitsu kunyuuuuk blablablablabla" },
        },
        footer = function ()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end
      }
    }

    return opts
  end
}
