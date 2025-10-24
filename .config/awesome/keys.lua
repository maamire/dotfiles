-- ===================================================================
-- Initialization
-- ===================================================================
    local awful = require("awful")
    local gears = require("gears")
    local naughty = require("naughty")
    local beautiful = require("beautiful")
    local hotkeys_popup = require("awful.hotkeys_popup")
    local dpi = beautiful.xresources.apply_dpi

    -- ModKeys
    local modkey = "Mod4"
    local altkey = "Mod1"

    -- Module table
    local keys = {}


    -- Fixed Move by direction for multiple screens
    local function focus_with_bugfix(direction)
        return function()
            awful.client.focus.global_bydirection(direction)
            if client.focus then
                client.focus:raise()
            end
            local is_empty_destination = #awful.screen.focused().clients < 1
            if is_empty_destination then
                client.focus = nil
            end
        end
    end

    -- ================================
    -- Mouse Keys
    -- ================================
    keys.clientbuttons = gears.table.join(
        awful.button({}, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),


        awful.button({ modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),


        awful.button({ modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    -- ================================
    -- Desktop Keybinds
    -- ================================

    keys.globalkeys = gears.table.join(

        awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

        -- ================================
        -- Client Focus
        -- ================================

        awful.key({ modkey }, "j",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.focus.byidx(-1)
            else
                focus_with_bugfix("down")()
            end
        end,
        { description = "focus down", group = "client" }),


        awful.key({ modkey }, "k",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.focus.byidx(1)
            else
                focus_with_bugfix("up")()
            end
        end,
        { description = "focus up", group = "client" }),


        awful.key({ modkey }, "h",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.focus.byidx(-1)
            else
                focus_with_bugfix("left")()
            end
        end,
        { description = "focus left", group = "client" }),


        awful.key({ modkey }, "l",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.focus.byidx(1)
            else
                focus_with_bugfix("right")()
            end
        end,
        { description = "focus right", group = "client" }),


        awful.key({ modkey }, "u",
        function()
            awful.client.urgent.jumpto()
        end,
        { description = "jump to urgent client", group = "client" }),


        awful.key({ modkey }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),


        -- ================================
        -- Client Swap
        -- ================================

        awful.key({ modkey, "Mod1" }, "j",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.swap.byidx(-1)
            else
                awful.client.swap.global_bydirection("down")
            end
        end,
        { description = "swap down", group = "client" }),


        awful.key({ modkey, "Mod1" }, "k",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.swap.byidx(1)
            else
                awful.client.swap.global_bydirection("up")
            end
        end,
        { description = "swap up", group = "client" }),


        awful.key({ modkey, "Mod1" }, "h",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.swap.byidx(-1)
            else
                awful.client.swap.global_bydirection("left")
            end
        end,
        { description = "swap left", group = "client" }),


        awful.key({ modkey, "Mod1" }, "l",
        function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            if tag.layout == awful.layout.suit.max or tag.layout == awful.layout.suit.max.fullscreen then
                awful.client.swap.byidx(1)
            else
                awful.client.swap.global_bydirection("right")
            end
        end,
        { description = "swap right", group = "client" }),



        -- ================================
        -- Client Resize
        -- ================================

        awful.key({ modkey, "Shift" }, "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        { description = "increase master width factor", group = "layout" }),


        awful.key({ modkey, "Shift" }, "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        { description = "decrease master width factor", group = "layout" }),


        -- ================================
        -- Screen Focus
        -- ================================

        awful.key({ modkey, "Control" }, ".",
        function()
            awful.screen.focus_relative(1)
        end,
        { description = "focus the next screen", group = "screen" }),


        awful.key({ modkey, "Control" }, ",",
        function()
            awful.screen.focus_relative(-1)
        end,
        { description = "focus the previous screen", group = "screen" }),


        -- ================================
        -- Launching Applications
        -- ================================

        awful.key({ modkey }, "Return",
        function()
            awful.spawn(terminal)
        end,
        { description = "open a terminal", group = "launcher" }),


        awful.key({ modkey, "Control" }, "Return",
        function()
            awful.spawn("alacritty --class floating-term")
        end,
        { description = "open a floating terminal", group = "launcher" }),

        awful.key({ modkey }, "r",
        function()
            awful.spawn("rofi -show drun")
        end, { description = "run prompt", group = "launcher" }),

        awful.key({ modkey, "Shift" }, "s", function()
            awful.spawn("flameshot gui")
        end),


        -- ================================
        -- Layout Columns
        -- ================================

        awful.key({ modkey, "Control" }, "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        { description = "increase the number of master clients", group = "layout" }),


        awful.key({ modkey, "Control" }, "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        { description = "decrease the number of master clients", group = "layout" }),


        awful.key({ modkey, "Control", "Shift" }, "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        { description = "increase the number of columns", group = "layout" }),


        awful.key({ modkey, "Control", "Shift" }, "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        { description = "decrease the number of columns", group = "layout" }),


        awful.key({ modkey }, "space",
        function()
            awful.layout.inc(1)
        end,
        { description = "select next", group = "layout" }),


        awful.key({ modkey, "Shift" }, "space",
        function()
            awful.layout.inc(-1)
        end,
        { description = "select previous", group = "layout" }),

        -- ================================
        -- Minimise
        -- ================================

        awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize",
                                                        { raise = true })
            end
        end,
        { description = "restore minimized", group = "client" }),


        -- ================================
        --  Awesome restart
        -- ================================

        awful.key({ modkey, "Control" }, "r",
        function()
            awesome.restart()
        end,
        { description = "reload awesome", group = "awesome" }),


        awful.key({ modkey, "Control" }, "q",
        function()
            awesome.quit()
        end,
        { description = "quit awesome", group = "awesome" }),

        -- ================================
        -- Volume Control
        -- ================================

        awful.key({ modkey }, "v",
        function()
            awful.spawn("alacritty --class volume-term -e pulsemixer")
        end,
        { description = "spawn volume mixer", group = "media" }),

        awful.key({}, "XF86AudioRaiseVolume", function()
            awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
        end,
        { description = "raise volume", group = "media" }),

        awful.key({}, "XF86AudioLowerVolume", function()
            awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
        end,
        { description = "lower volume", group = "media" }),

        awful.key({}, "XF86AudioMute", function()
            awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
        end,
        { description = "mute volume", group = "media" }),


        -- ================================
        -- Brightness control
        -- ================================

        awful.key({}, "XF86MonBrightnessUp", function()
            awful.spawn("light -A 5")
        end,
        { description = "increase brightness", group = "media" }),


        awful.key({}, "XF86MonBrightnessDown", function()
            awful.spawn("light -U 5")
        end,
        { description = "decrease brightness", group = "media" })
    )

    -- ================================
    -- Client Key bindings
    -- ================================

    keys.clientkeys = gears.table.join(

        awful.key({ modkey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),


        awful.key({ modkey, "Shift" }, "c",
        function(c)
            c:kill()
        end,
        { description = "close", group = "client" }),


        awful.key({ modkey, "Control" }, "space",
        function()
            awful.client.floating.toggle(client.focus)
        end,
        { description = "toggle floating", group = "client" }),


        awful.key({ modkey, "Mod1" }, "Return",
        function(c)
            c:swap(awful.client.getmaster())
        end,
        { description = "move to master", group = "client" }),


        awful.key({ modkey }, "o",
        function(c)
            c:move_to_screen()
        end,
        { description = "move to screen", group = "client" }),


        awful.key({ modkey }, "t",
        function(c)
            c.ontop = not c.ontop
        end,
        { description = "toggle keep on top", group = "client" }),


        awful.key({ modkey }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),


        ---- Resizing slave clients
        awful.key({ modkey, "Shift" }, "Left", function()
            awful.client.incwfact(-0.05)
        end,
        { description = "resize non-master", group = "client"}),

        awful.key({ modkey, "Shift" }, "Right", function()
            awful.client.incwfact(0.05)
        end,
        { description = "resize non-master", group = "client"})
    )

    -- Bind all key numbers to tags.
    for i = 1, maxtags do
        keys.globalkeys = gears.table.join(keys.globalkeys,

            -- Switch to tag
            awful.key({ modkey }, "#" .. i + 9,
                function()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
                end,
                { description = "view tag #" .. i, group = "tag" }),


            -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" })
        )
    end

return keys
