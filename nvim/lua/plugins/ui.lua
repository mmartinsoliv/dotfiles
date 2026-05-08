-- ============================================
-- UI Enhancements
-- ============================================

return {
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local icons = {
        diagnostics = {
          Error = 'E ',
          Warn = 'W ',
          Info = 'I ',
          Hint = 'H ',
        },
        git = {
          added = '+',
          modified = '~',
          removed = '-',
        },
      }

      local function fg(name)
        return function()
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format('#%06x', hl.foreground) }
        end
      end

      return {
        options = {
          theme = 'tokyonight',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(mode)
                return mode:sub(1, 1)
              end,
            },
          },
          lualine_b = {
            'branch',
            {
              'diff',
              symbols = icons.git,
            },
          },
          lualine_c = {
            {
              'diagnostics',
              symbols = icons.diagnostics,
            },
            {
              'filetype',
              icon_only = true,
              separator = '',
              padding = { left = 1, right = 0 },
            },
            {
              'filename',
              path = 1,
              symbols = {
                modified = ' ●',
                readonly = ' RO',
                unnamed = '',
              },
            },
          },
          lualine_x = {
            {
              function()
                return require('noice').api.status.command.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.command.has()
              end,
              color = fg('Statement'),
            },
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.mode.has()
              end,
              color = fg('Constant'),
            },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = fg('Special'),
            },
            {
              'encoding',
              fmt = function(encoding)
                return encoding ~= 'utf-8' and encoding or ''
              end,
            },
            {
              'fileformat',
              fmt = function(format)
                return format ~= 'unix' and format or ''
              end,
            },
            'filetype',
          },
          lualine_y = {
            {
              'progress',
              separator = ' ',
              padding = { left = 1, right = 0 },
            },
            {
              'location',
              padding = { left = 0, right = 1 },
            },
          },
          lualine_z = {
            function()
              return ' ' .. os.date('%H:%M') .. ' '
            end,
          },
        },
        extensions = { 'neo-tree', 'lazy', 'fzf', 'quickfix', 'toggleterm', 'trouble' },
      }
    end,
  },

  -- Buffer line (tabs)
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete other buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the right' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the left' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
      { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    },
    opts = {
      options = {
        numbers = 'none',
        close_command = function(n)
          require('mini.bufremove').delete(n, false)
        end,
        right_mouse_command = function(n)
          require('mini.bufremove').delete(n, false)
        end,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = 'E',
            Warn = 'W',
            Info = 'I',
          }
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
            .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        sort_by = 'insert_after_current',
        separator_style = 'thin',
        show_buffer_close_icons = true,
        show_close_icon = false,
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd('BufAdd', {
        callback = function()
          vim.schedule(function()
            pcall(require, 'bufferline')
          end)
        end,
      })
    end,
  },

  -- Better notifications
  {
    'rcarriga/nvim-notify',
    keys = {
      {
        '<leader>un',
        function()
          require('notify').dismiss({ silent = true, pending = true })
        end,
        desc = 'Dismiss all Notifications',
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      background_colour = '#1a1b26',
    },
    init = function()
      local notify = require('notify')
      notify.setup({
        render = 'compact',
        stages = 'fade',
      })
      vim.notify = notify
    end,
  },

  -- Noice: better UI for messages, cmdline, and popupmenu
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  -- Indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
    main = 'ibl',
  },

  -- Active indent guide and indent text objects
  {
    'echasnovski/mini.indentscope',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map('n', ']h', gs.next_hunk, 'Next Hunk')
        map('n', '[h', gs.prev_hunk, 'Prev Hunk')

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, 'Stage Hunk')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset Hunk')
        map('v', '<leader>hs', function()
          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Stage Hunk')
        map('v', '<leader>hr', function()
          gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Reset Hunk')
        map('n', '<leader>hS', gs.stage_buffer, 'Stage Buffer')
        map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
        map('n', '<leader>hR', gs.reset_buffer, 'Reset Buffer')
        map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
        map('n', '<leader>hb', function()
          gs.blame_line({ full = true })
        end, 'Blame Line')
        map('n', '<leader>hB', gs.toggle_current_line_blame, 'Toggle Line Blame')
        map('n', '<leader>hd', gs.diffthis, 'Diff This')
        map('n', '<leader>hD', function()
          gs.diffthis('~')
        end, 'Diff This ~')
        map('n', '<leader>td', gs.toggle_deleted, 'Toggle Deleted')

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
      end,
    },
  },

  -- Better quickfix
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {},
  },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      keywords = {
        FIX = {
          icon = ' ',
          color = 'error',
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = ' ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      gui_style = {
        fg = 'NONE',
        bg = 'BOLD',
      },
    },
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {
      easing_function = 'quadratic',
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    },
  },

  -- Which-key: keybinding helper
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = { spelling = true },
      spec = {
        {
          mode = { 'n', 'v' },
          { 'g', group = '+goto' },
          { 'gs', group = '+surround' },
          { ']', group = '+next' },
          { '[', group = '+prev' },
          { '<leader><tab>', group = '+tabs' },
          { '<leader>b', group = '+buffer' },
          { '<leader>c', group = '+code' },
          { '<leader>f', group = '+file/find' },
          { '<leader>g', group = '+git' },
          { '<leader>gh', group = '+hunks' },
          { '<leader>q', group = '+quit/session' },
          { '<leader>s', group = '+search' },
          { '<leader>u', group = '+ui' },
          { '<leader>w', group = '+windows' },
          { '<leader>x', group = '+diagnostics/quickfix' },
        },
      },
    },
    config = function(_, opts)
      require('which-key').setup(opts)
    end,
  },

  -- Dashboard / Startup screen
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local dashboard = require('alpha.themes.dashboard')
      local logo = [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      dashboard.section.header.val = vim.split(logo, '\n')
      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
        dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
        dashboard.button('s', ' ' .. ' Restore Session', [[:lua require('persistence').load() <cr>]]),
        dashboard.button('l', ' ' .. ' Lazy', ':Lazy<CR>'),
        dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = 'AlphaButtons'
        button.opts.hl_shortcut = 'AlphaShortcut'
      end
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButtons'
      dashboard.section.footer.opts.hl = 'AlphaFooter'
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
