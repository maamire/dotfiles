--
--
--      SpaceCamp!
--
--


-- =======================================================
--                      Init
-- =======================================================

    local awful = require("awful")
    local gears = require("gears")


    local spacecamp = {}

-- =======================================================
--                      Config
-- =======================================================

    spacecamp.initialize = function()
        local bar = require("bar")

        awful.screen.connect_for_each_screen(function(s)
            for i = 1, maxtags do
                awful.tag.add(i, {
                    screen = s,
                    layout = awful.layout.layouts[1],
                    selected = i == 1
                })
            end

            bar.create(s)
        end)
    end

    return spacecamp
