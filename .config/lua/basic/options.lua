local opt = vim.opt


--Line Number
opt.number = true
--TAB
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
--Clipboard()
opt.clipboard:append("unnamedplus")
--Outlook
opt.termguicolors = true
opt.signcolumn = "yes"

--other
opt.scrolloff = 8
