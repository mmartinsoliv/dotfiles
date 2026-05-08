-- ============================================
-- Rust Snippets
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
    trig = 'fn',
    name = 'Function definition',
    dscr = 'Rust function definition',
  }, fmt(
    [[
fn {}({}) {} {{
    {}
}}
]],
    {
      i(1, 'function_name'),
      i(2, 'args'),
      i(3, ''),
      i(4, 'todo!()'),
    }
  )),

  -- Public function
  s({
    trig = 'pubfn',
    name = 'Public function',
    dscr = 'Rust public function',
  }, fmt(
    [[
pub fn {}({}) {} {{
    {}
}}
]],
    {
      i(1, 'function_name'),
      i(2, 'args'),
      i(3, ''),
      i(4, 'todo!()'),
    }
  )),

  -- Struct definition
  s({
    trig = 'struct',
    name = 'Struct definition',
    dscr = 'Rust struct definition',
  }, fmt(
    [[
struct {} {{
    {}
}}
]],
    {
      i(1, 'StructName'),
      i(2, 'field: Type'),
    }
  )),

  -- Struct with derive macros
  s({
    trig = 'dstruct',
    name = 'Derived struct',
    dscr = 'Rust struct with derive macros',
  }, fmt(
    [[
#[derive({})]
struct {} {{
    {}
}}
]],
    {
      i(1, 'Debug, Clone'),
      i(2, 'StructName'),
      i(3, 'field: Type'),
    }
  )),

  -- Enum definition
  s({
    trig = 'enum',
    name = 'Enum definition',
    dscr = 'Rust enum definition',
  }, fmt(
    [[
enum {} {{
    {},
}}
]],
    {
      i(1, 'EnumName'),
      i(2, 'Variant'),
    }
  )),

  -- Impl block
  s({
    trig = 'impl',
    name = 'Impl block',
    dscr = 'Rust impl block',
  }, fmt(
    [[
impl {} {{
    {}
}}
]],
    {
      i(1, 'StructName'),
      i(2, '// methods'),
    }
  )),

  -- Trait definition
  s({
    trig = 'trait',
    name = 'Trait definition',
    dscr = 'Rust trait definition',
  }, fmt(
    [[
trait {} {{
    fn {}({});
}}
]],
    {
      i(1, 'TraitName'),
      i(2, 'method_name'),
      i(3, '&self'),
    }
  )),

  -- Match statement
  s({
    trig = 'match',
    name = 'Match statement',
    dscr = 'Rust match expression',
  }, fmt(
    [[
match {} {{
    {} => {},
    _ => {},
}}
]],
    {
      i(1, 'expression'),
      i(2, 'pattern'),
      i(3, 'result'),
      i(4, 'todo!()'),
    }
  )),

  -- If let
  s({
    trig = 'iflet',
    name = 'If let',
    dscr = 'Rust if let expression',
  }, fmt(
    [[
if let {} = {} {{
    {}
}}
]],
    {
      i(1, 'Some(value)'),
      i(2, 'option'),
      i(3, '// body'),
    }
  )),

  -- While let
  s({
    trig = 'whilelet',
    name = 'While let',
    dscr = 'Rust while let loop',
  }, fmt(
    [[
while let {} = {} {{
    {}
}}
]],
    {
      i(1, 'Some(value)'),
      i(2, 'iterator'),
      i(3, '// body'),
    }
  )),

  -- Result type
  s({
    trig = 'result',
    name = 'Result type',
    dscr = 'Rust Result type alias',
  }, fmt([[type Result<T> = std::result::Result<T, Box<dyn std::error::Error>>;]], {})),

  -- Main function
  s({
    trig = 'main',
    name = 'Main function',
    dscr = 'Rust main function',
  }, fmt(
    [[
fn main() {{
    {}
}}
]],
    {
      i(1, 'println!("Hello, world!");'),
    }
  )),

  -- Async main function
  s({
    trig = 'asyncmain',
    name = 'Async main function',
    dscr = 'Rust async main with tokio',
  }, fmt(
    [[
#[tokio::main]
async fn main() {{
    {}
}}
]],
    {
      i(1, 'println!("Hello, async world!");'),
    }
  )),

  -- Unit test
  s({
    trig = 'test',
    name = 'Unit test',
    dscr = 'Rust unit test',
  }, fmt(
    [[
#[cfg(test)]
mod tests {{
    use super::*;

    #[test]
    fn test_{}() {{
        {}
    }}
}}
]],
    {
      i(1, 'something'),
      i(2, 'assert!(true);'),
    }
  )),

  -- Println macro
  s({
    trig = 'print',
    name = 'Println macro',
    dscr = 'Rust println! macro',
  }, fmt([[println!("{}", {});]], {
    i(1, '{}'),
    i(2, 'value'),
  })),

  -- Format string
  s({
    trig = 'format',
    name = 'Format string',
    dscr = 'Rust format! macro',
  }, fmt([[format!("{}", {})]], {
    i(1, '{}'),
    i(2, 'value'),
  })),

  -- Vector
  s({
    trig = 'vec',
    name = 'Vector macro',
    dscr = 'Rust vec! macro',
  }, fmt([[vec![{}] ]], {
    i(1, 'elements'),
  })),

  -- Option unwrap
  s({
    trig = 'unwrap',
    name = 'Unwrap with expect',
    dscr = 'Rust unwrap with expect message',
  }, fmt([[.expect("{}")]], {
    i(1, 'should not fail'),
  })),
}
