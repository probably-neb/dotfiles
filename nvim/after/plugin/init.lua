-- source all plugin configuration files
-- creidt: https://github.com/rayfaddis/dotfiles/blob/main/config/nvim/init.lua
local plugin_dir = vim.fn.stdpath('config') .. '/lua/neb/plugins'
for _, file in ipairs(vim.fn.readdir(plugin_dir, [[ v:val =~ '\.lua$' ]])) do
    local file = plugin_dir .. '/' .. file
    if vim.fn.filereadable(file) then
        local ok, err_msg = pcall(vim.fn.execute, 'source ' .. file)
        if not ok then
            error("\nfailed to load plugin configuration: " .. file .. "\nerror: \n" .. err_msg)
        end
    end
end
