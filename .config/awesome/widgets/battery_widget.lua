--
--
--                  Battery Widget
--
--


-- =======================================================
--                      Init
-- =======================================================

    local awful = require("awful")
    local lain = require("lain")
    local markup = lain.util.markup
    local beautiful = require("beautiful")
    local widget_font = beautiful.widget_font

-- =======================================================
--                      Config
-- =======================================================
    local function get_battery_icon(ac ,status, perc)
        if status == "Charging" or ac == 1 then return "\u{f0084}"end
        if status == "Full" then return "\u{f0079}" end
        if perc >= 90 then return "\u{f0082}" end
        if perc >= 80 then return "\u{f0081}" end
        if perc >= 70 then return "\u{f0080}" end
        if perc >= 60 then return "\u{f007f}" end
        if perc >= 50 then return "\u{f007e}" end
        if perc >= 40 then return "\u{f007d}" end
        if perc >= 30 then return "\u{f007c}" end
        if perc >= 20 then return "\u{f007b}" end
        if perc >= 10 then return "\u{f007a}" end
        return "\u{f0083}"
    end

    local bat = lain.widget.bat({
        timeout = 10,
        battery = "BAT1",
        ac = "ACAD",
        settings = function()
        --local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
        local perc = bat_now.perc
        local debug_text = "bat_now field:\n"
        for k, v in pairs(bat_now) do
            debug_text = debug_text .. k .. " = " .. tostring(v) .. "\n"
        end

        local color
        local icon = get_battery_icon(bat_now.ac_status, bat_now.status, tonumber(perc))
        if bat_now.ac_status == 1 or bat_now.status == "Charging" or bat_now.status == "Full" then
            color = beautiful.blue or "#489ccf"
        elseif tonumber(perc) <=10 then
            color = beautiful.red or "#e35143"
        elseif tonumber(perc) <= 25 then
            color = beautiful.orange or "#ffa500"
        elseif tonumber(perc) <= 50 then
            color = beautiful.yellow or "#f2b63c"
        else
            color = beautiful.green or "#7bb934"
        end
            widget:set_markup(markup.font(widget_font,
                markup.fg.color(color, icon) .. " " .. string.format("%4s", perc .. "%")))
        end,
        })

    local process_name = "AWESOMEWM_BATTERY_UPOWER_MONITOR"
    awful.spawn.easy_async_with_shell(
        "pgrep -f '" .. process_name .. "' | xargs -r kill -9",
        function()
            awful.spawn.with_line_callback(
                "sh -c 'exec -a " .. process_name .. " upower --monitor'",
                {
                    stdout = function(line)
                        if line:match("device changed") or line:match("state") then
                            bat.update()
                        end
                    end
                }
            )
        end
    )

    return bat
