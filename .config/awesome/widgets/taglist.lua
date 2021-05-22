local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local tags = {"", "", "", "", ""}

local taglist = function(s)
  local tg = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    style = {
      shape = gears.shape.circle
    },
    layout = {
      spacing = 15,
      layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        {
          {
            {
              {
                id     = 'index_role',
                widget = wibox.widget.textbox,
              },
              margins = 2,
              widget  = wibox.container.margin,
            },
            bg     = beautiful.bg_normal,
            shape  = gears.shape.circle,
            widget = wibox.container.background,
          },
          {
            {
              id     = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            margins = 1,
            widget  = wibox.container.margin,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left  = 10,
        right = 10,
        widget = wibox.container.margin
      },
      id     = 'background_role',
      widget = wibox.container.background,
      -- Add support for hover colors and an index label
      create_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:get_children_by_id('index_role')[1].markup = '<b> '..tags[index]..' </b>'
      end,
      update_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:get_children_by_id('index_role')[1].markup = '<b> '..tags[index]..' </b>'
      end,
    },
    buttons = taglist_buttons
  }
  return tg
end

return taglist
