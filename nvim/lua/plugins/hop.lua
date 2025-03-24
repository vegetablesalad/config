return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  keys = function()
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    return {
      -- {
      --   "fl",
      --   function()
      --     hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR })
      --   end,
      --   mode = "n",
      --   desc = "Line after cursor",
      -- },
      -- {
      --   "fo",
      --   function()
      --     hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR })
      --   end,
      --   mode = "n",
      --   desc = "Line before cursor",
      -- },
      {
        "ft",
        function()
          --\(<[a-zA-Z][a-zA-Z0-9:-]*\)\(\_.\{-}\)\?>
          local pattern = "\\(<[a-zA-Z][a-zA-Z0-9:-]*\\)\\(\\_.\\{-}\\)\\?>"
          --local pattern = "\\d"

          hop.hint_patterns({ direction = directions.AFTER_CURSOR }, pattern)
        end,
        mode = "n",
        desc = "JSX tags",
      },
    }
  end,
}
