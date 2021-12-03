local M = {}

function M.print()
  local ref_name = os.getenv('GITHUB_REF_NAME') or ''
  if ref_name:find('^refs/tags/release-') ~= nil then
    return
  end
  
  tex.sprint('\\begingroup Build: \\ttfamily ')

  local version = os.getenv('GITHUB_SHA')
  if version == nil then
    version = 'local'
  else
    version = string.sub(version, 1, 7)
  end
  tex.sprint(version .. ' \\endgroup' )
end

return M