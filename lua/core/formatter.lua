--- @class Formatter
--- @field precondition? fun(): boolean
--- @field format fun(args: FormatArgs)

--- @class FormatArgs
--- @field bufnr number

--- @type table<number, table<string, Formatter>>
local formatters = {}


local M = {}

--- Attatch a format to a buffer.
--- @param bufnr number
--- @param name string
--- @param formatter Formatter
function M.attach_formatter(bufnr, name, formatter)
    if not formatters[bufnr] then
        return
    end
    formatters[bufnr][name] = formatter
end

--- @param bufnr number
--- @param name string
function M.detach_formatter(bufnr, name)
    if not formatters[bufnr] then
        return
    end
    formatters[bufnr][name] = nil
end

--- Runs all attatched formatters for the given buffer.
--- @param args {
---     bufnr?: number,
--- }
function M.format(args)
    args = args or {}
    args = vim.tbl_deep_extend("keep", args, {
        bufnr = 0,
    })

    local bufnr = args.bufnr
    if bufnr == 0 then
        bufnr = vim.api.nvim_get_current_buf()
    end

    local buf_formatters = formatters[bufnr]
    if not buf_formatters then return end

    for _, formatter in pairs(buf_formatters) do
        formatter.format({ bufnr = bufnr })
    end
end

function M.attached_formatters()
    return formatters
end

-------------------------------------------------------------

vim.api.nvim_create_autocmd("BufAdd", {
    callback = function(args)
        if not formatters[args.buf] then
            formatters[args.buf] = {}
        end
    end
})

vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
        formatters[args.buf] = nil
    end
})

vim.api.nvim_create_autocmd("BufWrite", {
    callback = function(args)
        if vim.g.format_on_save then
            M.format({ bufnr = args.buf })
        end
    end
})

return M
