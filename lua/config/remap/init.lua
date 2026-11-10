setmap = vim.keymap.set
setmap("n", "<leader>ne", ":vsp<CR>:Exp<CR>")
setmap("n", "<leader>vs", ":vsp <CR>", { desc = "Split the current buffer vertical" })
setmap("n", "<leader>v", ":sp <CR>", { desc = "Split the current buffer horizontally" })
setmap("n", "Q", ":qa <CR>", { desc = "Close all damn it" })
setmap("n", "gV", ":vertical all <CR>", { desc = "Vertical all the buffers" })
setmap("n", "<leader>c", ":ColorizerAttachToBuffer <CR>", { desc = "Attach colorizer to current buffer" })

setmap('n', '<Esc>', '<cmd>nohlsearch<CR>')
setmap('i', 'jj', '<Esc>')

setmap('t', 'tt', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
setmap('n', '<C-q>', '<C-w>q', { desc = " close the current buffer" })

setmap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
setmap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
setmap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
setmap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

setmap('n', '<leader>w', ":windo set nowrap<CR>", { desc = 'Disable [W]rap in during multiple windows' })

setmap('n', "<leader>x", function()
    local config = vim.fn.stdpath('config')
    vim.cmd("source " + config)
end)
setmap("n", "<leader>j", "<cmd>cnext<CR>")
setmap("n", "<leader>k", "<cmd>cprev<CR>")
