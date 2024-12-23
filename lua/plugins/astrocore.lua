-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_lines = {
        only_current_line = true,
        highlight_whole_line = false,
      },
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        cmdheight = 1,
        -- spell = false, -- sets vim.opt.spell
        -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        -- wrap = false, -- sets vim.opt.wrap
        showmode = true,
        colorcolumn = "100",

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
        whichwrap = "<>[]hl", -- whichwrap:append "<>[]hl"
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
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },
      },
      v = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        --
        ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },
        ["<M-Down>"] = {
          ":m '>+1<CR>gv=gv",
          silent = true,
          desc = "move selected text up",
        },
        ["<M-Up>"] = {
          ":m '<-2<CR>gv=gv",
          silent = true,
          desc = "move selected text down",
        },

        -- Copy & Paste
        -- ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" }
        ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" },

        ["<Leader>v"] = { '"+p', desc = "Paste from System Clipboard" },
      },
      t = {
        ["<C-q>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode" },
      },
      n = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        -- second key is the lefthand side of the map

        ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },
        ["<Leader>c"] = {
          (vim.loop.os_uname().sysname == "Linux") and "<cmd>!chmod +x %<CR>",
          desc = "Make current script executable",
        },
        ["<C-f>"] = {
          (vim.loop.os_uname().sysname == "Linux") and "<cmd>silent !tmux neww tmux-sessionizer<CR>",
          desc = "Open new tmux session",
        },
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["S-Tab"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>X"] = {
          function() require("astrocore.buffer").close(0, true) end,
          desc = "Force close buffer",
        },
        ["<Leader>x"] = {
          function() require("astrocore.buffer").close() end,
          desc = "Close buffer",
        },
        ["<Leader>bn"] = { "<cmd>enew<cr>", desc = "New File" },
        ["yY"] = { [[:let @"=@".getline('.')."\n"<CR>]], desc = "Append current yank to previous yank" },
        ["<Leader>Y"] = { '"+Y', desc = "Copy line to System Clipboard" },
        ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" },
        ["<M-Up>"] = {
          "v:m '<-2<CR>gv=gv<Esc>",
          silent = true,
          desc = "move selected text down",
        },
        ["<M-Down>"] = {
          "v:m '>+1<CR>gv=gv<Esc>",
          silent = true,
          desc = "move selected text up",
        },
        ["<M-S-Down>"] = {
          ":t.<CR>",
          silent = true,
          desc = "Copy currrent line below",
        },
        ["<M-S-Up>"] = {
          ":t-<CR>",
          silent = true,
          desc = "Copy currrent line above",
        },
        ["<Leader>s"] = {
          [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
          desc = "Replace all occurences of a word in the file",
        },
        ["N"] = {
          "Nzzzv",
          silent = true,
          desc = "Keep cursor in center while getting prev searchterm",
        },
        ["n"] = {
          "nzzzv",
          silent = true,
          desc = "Keep cursor in center while getting next searchterm",
        },
        ["<C-u>"] = {
          "<C-u>zz",
          silent = true,
          desc = "Keep the cursor in the middle when moving up",
        },
        ["<C-d>"] = {
          "<C-d>zz",
          silent = true,
          desc = "Keep the cursor in the middle when moving down",
        },
        ["J"] = {
          "mzJ`z",
          silent = true,
          desc = "Keep the cursor to the left in long lines when deleting a line break",
        },
        ["<Leader>v"] = { '"+p', desc = "Paste from System Clipboard" },
        ["<Leader><Leader>"] = {
          function() vim.cmd "so" end,
          desc = "Source current lua file",
        },
        ["<Esc>"] = { ":noh<CR>", desc = "Remove highighting with Esc key" },
        ["<Leader>C"] = false,
        ["[b"] = { "<nop>" },
        ["]b"] = { "<nop>" },
        ["<Leader>Q"] = { "<nop>" },
        ["<Leader>q"] = { "<nop>" },
        ["Q"] = { "@qj", desc = "Run macro in reg `q` and move to next line" },

        ["<Leader>br"] = {
          function()
            local buf = vim.api.nvim_win_get_buf(0)
            if vim.bo[buf].modifiable then
              vim.cmd "set noma"
              print "Modifiable off"
            else
              vim.cmd "set ma"
              print "Modifiable on"
            end
          end,
          desc = "Toggle modifiable for buffer",
        },

        -- Undo tree
        ["<Leader>U"] = { vim.cmd.UndotreeToggle, silent = true, desc = "Open Undo tree" }, -- "<cmd>UndotreeToggle<CR>"

        -- Telescope
        ["<Leader>gf"] = {
          function() require("telescope.builtin").git_files() end,
          desc = "Find Git files",
        },

        ["<Leader>fg"] = {
          function() require("telescope.builtin").live_grep() end,
          desc = "Find words",
        },

        ["<Leader>fG"] = {
          function()
            require("telescope.builtin").live_grep {
              additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
            }
          end,
          desc = "Find words in all files",
        },

        -- trouble.nvim

        ["<Leader>dx"] = {
          function() require("trouble").toggle() end,
          desc = "Toggle trouble",
        },
        ["<Leader>dw"] = {
          function() require("trouble").toggle "workspace_diagnostics" end,
          desc = "Toggle workspace diagnostics",
        },
        ["<Leader>dd"] = {
          function() require("trouble").toggle "document_diagnostics" end,
          desc = "Toggle document diagnostics",
        },
        ["<Leader>dq"] = {
          function() require("trouble").toggle "quickfix" end,
          desc = "Toggle quickfix",
        },
        ["<Leader>dl"] = {
          function() require("trouble").toggle "loclist" end,
          desc = "Toggle loclist",
        },
        ["gR"] = {
          function() require("trouble").toggle "lsp_references" end,
          desc = "Toggle lsp references",
        },

        -- NeoTree
        ["<Leader>n"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["<Leader>e"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end,
          desc = "Toggle Explorer Focus",
        },
        ["<Leader>o"] = false,

        -- Refactoring.nvim

        ["<Leader>rr"] = {
          function() require("refactoring").select_refactor {} end,
          desc = "Select Refactor",
        },

        ["<Leader>rI"] = {
          function() require("refactoring").refactor "Inline Function" end,
          desc = "Inline Function",
        },

        ["<Leader>ri"] = {
          function() require("refactoring").refactor "Inline Variable" end,
          desc = "Inline Variable",
        },

        ["<Leader>rb"] = {
          function() require("refactoring").refactor "Extract Block" end,
          desc = "Extract Block",
        },
        ["<Leader>rbf"] = {
          function() require("refactoring").refactor "Extract Block To File" end,
          desc = "Extract Block To File",
        },
        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },

      x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
        -- setting a mapping to false will disable it
        -- ["<C-N>"] = false,
        ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },

        ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" },
        ["<Leader>v"] = { '"+p', desc = "Paste from System Clipboard" },

        -- X mode
        ["<M-Down>"] = {
          ":m '>+1<CR>gv=gv",
          silent = true,
          desc = "move selected text up",
        },
        ["<M-Up>"] = {
          ":m '<-2<CR>gv=gv",
          silent = true,
          desc = "move selected text down",
        },
        -- ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', desc = "Dont copy replaced text", silent = true },
        ["<Leader>p"] = { '"_dP', desc = "Paste over selected text without yanking selected text" },
        -- Macros
        ["Q"] = { ":norm @q<CR>", desc = "Run macro in register `q` for selection" },
        -- Refactoring.nvim
        ["<Leader>ri"] = {
          function() require("refactoring").refactor "Inline Variable" end,
          desc = "Inline Variable",
        },

        ["<Leader>rr"] = {
          function() require("refactoring").select_refactor {} end,
          desc = "Select Refactor",
        },

        ["<Leader>re"] = {
          function() require("refactoring").refactor "Extract Function" end,
          desc = "Extract Function",
        },
        ["<Leader>rf"] = {
          function() require("refactoring").refactor "Extract Function To File" end,
          desc = "Extract Function To File",
        },
        ["<Leader>rv"] = {
          function() require("refactoring").refactor "Extract Variable" end,
          desc = "Extract Variable",
        },
      },
    },
  },
}
