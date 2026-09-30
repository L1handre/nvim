return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	init = function()
		vim.g.no_plugin_maps = true
	end,
	opts = {
		select = {
			lookahead = true,
		},
		move = {
			set_jumps = true,
		},
	},
	config = function()
		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")
		local swap = require("nvim-treesitter-textobjects.swap")

		local map_select = function(keys, query)
			vim.keymap.set({ "x", "o" }, keys, function()
				select.select_textobject(query, "textobjects")
			end)
		end

		local map_move = function(keys, fn, query)
			vim.keymap.set({ "n", "x", "o" }, keys, function()
				move[fn](query, "textobjects")
			end)
		end

		local map_swap = function(keys, fn, query)
			vim.keymap.set("n", keys, function()
				swap[fn](query, "textobjects")
			end)
		end

		map_select("am", "@function.outer")
		map_select("im", "@function.inner")
		map_select("ac", "@class.outer")
		map_select("ic", "@class.inner")
		map_select("ab", "@block.outer")
		map_select("ib", "@block.inner")
		map_select("a/", "@comment.outer")
		map_select("a\\", "@comment.outer")
		map_select("i/", "@comment.inner")
		map_select("i\\", "@comment.inner")
		map_select("aa", "@parameter.outer")
		map_select("ia", "@parameter.inner")
		map_select("ak", "@assignment.outer")
		map_select("ik", "@assignment.inner")
		map_select("il", "@assignment.lhs")
		map_select("iv", "@assignment.rhs")

		map_move("]m", "goto_next_start", "@function.outer")
		map_move("]c", "goto_next_start", "@class.outer")
		map_move("]b", "goto_next_start", "@block.outer")
		map_move("]/", "goto_next_start", "@comment.outer")
		map_move("]a", "goto_next_start", "@parameter.inner")
		map_move("]k", "goto_next_start", "@assignment.outer")
		map_move("]l", "goto_next_start", "@assignment.lhs")
		map_move("]v", "goto_next_start", "@assignment.rhs")

		map_move("]M", "goto_next_end", "@function.outer")
		map_move("]C", "goto_next_end", "@class.outer")
		map_move("]B", "goto_next_end", "@block.outer")
		map_move("]\\", "goto_next_end", "@comment.outer")
		map_move("]A", "goto_next_end", "@parameter.inner")
		map_move("]K", "goto_next_end", "@assignment.outer")
		map_move("]L", "goto_next_end", "@assignment.lhs")
		map_move("]V", "goto_next_end", "@assignment.rhs")

		map_move("[m", "goto_previous_start", "@function.outer")
		map_move("[c", "goto_previous_start", "@class.outer")
		map_move("[b", "goto_previous_start", "@block.outer")
		map_move("[/", "goto_previous_start", "@comment.outer")
		map_move("[a", "goto_previous_start", "@parameter.inner")
		map_move("[k", "goto_previous_start", "@assignment.outer")
		map_move("[l", "goto_previous_start", "@assignment.lhs")
		map_move("[v", "goto_previous_start", "@assignment.rhs")

		map_move("[M", "goto_previous_end", "@function.outer")
		map_move("[C", "goto_previous_end", "@class.outer")
		map_move("[B", "goto_previous_end", "@block.outer")
		map_move("[\\", "goto_previous_end", "@comment.outer")
		map_move("[A", "goto_previous_end", "@parameter.inner")
		map_move("[K", "goto_previous_end", "@assignment.outer")
		map_move("[L", "goto_previous_end", "@assignment.lhs")
		map_move("[V", "goto_previous_end", "@assignment.rhs")

		map_swap("<leader>sm", "swap_next", "@function.outer")
		map_swap("<leader>sa", "swap_next", "@parameter.inner")
		map_swap("<leader>sk", "swap_next", "@assignment.outer")

		map_swap("<leader>sM", "swap_previous", "@function.outer")
		map_swap("<leader>sA", "swap_previous", "@parameter.inner")
		map_swap("<leader>sK", "swap_previous", "@assignment.outer")
	end,
}
