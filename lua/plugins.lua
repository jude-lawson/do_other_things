require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'rose-pine/neovim'

  -- FZF for vim (general-purpose fuzzy utility)
  use{'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use 'junegunn/fzf.vim'

  -- Telescope, all-encompassing fuzzy utility
  use 'nvim-lua/plenary.nvim' -- dependency for telescope, utility functions for lua-nvim
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- statusline
  use 'itchyny/lightline.vim'

  -- git
  use 'tpope/vim-fugitive'

  -- Language-specific plugins
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'},
  }

  -- syntax highlighting
  use{'pangloss/vim-javascript', ft = 'javascript'}
  use{'leafgarland/typescript-vim', ft = 'typesript'}

  -- editing utilities
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
end)
