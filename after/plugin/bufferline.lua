require "bufferline".setup {
    options = {
        numbers = function(opts)
            return string.format("%s", opts.raise(opts.ordinal))
        end,
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left"
            }
        },
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.diagnostic.get(0, [[Error]])
                local warning = vim.diagnostic.get(0, [[Warning]])
                local info = vim.diagnostic.get(0, [[Information]])
                local hint = vim.diagnostic.get(0, [[Hint]])

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A9BA1E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#2EA9A7"})
                end
                return result
            end
        }
    }
}
