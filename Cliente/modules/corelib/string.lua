-- @docclass string

function string:split(delim)
  local start = 1
  local results = {}
  while true do
    local pos = string.find(self, delim, start, true)
    if not pos then
      break
    end
    table.insert(results, string.sub(self, start, pos-1))
    start = pos + string.len(delim)
  end
  table.insert(results, string.sub(self, start))
  table.removevalue(results, '')
  return results
end

function string:starts(start)
  return string.sub(self, 1, #start) == start
end

function string:ends(test)
   return test =='' or string.sub(self,-string.len(test)) == test
end

function string:trim()
  return string.match(self, '^%s*(.*%S)') or ''
end

function string:explode(sep, limit)
  if type(sep) ~= 'string' or tostring(self):len() == 0 or sep:len() == 0 then
    return {}
  end

  local i, pos, tmp, t = 0, 1, "", {}
  for s, e in function() return string.find(self, sep, pos) end do
    tmp = self:sub(pos, s - 1):trim()
    table.insert(t, tmp)
    pos = e + 1

    i = i + 1
    if limit ~= nil and i == limit then
      break
    end
  end

  tmp = self:sub(pos):trim()
  table.insert(t, tmp)
  return t
end

-- Strip accents from a string
local tableAccents = {["�"] = "a", ["�"] = "a", ["�"] = "a", ["�"] = "a", ["�"] = "a", ["�"] = "c", ["�"] = "e", ["�"] = "e", ["�"] = "e", ["�"] = "e", ["�"] = "i", ["�"] = "i", ["�"] = "i", ["�"] = "i", ["�"] = "n", ["�"] = "o", ["�"] = "o", ["�"] = "o", ["�"] = "o", ["�"] = "o", ["�"] = "u", ["�"] = "u", ["�"] = "u", ["�"] = "u", ["�"] = "y", ["�"] = "y", ["�"] = "A", ["�"] = "A", ["�"] = "A", ["�"] = "A", ["�"] = "A", ["�"] = "C", ["�"] = "E", ["�"] = "E", ["�"] = "E", ["�"] = "E", ["�"] = "I", ["�"] = "I", ["�"] = "I", ["�"] = "I", ["�"] = "N", ["�"] = "O", ["�"] = "O", ["�"] = "O", ["�"] = "O", ["�"] = "O", ["�"] = "U", ["�"] = "U", ["�"] = "U", ["�"] = "U", ["�"] = "Y"}
function string.stripAccents(str)
  local normalizedString = ""
  for strChar in str:gmatch"." do --for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
  if tableAccents[strChar] ~= nil then
    normalizedString = normalizedString .. tableAccents[strChar]
  else
    normalizedString = normalizedString .. strChar
  end
  end
  return normalizedString
end