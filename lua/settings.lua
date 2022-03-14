local opt = vim.opt
local cmd = vim.api.nvim_command

local function set(params)
  for option, value in pairs(params) do
    opt[option] = value
  end
end

-- General options
set{termguicolors = true}   -- support true colors
set{hidden = false}         -- hidden files can be insidious causing the need to manually delete buffers
set{
  backup = false,
  writebackup = false,
}                           -- no backup files (LSPs have trouble with these)
set{number = true}          -- enable line numbers
set{signcolumn = 'number'}  -- use line numbers for the side column where signs for errors and such appear
set{swapfile = false}       -- none of those dastardly swapfiles
set{hlsearch = false}       -- disable highlighting search results
set{
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
}                           -- set <Tab> to 2 spaces
set{smarttab = true}        -- align tabs width at the beginning of a line

-- Additional configuration
cmd 'syntax on'             -- enable syntax highlighting

-- Colorscheme configuration
set{background = 'dark'}      -- rose-pine will respect light or dark
cmd 'colorscheme rose-pine'   -- set colorscheme

-- End statement
print('Settings loaded.')

