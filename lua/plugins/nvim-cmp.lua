return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "onsails/lspkind.nvim"
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            --require("luasnip").lsp_expand(args.body)
	    vim.snippet.expand(args.body)
          end,
        },
        window = {
	  completion = cmp.config.window.bordered({
	    winhighlight = "Normal:Pmenu",
	  }),
          documentation = cmp.config.window.bordered({
	    winhighlight = "Normal:Pmenu",
	  }),
        },
        mapping = cmp.mapping.preset.insert({
	  ['<C-k>'] = cmp.mapping.select_prev_item(),
	  ['<C-j>'] = cmp.mapping.select_next_item(),
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-c>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
	formatting = {
	  fields = { "icon", "abbr", "menu", "kind" },
	  format = function(entry, vim_item)
	    local lspkind = require("lspkind")
	    local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
	    kind.icon = " " .. (kind.icon or "") .. "  "
	    kind.kind = "   (" .. (kind.kind or "") .. ")"

	    return kind
	  end,
	},
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        })
      })
    end,
  },
}
