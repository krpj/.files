-- Require Cairo for drawing
require 'cairo'

-- Function to draw numbers around the circle
function draw_numbers(cr, x_center, y_center, radius, start_angle, step_angle, num_steps)
    cairo_select_font_face(cr, "Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
    cairo_set_font_size(cr, 10)  -- Set the font size for the numbers
    cairo_set_source_rgba(cr, 1, 1, 1, 1)  -- Set the text color to white

    for i = 1, num_steps do
        local angle = start_angle + (i - 1) * step_angle
        local x = x_center + (radius + 5) * math.cos(angle)
        local y = y_center + (radius + 5) * math.sin(angle)
        
        -- Adjust the position for text centering
        cairo_move_to(cr, x - 5, y + 5)
        local text = tostring(i)
        cairo_show_text(cr, text)
    end
end

-- Main function called by Conky
function conky_main()
    if conky_window == nil then return end

    -- Setup the surface and context for drawing
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local cr = cairo_create(cs)

    -- Parameters for drawing numbers
    local x_center = 400  -- Center X position
    local y_center = 300  -- Center Y position
    local radius = 41     -- Radius of the circle (half of previous radius)
    local start_angle = math.rad(144)  -- Starting angle in radians (rotated counterclockwise by 90 degrees from 225 degrees)
    local step_angle = math.rad(28)    -- Angle step between numbers in radians (27 degrees)
    local num_steps = 10  -- Number of steps

    -- Draw the first set of numbers
    draw_numbers(cr, x_center, y_center, radius, start_angle, step_angle, num_steps)

    -- Draw the second set of numbers 12 pixels to the right
    draw_numbers(cr, x_center + 104, y_center, radius, start_angle, step_angle, num_steps)

-- Draw the second row of numbers, 104 pixels lower
    draw_numbers(cr, x_center, y_center + 104, radius, start_angle, step_angle, num_steps)
    draw_numbers(cr, x_center + 104, y_center + 104, radius, start_angle, step_angle, num_steps)

    -- Clean up
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
end

