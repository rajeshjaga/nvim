vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind =='install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

gh = function(packages)
  return 'https://github.com/' .. packages
end

vim.pack.add({
          {
            src = gh('rose-pine/nvim'),
            name='rosepine'
          },
          {src=gh('folke/which-key.nvim')},
          {src=gh('folke/snacks.nvim')},
          {src=gh('folke/flash.nvim')},
          {src=gh('stevearc/conform.nvim')},
          {src=gh('MeanderingProgrammer/render-markdown.nvim')},
          {src=gh('MunifTanjim/nui.nvim')},
          {src=gh('rcarriga/nvim-notify')},
          {src=gh('j-hui/fidget.nvim')},
          {src=gh('folke/noice.nvim')},
          {src=gh('stevearc/oil.nvim')},
          {src=gh('folke/snacks.nvim')},
          {src=gh('nvim-mini/mini.nvim')},
          {src=gh('nvim-tree/nvim-web-devicons')},
          ---telescope
          {
            src = gh('nvim-telescope/telescope.nvim'),
            version = 'v0.2.1',
          },
          {src=gh('nvim-telescope/telescope-ui-select.nvim')},
          {src=gh('nvim-tree/nvim-web-devicons')},
          {src=gh('nvim-lua/plenary.nvim')},
          {src=gh('nvim-telescope/telescope-fzf-native.nvim')},
          ---
          {src=gh('nvim-treesitter/nvim-treesitter')},
          {src=gh('folke/which-key.nvim')},
          {src=gh('nvim-lualine/lualine.nvim')},
          {
            src=gh('saghen/blink.cmp'),
            version = 'v1.10.2',
          },
          {src=gh('neovim/nvim-lspconfig')},

})

require('config.plugins.oil')
require('config.plugins.keys')

--config for theme is in the editor.lua
require('config.plugins.editor')

require('config.plugins.completion')
require('config.plugins.qol')
require('config.plugins.mini')
require('config.plugins.snacks')
require('config.plugins.treesitter')
require('config.plugins.telescope')
