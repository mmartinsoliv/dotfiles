-- ============================================
-- Python Snippets
-- ============================================

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- Function definition
  s({
    trig = 'def',
    name = 'Function definition',
    dscr = 'Python function definition',
  }, fmt(
    [[
def {}({}):
    {}
]],
    {
      i(1, 'function_name'),
      i(2, 'args'),
      i(3, 'pass'),
    }
  )),

  -- Method definition
  s({
    trig = 'meth',
    name = 'Method definition',
    dscr = 'Python class method',
  }, fmt(
    [[
def {}(self{}):
    {}
]],
    {
      i(1, 'method_name'),
      i(2, ', args'),
      i(3, 'pass'),
    }
  )),

  -- Class definition
  s({
    trig = 'class',
    name = 'Class definition',
    dscr = 'Python class definition',
  }, fmt(
    [[
class {}({}):
    def __init__(self{}):
        {}
]],
    {
      i(1, 'ClassName'),
      i(2, 'object'),
      i(3, ''),
      i(4, 'pass'),
    }
  )),

  -- If __name__ == '__main__'
  s({
    trig = 'main',
    name = 'Main guard',
    dscr = 'If __name__ == __main__ guard',
  }, fmt(
    [[
if __name__ == '__main__':
    {}
]],
    {
      i(1, 'main()'),
    }
  )),

  -- For loop
  s({
    trig = 'for',
    name = 'For loop',
    dscr = 'Python for loop',
  }, fmt(
    [[
for {} in {}:
    {}
]],
    {
      i(1, 'item'),
      i(2, 'items'),
      i(3, 'pass'),
    }
  )),

  -- List comprehension
  s({
    trig = 'listcomp',
    name = 'List comprehension',
    dscr = 'Python list comprehension',
  }, fmt([[ [{} for {} in {}] ]], {
    i(1, 'expression'),
    i(2, 'item'),
    i(3, 'items'),
  })),

  -- Dictionary comprehension
  s({
    trig = 'dictcomp',
    name = 'Dictionary comprehension',
    dscr = 'Python dictionary comprehension',
  }, fmt([[ {{ {}: {} for {} in {} }} ]], {
    i(1, 'key'),
    i(2, 'value'),
    i(3, 'item'),
    i(4, 'items'),
  })),

  -- Try-except block
  s({
    trig = 'try',
    name = 'Try-except block',
    dscr = 'Python try-except block',
  }, fmt(
    [[
try:
    {}
except {} as e:
    print(f"Error: {e}")
]],
    {
      i(1, 'pass'),
      i(2, 'Exception'),
    }
  )),

  -- With statement
  s({
    trig = 'with',
    name = 'With statement',
    dscr = 'Python with context manager',
  }, fmt(
    [[
with {} as {}:
    {}
]],
    {
      i(1, 'context'),
      i(2, 'var'),
      i(3, 'pass'),
    }
  )),

  -- Dataclass
  s({
    trig = 'dataclass',
    name = 'Dataclass',
    dscr = 'Python dataclass',
  }, fmt(
    [[
from dataclasses import dataclass

@dataclass
class {}:
    {}: {}
]],
    {
      i(1, 'ClassName'),
      i(2, 'field_name'),
      i(3, 'type'),
    }
  )),

  -- Logger setup
  s({
    trig = 'logger',
    name = 'Logger setup',
    dscr = 'Python logging setup',
  }, fmt(
    [[
import logging

logger = logging.getLogger(__name__)
]],
    {}
  )),

  -- Lambda function
  s({
    trig = 'lambda',
    name = 'Lambda function',
    dscr = 'Python lambda expression',
  }, fmt([[lambda {}: {}]], {
    i(1, 'x'),
    i(2, 'x'),
  })),

  -- Property decorator
  s({
    trig = 'property',
    name = 'Property decorator',
    dscr = 'Python property decorator',
  }, fmt(
    [[
@property
def {}(self):
    return {}
]],
    {
      i(1, 'property_name'),
      i(2, 'self._property_name'),
    }
  )),

  -- Async function
  s({
    trig = 'async',
    name = 'Async function',
    dscr = 'Python async function',
  }, fmt(
    [[
async def {}({}):
    {}
]],
    {
      i(1, 'function_name'),
      i(2, 'args'),
      i(3, 'pass'),
    }
  )),
}
