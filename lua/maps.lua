local set_keymap = vim.api.nvim_set_keymap
local function nmap(params)
  setmetatable(params, {__index={noremap=true}})
  set_keymap('n', params[1], params[2], {noremap = params.noremap})
end

-- General
nmap{'<leader>lc', ':source $HOME/.config/nvim/init.lua<cr>'}

-- Finding files
nmap{'<leader>ff', ':Telescope find_files<cr>'}

-- easier commanding
nmap{';', ':'}
nmap{'<leader>;', ';'}
nmap{';', ':'}
nmap{'<leader>;', ';'}

-- easy window navigation
nmap{'<C-H>', '<C-W><C-H>'}
nmap{'<C-J>', '<C-W><C-J>'}
nmap{'<C-K>', '<C-W><C-K>'}
nmap{'<C-L>', '<C-W><C-L>'}

-- resize windows with arrow keys, they're not good for much else
nmap{'<Up>', ':res +5'}
nmap{'<Down>', ':res -5'}
nmap{'<Left>', ':vertical resize +5'}
nmap{'<Right>', ':vertical resize -5'}

-- End statement
print('Maps loaded.')
