if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed =
        require("astrocore").list_insert_unique(
        opts.ensure_installed,
        {
          "lua_ls",
          -- add more arguments for adding more language servers
          "rust-analyzer",
          "bash-language-server",
          "clang-format",
          "clangd",
          "cmake-language-server", -- cmake,
          "fortls",
          "gofumpt",
          "gopls",
          "iferr",
          "jedi-language-server", -- jedi_language_server,
          "kotlin-language-server", -- kotlin_language_server,
          "lua-language-server", -- lua_ls,
          "marksman",
          "powershell-editor-services", -- powershell_es,
          "pylint",
          "pyright",
          "python-lsp-server", -- pylsp,
          "shellcheck",
          "shellharden",
          "shfmt",
          "sqlls",
          "stylua",
          "taplo",
          "typst-lsp", -- typst_lsp,
          "vim-language-server" -- vimls,
        }
      )
    end
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed =
        require("astrocore").list_insert_unique(
        opts.ensure_installed,
        {
          "stylua"
          -- add more arguments for adding more null-ls sources
        }
      )
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed =
        require("astrocore").list_insert_unique(
        opts.ensure_installed,
        {
          "python"
          -- add more arguments for adding more debuggers
        }
      )
    end
  }
}
