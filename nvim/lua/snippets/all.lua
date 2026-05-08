-- ============================================
-- Global Snippets
-- ============================================

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  -- Current date
  s({
    trig = 'date',
    name = 'Current date',
    dscr = 'Insert current date',
  }, {
    f(function()
      return os.date('%Y-%m-%d')
    end),
  }),

  -- Current datetime
  s({
    trig = 'datetime',
    name = 'Current datetime',
    dscr = 'Insert current date and time',
  }, {
    f(function()
      return os.date('%Y-%m-%d %H:%M:%S')
    end),
  }),

  -- Todo comment
  s({
    trig = 'todo',
    name = 'TODO comment',
    dscr = 'Insert a TODO comment',
  }, {
    t('TODO: '),
    i(1, 'description'),
  }),

  -- Fixme comment
  s({
    trig = 'fixme',
    name = 'FIXME comment',
    dscr = 'Insert a FIXME comment',
  }, {
    t('FIXME: '),
    i(1, 'description'),
  }),

  -- Lorem ipsum
  s({
    trig = 'lorem',
    name = 'Lorem ipsum',
    dscr = 'Insert lorem ipsum text',
  }, {
    t('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  }),
}
