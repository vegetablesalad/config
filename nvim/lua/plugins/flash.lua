return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {
    label = {
      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 5,
      },
    },
    modes = {
      char = {
        enabled = false,
        keys = { "t", "T", ";", "," },
      },
    },
  },
  keys = {
    {
      "fo",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = false, mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^\\s*\\S",
        })
      end,
      desc = "Flash line UP",
    },
    {
      "fl",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = true, mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^\\s*\\S",
        })
      end,
      desc = "Flash line DOWN",
    },
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
    {
      "ft",
      mode = { "n", "o", "x" },
      function()
        local pattern = "\\(<[a-zA-Z][a-zA-Z0-9:-]*\\)\\(\\_.\\{-}\\)\\?>"

        require("flash").jump({
          search = {
            forward = false,
            mode = "search",
            max_length = 0,
          },
          label = { before = { 0, 0 }, after = false },
          highlight = {
            matches = false,
          },
          pattern = pattern,
        })
      end,

      desc = "Flash to TAG",
    },
  },
}
