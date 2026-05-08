-- ============================================
-- JavaScript/TypeScript Snippets
-- ============================================

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- Console log
  s({
    trig = 'log',
    name = 'console.log',
    dscr = 'Console log statement',
  }, fmt([[console.log({})]], {
    i(1, 'value'),
  })),

  -- Console error
  s({
    trig = 'error',
    name = 'console.error',
    dscr = 'Console error statement',
  }, fmt([[console.error({})]], {
    i(1, 'error'),
  })),

  -- Arrow function
  s({
    trig = 'arrow',
    name = 'Arrow function',
    dscr = 'Arrow function expression',
  }, fmt(
    [[
const {} = ({}) => {{
  {}
}}
]],
    {
      i(1, 'functionName'),
      i(2, 'params'),
      i(3, '// body'),
    }
  )),

  -- Async arrow function
  s({
    trig = 'asyncarrow',
    name = 'Async arrow function',
    dscr = 'Async arrow function expression',
  }, fmt(
    [[
const {} = async ({}) => {{
  {}
}}
]],
    {
      i(1, 'functionName'),
      i(2, 'params'),
      i(3, '// body'),
    }
  )),

  -- Function declaration
  s({
    trig = 'func',
    name = 'Function declaration',
    dscr = 'Function declaration',
  }, fmt(
    [[
function {}({}) {{
  {}
}}
]],
    {
      i(1, 'functionName'),
      i(2, 'params'),
      i(3, '// body'),
    }
  )),

  -- Async function declaration
  s({
    trig = 'asyncfunc',
    name = 'Async function declaration',
    dscr = 'Async function declaration',
  }, fmt(
    [[
async function {}({}) {{
  {}
}}
]],
    {
      i(1, 'functionName'),
      i(2, 'params'),
      i(3, '// body'),
    }
  )),

  -- Try-catch block
  s({
    trig = 'trycatch',
    name = 'Try-catch block',
    dscr = 'Try-catch error handling',
  }, fmt(
    [[
try {{
  {}
}} catch (error) {{
  console.error(error)
}}
]],
    {
      i(1, '// try block'),
    }
  )),

  -- Try-catch-finally block
  s({
    trig = 'trycatchfinally',
    name = 'Try-catch-finally block',
    dscr = 'Try-catch-finally error handling',
  }, fmt(
    [[
try {{
  {}
}} catch (error) {{
  console.error(error)
}} finally {{
  {}
}}
]],
    {
      i(1, '// try block'),
      i(2, '// finally block'),
    }
  )),

  -- Import statement
  s({
    trig = 'imp',
    name = 'Import statement',
    dscr = 'ES6 import statement',
  }, fmt([[import {{ {} }} from '{}']], {
    i(1, 'module'),
    i(2, 'package'),
  })),

  -- Default import
  s({
    trig = 'impd',
    name = 'Default import',
    dscr = 'ES6 default import statement',
  }, fmt([[import {} from '{}']], {
    i(1, 'module'),
    i(2, 'package'),
  })),

  -- Export default
  s({
    trig = 'expd',
    name = 'Export default',
    dscr = 'Export default statement',
  }, fmt([[export default {}]], {
    i(1, 'expression'),
  })),

  -- React component (function)
  s({
    trig = 'rfc',
    name = 'React functional component',
    dscr = 'Create a React functional component',
  }, fmt(
    [[
export function {}({}) {{
  return (
    <div>
      {}
    </div>
  )
}}
]],
    {
      f(function(_, snip)
        return snip.env.TM_FILENAME_BASE or 'Component'
      end),
      i(1, 'props'),
      i(2, '{/* content */}'),
    }
  )),

  -- React useState hook
  s({
    trig = 'useState',
    name = 'React useState',
    dscr = 'React useState hook',
  }, fmt([[const [{}, set{}] = useState({})]], {
    i(1, 'state'),
    f(function(args)
      return args[1][1]:gsub('^%l', string.upper)
    end, { 1 }),
    i(2, 'initialValue'),
  })),

  -- React useEffect hook
  s({
    trig = 'useEffect',
    name = 'React useEffect',
    dscr = 'React useEffect hook',
  }, fmt(
    [[
useEffect(() => {{
  {}

  return () => {{
    {}
  }}
}}, [{}])
]],
    {
      i(1, '// effect'),
      i(2, '// cleanup'),
      i(3, 'dependencies'),
    }
  )),

  -- React useCallback hook
  s({
    trig = 'useCallback',
    name = 'React useCallback',
    dscr = 'React useCallback hook',
  }, fmt(
    [[
const {} = useCallback(({}) => {{
  {}
}}, [{}])
]],
    {
      i(1, 'callback'),
      i(2, 'params'),
      i(3, '// body'),
      i(4, 'dependencies'),
    }
  )),

  -- SetTimeout
  s({
    trig = 'timeout',
    name = 'setTimeout',
    dscr = 'setTimeout function',
  }, fmt(
    [[
setTimeout(() => {{
  {}
}}, {})
]],
    {
      i(1, '// callback'),
      i(2, '1000'),
    }
  )),

  -- Promise
  s({
    trig = 'promise',
    name = 'Promise',
    dscr = 'New Promise',
  }, fmt(
    [[
new Promise((resolve, reject) => {{
  {}
}})
]],
    {
      i(1, '// promise body'),
    }
  )),
}
