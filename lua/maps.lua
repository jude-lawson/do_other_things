local set_keymap = vim.api.nvim_set_keymap
local function nmap(params)
  setmetatable(params, {__index={noremap=true}})
  set_keymap('n', params[1], params[2], {noremap = params.noremap})
end
local function vmap(params)
  setmetatable(params, {__index={noremap=true}})
  set_keymap('v', params[1], params[2], {noremap = params.noremap})
end

-- General
nmap{'<leader>lc', ':luafile $HOME/.config/nvim/init.lua<cr>'}

-- Finding files
nmap{'<leader>ff', ':Telescope find_files hidden=true<cr>'}
nmap{'<leader>fg', ':Telescope live_grep<cr>'}
nmap{'<leader>zs', ':Telescope git_status<cr>'}

-- Code actions
nmap{'<leader>ca', ':Telescope lsp_code_actions'}

-- easier commanding
nmap{';', ':'}
nmap{'<leader>;', ';'}
vmap{';', ':'}
vmap{'<leader>;', ';'}

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

-- git
nmap{'<leader>gc', ':Git commit -m '}

-- End statement
print('Maps loaded.')
