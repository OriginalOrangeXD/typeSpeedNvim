local display = require('typeSpeed.ui')
local words = require('typeSpeed.getWord')
local word = words('test')

return
{
    display = display(word)
}
