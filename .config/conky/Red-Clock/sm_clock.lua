settings_table = {
    -- Hour ring
    {
        name='time',
        arg='%I',
        max=12,
        bg_colour=0x888888,
        bg_alpha=0.2,
        fg_colour=0xff0000,
        fg_alpha=1.0,
        x=161, y=170, 
        radius=40,
        thickness=4,
        start_angle=0,
        end_angle=360
    },
    -- Minute ring
    {
        name='time',
        arg='%M',
        max=60,
        bg_colour=0x888888,
        bg_alpha=0.2,
        fg_colour=0xff0000,
        fg_alpha=1.0,
        x=161, y=170, 
        radius=62,
        thickness=4,
        start_angle=0,
        end_angle=360
    },
    -- Second ring
    {
        name='time',
        arg='%S',
        max=60,
        bg_colour=0x888888,
        bg_alpha=0.2,
        fg_colour=0xff0000,
        fg_alpha=1.0,
        x=161, y=170, 
        radius=68,
        thickness=4,
        start_angle=0,
        end_angle=360
    },
    {
        name='hwmon',
        arg='1 temp 1',  -- Replace with the correct argument for GPU temperature
        max=14,  -- Assuming a max temperature of 100°C
        bg_colour=0x808080,  -- Grey color for inactive
        bg_alpha=0.5,
        fg_colour=0xff0000,  -- Red color for active
        fg_alpha=1.0,
        x=161, y=168,  -- Position adjusted to be atop the clock
        radius=76,  -- Adjusted to fit proportionally
        thickness=4,
        start_angle=270,
        end_angle=90
    },
    -- CPU Temperature Gauge
    {
        name='hwmon',
        arg='2 temp 2',  -- Replace with the correct argument for CPU temperature
        max=6.2,  -- Assuming a max temperature of 100°C
        bg_colour=0x808080,  -- Grey color for inactive
        bg_alpha=0.5,
        fg_colour=0xff0000,  -- Red color for active
        fg_alpha=1.0,
        x=161, y=168,  -- Position adjusted to be atop the clock
        radius=86,  -- Adjusted to fit proportionally
        thickness=5,
        start_angle=270,
        end_angle=90
    }
}

clock_r = 70
clock_x = 161
clock_y = 170
clock_colour = 0xffffff
clock_alpha = 1.0
show_seconds = true

require 'cairo'

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr, pct, pt)
    local angle_0 = pt['start_angle'] * (2 * math.pi / 360) - math.pi / 2
    local angle_f = pt['end_angle'] * (2 * math.pi / 360) - math.pi / 2
    local pct_arc = pct * (angle_f - angle_0)

    -- Draw background ring
    cairo_arc(cr, pt['x'], pt['y'], pt['radius'], angle_0, angle_f)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(pt['bg_colour'], pt['bg_alpha']))
    cairo_set_line_width(cr, pt['thickness'])
    cairo_stroke(cr)

    -- Draw indicator ring
    cairo_arc(cr, pt['x'], pt['y'], pt['radius'], angle_0, angle_0 + pct_arc)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(pt['fg_colour'], pt['fg_alpha']))
    cairo_stroke(cr)
end

function draw_clock_hands(cr, xc, yc)
    local secs = os.date("%S")
    local mins = os.date("%M")
    local hours = os.date("%I")

    local secs_arc = (2 * math.pi / 60) * secs
    local mins_arc = (2 * math.pi / 60) * mins + secs_arc / 60
    local hours_arc = (2 * math.pi / 12) * hours + mins_arc / 12

    -- Draw hour hand
    cairo_move_to(cr, xc, yc)
    cairo_line_to(cr, xc + 0.5 * clock_r * math.sin(hours_arc), yc - 0.5 * clock_r * math.cos(hours_arc))
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND)
    cairo_set_line_width(cr, 5)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(clock_colour, clock_alpha))
    cairo_stroke(cr)

    -- Draw minute hand
    cairo_move_to(cr, xc, yc)
    cairo_line_to(cr, xc + 0.8 * clock_r * math.sin(mins_arc), yc - 0.8 * clock_r * math.cos(mins_arc))
    cairo_set_line_width(cr, 3)
    cairo_stroke(cr)

    -- Draw second hand
    if show_seconds then
        cairo_move_to(cr, xc, yc)
        cairo_line_to(cr, xc + clock_r * math.sin(secs_arc), yc - clock_r * math.cos(secs_arc))
        cairo_set_line_width(cr, 1)
        cairo_stroke(cr)
    end
end

function conky_main()
    local function setup_rings(cr, pt)
        local str = string.format('${%s %s}', pt['name'], pt['arg'])
        local value = tonumber(conky_parse(str)) or 0
        local pct = value / pt['max']

        draw_ring(cr, pct, pt)
    end

    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local cr = cairo_create(cs)

    local updates = conky_parse('${updates}')
    local update_num = tonumber(updates)

    if update_num > 5 then
        for i in pairs(settings_table) do
            setup_rings(cr, settings_table[i])
        end
    end

    -- Draw clock hands
    draw_clock_hands(cr, clock_x, clock_y)

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
end

