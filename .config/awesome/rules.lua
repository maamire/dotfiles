-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local beautiful = require("beautiful")

-- define screen height and width
local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- module table
local rules = {}

-- ===================================================================
-- Rules
-- ===================================================================

-- Rules to apply to new clients (through the "manage" signal).
function rules.create(clientkeys, clientbuttons)
    return  {
        -- All clients will match this rule.
        {
            rule = {},
            properties = {
                titlebars_enabled = beautiful.titlebars_enabled,
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,

                -- force disable maximised
                maximized_vertical = false,
                maximized_horizontal = false,

                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            },
        },

        -- Floating clients.
        {
            rule_any = {
                instance = {
                    "DTA", -- Firefox addon DownThemAll.
                    "copyq", -- Includes session name in class.
                    "pinentry",
                },
                class = {
                    "Arandr",
                    "Blueman-manager",
                    "Gpick",
                    "Kruler",
                    "MessageWin", -- kalarm.
                    "Nm-connection-editor",
                    "Sxiv",
                    "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                    "Wpa_gui",
                    "veromix",
                    "xtightvncviewer",
                    "floating-term",
                },

                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester", -- xev.
                    "Steam Guard - Computer Authorization Required",
                },
                role = {
                    "AlarmWindow", -- Thunderbird's calendar.
                    "ConfigManager", -- Thunderbird's about:config.
                    "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
                    "GtkFileChooserDialog",
                },
                type = {
                    "dialog",
                },
            },
            properties = { floating = true },
        },

        -- Floating terminal
        {
            rule_any = {
                class = {
                    "floating-term",
                    "volume-term"
                },
            },
            properties = {
                focus = awful.client.focus.filter,
                screen = mouse.screen.preferred,
                placement = function(c)
                    -- Place under the mouse first
                    awful.placement.under_mouse(c)
                    -- Then adjust to ensure it's not offscreen
                    awful.placement.no_offscreen(c)
                end,
                floating = true,
                width = 1200,
                height = 600,
            },
        },

        -- Fullscreen Clients
        {
            rule_any = {
                class = {
                    "steam_app_.*"
                },
                instance = {
                    "steam_app_.*"
                }
            },
            properties = {
                minimized = false,
                fullscreen = true,
            },
            callback = function(c)
                c:connect_signal("property::minimized", function()
                    if c.minimized then
                        c.minimized = false
                    end
                end)
            end
        },

        -- Disable size hints for misbehaving apps
        {
            rule_any = {
                class = {"Discord", "vesktop", "Spotify", "steam", "steamwebhelper"}
            },
            properties = {
                size_hints_honor = false
            }
        },

        -- Add titlebars to normal clients and dialogs
        { rule = { class = "firefox" }, properties = { opacity = 1, maximized = false, floating = false } },

        -- File chooser dialog
        {
            rule_any = {role = {"GtkFileChooserDialog"}},
            properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.65}
        },

    -- Pavucontrol & Bluetooth Devices
        {
            rule_any = {class = {"Pavucontrol"}, name = {"Bluetooth Devices"}},
            properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.45}
        },
    }
end

-- return module table
return rules
