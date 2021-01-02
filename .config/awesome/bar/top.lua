local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local tgb = require("widgets.tagbutton")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

mytextclock = wibox.widget.textclock("%H:%M")

-- Create a wibox for each screen and add it



awful.screen.connect_for_each_screen(function(s)
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    

    -- Create the wibox
    s.top = awful.wibar({ position = "top", screen = s, height = dpi(25) })

    -- Add widgets to the wibox
    s.top:setup {
        layout = wibox.layout.stack,
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
                wibox.widget.systray(),
            },
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                s.mylayoutbox,
            },
        },
        {
            mytextclock,
            valign = "center",
            halign = "center",
            layout = wibox.container.place
        }
    }
end)