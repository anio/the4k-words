
local awful = require("awful")

local function start()

    local HOME = os.getenv("HOME")
    local widget_path = HOME .. "/.config/awesome/the4k-words"

    local command = "shuf -n1 " .. widget_path .. "/4k_essential_words.txt"

    local word_t = awful.tooltip {
        text = ''
    }

    return awful.widget.watch(command, 60, function(widget, stdout)

        stdout = string.gsub(stdout, '%c', '')
        local word = string.gsub(stdout, ' %-.*', '')
        local title = string.gsub(stdout, '.* %- ', '')

        word_t:add_to_object(widget)
        word_t:set_text(title)
        widget:set_markup(' | <b>' .. word .. '</b> | ')
        widget:set_forced_width(120)
        widget:set_align('center')
    end)
end

return {
    start = start
}
