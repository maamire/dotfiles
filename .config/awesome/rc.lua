--
--      rc.lua
--
    local lgi = require("lgi")
    local Gio = lgi.Gio
    local GioUnix = lgi.GioUnix

    if not Gio.UnixInputStream and GioUnix then
    Gio.UnixInputStream = GioUnix.InputStream
    Gio.UnixOutputStream = GioUnix.OutputStream
    end

    pcall(require, "luarocks.loader")

    local gears = require("gears")
    local awful = require("awful")

    require("awful.hotkeys_popup.keys")

-- =======================================================
--                      Config
-- =======================================================

    local themes = {
        "spacecamp"
    }
    local theme = themes[1]

    modkey = "Mod4"
    terminal = "alacritty"
    browser = "firefox"
    editor = os.getenv("EDITOR") or "vim"
    editor_cmd = terminal .. " -e " .. editor
    maxtags = 6

-- =======================================================
-- Init
-- =======================================================

-- Notifications
    require("notifications")

-- Layouts
    awful.layout.layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.fair,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
    }

-- Theme
    local beautiful = require("beautiful")
    beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/" .. theme .. "-theme.lua")
    local selected_theme = require(theme)
    selected_theme.initialize()
-- Keys
    local keys = require("keys")
    root.keys(keys.globalkeys)
    root.buttons(keys.desktopbuttons)
-- Rules
    local create_rules = require("rules").create
    awful.rules.rules = create_rules(keys.clientkeys, keys.clientbuttons)
-- Signals
    require("signals")
-- =======================================================
--                      Autostart Apps
-- =======================================================

    awful.spawn.with_shell("~/.config/Scripts/autostart.sh")

-- ========================================================
--                      Garbage Collection
-- ========================================================

    collectgarbage("setpause", 110)
    collectgarbage("setstepmul", 1000)
