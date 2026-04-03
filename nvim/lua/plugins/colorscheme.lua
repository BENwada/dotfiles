return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- ここでKanagawaの背景透過を有効にする
      theme = "wave", -- (オプション) wave, dragon, lotus から選択可能
    },
    config = function(_, opts)
      require("kanagawa").setup(opts) -- 設定を適用
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
