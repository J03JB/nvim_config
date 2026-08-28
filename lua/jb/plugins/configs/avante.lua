return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        "saghen/blink.cmp",
        lazy = true,
        dependencies = { "saghen/blink.compat" },
        opts = {
          -- Include your custom avante providers in the active sources list
          sources = {
            default = { "avante_commands", "avante_mentions", "avante_files" },

            providers = {
              avante_commands = {
                name = "avante_commands",
                module = "blink.compat.source",
                score_offset = 90,
                opts = {},
              },
              avante_files = {
                name = "avante_files",
                module = "blink.compat.source",
                score_offset = 100,
                opts = {},
              },
              avante_mentions = {
                name = "avante_mentions",
                module = "blink.compat.source",
                score_offset = 1000,
                opts = {},
              },
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      -- Default configuration
      hints = { enabled = false },

      ---@alias AvanteProvider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
      },

      input = {
        provider = "snacks", -- "native" | "snacks"
        provider_opts = {
          title = "Avante Input",
          icon = " ",
        },
      },
      -- File selector configuration
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
      file_selector = {
        provider = "fzf", -- Avoid native provider issues
        provider_opts = {},
      },
    },
  },
  -- {
  --   "folke/which-key.nvim",
  --   optional = true,
  --   opts = {
  --     spec = {
  --       { "<leader>a", group = "ai" },
  --     },
  --   },
  -- },
}
