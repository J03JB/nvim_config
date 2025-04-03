return {
  "saghen/blink.cmp",

  dependencies = {
    {
      "saghen/blink.compat",
      opts = {},
      version = "*",
    },
    { "rafamadriz/friendly-snippets" },
    -- { "giuxtaposition/blink-cmp-copilot" },
    { "fang2hou/blink-copilot" },
    { "folke/lazydev.nvim" },
    { "mikavilpas/blink-ripgrep.nvim" },
    { "Kaiser-Yang/blink-cmp-avante" },
  },
  version = "1.*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      -- ['<CR>'] = { 'accept', 'fallback' },
    },

    cmdline = {
      keymap = {
        preset = "cmdline",
      },
    },
    enabled = function()
      local filetype = vim.bo[0].filetype
      if filetype == "oil" or filetype == "prompt" then
        return false
      end
      return true
    end,

    completion = {
      list = {
        max_items = 200,
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = true,
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
          -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          treesitter = { "lsp" },
        },
      },
      -- Show documentation when selecting a completion item
      documentation = { window = { border = "rounded" }, auto_show = true, auto_show_delay_ms = 500 },

      ghost_text = {
        enabled = true,
      },
    },

    -- Experimental signature help support
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },

    sources = {
      providers = {
        supermaven = {
          name = "supermaven",
          module = "blink.compat.source",
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Supermaven"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
          -- kind = "Supermaven",
        },
        codeium = {
          name = "codeium",
          module = "blink.compat.source",
        },
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },

        copilot = {
          name = "copilot",
          module = "blink-copilot",
          enabled = false,
          score_offset = 500,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
        lazydev = {
          name = "lazydev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        ripgrep = { max_items = 3, score_offset = -2, module = "blink-ripgrep", name = "ripgrep" },
      },
      default = {
        "supermaven",
        -- "copilot",
        "avante_commands",
        "avante_mentions",
        "avante_files",
        "lazydev",
        "lsp",
        "path",
        "snippets",
        "buffer",
        "ripgrep",
        -- "codeium",
      },
    },
    appearance = {
      kind_icons = require("jb.utils").icons.kind,
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  opts_extend = { "sources.default" },
}
