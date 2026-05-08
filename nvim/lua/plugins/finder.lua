-- ============================================
-- File Finder & Explorer
-- ============================================

return {
  -- Telescope: fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    keys = {
      { '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<cr>', desc = 'Switch Buffer' },
      { '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Grep (root dir)' },
      { '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
      { '<leader><space>', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },
      -- find
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },
      { '<leader>fF', '<cmd>Telescope find_files cwd=false<cr>', desc = 'Find Files (cwd)' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
      { '<leader>fR', '<cmd>Telescope oldfiles cwd=vim.loop.cwd()<cr>', desc = 'Recent (cwd)' },
      -- git
      { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = 'commits' },
      { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'status' },
      -- search
      { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
      { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },
      { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
      { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
      { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Document diagnostics' },
      { '<leader>sD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace diagnostics' },
      { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Grep (root dir)' },
      { '<leader>sG', '<cmd>Telescope live_grep cwd=false<cr>', desc = 'Grep (cwd)' },
      { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
      { '<leader>sH', '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
      { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
      { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
      { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
      { '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
      { '<leader>sR', '<cmd>Telescope resume<cr>', desc = 'Resume' },
      { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = 'Word (root dir)' },
      { '<leader>sW', '<cmd>Telescope grep_string cwd=false<cr>', desc = 'Word (cwd)' },
      { '<leader>uC', '<cmd>Telescope colorscheme enable_preview=true<cr>', desc = 'Colorscheme with preview' },
      {
        '<leader>ss',
        function()
          require('telescope.builtin').lsp_document_symbols({
            symbols = require('lazyvim.config').get_kind_filter(),
          })
        end,
        desc = 'Goto Symbol',
      },
      {
        '<leader>sS',
        function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols({
            symbols = require('lazyvim.config').get_kind_filter(),
          })
        end,
        desc = 'Goto Symbol (Workspace)',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        enabled = vim.fn.executable('make') == 1,
      },
    },
    opts = function()
      local actions = require('telescope.actions')

      local open_with_trouble = function(...)
        return require('trouble.providers.telescope').open_with_trouble(...)
      end

      local function find_command()
        if 1 == vim.fn.executable('rg') then
          return { 'rg', '--files', '--color', 'never', '-g', '!.git' }
        elseif 1 == vim.fn.executable('fd') then
          return { 'fd', '--type', 'f', '--color', 'never', '-E', '.git' }
        elseif 1 == vim.fn.executable('fdfind') then
          return { 'fdfind', '--type', 'f', '--color', 'never', '-E', '.git' }
        elseif 1 == vim.fn.executable('find') and vim.fn.has('win32') == 0 then
          return { 'find', '.', '-type', 'f' }
        end
      end

      return {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == '' then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ['<C-t>'] = open_with_trouble,
              ['<a-t>'] = open_with_trouble,
              ['<a-i>'] = function()
                local action_state = require('telescope.actions.state')
                local line = action_state.get_current_line()
                require('telescope.builtin').find_files({ no_ignore = true, default_text = line })
              end,
              ['<a-h>'] = function()
                local action_state = require('telescope.actions.state')
                local line = action_state.get_current_line()
                require('telescope.builtin').find_files({ hidden = true, default_text = line })
              end,
              ['<C-Down>'] = actions.cycle_history_next,
              ['<C-Up>'] = actions.cycle_history_prev,
              ['<C-f>'] = actions.preview_scrolling_down,
              ['<C-b>'] = actions.preview_scrolling_up,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
            n = {
              ['q'] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = find_command,
            hidden = true,
            no_ignore = false,
          },
          live_grep = {
            additional_args = { '--hidden' },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('fzf')
    end,
  },

  -- Neo-tree: file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    keys = {
      {
        '<leader>e',
        function()
          require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = 'Explorer NeoTree (root dir)',
      },
      {
        '<leader>E',
        function()
          require('neo-tree.command').execute({ toggle = true, dir = vim.fn.expand('%:p:h') })
        end,
        desc = 'Explorer NeoTree (cwd)',
      },
      {
        '<leader>be',
        function()
          require('neo-tree.command').execute({ source = 'buffers', toggle = true })
        end,
        desc = 'Buffer explorer',
      },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute({ source = 'git_status', toggle = true })
        end,
        desc = 'Git explorer',
      },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require('neo-tree')
        end
      end
    end,
    opts = {
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'qf', 'Outline' },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            'node_modules',
            '.git',
            '.next',
            '.nuxt',
            'dist',
            'build',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
      window = {
        mappings = {
          ['<space>'] = 'none',
          ['Y'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          ['O'] = function(state)
            require('lazy.util').open(state.tree:get_node().path, { system = true })
          end,
          ['P'] = { 'toggle_preview', config = { use_float = true } },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        git_status = {
          symbols = {
            unstaged = 'U',
            staged = 'S',
            unmerged = 'M',
            renamed = 'R',
            untracked = '?',
            deleted = 'D',
            ignored = 'I',
          },
        },
      },
    },
    config = function(_, opts)
      require('neo-tree').setup(opts)
      vim.api.nvim_create_autocmd('TermClose', {
        pattern = '*lazygit',
        callback = function()
          if package.loaded['neo-tree.sources.git_status'] then
            require('neo-tree.sources.git_status').refresh()
          end
        end,
      })
    end,
  },

  -- FZF Lua: alternative fuzzy finder
  {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    keys = {
      { '<leader>fz', '<cmd>FzfLua<cr>', desc = 'FzfLua' },
      { '<leader>ffz', '<cmd>FzfLua files<cr>', desc = 'Find files (fzf)' },
      { '<leader>fgz', '<cmd>FzfLua live_grep<cr>', desc = 'Live grep (fzf)' },
      { '<leader>fbz', '<cmd>FzfLua buffers<cr>', desc = 'Buffers (fzf)' },
      { '<leader>frz', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files (fzf)' },
    },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = 'rounded',
        preview = {
          default = 'bat',
          border = 'border',
          wrap = 'nowrap',
          hidden = 'nohidden',
          vertical = 'down:45%',
          horizontal = 'right:60%',
          layout = 'flex',
          flip_columns = 120,
          title = true,
          title_pos = 'center',
          scrollbar = 'float',
        },
      },
      keymap = {
        builtin = {
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          ['<S-down>'] = 'preview-page-down',
          ['<S-up>'] = 'preview-page-up',
          ['<S-left>'] = 'preview-page-reset',
        },
        fzf = {
          ['ctrl-z'] = 'abort',
          ['ctrl-u'] = 'unix-line-discard',
          ['ctrl-f'] = 'half-page-down',
          ['ctrl-b'] = 'half-page-up',
          ['ctrl-a'] = 'beginning-of-line',
          ['ctrl-e'] = 'end-of-line',
          ['alt-a'] = 'toggle-all',
          ['alt-g'] = 'first',
          ['alt-G'] = 'last',
        },
      },
      files = {
        prompt = 'Files❯ ',
        cwd_prompt = false,
        actions = {
          ['ctrl-g'] = false,
        },
      },
      grep = {
        prompt = 'Rg❯ ',
        input_prompt = 'Grep For❯ ',
        actions = {
          ['ctrl-g'] = false,
        },
      },
      buffers = {
        prompt = 'Buffers❯ ',
      },
      oldfiles = {
        prompt = 'History❯ ',
        cwd_only = true,
        stat_file = true,
        include_current_session = true,
      },
    },
  },

  -- Flash: enhanced search navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    vscode = true,
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'o', 'x' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },

  -- Trouble: pretty diagnostics list
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references / ... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/quickfix item',
      },
    },
    opts = {
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      use_diagnostic_signs = true,
    },
  },

  -- Project management
  {
    'ahmedkhalf/project.nvim',
    opts = {
      manual_mode = false,
      detection_methods = { 'pattern', 'lsp' },
      patterns = {
        '.git',
        '_darcs',
        '.hg',
        '.bzr',
        '.svn',
        'Makefile',
        'package.json',
        'Cargo.toml',
        'go.mod',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
      },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = 'global',
      datapath = vim.fn.stdpath('data'),
    },
    event = 'VeryLazy',
    config = function(_, opts)
      require('project_nvim').setup(opts)
      require('telescope').load_extension('projects')
    end,
    keys = {
      { '<leader>fp', '<cmd>Telescope projects<cr>', desc = 'Projects' },
    },
  },
}
