local awful = require("awful")

awful.spawn.with_shell("picom")
awful.spawn.with_shell("xrdb -merge /home/devinr/.Xresources")
awful.spawn.with_shell("set -x GDK_SCALE 2")
awful.spawn.with_shell("set -x GDK_DPI_SCALE 1")
awful.spawn.with_shell("feh --bg-fill /home/devinr/.config/awesome/themes/default/wallpaper.jpg")
