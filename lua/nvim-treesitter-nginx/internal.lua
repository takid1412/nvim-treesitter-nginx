local M = {}

function M.init()

	local current_file_path = debug.getinfo(1, "S").source:sub(2)

	local current_dir = vim.fn.fnamemodify(current_file_path, ":h")

	local plugin_root = vim.fn.fnamemodify(current_dir, ":h:h")

	vim.api.nvim_create_autocmd("User", {
		pattern = "TSUpdate",
		callback = function()
			require("nvim-treesitter.parsers").nginx = {
				install_info = {
					path = plugin_root .. "/tree-sitter-nginx",
					files = { "src/parser.c" },
					branch = "main",
					queries = "queries"
				},
				filetype = "nginx",
			}
		end,
	})

    vim.filetype.add({
      pattern = {
        [".*/nginx/.*%.conf"] = "nginx",
      },
    })
end

return M
