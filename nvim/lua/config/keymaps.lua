-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--local hop = require("hop")
--local directions = require("hop.hint").HintDirection

--vim.keymap.set("", "fl", function()
--  hop.hint_lines({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, { desc = "Hop line", remap = true })

vim.keymap.set("n", "-", function()
  if not MiniFiles.close() then
    -- MiniFiles.open(nil, false)
    -- MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end, { desc = "Open mini file", remap = true })

local function toggle_neo_tree_source(source)
  local manager = require("neo-tree.sources.manager")
  local current_win = vim.api.nvim_get_current_win()

  local state = manager.get_state(source)
  local neo_tree_win = state and state.winid

  if neo_tree_win and vim.api.nvim_win_is_valid(neo_tree_win) then
    if current_win == neo_tree_win then
      -- Already in the target Neo-tree view → go back to previous window
      vim.cmd("wincmd p")
    else
      -- Neo-tree window is open but we're not in it → switch the source and focus that window
      vim.cmd("Neotree focus " .. source)
      vim.api.nvim_set_current_win(neo_tree_win)
    end
  else
    -- Neo-tree isn't open yet → open and focus target source
    vim.cmd("Neotree focus " .. source)
  end
end
-- Keymaps
vim.keymap.set("n", "<leader>ee", function()
  toggle_neo_tree_source("filesystem")
end, { desc = "Toggle Neo-tree Filesystem" })

vim.keymap.set("n", "<leader>eb", function()
  toggle_neo_tree_source("buffers")
end, { desc = "Toggle Neo-tree Buffers" })

vim.keymap.set("n", "<leader>eg", function()
  toggle_neo_tree_source("git_status")
end, { desc = "Toggle Neo-tree Git Status" })
