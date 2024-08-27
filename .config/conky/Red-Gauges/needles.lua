require 'cairo'

gauge = {
{
    name='memperc',    arg='',
    max_value=95,                 max_rpm=100,
    x=340,                          y=272,
    graph_radius=35,
    graph_thickness=8,
    graph_start_angle=225,
    graph_unit_angle=2.84,         graph_unit_thickness=2.7,
    graph_bg_colour=0xFFEEEE,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=1.0,
    hand_fg_colour=0xFFFFFF,       hand_fg_alpha=1.0,
    txt_radius=0,
    txt_weight=1,                  txt_size=10,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=0.0,
    graduation_radius=35,
    graduation_thickness=8,       graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xAAAAAA, graduation_fg_alpha=0.5,
    caption='   RAM',
    caption_weight=1,              caption_size=14,
    caption_fg_colour=0xFF0000,    caption_fg_alpha=100,

        -- Needle Parameters
        needle_colour=0xFF0000,        -- Red color for the needle
        needle_alpha=1.0,              -- Fully opaque needle
        needle_thickness=2,            -- 4 pixels wide
        needle_length=40,              -- Needle length to reach the edge of the gauge
    },
{
    name='exec',               arg='cat /etc/fancontrol_gpufanspeed_input',
    max_value=95,                 max_rpm=4000,
    x=443,                          y=272,
    graph_radius=35,
    graph_thickness=8,
    graph_start_angle=225,
    graph_unit_angle=2.84,         graph_unit_thickness=2.7,
    graph_bg_colour=0xFFEEEE,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=1.0,
    hand_fg_colour=0xFFFFFF,       hand_fg_alpha=1.0,
    txt_radius=0,
    txt_weight=1,                  txt_size=23.0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=0.0,
    graduation_radius=35,
    graduation_thickness=8,       graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xAAAAAA, graduation_fg_alpha=0.5,
    caption='GPU fan',
    caption_weight=1,              caption_size=14,
    caption_fg_colour=0xFF0000,    caption_fg_alpha=100,
    caption_x_offset=-24,                   caption_y_offset=20, 


        -- Needle Parameters
        needle_colour=0xFF0000,        -- Red color for the needle
        needle_alpha=1.0,              -- Fully opaque needle
        needle_thickness=2,            -- 4 pixels wide
        needle_length=40,              -- Needle length to reach the edge of the gauge
    },
{
    name='hwmon',               arg='3 fan 1',
    max_value=95,                 max_rpm=3300,
    x=340,                          y=376,
    graph_radius=35,
    graph_thickness=8,
    graph_start_angle=225,
    graph_unit_angle=2.84,         graph_unit_thickness=2.7,
    graph_bg_colour=0xFFEEEE,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=1.0,
    hand_fg_colour=0xFFFFFF,       hand_fg_alpha=1.0,
    txt_radius=0,
    txt_weight=1,                  txt_size=23.0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=0.0,
    graduation_radius=35,
    graduation_thickness=8,       graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xAAAAAA, graduation_fg_alpha=0.5,
    caption='  FAN 1',
    caption_weight=1,              caption_size=14,
    caption_fg_colour=0xFF0000,    caption_fg_alpha=100,

        -- Needle Parameters
        needle_colour=0xFF0000,        -- Red color for the needle
        needle_alpha=1.0,              -- Fully opaque needle
        needle_thickness=2,            -- 4 pixels wide
        needle_length=40,              -- Needle length to reach the edge of the gauge
    },
{
    name='hwmon',               arg='3 fan 2',
    max_value=95,                 max_rpm=3300,
    x=443,                          y=376,
    graph_radius=35,
    graph_thickness=8,
    graph_start_angle=225,
    graph_unit_angle=2.84,         graph_unit_thickness=2.7,
    graph_bg_colour=0xFFEEEE,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=1.0,
    hand_fg_colour=0xFFFFFF,       hand_fg_alpha=1.0,
    txt_radius=0,
    txt_weight=1,                  txt_size=23.0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=0.0,
    graduation_radius=35,
    graduation_thickness=8,       graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xAAAAAA, graduation_fg_alpha=0.5,
    caption='  FAN 2',
    caption_weight=1,              caption_size=14,
    caption_fg_colour=0xFF0000,    caption_fg_alpha=100,

        -- Needle Parameters
        needle_colour=0xFF0000,        -- Red color for the needle
        needle_alpha=1.0,              -- Fully opaque needle
        needle_thickness=2,            -- 4 pixels wide
        needle_length=40,              -- Needle length to reach the edge of the gauge
    },
}

function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function angle_to_position(start_angle, current_angle)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
end

function draw_gauge_ring(display, data, value)
    local max_value = data['max_value']
    local max_rpm = data['max_rpm']
    local x, y = data['x'], data['y']
    local graph_radius = data['graph_radius']
    local graph_thickness, graph_unit_thickness = data['graph_thickness'], data['graph_unit_thickness']
    local graph_start_angle = data['graph_start_angle']
    local graph_unit_angle = data['graph_unit_angle']
    local graph_bg_colour, graph_bg_alpha = data['graph_bg_colour'], data['graph_bg_alpha']
    local graph_fg_colour, graph_fg_alpha = data['graph_fg_colour'], data['graph_fg_alpha']
    local hand_fg_colour, hand_fg_alpha = data['hand_fg_colour'], data['hand_fg_alpha']
    local graph_end_angle = (max_value * graph_unit_angle) % 360

    -- Background ring
    cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, 0), angle_to_position(graph_start_angle, graph_end_angle))
    cairo_set_source_rgba(display, rgb_to_r_g_b(graph_bg_colour, graph_bg_alpha))
    cairo_set_line_width(display, graph_thickness)
    cairo_stroke(display)

    -- Arc of value
    local val = value % (max_value +1)
    local start_arc = 0
    local stop_arc = 0
    local i = 1
    while i <= val do
        start_arc = (graph_unit_angle * i) - graph_unit_thickness
        stop_arc = (graph_unit_angle * i)
        cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
        cairo_set_source_rgba(display, rgb_to_r_g_b(graph_fg_colour, graph_fg_alpha))
        cairo_stroke(display)
        i = i + 1
    end

    -- Needle
    local angle = angle_to_position(graph_start_angle, graph_unit_angle * val)
    local needle_length = data['needle_length']
    cairo_move_to(display, x, y)
    cairo_line_to(display, x + needle_length * math.cos(angle), y + needle_length * math.sin(angle))
    cairo_set_source_rgba(display, rgb_to_r_g_b(data['needle_colour'], data['needle_alpha']))
    cairo_set_line_width(display, data['needle_thickness'])
    cairo_stroke(display)

    -- Graduations marks
    local graduation_radius = data['graduation_radius']
    local graduation_thickness, graduation_mark_thickness = data['graduation_thickness'], data['graduation_mark_thickness']
    local graduation_unit_angle = data['graduation_unit_angle']
    local graduation_fg_colour, graduation_fg_alpha = data['graduation_fg_colour'], data['graduation_fg_alpha']
    if graduation_radius > 0 and graduation_thickness > 0 and graduation_unit_angle > 0 then
        local nb_graduation = graph_end_angle / graduation_unit_angle
        local i = 0
        while i < nb_graduation do
            cairo_set_line_width(display, graduation_thickness)
            start_arc = (graduation_unit_angle * i) - (graduation_mark_thickness / 2)
            stop_arc = (graduation_unit_angle * i) + (graduation_mark_thickness / 2)
            cairo_arc(display, x, y, graduation_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
            cairo_set_source_rgba(display,rgb_to_r_g_b(graduation_fg_colour,graduation_fg_alpha))
            cairo_stroke(display)
            cairo_set_line_width(display, graph_thickness)
            i = i + 1
        end
    end

    -- Text (rpm value)
    local txt_radius = data['txt_radius']
    local txt_weight, txt_size = data['txt_weight'], data['txt_size']
    local txt_fg_colour, txt_fg_alpha = data['txt_fg_colour'], data['txt_fg_alpha']
    local str, value = 0, 0
    local str, rpm
    str = string.format('${%s %s}', data['name'], data['arg'])
    str = conky_parse(str)
    value = tonumber(str)
    cairo_select_font_face(display, "Droid Sans", CAIRO_FONT_SLANT_NORMAL, txt_weight)
    cairo_set_font_size(display, txt_size)
    cairo_set_source_rgba(display, rgb_to_r_g_b(txt_fg_colour, txt_fg_alpha))
    if value >= 2000 then cairo_move_to(display, x - ((1.3 * txt_size) - 1), y + (0.5 * txt_size) - 3) end
    if value <= 1999 then cairo_move_to(display, x - ((1.3 * txt_size) + 2), y + (0.5 * txt_size) - 3) end
    if value <= 999 then cairo_move_to(display, x - ((1.2 * txt_size) - 6), y + (0.5 * txt_size) - 3) end
    if value <= 199 then cairo_move_to(display, x - ((1.2 * txt_size) - 3), y + (0.5 * txt_size) - 3) end
    if value <= 99 then cairo_move_to(display, x - ((1.2 * txt_size) - 17), y + (0.5 * txt_size) - 3) end
    if value <= 9 then cairo_move_to(display, x - ((1.1 * txt_size) - 20), y + (0.5 * txt_size) - 3) end
    cairo_show_text(display, value)
    cairo_stroke(display)

    -- Caption (fan name)
    local caption = data['caption']
    local caption_weight, caption_size = data['caption_weight'], data['caption_size']
    local caption_fg_colour, caption_fg_alpha = data['caption_fg_colour'], data['caption_fg_alpha']
    local tox = graph_radius * (math.cos((graph_start_angle * 2 * math.pi / 360) - (math.pi / 2)))
    local toy = graph_radius * (math.sin((graph_start_angle * 2 * math.pi / 360) - (math.pi / 2))) + 5
    cairo_select_font_face(display, "Droid Sans", CAIRO_FONT_SLANT_NORMAL, caption_weight)
    cairo_set_font_size(display, caption_size)
    cairo_set_source_rgba(display, rgb_to_r_g_b(caption_fg_colour, caption_fg_alpha))
    cairo_move_to(display, x + tox - 2, y + toy + 1)
    if graph_start_angle < 105 then
        cairo_move_to(display, x + tox - 30, y + toy + 1)
    end
    cairo_show_text(display, caption)
    cairo_stroke(display)
end

function go_gauge_rings(display)
    local function load_gauge_rings(display, data)
        local str, value = 0, 0
        local str, rpm
        local max_value = data['max_value']
        local max_rpm = data['max_rpm']
        str = string.format('${%s %s}', data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)
        rpm = (value / max_rpm * max_value)
        rpm = math.floor(rpm)
        draw_gauge_ring(display, data, rpm)
    end

    local i = 1
    while gauge[i] do
        load_gauge_rings(display, gauge[i])
        i = i + 1
    end
end

function conky_main()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    go_gauge_rings(display)
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end

