require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Markdown
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown preview in browser" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown preview stop" })
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown render toggle" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
