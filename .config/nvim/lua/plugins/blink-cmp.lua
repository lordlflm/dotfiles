return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  -- dependencies = { 'rafamadriz/friendly-snippets' },
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*'
    },
    {
      "giuxtaposition/blink-cmp-copilot",
    },
  },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'super-tab',
      ['<C-c>'] = { 'show', 'hide' },
      ['<C-d>'] = { 'show_documentation', 'hide_documentation' },
      ['<C-s>'] = { 'show_signature', 'hide_signature' },
      ['<C-Up>'] = { 'scroll_documentation_up' },
      ['<C-Down>'] = { 'scroll_documentation_down' }
    },

    completion = {
      list = {
        selection = {
          auto_insert = false
        }
      },
      menu = {
        border = 'rounded',
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind", gap = 1, "kind_icon" }
          }
        }
      },
      ghost_text = {
        enabled = true,
        -- show_with_menu = false
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded"
        }
      }
    },

    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        border = 'rounded'
      }
    },

    snippets = { preset = 'luasnip' },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
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
      },
      -- per_filetype = {
      --   codecompanion = { "codecompanion" },
      -- },
    },

    cmdline = {
      keymap = { preset = 'inherit' },
      completion = { menu = { auto_show = true } },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

    appearance = {
      use_nvim_cmp_as_default = false,
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
      -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
      kind_icons = {
        Copilot = "",
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },
  },
  opts_extend = { "sources.default" }
}
