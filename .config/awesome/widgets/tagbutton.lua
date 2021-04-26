local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local tgb = function(widget, bg, bc, t, s, fc)
    local tgb = wibox.container.background()
    tgb.widget = widget
    tgb.bg = bg
    tgb.shape = gears.shape.rounded_rect
    tgb.forced_height = 30
    tgb.forced_width = 30
    tgb.shape_border_width = 2
    tgb.shape_border_color = bc
    tgb:connect_signal("button::press", function() s.tags[t]:view_only() tgb.bg = fc end)
    return tgb
end


return tgb
