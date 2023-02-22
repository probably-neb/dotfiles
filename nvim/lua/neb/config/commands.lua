-- function to print vim.inspect info quickly
function P(...)
    print(vim.inspect(...))
end
function Reload(plugin)
    require('plenary.reload').reload_module(plugin)
end
