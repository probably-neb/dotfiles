local function set_colorscheme(name, theme_name)
	vim.fn.writefile({name}, theme_name)
	--vim.cmd(string.format('source ./.%s', name))
	c = require('capitalize')
	vim.api.nvim_command(c.capitalize(name))
	-- vim.loop.spawn('kitty', {
	-- 	args = {
	-- 		'@',
	-- 		'set-colors',
	-- 		'-c',
	-- 		string.format('/home/neb/dotfiles/kitty/themes/%s.conf',name)
	-- 		}
	-- 	}, nil)
end
