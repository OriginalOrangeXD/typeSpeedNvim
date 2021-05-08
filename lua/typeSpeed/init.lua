local display = require('typeSpeed.ui')
local words = require('typeSpeed.getWord')

function Setup(file)
    local word = words(file)
    display(word)
    local tmp
    for i=0,10,1 do
        -- something to read input
        -- while not correct keep getting input
        -- when all words are correct grab 10 new words
        print(tmp)
    end
end


return {
    setup = Setup('test')
}
