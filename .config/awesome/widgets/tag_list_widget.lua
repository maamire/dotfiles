--
--
--                  Tag List
--
--

-- =======================================================
--                      Init
-- =======================================================
    local awful = require("awful")
    local wibox = require("wibox")
    local gears = require("gears")
    local beautiful = require("beautiful")
    local dpi = beautiful.xresources.apply_dpi
    local modkey  = require('keys').modkey

    local tag_list = {}


-- =======================================================
--                      Config
-- =======================================================

    tag_list.create = function(s)
        return awful.widget.taglist({
            screen = s,
            filter = awful.widget.taglist.filter.all,
            style = { gears.shape.rectangle,
            },
            layout = {
                spacing = beautiful.taglist_spacing,
                layout = wibox.layout.fixed.horizontal,
            },

            buttons = gears.table.join(
                awful.button({}, 1, function(t)
                        t:view_only()
                    end),

                awful.button({ modkey }, 1, function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end),

                awful.button({}, 3,
                    awful.tag.viewtoggle),

                awful.button({ modkey }, 3, function(t)
                    if client.focus then
                        client.focus:toggle_tag(t)
                    end
                end),

                awful.button({}, 4, function(t)
                    awful.tag.viewnext(t.screen)
                end),

                awful.button({}, 5, function(t)
                    awful.tag.viewprev(t.screen)
                end)
            ),
        })
    end

return tag_list
