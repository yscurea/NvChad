require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazy_path)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazy_path)
require "plugins"

