return 	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = function ()
      local fzf = require('fzf-lua')
      return {
        {"<C-\\>", fzf.buffers},
        {"<C-k>", fzf.builtin},
        {"<C-p>", fzf.files},
        {"<C-l>", fzf.live_grep},
        {"<C-g>", fzf.grep_project},
        {"<C-t>", fzf.lsp_workspace_symbols},
        {"<F1>", fzf.help_tags}
      }
    end,
 		opts = { remap = false },
		config = function()
      local fzf = require('fzf-lua')
      fzf.setup({
        fzf = {
          {"ctrl-q", "select-all+accept" }
        }
      })
		end,
}
