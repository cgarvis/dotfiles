local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.trail_space,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace
  }
}
