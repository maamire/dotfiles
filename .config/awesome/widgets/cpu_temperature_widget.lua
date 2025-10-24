--
--
--                  CPU Temperature Widget
--
--


-- =======================================================
--                      Init
-- =======================================================

    local lain = require("lain")
    local markup = lain.util.markup
    local beautiful = require("beautiful")
    local widget_font = beautiful.widget_font


-- =======================================================
--                      Config
-- =======================================================


    function getcputempfile()
        file = io.popen("bash -c 'echo  /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp1_input'")
        stdout = file:read("*l")
        file:close()
        return stdout
    end

    local temp = lain.widget.temp({

            timeout = 10,
            tempfile = getcputempfile(),
            settings = function()
                local temp = coretemp_now:match("^(%d+)")
                local icon
                local color

                if tonumber(temp) >= 80 then
                    icon = "\u{f2c7}"
                    color = beautiful.red or "#e35143"
                elseif tonumber(temp) >= 60 then
                    icon = "\u{f2c9}"
                    color = beautiful.yellow or "#f2b63c"
                else
                    icon = "\u{f2cb}"
                    color = beautiful.green or "#7bb934"
                end

                widget:set_markup(markup.font(widget_font,
                    markup.fg.color(color, icon) .. " " .. string.format("%4s", temp .. "°")))
            end,
        })

    return temp
