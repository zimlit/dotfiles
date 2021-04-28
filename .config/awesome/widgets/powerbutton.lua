local wibox = require("wibox")
local awful = require("awful")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local sleep_text = wibox.widget{
  text = "sleep",
  widget = wibox.widget.textbox
}
local sleep = wibox.container.background(sleep_text, '#00000000', gears.shape.rounded_rect)

sleep:connect_signal("button::press", function()
  awful.spawn("loginctl suspend")
end)
sleep:connect_signal("mouse::enter", function()
  sleep.bg = '#555555'
end)
sleep:connect_signal("mouse::leave", function()
  sleep.bg = '#00000000'
end)
local shutdown_text = wibox.widget{
  text = "shutdown",
  widget = wibox.widget.textbox
}

local shutdown = wibox.container.background(shutdown_text, '#00000000', gears.shape.rounded_rect)

shutdown:connect_signal("button::press", function()
  awful.spawn("sudo shutdown -h now")
end)
shutdown:connect_signal("mouse::enter", function()
  shutdown.bg = '#555555'
end)
shutdown:connect_signal("mouse::leave", function()
  shutdown.bg = '#00000000'
end)
local logout_text = wibox.widget{
  text = "logout",
  widget = wibox.widget.textbox
}
local logout = wibox.container.background(logout_text, '#00000000', gears.shape.rounded_rect)
logout:connect_signal("button::press", function()
  awesome.quit()
end)
logout:connect_signal("mouse::enter", function()
  logout.bg = '#555555'
end)
logout:connect_signal("mouse::leave", function()
  logout.bg = '#00000000'
end)

local popup = awful.popup{
  bg = beautiful.bg_normal,
  ontop = true,
  visible = false,
  shape = gears.shape.rounded_rect,
  border_width = 1,
  border_color = beautiful.bg_focus,

  maximum_width = 400,
  widget = {
    {
      sleep,
      shutdown,
      logout,
      layout = wibox.layout.fixed.vertical,
    },
    margins = 10,
    placement = awful.placement.top_right,
    bg = beautiful.bg_normal,
    widget  = wibox.container.margin
  },


}
local button = wibox.widget{
  text=" ",
  widget = wibox.widget.textbox,
  font = "courier prime 13"
}
button:connect_signal("button::press", function()
  if  not popup.visible then
    popup.visible = true
    popup.y = 50
    popup.x = 3670
  else
    popup.visible = false
  end
end)
return button
