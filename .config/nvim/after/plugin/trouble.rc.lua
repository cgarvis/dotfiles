local status, trouble = pcall(require, "trouble")
if (not status) then return end

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)


trouble.setup {
  auto_open = true,
  auto_close = true,
}
