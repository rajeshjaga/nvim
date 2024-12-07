-- return{
--     "catppuccin/nvim",
--     lazy=false,
--     name="catppuccin",
--     priority=1000,
--     config = function()
--         require("catppuccin").setup({
--             transparent_background = true,
--         })
--     vim.cmd.colorscheme("catppuccin")
--     vim.g.catppuccin_flavour = "mocha"
--     end
-- }
return {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "main",
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            enable = {
                terminal = true,
                legacy_highlights = true,
                migratations = true,
            },
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
        })
        vim.cmd.colorscheme("rose-pine")
    end
}
