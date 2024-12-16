return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	commit = "37f0cf1",
	init = function()
        if vim.env.ANTHROPIC_API_KEY ~= nil then
            return
        end
        local path = vim.fn.stdpath("config") .. "/.claude.txt"
		local file = io.open(path, "r")
		if not file then
			print("ERROR: failed to read claude api key at:" .. path)
			return nil
		end
		local key = file:read("*l")
		file:close()
		vim.env.ANTHROPIC_API_KEY = key
	end,
	opts = {
		provider = "claude",
        debug = true,
        api_key_name = "ANTHROPIC_API_KEY"
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
