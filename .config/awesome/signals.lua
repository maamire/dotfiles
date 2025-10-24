--
--
--      Signals
--
--


-- =======================================================
--                      Init
-- =======================================================

    local awful = require("awful")
    local beautiful = require("beautiful")
    local gears = require("gears")

-- =======================================================
-- Autofocus
-- =======================================================

    require("awful.autofocus")

-- =======================================================
-- Layout Gap
-- =======================================================

    tag.connect_signal("property::layout", function(t)
       local current_layout = awful.tag.getproperty(t, 'layout')
           if (current_layout == awful.layout.suit.max) then
              t.gap = 0
           else
              t.gap = beautiful.useless_gap
           end
    end)


-- =======================================================
-- Client Manage
-- =======================================================

    client.connect_signal("manage", function(c)

        if not awesome.startup then
            awful.client.setslave(c)
        end

        -- If screen count changes reposition clients
        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end
    end)

-- =======================================================
-- Client Focusing
-- =======================================================

    client.connect_signal("mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", { raise = true })
    end)

    client.connect_signal("focus",
    function(c)
        c.border_color = beautiful.border_focus
    end)

    client.connect_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
    end)

-- =======================================================
-- Size Hints
-- =======================================================

    local misbehaving_apps = {
        "Discord",
        "discord",
        "vesktop",
        "Spotify",
        "spotify",
        "steam",
        "steamwebhelper"
    }
    client.connect_signal("property::floating", function(c)
        for _, class in ipairs(misbehaving_apps) do
            if c.class == class then
                c.size_hints_honor = false
                break
            end
        end
    end)
-- ===================================================================
-- Screen changes
-- ===================================================================
    screen.connect_signal("property::geometry", awesome.restart)
