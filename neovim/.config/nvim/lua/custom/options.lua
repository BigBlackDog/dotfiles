-- function ApplyColors(colorscheme)
-- 	colorscheme = colorscheme or "ayu-mirage"
--
-- 	vim.cmd.colorscheme("ayu-mirage")
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- stolen from tjdevries
vim.opt.showmode = false -- mode is shown with lualine
vim.opt.showcmd = false -- not sure about this one

vim.opt.cmdheight = 1 -- Height of the command bar
vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.showmatch = true -- show matching brackets when text indicator is over them
vim.opt.relativenumber = true -- Show line numbers
-- in kickstart they use vim.wo.number = true ... i don't know the difference
vim.opt.number = true -- But show the actual number for the line we're on

vim.opt.hidden = true -- I like having buffers stay around
vim.opt.equalalways = false -- I don't like my windows changing all the time
vim.opt.splitright = true -- Prefer windows splitting to the right
vim.opt.splitbelow = true -- Prefer windows splitting to the bottom

vim.opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

vim.opt.cursorline = true -- Highlight the current line

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

vim.opt.belloff = "all" -- Just turn the dang bell off

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

-- Set colorscheme
--ApplyColors("ayu-mirage")

-- Set completeopt to have a better completion experience
-- preview is additional to kickstart ... have to read up on the difference again
vim.o.completeopt = "menuone,noselect,preview"
