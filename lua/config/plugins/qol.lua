local flash = require('flash')
flash.setup({})

local mapset = vim.keymap.set

mapset({"n","x","o"}, "s", function() flash.jump() end, {desc="Flash"})
mapset({"n","x","o"}, "S", function() flash.treesitter() end, {desc="Flash treesitter"})
mapset("o", "r", function() flash.remote() end, {desc="Flash"})
mapset({"o","x"}, "R", function() flash.treesitter_search() end, {desc="Flash"})
mapset("c", "<c-s>", function() flash.toggle() end, {desc="toggle flash search"})
