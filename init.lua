-- First, reset the `require` cache, so that I can develop this sensibly
for name, _val in pairs(package.loaded) do
  package.loaded[name] = nil
end

require('plugins')
require('telescope').load_extension 'file_browser'
require('maps')
require('settings')
-- require('greetings')
