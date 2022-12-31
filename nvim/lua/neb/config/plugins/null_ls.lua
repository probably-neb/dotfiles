local M = { "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "jayp0521/mason-null-ls.nvim" },
    lazy = true,
}

function M.setup(opts)
 local null_ls = require("null-ls")

        null_ls.setup({
            debounce = 150,
            save_after_format = false,
            sources = {
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.fish_indent,
                -- null_ls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
                -- null_ls.builtins.formatting.eslint_d,
                -- null_ls.builtins.diagnostics.shellcheck,
                -- null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.markdownlint,
                -- null_ls.builtins.diagnostics.luacheck,
                -- null_ls.builtins.diagnostics.selene.with({
                --   condition = function(utils)
                --     return utils.root_has_file({ "selene.toml" })
                --   end,
                -- }),
                -- null_ls.builtins.code_actions.gitsigns,
                -- null_ls.builtins.formatting.isort,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.flake8,
            },
            on_attach = opts.on_attach
        })
        -- mason-null-ls adds the NullLsInstall & NullLsRemove commands
        require("mason-null-ls").setup({
            ensure_installed = { "jq" },
            automatic_setup = true,
        })
        ---@diagnostic disable-next-line: missing-parameter
        require("mason-null-ls").setup_handlers()   
end

-- credit @folke
function M.has_formatter(ft)
    local sources = require('null-ls.sources')
    local available = sources.get_available(ft, "NULL_LS_FORMATTING")
    return #available > 0
end

return M
