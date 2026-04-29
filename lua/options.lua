local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false

opt.timeoutlen = 300
opt.updatetime = 50

opt.showmode = false
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    eob = " ",
}
