local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

colors.setup {
  Error = "#ff7eb6",
  Warning = "#e0af68",
  Information = "#82cfff",
  Hint = "#10B981"
}
