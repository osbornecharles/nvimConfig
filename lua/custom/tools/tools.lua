local Module = {}

function Module.GetVisualSelection()
  local _, lineStart, colStart = unpack(vim.fn.getpos('v'))
  print('linestart: ' .. lineStart)
  print('colstart: ' .. colStart)
  local _, lineEnd, colEnd = unpack(vim.fn.getpos('.'))
  print('lineend: ' .. lineEnd)
  print('colend: ' .. colEnd)
  if lineStart > lineEnd or (lineStart == lineEnd and colStart > colEnd) then
    local tempLineStart = lineStart
    local tempColStart = colStart
    lineStart = lineEnd
    colStart = colEnd
    lineEnd = tempLineStart
    colEnd = tempColStart
  end
  return vim.api.nvim_buf_get_text(0, lineStart-1, colStart-1, lineEnd-1, colEnd, {})
end

return Module
