--
--
--      Top Bar
--
--


-- =======================================================
--                      Init
-- =======================================================

    local awful = require("awful")
    local beautiful = require("beautiful")
    local wibox = require("wibox")
    local gears = require("gears")
    local dpi = beautiful.xresources.apply_dpi

    local topbar = {}


-- =======================================================
--                      Config
-- =======================================================

    topbar.create = function(s)
        local bar = awful.wibar({
            screen = s,
            position = "top",
            ontop = false,
            height = beautiful.top_panel_height,
            width = s.geometry.width,
        })

        local function fixed_width_widget(w, width)
            return {
                {
                    w,
                    widget = wibox.container.place,
                    halign = "center",
                    valign = "center",

                },
                forced_width = width or dpi(60),
                widget = wibox.container.background,
            }
        end

        bar:setup {
            expand = "none",
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                require("widgets.tag_list_widget").create(s),
                wibox.container.margin(require("widgets.layout_box_widget").create(s), dpi(2), dpi(2), dpi(2), dpi(1)),
            },
                require("widgets.calendar_widget").create(s),
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(5),
                fixed_width_widget(require("widgets.cpu_temperature_widget").widget),
                fixed_width_widget(require("widgets.cpu_widget").widget),
                fixed_width_widget(require("widgets.memory_widget").widget),
                fixed_width_widget(require("widgets.battery_widget").widget),
                fixed_width_widget(require("widgets.volume_widget").widget, dpi(70)),
                wibox.container.margin(wibox.widget.systray(), dpi(1), dpi(3), dpi(3), dpi(3))
            }
        }

        bar:connect_signal("mouse::enter", function()
            bar.ontop = true
        end)

        bar:connect_signal("mouse::leave", function()
            bar.ontop = false
        end)

    end
    return topbar
