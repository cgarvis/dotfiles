local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

chatgpt.setup {
  api_key_cmd = "security find-generic-password -s OPENAI_API_KEY -w",
  openai_params = {
    model = "gpt-4-turbo",
    max_tokens = 500
  },
  openai_edit_params = {
    model = "gpt-4-turbo",
    max_tokens = 500
  }
}


require("which-key").add({
  {
    mode = {"n", "v"},
    { "<C-g>e", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    { "<C-g>g", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    { "<C-g>t", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    { "<C-g>k", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    { "<C-g>d", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    { "<C-g>a", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    { "<C-g>o", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    { "<C-g>s", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    { "<C-g>f", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    { "<C-g>x", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    { "<C-g>r", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    { "<C-g>l", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
  }
})
