-- lazy.nvim setup
-- 1) CHecks if lazy.nvim is installed, if not it installs its
-- 2) Sets up lazy.nvim, adding LazyVim plugins, and personal plugins
-- 3) Remove some configurations that are not needed

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErroMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit" },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Import LazyVim plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- Import personal plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy loaded.
        -- Your custom plugins will be loaded during startup.
        -- If you want to lazy load your custom plugins, you can set this to true.
        lazy = false,
        -- It's recommended to leave version=false for now
        -- A lot of plugins that support versioning are not up to date.
        version = false
    },
    install = {},
    checker = {
        enabled = true, -- enable the update checker
        notify = true, -- display a notification when updates are available
    },
    performance = {
        rtp = {
            -- Disable some plugins
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
        },
    },
},})
