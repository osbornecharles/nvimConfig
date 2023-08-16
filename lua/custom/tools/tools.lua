local Module = {}

function Module.GetVisualSelection()
  local _, lineStart, colStart = unpack(vim.fn.getpos('v'))
  local _, lineEnd, colEnd = unpack(vim.fn.getpos('.'))
  if lineStart > lineEnd or (lineStart == lineEnd and colStart > colEnd) then
    local tempLineStart = lineStart
    local tempColStart = colStart
    lineStart = lineEnd
    colStart = colEnd
    lineEnd = tempLineStart
    colEnd = tempColStart
  end
  print('ls: ' .. lineStart)
  print('le: ' .. lineEnd)
  return vim.api.nvim_buf_get_text(0, lineStart-1, colStart-1, lineEnd-1, colEnd, {})
end

return Module
