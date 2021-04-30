local popup = require('popup')

local M{}

local function create_window()
    local width = 60
    local height = 10
    local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
    local bufnr = vim.api.nvim_create_buf(false, false)

    local typeSpeedId, win = popup.create(bufnr, {
        title = 'Harpoon',
        highlight = 'HarpoonWindow',
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    vim.api.nvim_win_set_option(win.border.win_id, 'winhl', 'Normal:TypeSpeedBorder')
    return {
        bufnr = bufnr,
        win_id = typeSpeedId
    }

end
