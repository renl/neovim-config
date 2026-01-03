return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        keymap = {
          accept = "<C-Up>",
          next = "<C-Right>",
          prev = "<C-Left>",
          dismiss = "<C-e>",
          accept_word = "<C-Down>",
        },
      },
    })
  end, 
}
