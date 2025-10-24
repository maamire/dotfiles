--
--
--                  Volume Widget
--
--
-- =======================================================
--                      Init
-- =======================================================

    local lain = require("lain")
    local markup = lain.util.markup
    local awful = require("awful")
    local beautiful = require("beautiful")
    local widget_font = beautiful.widget_font
    local naughty = require("naughty")

-- =======================================================
--                      Config
-- =======================================================

    local volume = lain.widget.pulse({
        cmd = "pactl list sinks | sed -n -e \"/$(pactl get-default-sink)/,\\$!d\" -e 's/Name/index/p' -e '/Base Volume/d' -e 's/Volume/volume/p' -e 's/Mute/muted/p' -e 's/device\\.description/device\\.string/p' -e 's/device\\.description/device\\.string/p' | sed ':a; s/\\(device\\.string = \"[^\"]*\\) \\([^\"]*\"\\)/\\1_\\2/; ta'",
        timeout = 3600,
        settings = function()
            local vlevel = volume_now.left
            local muted = volume_now.muted == "yes"
            local icon
            local color

            -- local debug = string.format("index: %s \ndevice: %s\n muted: %s", tostring(volume_now.index), tostring(volume_now.device), tostring(volume_now.muted))
            -- naughty.notify({
            --     text = debug,
            --     timeout = 5
            -- })

            if muted then
                icon = "\u{f0581}"
                color = beautiful.red or "#e35143"
            elseif tonumber(vlevel) > 100 then
                icon = "\u{f057e}"
                color = beautiful.red or "#e35143"
            elseif tonumber(vlevel) > 70 then
                icon = "\u{f057e}"
                color = beautiful.green or "#7bb934"
            elseif tonumber(vlevel) > 30 then
                icon = "\u{f0580}"
                color = beautiful.green or "#7bb934"
            elseif tonumber(vlevel) > 0 then
                icon = "\u{f057f}"
                color = beautiful.green or "#7bb934"
            else
                icon = "\u{f075f}"
                color = beautiful.blue or "#489ccf"
            end

        widget:set_markup(markup.font(widget_font,
            markup.fg.color(color, icon) .. " " .. string.format("%4s", vlevel .. "%")))
        end,
    })

    local process_name = "AWESOMEWM_VOLUME_WIDGET_PACTL"
    awful.spawn.easy_async_with_shell(
        "pgrep -f '" .. process_name .. "' | xargs -r kill -9",
        function()
            awful.spawn.with_line_callback(
                "sh -c 'exec -a " .. process_name .. " pactl subscribe'",
                {
                    stdout = function(line)
                        if line:match("'change' on sink") or line:match("'change' on server") then
                            volume.update()
                        end
                    end
                }
            )
        end
    )

    return volume
