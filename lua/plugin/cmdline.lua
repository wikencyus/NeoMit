return {
  {
    "hrsh7th/cmp-cmdline",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local cmp = require("cmp")

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
        },
        window = {
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          format = function(entry, item)
            local icon = "󰘳 "
            local source = entry.source.name
            if source == "cmdline" then
              icon = " "
            elseif source == "path" then
              icon = " "
            elseif source == "cmdline_history" then
              icon = "󰑖 "
            end
            item.kind = icon
            return item
          end,
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
        window = {
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          format = function(entry, item) -- m
            item.kind = "󰚃 "
            return item
          end,
        },
      })
    end,
  },
}
