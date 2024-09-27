return 	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
      local fzf = require('fzf-lua')
 		  local opts = { remap = false }

      vim.keymap.set("n", "<C-\\>", fzf.buffers, opts)
      vim.keymap.set("n", "<C-k>", fzf.builtin, opts)
      vim.keymap.set("n", "<C-p>", fzf.files, opts)
      vim.keymap.set("n", "<C-l>", fzf.live_grep_glob, opts)
      vim.keymap.set("n", "<C-g>", fzf.grep_project, opts)
      vim.keymap.set("n", "<C-t>", fzf.lsp_workspace_symbols, opts)
      vim.keymap.set("n", "<F1>", fzf.help_tags, opts)

      fzf.setup()
		end,
}
