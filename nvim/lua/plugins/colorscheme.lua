return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "wave", -- (オプション) wave, dragon, lotus から選択可能
    },
    config = function(_, opts)
      require("kanagawa").setup(opts) -- 設定を適用
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
