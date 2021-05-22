local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local tgb = require("widgets.tagbutton")
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local dpi = xresources.apply_dpi
local net_widgets = require("net_widgets")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local power = require("widgets.powerbutton")

mytextclock = wibox.widget.textclock("%H:%M")
net_wireless = net_widgets.wireless({interface="wlp29s0",
popup_position = "top_left"})

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
  s.top = awful.wibar({ position = "top", screen = s, height = dpi(25), bg=beautiful.bg_normal .. "80" })

  -- Add widgets to the wibox
  s.top:setup {
    layout = wibox.layout.stack,
    {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      net_wireless,
      volume_widget{
        widget_type = 'arc'
      },
    },
    nil,
    { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    power,
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
