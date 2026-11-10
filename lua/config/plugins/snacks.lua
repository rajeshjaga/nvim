local Snacks = require('snacks')
Snacks.setup({
  bigfile = { enabled = true },
  dashboard = {
    preset = {
      pick = nil,
      ---@type snacks.dashboard.Item[]
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      -- Used by the `header` section
      header =
      [[ Rajesh ]],
    },
    -- item field formatters
    formats = {
      icon = function(item)
        if item.file and item.icon == "file" or item.icon == "directory" then
          return Snacks.dashboard.icon(item.file, item.icon)
        end
        return { item.icon, width = 2, hl = "icon" }
      end,
      footer = { "%s", align = "center" },
      header = { "%s", align = "center" },
      file = function(item, ctx)
        local fname = vim.fn.fnamemodify(item.file, ":~")
        fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
        if #fname > ctx.width then
          local dir = vim.fn.fnamemodify(fname, ":h")
          local file = vim.fn.fnamemodify(fname, ":t")
          if dir and file then
            file = file:sub(-(ctx.width - #dir - 2))
            fname = dir .. "/…" .. file
          end
        end
        local dir, file = fname:match("^(.*)/(.+)$")
        return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
      end,
    },
    sections = {
      { section = "header" },
      { section = "keys",   gap = 1, padding = 1 },
      -- the built-in "startup" section hard-requires lazy.nvim, so build our own
      function()
        local n = #vim.pack.get()
        return {
          align = "center",
          text = {
            { "⚡ ", hl = "special" },
            { tostring(n), hl = "special" },
            { " plugins", hl = "footer" },
          },
        }
      end,
    },
  },
  explorer = { enabled = false },
  indent = { enabled = true },
  input = { enabled = true },
  lazygit = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  zen = {
    toggles = { dim = true, git_signs = false, mini_diff_signs = false},
    center = true,          
    show = { statusline = false, tabline = false, },
    ---@type snacks.win.Config
    win = { style = "zen" },
    zoom = {
      toggles = {},
      center = false,
      show = { statusline = true, tabline = true },
      win = { backdrop = false, width = 0},
    },
  },
})

map=vim.keymap.set

map( "n", "<leader>,",  function() Snacks.picker.buffers() end,                                 {desc = "Buffers" })
map( "n", "<leader>/",  function() Snacks.picker.grep() end,                                    {desc = "Grep" })
map( "n", "<leader>:",  function() Snacks.picker.command_history() end,                         {desc = "Command History" })
map( "n", "<leader>n",  function() Snacks.picker.notifications() end,                           {desc = "Notification History" })
map( "n", "<leader>ff", function() Snacks.picker.files() end,                                   {desc = "Find Files" })
map( "n", "<leader>fg", function() Snacks.picker.git_files() end,                               {desc = "Find Git Files" })
map( "n", "<leader>fp", function() Snacks.picker.projects() end,                                {desc = "Projects" })
map( "n", "<leader>fr", function() Snacks.picker.recent() end,                                  {desc = "Recent" })
map( "n", "<leader>nv", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, {desc = "Find Config File" })
--lsp
map("n","gd",         function() Snacks.picker.lsp_definitions() end,                         {desc = "Goto Definition" })
map("n","gD",         function() Snacks.picker.lsp_declarations() end,                        {desc = "Goto Declaration" })
map("n","gr",         function() Snacks.picker.lsp_references() end,                          {desc = "References" })
map("n","gI",         function() Snacks.picker.lsp_implementations() end,                     {desc = "Goto Implementation" })
map("n","gy",         function() Snacks.picker.lsp_type_definitions() end,                    {desc = "Goto T[y]pe Definition" })
map("n","gai",        function() Snacks.picker.lsp_incoming_calls() end,                      {desc = "C[a]lls Incoming" })
map("n","gao",        function() Snacks.picker.lsp_outgoing_calls() end,                      {desc = "C[a]lls Outgoing" })
map("n","<leader>ss", function() Snacks.picker.lsp_symbols() end,                             {desc = "LSP Symbols" })
map("n","<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   {desc = "LSP Workspace Symbols" })
--other
map("n","<leader>z",  function() Snacks.zen() end,                                            {desc = "Toggle Zen Mode" })
map("n","<leader>Z",  function() Snacks.zen.zoom() end,                                       {desc = "Toggle Zoom" })
map("n","<leader>n",  function() Snacks.notifier.show_history() end,                          {desc = "Notification History" })
map("n","<leader>bd", function() Snacks.bufdelete() end,                                      {desc = "Delete Buffer" })
map("n","<leader>lg", function() Snacks.lazygit() end,                                        {desc = "Lazygit" })
map("n","<c-/>",      function() Snacks.terminal() end,                                       {desc = "Toggle Terminal" })
