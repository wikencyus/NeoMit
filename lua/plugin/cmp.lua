return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            scrollbar = false,
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
          }),
        },

        completion = {
          completeopt = "menu,menuone,noinsert",
        },

        preselect = cmp.PreselectMode.Item,

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),

        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind_icons = {
              Text = "", Method = "", Function = "", Constructor = "",
              Field = "", Variable = "", Class = "", Interface = "",
              Module = "", Property = "", Unit = "", Value = "",
              Enum = "", Keyword = "", Snippet = "", Color = "",
              File = "", Reference = "", Folder = "", EnumMember = "",
              Constant = "", Struct = "", Event = "", Operator = "",
              TypeParameter = "",
            }
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },

        experimental = {
          ghost_text = false,
        },
      })
    end,
  },
}
