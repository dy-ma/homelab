local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.scrolloff = 6

opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Use the macOS clipboard when Neovim is running in a graphical login or SSH
-- session with clipboard access.
opt.clipboard = "unnamedplus"
