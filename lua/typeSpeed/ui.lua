local popup = require('popup')

local M = {}

TypeSpeedId = nil
TypeSpeedBufh = nil

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

local function wordDisplay()
    if TypeSpeedId ~= nil and vim.api.nvim_win_is_valid(TypeSpeedId) then
        vim.api.nvim_win_close(TypeSpeedId, true)
        TypeSpeedId = nil
        TypeSpeedBufh = nil
    end
    local winInfo = create_window()
    local content = {}

    TypeSpeedId = winInfo.win_id
    TypeSpeedBufh = winInfo.bufnr

    content[0] = "test"
    content[1] = "test2"
    vim.api.nvim_buf_set_name(TypeSpeedBufh, "Typeing Speed")
    vim.api.nvim_buf_set_lines(TypeSpeedBufh, 0, #content, false, content)
    vim.api.nvim_buf_set_option(TypeSpeedBufh, "filetype", "typeSpeed")
    vim.api.nvim_buf_set_option(TypeSpeedBufh, "buftype", "acwrite")
    vim.api.nvim_buf_set_option(TypeSpeedBufh, "bufhidden", "delete")
    vim.cmd(string.format("autocmd BufModifiedSet <buffer=%s> set nomodified", TypeSpeedBufh))

end
return wordDisplay
