local null_ls = require "null-ls"

local b = null_ls.builtins

local config_dir = os.getenv("XDG_CONFIG_HOME") or ((os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/.config")


local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- spell
  b.diagnostics.cspell.with({
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity["WARN"]
    end,
    condition = function()
      return vim.fn.executable('cspell') > 0
    end,
    extra_args = { "--config", config_dir .. "/cspell/cspell.json"},
  })
}

null_ls.setup {
  debug = true,
  sources = sources,
}
