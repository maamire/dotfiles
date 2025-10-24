--
--
--                  Theme
--
--

    local xresources = require("beautiful.xresources")
    local gears = require("gears")
    local dpi = xresources.apply_dpi

    -- define module table
    local theme = {}

    -- =============================================================
    --                          Config
    -- =============================================================
    theme.name = "Spacecamp"

    theme.font = "FiraMono Nerd Font Mono Medium 11"
    theme.title_font = "FiraMono Nerd Font Propo Medium 16"
    theme.widget_font = "FiraMono Nerd Font Mono Medium"


    theme.bg_normal     = "#121212"
    theme.bg_dark       = "#0D0D0D"
    theme.bg_focus      = "#91AADF"
    theme.bg_focus_green = "#57BA37"

    theme.bg_minimize   = "#666666"
    theme.bg_urgent     = "#D71A1A"

    theme.fg_normal     = "#D0D0D0"
    theme.fg_focus      = "#EEEEEE"
    theme.fg_minimize   = "#EEEEEE"
    theme.fg_urgent     = "#FF0000"

    -- Gaps
    theme.useless_gap   = dpi(5)
    theme.gap_single_client = false

    -- Border
    theme.border_width  = dpi(1)
    theme.border_normal = theme.bg_normal
    theme.border_focus  = "#A9C1DE"
    theme.border_marked = theme.fg_urgent

    -- Tasklist
    theme.tasklist_font = theme.font
    theme.tasklist_bg_normal = theme.bg_normal
    theme.tasklist_bg_focus = theme.bg_focus
    theme.tasklist_bg_urgent = theme.bg_urgent

    theme.tasklist_fg_focus = theme.fg_focus
    theme.tasklist_fg_urgent = theme.fg_urgent
    theme.tasklist_fg_normal = theme.fg_normal

    -- Taglist
    theme.taglist_spacing = dpi(0)
    theme.taglist_height  = dpi(20)
    theme.taglist_width   = dpi(20)

    theme.taglist_bg_normal = theme.bg_normal
    theme.taglist_fg_normal = theme.fg_normal
    theme.taglist_bg_focus  = "#57BA37"
    theme.taglist_fg_focus  = theme.fg_focus
    theme.taglist_bg_urgent = theme.bg_urgent
    theme.taglist_fg_focus  = theme.fg_focus

    -- =============================================================
    --                          WiBar
    -- =============================================================

    theme.wibar_height = dpi(30)
    theme.wibar_width  = dpi(55)

    -- Notifications
    theme.notification_max_width = dpi(300)

    -- Systray
    theme.bg_systray    = theme.bg_normal

    -- Titlebars
    theme.titlebars_enabled = false

    -- Icons
    local themes_path = gears.filesystem.get_themes_dir()
    theme.layout_tile = themes_path.."default/layouts/tilew.png"
    theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
    theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
    theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
    theme.layout_max = themes_path.."default/layouts/maxw.png"
    theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"

    -- Define the icon theme for application icons. If not set then the icons
    -- from /usr/share/icons and /usr/share/icons/hicolor will be used.
    theme.icon_theme = nil

    return theme
