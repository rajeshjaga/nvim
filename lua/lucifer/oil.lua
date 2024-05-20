return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
        vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
    end
}
