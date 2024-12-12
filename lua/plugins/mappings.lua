return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
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
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
