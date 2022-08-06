-- First, reset the `require` cache, so that I can develop this sensibly
function unsetPackage()
  package.loaded[name] = nil
end

-- This can be problematic so be wary
for name, _val in pairs(package.loaded) do
  pcall(unsetPackage)
end

require('plugins')
require('lsp')
require('telescope').load_extension 'file_browser'
require('maps')
require('settings')
require('greetings')
