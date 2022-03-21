-- https://tex.stackexchange.com/a/446431
local M = {}


function M.betterurl(text)
  label = text:gsub(".", "%1\\allowbreak{}")

  label = label:gsub("~", "\\textasciitilde")
  label = label:gsub("&", "\\&")
  label = label:gsub("/", "/")
  label = label:gsub("-", "-")

  url = text

  tex.print("\\href{" .. url .. "}{" .. label .. "}")

end

return M