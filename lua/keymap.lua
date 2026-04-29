local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local bufnr = args.buf

    map("n", "<leader>ld", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Goto Definition" })
    map("n", "<leader>lr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: References" })
    map("n", "<leader>lK", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
    map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })
    map("n", "<leader>lR", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP: Rename" })
    map("n", "<leader>le", vim.diagnostic.open_float, { buffer = bufnr, desc = "LSP: Show Diagnostics" })
    map("n", "<leader>l[", function()
      vim.diagnostic.jump({ prev = true })
    end, { buffer = bufnr, desc = "LSP: Prev Diagnostic" })
    map("n", "<leader>l]", function()
      vim.diagnostic.jump({ next = true })
    end, { buffer = bufnr, desc = "LSP: Next Diagnostic" })
    map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto Definition" })
    map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  end,
})

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Bufferline"})
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "NeoTree" })
