local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

local function linesGet(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do
        lines[#lines +1] = line
    end
    return lines
end

function TenWord(file)
    local lines = linesGet(file)
    math.randomseed(os.time())

    local words = {}

    for i=0, 10,1 do
        local tmp = math.random(#lines)
        words[i] = lines[tmp]
    end
    return words
end

return TenWord

