-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end
  },
  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██"
      }
      return opts
    end
  },
  -- You can disable default plugins as follows:
  {"max397574/better-escape.nvim", enabled = false},
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", {"javascriptreact"})
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", {"tex", "latex"}):with_pair(cond.not_after_regex "%%"):with_pair(
            -- don't add a pair if the next character is %
            -- don't add a pair if  the previous character is xxx
            cond.not_before_regex("xxx", 3)
          ):with_move(cond.none()):with_del(cond.not_after_regex "xx"):with_cr(cond.none())
          -- don't move right when repeat character
          -- don't delete if the next character is xx
          -- disable adding a newline when you press <cr>
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end
  },
  -- ! MY OWN CONFIG
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim"
    },
    opts = {},
    cmd = {"MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor"},
    keys = {
      {
        mode = {"v", "n"},
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor"
      }
    }
  },
  {"imsnif/kdl.vim", ft = "kdl"},
  {
    "jesseleite/nvim-macroni",
    lazy = false
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set(
        "i",
        "<C-g>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        {expr = true}
      )
      vim.keymap.set(
        "i",
        "<C-;>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        {expr = true}
      )
      vim.keymap.set(
        "i",
        "<C-,>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        {expr = true}
      )
      vim.keymap.set(
        "i",
        "<C-x>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        {expr = true}
      )
    end
  },
  {
    "simrat39/rust-tools.nvim"
  },
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    opts = {}
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = {"o", "x"},
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search"
      },
      {
        "<C-q>",
        mode = {"c"},
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search"
      }
    }
  },
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   as = "lsp_lines",
  --   config = function() require("lsp_lines").setup() end,
  --   lazy = false,
  -- },
  {
    "mg979/vim-visual-multi",
    -- event = "BufEnter",
    config = function()
      vim.g.VM_set_statusline = 3 -- Update cursor location on each movement
      -- vim.g.VM_silent_exit = 1 -- Exit Visual Multi silenty
      vim.g.VM_Mono_hl = "DiffText"
      vim.g.VM_Extend_hl = "DiffAdd"
      vim.g.VM_Cursor_hl = "Visual"
      vim.g.VM_Insert_hl = "DiffChange"
      vim.cmd [[
          let g:VM_custom_remaps = {'<C-c>': '<Esc>' }
      ]]

      vim.cmd [[
        if exists(':VMTheme')
      
          " to avoid that current theme is reapplied on colorscheme change
          let g:VM_theme_set_by_colorscheme = 1
      
          if &background == 'light'
            hi VM_Extend ctermbg=38    ctermfg=232    guibg=#AAF0D6    guifg=NONE
            hi VM_Cursor ctermbg=41    ctermfg=232    guibg=#78dede    guifg=#262626
            hi VM_Insert ctermbg=233   ctermfg=232    guibg=#ffffaf    guifg=#262626
            hi VM_Mono   ctermbg=231   ctermfg=232    guibg=#B23A2D    guifg=#ffffff
          else
            hi VM_Extend ctermbg=38    ctermfg=237    guibg=#5f8787    guifg=#ffffff
            hi VM_Cursor ctermbg=41    ctermfg=237    guibg=#00af87    guifg=#ffffff
            hi VM_Insert ctermbg=233   ctermfg=237    guibg=#5f0087    guifg=#ffffff
            hi VM_Mono   ctermbg=231   ctermfg=235    guibg=#e05f51    guifg=#ffffff
          endif
      
      
        endif
      ]]
    end
  },
  {
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup {mappings_style = "sandwich"}
    end,
    lazy = false
  },
  {
    "Djancyp/better-comments.nvim",
    config = function()
      require("better-comment").Setup()
    end,
    lazy = false
  },
  {
    "mbbill/undotree",
    lazy = false
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require("refactoring").setup {}
    end
  }
}
