--
--
--                  Layout Box
--
--


-- =======================================================
--                      Init
-- =======================================================


    local gears = require('gears')
    local awful = require('awful')

    local layout_box = {}
-- =======================================================
--                      Config
-- =======================================================



    layout_box.create = function(s)
    local widget = awful.widget.layoutbox(s)
        widget:buttons(gears.table.join(
            awful.button({}, 1, function()
                awful.layout.inc(1, s)
            end),
            awful.button({}, 2, function()
                awful.layout.inc(1, s)
            end),
            awful.button({}, 3, function()
                awful.layout.inc(-1, s)
            end),
            awful.button({}, 4, function()
                awful.layout.inc(1, s)
            end),
            awful.button({}, 5, function()
                awful.layout.inc(-1, s)
            end)
        )
    )

    return widget
end

return layout_box
