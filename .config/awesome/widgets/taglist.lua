local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local tgb = function(widget, bg, bc)
    local tgb = wibox.container.background()
    tgb.widget = widget
    tgb.bg = bg
    tgb.shape = gears.shape.rounded_rect
    tgb.shape_border_width = 2
    tgb.shape_border_color = bc
    return tgb
end

local TagList = function(s)
end

return TagList