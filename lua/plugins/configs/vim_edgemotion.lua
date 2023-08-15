local set = vim.keymap.set
local option = { noremap = true, silent = true }
set("v", "<Leader>J", "<Plug>(edgemotion-j)", option)
set("v", "<Leader>K", "<Plug>(edgemotion-k)", option)
set("n", "<Leader>J", "<Plug>(edgemotion-j)", option)
set("n", "<Leader>K", "<Plug>(edgemotion-k)", option)
