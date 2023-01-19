
local buf_path = vim.fn.expand("%:p")
local in_ansible_dir = string.find(buf_path, "ansible/")

if in_ansible_dir then
    vim.bo.filetype = "yaml.ansible"
end
