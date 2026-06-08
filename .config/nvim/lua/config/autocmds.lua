-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- templ LSP provides hover but has no useful info for Tailwind classes;
-- disable it so tailwindcss is the sole hover responder
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.templ",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "templ" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})
