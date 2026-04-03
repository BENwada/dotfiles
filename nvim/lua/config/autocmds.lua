-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      -- "NormalFloat",
      -- "FloatBorder",
      "SignColumn",
      "EndOfBuffer",
      "LineNr",
    }
    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   -- 対象拡張子を限定
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.jsonc" },
--   callback = function()
--     -- 現在のバッファで biome が動いているか確認
--     local clients = vim.lsp.get_clients({ name = "biome", bufnr = 0 })
--     if #clients > 0 then
--       vim.lsp.buf.code_action({
--         context = {
--           diagnostics = vim.diagnostic.get(0), -- 必須フィールド
--           only = {
--             -- ここを必ず「大文字」を含めた正しい形式にする
--             "source.fixAll.biome",
--             "source.organizeImports.biome",
--             "quickfix.biome.useSortedClasses",
--           },
--         },
--         apply = true,
--       })
--     end
--   end,
-- })
