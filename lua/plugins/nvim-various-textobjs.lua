return {
	"chrisgrieser/nvim-various-textobjs",
	event = "VeryLazy",
	config = function()
		local various = require("various-textobjs")
		various.setup()

		local map = vim.keymap.set

		local function get_cmd(object, location)
			return function()
				various[object](location)
			end
		end

		map({ "o", "x" }, "as", get_cmd("subword", "outer"), { desc = "outer subword" })
		map({ "o", "x" }, "is", get_cmd("subword", "inner"), { desc = "inner subword" })

		map({ "o", "x" }, "al", get_cmd("lineCharacterwise", "outer"), { desc = "outer line" })
		map({ "o", "x" }, "il", get_cmd("lineCharacterwise", "inner"), { desc = "inner line" })
	end,
}
