local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local tgb = require("widgets.tagbutton")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local taglist = require("widgets.taglist")
--local layout = require("layouts.center").horizontal()

awful.screen.connect_for_each_screen(function(s)

  local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
  )

  s.mytaglist = taglist(s)

  s.mywibox = awful.wibar({ position = "bottom", screen = s, height = dpi(45)
  , bg="#0000000" })

  -- Add widgets to the wibox
  s.mywibox:setup{
    layout = wibox.layout.align.horizontal,
    expand = "outside",
    nil,
    s.mytaglist,
    nil,


}
end)
