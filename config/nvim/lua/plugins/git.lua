return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>g", "<cmd>Neogit<cr>", desc = "Neogit" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    opts = { current_line_blame = true },
  },
}
