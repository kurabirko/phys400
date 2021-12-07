local M = {}

function M.print()
  local is_ci = os.getenv('CI') or ''
  if is_ci ~= 'true' then
    return
  end
  
  local version = os.getenv('GITHUB_SHA')

  tex.sprint('\\begingroup Build: \\ttfamily ' ..
    string.sub(version, 1, 7) ..
    ' \\endgroup')
end

return M
