require("lint").linters_by_ft = {
  html = { "tidy", "htmlhint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function() end,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.templ" },
  callback = vim.lsp.buf.format,
  require("lint").try_lint(),
})

local custom_format = function()
  if vim.bo.filetype == "templ" then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd("e!")
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- other configuration options
  vim.keymap.set("n", "<leader>lf", custom_format, opts)
end

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspconfig = require("lspconfig")

lspconfig.templ.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ", "astro", "javascript", "typescript", "react" },
  init_options = { userLanguages = { templ = "html" } },
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
  },
}
