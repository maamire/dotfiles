--
--
--      Battery Widget
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


    local cpu = lain.widget.cpu({
            timeout = 10,
            settings = function()
                local perc = cpu_now.usage
                local icon = "\u{f2db}"
                if tonumber(perc) >= 90 then
                    color = beautiful.red or "#e35143"
                elseif tonumber(perc) >= 75 then
                    color = beautiful.orange or "#ffa500"
                elseif tonumber(perc) >=50 then
                    color = beautiful.yellow or "#f2b63c"
                elseif tonumber(perc) >=25 then
                    color = beautiful.green or "#7bb934"
                else
                    color = beautiful.blue or "#489ccf"
                end

                widget:set_markup(markup.font(widget_font,
                    markup.fg.color(color, icon) .. " " .. string.format("%4s", perc .. "%")))
            end,
        })

    return cpu
