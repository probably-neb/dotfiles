local RUST_LLDB_COMMANDS_PATH = "/home/neb/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/etc/lldb_commands"
local ADAPTERS = {
	lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode",
		name = "lldb",
	},
	rust_lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode --source " .. RUST_LLDB_COMMANDS_PATH,
		name = "rust-lldb",
	},
    gdb = {
        type = "executable",
        command = "/usr/bin/gdb",
        name = "gdb",
    }
}

local CONFIGS = {
	rustLLDB = {
		name = "Launch lldb",
		type = "rust-lldb",
		request = "launch",
		program = function()
			return vim.fn.input({ prompt = "Path to executable: ", default = vim.fn.getcwd() .. "/", key = "file" })
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},
		runInTerminal = false,
	},
	zigLLDB = {
		name = "Launch lldb",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input({
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file",
			})
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},
		runInTerminal = false,
	},
	cLLDB = {
		name = "Launch lldb",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input({
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file",
			})
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},
		runInTerminal = false,
	},
}
local DAP_PREFIX = "<leader>d"

local DAP_IDK_FIGURE_OUT_LATER = {
	breakpoint = {
		text = "b",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	breakpoint_rejected = {
		text = "r",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "s",
		texthl = "DiagnosticSignWarn",
		linehl = "Visual",
		numhl = "DiagnosticSignWarn",
	},
}

local DAP = {
	active = true,
	on_config_done = nil,
	breakpoint = {
		text = "b",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	breakpoint_rejected = {
		text = "r",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "s",
		texthl = "DiagnosticSignWarn",
		linehl = "Visual",
		numhl = "DiagnosticSignWarn",
	},
	log = {
		level = "info",
	},
	ui = {
		auto_open = true,
		notify = {
			threshold = vim.log.levels.INFO,
		},
		config = {
			icons = { expanded = "", collapsed = "", circular = "" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Use this to override mappings for specific elements
			element_mappings = {},
			expand_lines = true,
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.33,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					size = 0.27,
					position = "bottom",
				},
			},
			controls = {
				enabled = true,
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			floating = {
				max_height = 0.9,
				max_width = 0.5, -- Floats will be treated as percentage of your screen.
				border = "rounded",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
			},
		},
	},
}
-- until rcarriga/nvim-dap-ui#164 is fixed
local function notify_handler(msg, level, opts)
	if level >= DAP.ui.notify.threshold then
		return vim.notify(msg, level, opts)
	end

	opts = vim.tbl_extend("keep", opts or {}, {
		title = "dap-ui",
		icon = "",
		on_open = function(win)
			vim.api.nvim_buf_set_option(vim.api.nvim_win_get_buf(win), "filetype", "markdown")
		end,
	})

	-- vim_log_level can be omitted
	if level == nil then
		level = "INFO"
	elseif type(level) == "string" then
		level = (level):upper()
	else
		-- https://github.com/neovim/neovim/blob/685cf398130c61c158401b992a1893c2405cd7d2/runtime/lua/vim/lsp/log.lua#L5
		level = level + 1
	end

	msg = string.format("%s: %s", opts.title, msg)
end

local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "rcarriga/nvim-dap-ui", config = DAP.ui.config, dependencies = { "nvim-neotest/nvim-nio" } },
		{
			"folke/neodev.nvim",
			ft = { "lua" },
			config = function()
				require("neodev").setup({ library = { plugins = "nvim-dap-ui" }, types = true })
			end,
		},
	},
	keys = {
		DAP_PREFIX,
	},
	-- TODO: `nvim-dap-virtual-text` would be a poggers addition to this fine dap setup
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		dap.adapters.lldb = ADAPTERS.lldb
		dap.adapters.rust_lldb = ADAPTERS.rust_lldb

		dap.configurations.rust = { CONFIGS.rustLLDB }
		dap.configurations.zig = { CONFIGS.zigLLDB }
		dap.configurations.c = { CONFIGS.cLLDB }

		dap.set_log_level(DAP.log.level)
		if DAP.ui.auto_open then
			dap.listeners.after.event_initialized["dapui_config"] = function()
				ui.open()
			end
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			--   dapui.close()
			-- end
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			--   dapui.close()
			-- end
		end

		vim.fn.sign_define("DapBreakpoint", DAP.breakpoint)
		vim.fn.sign_define("DapBreakpointRejected", DAP.breakpoint_rejected)
		vim.fn.sign_define("DapStopped", DAP.stopped)

		-- ui.util.notify = notify_handler

		local wk = require("which-key")
		wk.register({
			b = {
				function()
					dap.toggle_breakpoint()
				end,
				"Toggle breakpoint",
			},
			r = {
                name = "Run",
				e = {
					function()
						dap.repl_open()
					end,
					"Open Dat READ-EVAL-PRINT-LOOP",
				},
				l = {
					function()
						dap.run_last()
					end,
					"Run Last",
				},
				c = {
					function()
						dap.run_to_cursor()
					end,
                    "Run To Cursor"
				},
			},
			c = {
				function()
					dap.continue()
				end,
				"Continue",
			},
			n = {
				function()
					dap.step_over()
				end,
				"Step over",
			},
			s = {
				function()
					dap.step_into()
				end,
				"Step into",
			},
			o = {
				function()
					dap.step_out()
				end,
				"Step out",
			},
			q = {
				function()
					dap.terminate()
                    ui.close()
				end,
				"Terminate",
			},
			x = {
				function()
					ui.eval()
				end,
				"Execute Expression",
				mode = { "v", "n", "x" },
			},
		}, { prefix = DAP_PREFIX, noremap = true })
	end,
}

-- local M = {}
--
-- M.config = function()
--   lvim.builtin.dap = {
--     active = true,
--     on_config_done = nil,
--     log = {
--       level = "info",
--     },
--     ui = {
--       auto_open = true,
--       notify = {
--         threshold = vim.log.levels.INFO,
--       },
--       config = {
--         icons = { expanded = "", collapsed = "", circular = "" },
--         mappings = {
--           -- Use a table to apply multiple mappings
--           expand = { "<CR>", "<2-LeftMouse>" },
--           open = "o",
--           remove = "d",
--           edit = "e",
--           repl = "r",
--           toggle = "t",
--         },
--         -- Use this to override mappings for specific elements
--         element_mappings = {},
--         expand_lines = true,
--         layouts = {
--           {
--             elements = {
--               { id = "scopes", size = 0.33 },
--               { id = "breakpoints", size = 0.17 },
--               { id = "stacks", size = 0.25 },
--               { id = "watches", size = 0.25 },
--             },
--             size = 0.33,
--             position = "right",
--           },
--           {
--             elements = {
--               { id = "repl", size = 0.45 },
--               { id = "console", size = 0.55 },
--             },
--             size = 0.27,
--             position = "bottom",
--           },
--         },
--         controls = {
--           enabled = true,
--           -- Display controls in this element
--           element = "repl",
--           icons = {
--             pause = "",
--             play = "",
--             step_into = "",
--             step_over = "",
--             step_out = "",
--             step_back = "",
--             run_last = "",
--             terminate = "",
--           },
--         },
--         floating = {
--           max_height = 0.9,
--           max_width = 0.5, -- Floats will be treated as percentage of your screen.
--           border = "rounded",
--           mappings = {
--             close = { "q", "<Esc>" },
--           },
--         },
--         windows = { indent = 1 },
--         render = {
--           max_type_length = nil, -- Can be integer or nil.
--           max_value_lines = 100, -- Can be integer or nil.
--         },
--       },
--     },
--   }
-- end

-- M.setup = function()
--   local status_ok, dap = pcall(require, "dap")
--   if not status_ok then
--     return
--   end
--
--   if lvim.use_icons then
--     vim.fn.sign_define("DapBreakpoint", lvim.builtin.dap.breakpoint)
--     vim.fn.sign_define("DapBreakpointRejected", lvim.builtin.dap.breakpoint_rejected)
--     vim.fn.sign_define("DapStopped", lvim.builtin.dap.stopped)
--   end
--
--   dap.set_log_level(lvim.builtin.dap.log.level)
--
--   if lvim.builtin.dap.on_config_done then
--     lvim.builtin.dap.on_config_done(dap)
--   end
-- end
--
-- M.setup_ui = function()
--   local status_ok, dap = pcall(require, "dap")
--   if not status_ok then
--     return
--   end
--   local dapui = require "dapui"
--   dapui.setup(lvim.builtin.dap.ui.config)
--
--   if lvim.builtin.dap.ui.auto_open then
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     -- dap.listeners.before.event_terminated["dapui_config"] = function()
--     --   dapui.close()
--     -- end
--     -- dap.listeners.before.event_exited["dapui_config"] = function()
--     --   dapui.close()
--     -- end
--   end
--
--   local Log = require "lvim.core.log"
-- end

return M
