---@diagnostic disable: missing-fields
return {
    { -- html autotags
        "windwp/nvim-ts-autotag",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {
                    "nix",
                    "typescript",
                    "javascript",
                    "html",
                    "css",
                    "graphql",
                    "scss",
                    "sql",
                    "svelte",
                    "vue",
                    "org",
                    "cmake",
                    "go",
                    "gitignore",
                    "gitcommit",
                    "http",

                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true
                }
            })
        end
    }
}
