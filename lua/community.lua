-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- import/override with your plugins folder
  -- import/override with your plugins folder
}
