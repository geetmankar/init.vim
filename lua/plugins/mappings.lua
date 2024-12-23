return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- Insert
        i = {
          ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },
        },
        -- Visual
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
        -- Normal
        n = {
          -- normal movement -> g movement
          ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
          ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
          ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', expr = true },
          ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', expr = true },
          --
          ["<C-c>"] = { "<Esc>", desc = "Remap to Escape" },
          -- line movement
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
          -- with vim movement
          ["<M-k>"] = {
            "v:m '<-2<CR>gv=gv<Esc>",
            silent = true,
            desc = "move selected text down",
          },
          ["<M-j>"] = {
            "v:m '>+1<CR>gv=gv<Esc>",
            silent = true,
            desc = "move selected text up",
          },
          ["<M-S-j>"] = {
            ":t.<CR>",
            silent = true,
            desc = "Copy currrent line below",
          },
          ["<M-S-k>"] = {
            ":t-<CR>",
            silent = true,
            desc = "Copy currrent line above",
          },
          --
          -- Copy & Paste
          -- ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" }
          ["<Leader>Y"] = { '"+Y', desc = "Copy line to System Clipboard" },
          ["<Leader>y"] = { '"+y', desc = "Copy to System Clipboard" },

          ["<Leader>v"] = { '"+p', desc = "Paste from System Clipboard" },
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
          ["yY"] = {
            [[:let @"=@".getline('.')."\n"<CR>]],
            desc = "Append current yank to previous yank",
          },
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
        ["<Leader>U"] = {
          vim.cmd.UndotreeToggle,
          silent = true,
          desc = "Open Undo tree",
        }, -- "<cmd>UndotreeToggle<CR>"

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
        -- Terminal
        t = {
          ["<C-q>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode" },
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
  },
}
