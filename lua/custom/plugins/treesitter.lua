-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
return {
	"nvim-treesitter/nvim-treesitter",
	init = function ()
		require('nvim-treesitter.install').prefer_git = false
	end,
	config = function ()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = "all",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<leader>t',
					node_incremental = '<TAB>',
					scope_incremental = '<CR>',
					node_decremental = '<S-TAB>',
				},
			},
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
				swap = {
					enable = true,
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},
		}
	end
}
