
class util
  unloadLuaNamespace: (prefix) ->
    prefixWithDot = prefix .. '.'
    for key, value in pairs(package.loaded) do
      if key == prefix or key\sub(1, #prefixWithDot) == prefixWithDot then
        package.loaded[key] = nil

