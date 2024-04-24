local DISABLE = -1
local SERVER_OPTS = {
    pylsp = {
        single_file_support = true,
        settings = {
            -- no diagnostics for not following flake8
            pylsp = { plugins = { pycodestyle = { enabled = false } } },
        },
    },
    gopls = {
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                -- templateExtensions = { ".templ" },
                staticcheck = true,
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    templ = {
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
        root_dir = nil,
        settings = {},
        __onload = function(opts)
            opts.root_dir = require("lspconfig").util.root_pattern("go.mod", ".git")
            require("lspconfig.configs").templ = {
                default_config = opts,
            }
            return opts
        end,
    },
    disable = {
        templ = true,
        rust_analyzer = true, -- only disabled for mason-lspconfig automagic setup (using rust-tools instead)
        pyright = true,
        clangd = true,
    },
}

-- lsp, mason?, lints, daps, oh my!
return {
    { "nvim-lua/lsp-status.nvim", dependencies = { "neovim/nvim-lspconfig" } },
    -- { "glepnir/lspsaga.nvim" },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        -- enabled = false,
        config = function()
            -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })

            -- mason must be loaded so sources installed with it can be found
            require("mason")
            local nvim_lsp = require("lspconfig")
            local lsp_configs = require("lspconfig.configs")
            local format = require("neb.config.plugins.lsp.format")

            -- initialize lsp_status
            local lsp_status = require("lsp-status")
            lsp_status.register_progress()
            lsp_status.config({
                -- diagnostics = false,
                current_function = false,
                status_symbol = "lsp:",
            })

            local wk = require("which-key")

            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Mappings.

                local opts = { noremap = true, silent = false, buffer = bufnr }

                wk.register({
                    name = "LSP",
                    g = {
                        name = "GOTO",
                        D = {vim.lsp.buf.declaration, "Declaration"},
                        d = {vim.lsp.buf.definition, "Definition"},
                        i = {vim.lsp.buf.implementation, "Implementation"},
                    },
                    ["<leader>"] = {
                        w = {
                            name = "Workspace",
                            a = {vim.lsp.buf.add_workspace_folder, "Add Folder"},
                            r = {vim.lsp.buf.remove_workspace_folder, "Remove Folder"},
                            l = {function() print(vim.inspect(vim.lsp.buf.list_workspace_folders)) end, "List Folders"}
                        },
                        ['='] = { function() format.format() end, "Format"},
                        i = {vim.lsp.buf.hover, "Hover", mode = {"n", "v"}},
                        D = {vim.lsp.buf.type_definition, "Type Definition"},
                        rn = {name="rename", vim.lsp.buf.rename, "Rename"},
                        ["<leader>r"] = { "<cmd>LspRestart<cr>", "Restart LSP" },
                    },
                    ["<C-h>"] = {vim.lsp.buf.signature_help, "Signature Help", mode={"i", "n"}},
                    ["<C-g>"] = {vim.lsp.buf.code_action, "Code Action", mode = {"n", "v", "i"}},
                    ["<C-b>"] = {vim.lsp.buf.references, "References"},
                }, opts)
                -- TODO: use client info for smarter mappings

                -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                -- vim.keymap.set({ "v", "n" }, "<space>i", vim.lsp.buf.hover, opts)
                -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                -- vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
                -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wl", function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders))
                -- end, opts)
                -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                -- vim.keymap.set({ "n", "v", "i" }, "<C-g>", vim.lsp.buf.code_action, opts)
                -- vim.keymap.set("n", "<C-b>", vim.lsp.buf.references, opts)
                -- vim.keymap.set("n", "<space>=", function()
                --     -- vim.lsp.buf.format {async = true}
                --     format.format()
                --     end, { noremap = true, buffer = bufnr })

                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_bs)
                    vim.lsp.buf.format({ async = true })
                end, {})

                lsp_status.on_attach(client)
                -- vim.keymap.set("n", "<leader><leader>r", "<cmd>LspRestart<cr>", opts)
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
            local flags = { debounce_text_changes = 50 }

            local options = { on_attach = on_attach, capabilities = capabilities, flags = flags }
            local setup = function(server)
                if SERVER_OPTS.disable[server] then
                    return
                end

                local opts = SERVER_OPTS[server]
                opts = opts or {}
                if type(opts.__onload) == "function" then
                    opts = opts.__onload(opts)
                end
                opts = vim.tbl_extend("keep", opts, options)

                if nvim_lsp[server] == nil or nvim_lsp[server].setup == nil then
                    print("no lspconfig for " .. server)
                    return
                end
                nvim_lsp[server].setup(opts)
            end

            -- TODO: make another function that sets
            -- up this table for me given server names and
            -- opts then passes it to mason-lspconfig
            require("mason-lspconfig").setup_handlers({
                setup,
            })
            setup("ccls")
            setup("templ")
            -- null-ls will handle whether it should attach based on it's registered sources.. right?
            -- this should (most importantly) set `on_attach` for null-ls sources
            require("neb.config.plugins.null_ls").setup(options)

            require("neb.config.plugins.rust-tools").setup(options)

            -- nvim_lsp.racket_langserver.setup(options)

            vim.diagnostic.config({
                virtual_text = true,
                underline = false,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
            })

            wk.register({
                ["<leader>"] = {
                        name = "Diagnostics",
                        e = {vim.diagnostic.open_float, "Show Diagnostics"},
                        q = {vim.diagnostic.setloclist, "Quickfix"},
                },
                ["[d"] = {vim.diagnostic.goto_prev, "Previous Diagnostic"},
                ["]d"] = {vim.diagnostic.goto_next, "Next Diagnostic"},
            })
        end,
    },
}
