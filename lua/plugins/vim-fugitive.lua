return {
	"tpope/vim-fugitive",
	init = function()
		vim.api.nvim_create_user_command("G", function(opts)
			if opts.args == "" then
				vim.cmd("tab Git")
			else
				vim.cmd("Git " .. opts.args)
			end
		end, { nargs = "*", bang = true, complete = "file" })
	end,
}
