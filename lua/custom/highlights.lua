local M = {}

M.override = {
  -- コメントの見づらさ解決
  Comment = {
    italic = true,
    bg = "#333333",
    fg = "white",
  },
}

M.add = {
  NvimTreeOpenedFolderName = {
    fg = "green",
    bold = true,
  },
}

return M
