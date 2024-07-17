return {
  {
    "stevearc/overseer.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    config = function()
      require("overseer").setup {
        templates = { "builtin", "user.cpp_build" },
      }
    end,
  },
}
