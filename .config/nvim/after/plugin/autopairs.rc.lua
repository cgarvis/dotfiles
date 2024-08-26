local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" , "vim" },
})

vim.api.nvim_set_keymap("i", "<C-v>", '<C-r>+', { noremap = true } )
