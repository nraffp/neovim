local override_dir = vim.fn.stdpath("config") .. "/lua/override"
for _, file in ipairs(vim.fn.glob(override_dir .. "/*.lua", true, true)) do
    local module_name = file:match(".*/lua/(.-)%.lua$"):gsub("/", ".")
    if module_name ~= "override.init" then
        require(module_name)
    end
end
