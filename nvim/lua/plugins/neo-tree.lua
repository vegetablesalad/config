return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          never_show = {
            ".git",
          },
        },
      },
    })

    --		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>") -- Ctrl + N to toggle file directory.
    --		vim.keymap.set("n", "<leader>fr", ":Neotree reveal<CR>")
  end,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_by_name = {
        "node_modules",
      },
    },
  },
}
