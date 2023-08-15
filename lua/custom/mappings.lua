---@type MappingsTable
local M = {}

M.general = {
  t = {
    ["<A-j>"] = {"<C-\\><C-n>","Escape terminal"},
  },
}

M.trouble = {
  n = {
    ["<C-t>"] =  { ":TroubleToggle<CR>", "Toggle Trouble List" },
  }
}

M.hop = {
  n = {
    ["<leader>jw"] = { "<cmd>HopWord<CR>", "HopWord" },
    ["<leader>jv"] = { "<cmd>HopVertical<CR>", "HopVertical" },
    ["<leader>ja"] = { "<cmd>HopAnywhere<CR>", "HopAnywhere" },
  }
}

return M
