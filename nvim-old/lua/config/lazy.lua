local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        --"L3MON4D3/LuaSnip",
        --"saadparwaiz1/cmp_luasnip",
        --"mlaursen/vim-react-snippets",
      },
      opts = function()
        --vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        --require("vim-react-snippets").lazy_load()
      end,
    },
    --{ import = "lazyvim.plugins.extras.lang.typescript" },
    --{ import = "lazyvim.plugins.extras.lang.json" },
    { "echasnovski/mini.nvim", version = false },
    { "echasnovski/mini.indentscope", version = false },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
  },
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-animate.md
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latesthgit commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
require("mini.indentscope").setup()
