-- ============================================
-- Colorscheme: Tokyo Night
-- ============================================

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      light_style = 'day',
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = 'dark',
        floats = 'dark',
      },
      sidebars = {
        'qf',
        'vista_kind',
        'terminal',
        'spectre_panel',
        'startuptime',
        'neo-tree',
      },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
      on_colors = function(colors)
        -- Custom color adjustments
        colors.border = colors.blue0
      end,
      on_highlights = function(hl, c)
        -- Custom highlight groups
        hl.TelescopeBorder = {
          fg = c.blue0,
          bg = c.bg_dark,
        }
        hl.TelescopePromptBorder = {
          fg = c.blue0,
          bg = c.bg_dark,
        }
        hl.TelescopeResultsBorder = {
          fg = c.blue0,
          bg = c.bg_dark,
        }
        hl.TelescopePreviewBorder = {
          fg = c.blue0,
          bg = c.bg_dark,
        }
        hl.NeoTreeFloatBorder = {
          fg = c.blue0,
          bg = c.bg_dark,
        }
      end,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd('colorscheme tokyonight')
    end,
  },
}
