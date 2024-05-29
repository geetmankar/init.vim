-- Customization
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "FiraCode NFM"
  -- transparency
  vim.g.neovide_transparency = 0.95
  -- acrylic transparency blur
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- refresh screen
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  -- vim.g.neovide_profiler = true
  -- ask before quitting while having unsaved changes
  vim.g.neovide_confirm_quit = true
  -- cursor animation
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

vim.opt.colorcolumn = "80"
vim.opt.showmode = false

vim.opt.whichwrap:append "<>[]hl"
vim.diagnostic.config {
  virtual_lines = {
    only_current_line = true,
    highlight_whole_line = false,
  },
  virtual_text = false,
}

return {
  opt = {
    cmdheight = 1,
    -- spell = false, -- sets vim.opt.spell
    -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    -- wrap = false, -- sets vim.opt.wrap
    showmode = true,

    clipboard = "",
    numberwidth = 6,
    ruler = false,

    -- shell = "nu",
    -- shellcmdflag = "-c",
    -- shellquote = "",
    -- shellxquote = "",

    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    tabstop = 4,
    softtabstop = 4,

    fillchars = { eob = " " },
    ignorecase = true,
    smartcase = true,
    scrolloff = 8,
    termguicolors = true,

    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    backup = false,

    updatetime = 50,
    timeoutlen = 400,

    list = true,
    listchars = {
      eol = "↲",
      tab = "» ",
      space = "·",
      extends = "›",
      precedes = "‹",
      nbsp = "␣",
    },
  },
}
