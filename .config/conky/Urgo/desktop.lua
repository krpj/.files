require 'cairo'

corner_r=35

    -- Set the colour and transparency (alpha) of your background.

bg_colour=0x000000
bg_alpha=0.0
    
line_width=0.3
line_cap=CAIRO_LINE_CAP_BUTT --we don't need this any more after closing the path
line_join=CAIRO_LINE_JOIN_MITER --but this will still affect how the lines look
red,green,blue,alpha=1,1,1,1
font="Droid Sans"
font_size=10
font_slant=CAIRO_FONT_SLANT_NORMAL
font_face=CAIRO_FONT_WEIGHT_NORMAL

pozycja_x=400
pozycja_y=400
txtxoffset=2 -- text offset
txtyoffset=2 -- text offset

--cpu0
promien_cpu0=54
width_cpu0=5
nwsk=45 -- leader angle
ramie_cpu0=165

--cpu1
promien_cpu1=54
width_cpu1=5
ramie_cpu1=165

--memperc
promien_memperc=92
width_memperc=10
kat_memperc=45 -- leader angle
ramie_mem=165

--disk /
promien_root=72
width_root=7
kat_root=75
ramie_root=165

--disk /home
promien_home=72
width_home=7
kat_home=10
ramie_home=165

--disk /windows
promien_windows=72
width_windows=7
kat_windows=160
ramie_windows=165

--battery
promien_bat=112
width_bat=10
kat_bat=10
ramie_bat=165

--wlan up
promien_wlanup=122
width_wlanup=7
kat_wlanup=95
ramie_wlanup=165

--eth up
promien_ethup=112
width_ethup=7
kat_ethup=110
ramie_ethup=165

--eth down
promien_ethdown=112
width_ethdown=7
kat_ethdown=-45
ramie_ethdown=165

--------------------------------------------------------------------------------
--                                                                    gauge DATA
gauge = {
{
    name='cpu',                    arg='cpu0',                  max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_cpu0,
    graph_thickness=width_cpu0,
    graph_start_angle=-80,
    graph_unit_angle=1.6,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=44,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=54,
    graduation_thickness=width_cpu0,        graduation_mark_thickness=2,
    graduation_unit_angle=5,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',               
    caption_weight=1,              caption_size=9.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='cpu',                    arg='cpu1',                  max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=54,
    graph_thickness=width_cpu1,
    graph_start_angle=100,
    graph_unit_angle=1.6,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=44,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=54,
    graduation_thickness=width_cpu1,        graduation_mark_thickness=2,
    graduation_unit_angle=5,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=9.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='memperc',                arg='',                      max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_memperc,
    graph_thickness=width_memperc,
    graph_start_angle=184,
    graph_unit_angle=2.6,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=82,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=10.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='hwmon',                   arg='1 temp 1', 
    max_value=140,                 max_rpm=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_memperc,
    graph_thickness=width_memperc,
    graph_start_angle=88,
    graph_unit_angle=86 / 100,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=82,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=10.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='fs_used_perc',           arg='/media/logansfury/Elements/',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=72,
    graph_thickness=7,
    graph_start_angle=64,
    graph_unit_angle=1.14,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=63,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='fs_used_perc',           arg='/home/',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=72,
    graph_thickness=7,
    graph_start_angle=-56,
    graph_unit_angle=1.14,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=63,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='fs_used_perc',           arg='/',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_root,
    graph_thickness=width_root,
    graph_start_angle=184,
    graph_unit_angle=1.14,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=63,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='downspeedf',           arg='enp0s31f6',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_ethdown,
    graph_thickness=width_ethdown,
    graph_start_angle=120,
    graph_unit_angle=1.2,          graph_unit_thickness=5,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=0,
    txt_radius=104,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=112,
    graduation_thickness=7,        graduation_mark_thickness=1,
    graduation_unit_angle=2,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.1,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='upspeedf',           arg='enp0s31f6',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_ethup,
    graph_thickness=width_ethup,
    graph_start_angle=-60,
    graph_unit_angle=1.2,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=0,
    txt_radius=104,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=112,
    graduation_thickness=7,        graduation_mark_thickness=1,
    graduation_unit_angle=2,
    graduation_fg_colour=0xffffff, graduation_fg_alpha=0.1,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='downspeedf',           arg='wlp3s0',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=122,
    graph_thickness=7,
    graph_start_angle=120,
    graph_unit_angle=1.2,          graph_unit_thickness=5,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=0,
    txt_radius=134,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=112,
    graduation_thickness=7,        graduation_mark_thickness=1,
    graduation_unit_angle=2,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.1,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='upspeedf',           arg='wlp3s0',                     max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=122,
    graph_thickness=7,
    graph_start_angle=-60,
    graph_unit_angle=1.2,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.0,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=0,
    txt_radius=134,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=112,
    graduation_thickness=7,        graduation_mark_thickness=1,
    graduation_unit_angle=2,
    graduation_fg_colour=0xffffff, graduation_fg_alpha=0.1,
    caption='',
    caption_weight=1,              caption_size=12.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
     name='cpu',                    arg='cpu3',                  max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_bat,
    graph_thickness=width_bat,
    graph_start_angle=250,
    graph_unit_angle=0.4,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=100,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=10.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='cpu',                arg='cpu4',                      max_value=100,
    x=pozycja_x,                          y=pozycja_y,
    graph_radius=promien_bat,
    graph_thickness=width_bat,
    graph_start_angle=72,
    graph_unit_angle=0.4,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.1,
    graph_fg_colour=0xFFFFFF,      graph_fg_alpha=0.3,
    hand_fg_colour=0xff0000,       hand_fg_alpha=1.0,
    txt_radius=100,
    txt_weight=0,                  txt_size=9.0,
    txt_fg_colour=0xff0000,        txt_fg_alpha=1.0,
    graduation_radius=23,
    graduation_thickness=0,        graduation_mark_thickness=2,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=10.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
}

-------------------------------------------------------------------------------
--                                                                 rgb_to_r_g_b
-- converts color in hexa to decimal
--
function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

-------------------------------------------------------------------------------
--                                                            angle_to_position
-- convert degree to rad and rotate (0 degree is top/north)
--
function angle_to_position(start_angle, current_angle)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
end


-------------------------------------------------------------------------------
--                                                              draw_gauge_ring
-- displays gauges
--
        
    function draw_bg()
        
        if conky_window==nil then return end
        local w=conky_window.width
        local h=700 --conky_window.height
        local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
        cr=cairo_create(cs)
       
        cairo_move_to(cr,corner_r,0)
        cairo_line_to(cr,w-corner_r,0)
        cairo_curve_to(cr,w,0,w,0,w,corner_r)
        cairo_line_to(cr,w,h-corner_r)
        cairo_curve_to(cr,w,h,w,h,w-corner_r,h)
        cairo_line_to(cr,corner_r,h)
        cairo_curve_to(cr,0,h,0,h,0,h-corner_r)
        cairo_line_to(cr,0,corner_r)
        cairo_curve_to(cr,0,0,0,0,corner_r,0)
        cairo_close_path(cr)
       
        cairo_set_source_rgba(cr,rgb_to_r_g_b(bg_colour,bg_alpha))
        cairo_fill(cr)
        
        cairo_set_line_width (cr,line_width)
        cairo_set_line_cap  (cr, line_cap)
        cairo_set_source_rgba (cr,red,green,blue,alpha)
 
        --tekst setup
        cairo_select_font_face (cr, font, font_slant, font_face);
        cairo_set_font_size (cr, font_size)
        cairo_set_source_rgba (cr,red,green,blue,alpha)
        
        --cpu1
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*(promien_cpu0+width_cpu0),pozycja_y-math.sin(nwsk*3.142/180)*(promien_cpu0+width_cpu0))
        cairo_line_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu0,pozycja_y-math.sin(nwsk*3.142/180)*ramie_cpu0)
        cairo_line_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu0+124,pozycja_y-math.sin(nwsk*3.142/180)*ramie_cpu0)
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu0+txtxoffset,pozycja_y-math.sin(nwsk*3.142/180)*ramie_cpu0-txtyoffset)
        cairo_show_text (cr,"cpu1: "..conky_parse("${cpu cpu1}").."%, "..conky_parse("${freq_g cpu1}").."Ghz, "..conky_parse("${acpitemp}").."°C")
        cairo_stroke (cr)

--cpu4
-- Draw horizontal line (128 pixels long)
cairo_move_to(cr, pozycja_x + 290, pozycja_y -28)  -- Start at the right end of the horizontal line
cairo_line_to(cr, pozycja_x + 290 - 128, pozycja_y -28)  -- Draw the horizontal line to the left by 128 pixels

-- Draw diagonal line connecting to the top-left of the horizontal line
cairo_line_to(cr, pozycja_x + 290 - 154 - 14.14, pozycja_y -28 + 14.14) -- Half the original diagonal length
cairo_stroke(cr)

-- Display text
cairo_move_to(cr, pozycja_x + 2 + math.cos(nwsk * 3.202 / 1200) * ramie_cpu0 + txtxoffset -2, pozycja_y -9 - math.sin(nwsk * 3.202 / 1200) * ramie_cpu0 - txtyoffset)
cairo_show_text(cr, "cpu4: " .. conky_parse("${cpu cpu4}") .. "%, " .. conky_parse("${freq_g cpu4}") .. "Ghz, " .. conky_parse("${acpitemp}") .. "°C")
cairo_stroke(cr)
        
        --cpu2
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*(promien_cpu1+width_cpu1),pozycja_y+math.sin(nwsk*3.142/180)*(promien_cpu1+width_cpu1))
        cairo_line_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1)
        cairo_line_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+124,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1)
        cairo_stroke (cr)  
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+txtxoffset,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1-txtyoffset)
        cairo_show_text (cr,"cpu2: "..conky_parse("${cpu cpu2}").."%, "..conky_parse("${freq_g cpu2}").."Ghz, "..conky_parse("${acpitemp}").."°C")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+txtxoffset,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1+20-txtyoffset)
        cairo_show_text (cr,conky_parse("${top name 1 }")..conky_parse("${top cpu 1}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+txtxoffset,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1+30-txtyoffset)
        cairo_show_text (cr,conky_parse("${top name 2 }")..conky_parse("${top cpu 2}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+txtxoffset,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1+40-txtyoffset)
        cairo_show_text (cr,conky_parse("${top name 3 }")..conky_parse("${top cpu 3}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x+math.cos(nwsk*3.142/180)*ramie_cpu1+txtxoffset,pozycja_y+math.sin(nwsk*3.142/180)*ramie_cpu1+50-txtyoffset)
        cairo_show_text (cr,conky_parse("${top name 4 }")..conky_parse("${top cpu 4}").."%")
        cairo_stroke (cr)
        
        --memperc
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*(promien_memperc+width_memperc),pozycja_y+math.sin(kat_memperc*3.142/180)*(promien_memperc+width_memperc))
        cairo_line_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem)
        cairo_line_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem)
        cairo_stroke (cr)  
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125+txtxoffset,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem-txtyoffset);cairo_show_text (cr,"mem: "..conky_parse("${mem}").." / "..conky_parse("${memmax}"))
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125+txtxoffset,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem+20-txtyoffset);cairo_show_text (cr,conky_parse("${top_mem name 1}")..conky_parse("${top_mem mem 1}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125+txtxoffset,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem+30-txtyoffset);cairo_show_text (cr,conky_parse("${top_mem name 2}")..conky_parse("${top_mem mem 2}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125+txtxoffset,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem+40-txtyoffset);cairo_show_text (cr,conky_parse("${top_mem name 3}")..conky_parse("${top_mem mem 3}").."%")
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_memperc*3.142/180)*ramie_mem-125+txtxoffset,pozycja_y+math.sin(kat_memperc*3.142/180)*ramie_mem+50-txtyoffset);cairo_show_text (cr,conky_parse("${top_mem name 4}")..conky_parse("${top_mem mem 4}").."%")
        cairo_stroke (cr)
        
        --disk root
        cairo_move_to (cr,pozycja_x-math.cos(kat_root*3.142/180)*(promien_root+width_root),pozycja_y-math.sin(kat_root*3.142/180)*(promien_root+width_root))
        cairo_line_to (cr,pozycja_x-math.cos(kat_root*3.142/180)*ramie_root,pozycja_y-math.sin(kat_root*3.142/180)*ramie_root)
        cairo_line_to (cr,pozycja_x-math.cos(kat_root*3.142/180)*ramie_root+210,pozycja_y-math.sin(kat_root*3.142/180)*ramie_root)
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_root*3.142/180)*ramie_root+txtxoffset,pozycja_y-math.sin(kat_root*3.142/180)*ramie_root-10-txtyoffset);cairo_show_text (cr,"root "..conky_parse("${fs_size /}").." "..conky_parse("${fs_type /}"))
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_root*3.142/180)*ramie_root+txtxoffset,pozycja_y-math.sin(kat_root*3.142/180)*ramie_root-txtyoffset)
        cairo_show_text (cr,conky_parse("${fs_free /}").." ("..conky_parse("${fs_free_perc /}").."%) free -- "..conky_parse("${fs_used /}").." ("..conky_parse("${fs_used_perc /}").."%) used")
        cairo_stroke (cr)
       
        --disk home
        cairo_move_to (cr,pozycja_x-math.cos(kat_home*3.142/180)*(promien_home+width_home),pozycja_y-math.sin(kat_home*3.142/180)*(promien_home+width_home))
        cairo_line_to (cr,pozycja_x-math.cos(kat_home*3.142/180)*ramie_home,pozycja_y-math.sin(kat_home*3.142/180)*ramie_home)
        cairo_line_to (cr,pozycja_x-math.cos(kat_home*3.142/180)*ramie_home-200,pozycja_y-math.sin(kat_home*3.142/180)*ramie_home)
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_home*3.142/180)*ramie_home-200+txtxoffset,pozycja_y-math.sin(kat_home*3.142/180)*ramie_home-10-txtyoffset)
        cairo_show_text (cr,"home "..conky_parse("${fs_size /home}").." "..conky_parse("${fs_type /home}"))
        cairo_stroke (cr)        
        cairo_move_to (cr,pozycja_x-math.cos(kat_home*3.142/180)*ramie_home-200+txtxoffset,pozycja_y-math.sin(kat_home*3.142/180)*ramie_home-txtyoffset)
        cairo_show_text (cr,conky_parse("${fs_free /home}").." ("..conky_parse("${fs_free_perc /home}").."%) free -- "..conky_parse("${fs_used /home}").." ("..conky_parse("${fs_used_perc /home}").."%) used")
        cairo_stroke (cr)
        
        --disk Elements
        pozycja_y = pozycja_y - 6
        cairo_move_to (cr,pozycja_x-math.cos(kat_windows*3.142/180)*(promien_windows+width_windows),pozycja_y-math.sin(kat_windows*3.142/180)*(promien_windows+width_windows))
        cairo_line_to (cr,pozycja_x-math.cos(kat_windows*3.142/180)*ramie_windows,pozycja_y-math.sin(kat_windows*3.142/180)*ramie_windows)
        cairo_line_to (cr,pozycja_x-math.cos(kat_windows*3.142/180)*ramie_windows+200,pozycja_y-math.sin(kat_windows*3.142/180)*ramie_windows)
        cairo_stroke (cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_windows*3.142/180)*ramie_windows+txtxoffset,pozycja_y-1-math.sin(kat_windows*3.142/180)*ramie_windows-10-txtyoffset)
        cairo_show_text (cr,"Elements "..conky_parse("${fs_size /media/logansfury/Elements}").." "..conky_parse("${fs_type /media/logansfury/Elements}"))
        cairo_stroke (cr)        
        cairo_move_to (cr,pozycja_x-math.cos(kat_windows*3.142/180)*ramie_windows+txtxoffset,pozycja_y-1-math.sin(kat_windows*3.142/180)*ramie_windows-txtyoffset)
        cairo_show_text (cr,conky_parse("${fs_free /media/logansfury/Elements}").." ("..conky_parse("${fs_free_perc /media/logansfury/Elements}").."%) free -- "..conky_parse("${fs_used /media/logansfury/Elements}").." ("..conky_parse("${fs_used_perc /media/logansfury/Elements}").."%) used")
        cairo_stroke (cr)
        pozycja_y = pozycja_y + 6        

 --cpu3
                cairo_move_to (cr,pozycja_x-math.cos(kat_bat*3.142/180)*(promien_bat+width_bat),pozycja_y+math.sin(kat_bat*3.142/180)*(promien_bat+width_bat))
        cairo_line_to(cr,pozycja_x-math.cos(kat_bat*3.142/180)*ramie_bat,pozycja_y+math.sin(kat_bat*3.142/180)*ramie_bat)
        cairo_line_to(cr,pozycja_x-math.cos(kat_bat*3.142/180)*ramie_bat-128,pozycja_y+math.sin(kat_bat*3.142/180)*ramie_bat)
        cairo_stroke(cr)
        cairo_move_to (cr,pozycja_x-math.cos(kat_bat*3.142/180)*ramie_bat-50+txtxoffset,pozycja_y+math.sin(kat_bat*3.142/180)*ramie_bat-txtyoffset)
        cairo_move_to(cr, pozycja_x - 288, pozycja_y + 26)                        
        cairo_show_text (cr,"cpu3: "..conky_parse("${cpu cpu3}").."%, "..conky_parse("${freq_g cpu3}").."Ghz, "..conky_parse("${acpitemp}").."°C")
        cairo_stroke (cr)
        cairo_stroke (cr) 

-- GPU temp  
cairo_move_to(cr, pozycja_x + 264, pozycja_y +6)  -- Start at the right end of the horizontal line
cairo_line_to(cr, pozycja_x + 304 - 128, pozycja_y +6)  -- Draw the horizontal line to the left by 140 pixels
-- Draw diagonal line connecting to the top-left of the horizontal line
cairo_line_to(cr, pozycja_x + 264 - 140 - 28.28, pozycja_y +6 + 28.28) -- Diagonal length reduced and direction corrected
cairo_stroke(cr)
cairo_move_to(cr, pozycja_x +14 + math.cos(nwsk * 3.202 / 1200) * ramie_cpu0 + txtxoffset -2, pozycja_y +26 - math.sin(nwsk * 3.202 / 1200) * ramie_cpu0 - txtyoffset)
cairo_show_text(cr, "GPU: " .. conky_parse("${hwmon 1 temp 1}") ..  "°C")
cairo_stroke(cr)

        --eth up
        cairo_move_to (cr,pozycja_x-math.cos(kat_ethup*3.142/180)*(promien_ethup+width_ethup),pozycja_y+math.sin(kat_ethup*3.142/180)*(promien_ethup+width_ethup))
        cairo_line_to(cr,pozycja_x-math.cos(kat_ethup*3.142/180)*ramie_ethup,pozycja_y+math.sin(kat_ethup*3.142/180)*ramie_ethup)
        cairo_line_to(cr,pozycja_x-math.cos(kat_ethup*3.142/180)*ramie_ethup-140,pozycja_y+math.sin(kat_ethup*3.142/180)*ramie_ethup)
        cairo_stroke(cr)        
        cairo_move_to (cr,pozycja_x-math.cos(kat_ethup*3.142/180)*ramie_ethup-140+txtxoffset,pozycja_y+math.sin(kat_ethup*3.142/180)*ramie_ethup-txtyoffset)
        cairo_show_text (cr,"enp0s31f6 up:"..conky_parse("${totalup enp0s31f6}").."/"..conky_parse("${upspeed enp0s31f6}"))
        cairo_stroke (cr)
        
--eth down
        cairo_move_to (cr,pozycja_x-math.cos(kat_ethdown*3.142/180)*(promien_ethdown+width_ethdown),pozycja_y+math.sin(kat_ethdown*3.142/180)*(promien_ethdown+width_ethdown))
        cairo_line_to(cr,pozycja_x-math.cos(kat_ethdown*3.142/180)*ramie_ethdown,pozycja_y+math.sin(kat_ethdown*3.142/180)*ramie_ethdown)
        cairo_line_to(cr,pozycja_x-math.cos(kat_ethdown*3.142/180)*ramie_ethdown-140,pozycja_y+math.sin(kat_ethdown*3.142/180)*ramie_ethdown)
        cairo_stroke(cr)        
        cairo_move_to (cr,pozycja_x-math.cos(kat_ethdown*3.142/180)*ramie_ethdown-140+txtxoffset,pozycja_y+math.sin(kat_ethdown*3.142/180)*ramie_ethdown-txtyoffset)
        cairo_show_text (cr,"enp0s31f6 down:"..conky_parse("${totaldown enp0s31f6}").."/"..conky_parse("${downspeed enp0s31f6}"))
        cairo_stroke (cr)

    end
        
        
function draw_gauge_ring(display, data, value)
    local max_value = data['max_value']
    local x, y = data['x'], data['y']
    local graph_radius = data['graph_radius']
    local graph_thickness, graph_unit_thickness = data['graph_thickness'], data['graph_unit_thickness']
    local graph_start_angle = data['graph_start_angle']
    local graph_unit_angle = data['graph_unit_angle']
    local graph_bg_colour, graph_bg_alpha = data['graph_bg_colour'], data['graph_bg_alpha']
    local graph_fg_colour, graph_fg_alpha = data['graph_fg_colour'], data['graph_fg_alpha']
    local hand_fg_colour, hand_fg_alpha = data['hand_fg_colour'], data['hand_fg_alpha']
    local graph_end_angle = (max_value * graph_unit_angle) % 360

    -- background ring
    cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, 0), angle_to_position(graph_start_angle, graph_end_angle))
    cairo_set_source_rgba(display, rgb_to_r_g_b(graph_bg_colour, graph_bg_alpha))
    cairo_set_line_width(display, graph_thickness)
    cairo_stroke(display)

    -- arc of value
    local val = value % (max_value + 1)
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
    local angle = start_arc

    -- hand
    start_arc = (graph_unit_angle * val) - (graph_unit_thickness * 2)
    stop_arc = (graph_unit_angle * val)
    cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
    cairo_set_source_rgba(display, rgb_to_r_g_b(hand_fg_colour, hand_fg_alpha))
    cairo_stroke(display)

    -- graduations marks
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

    -- text
    local txt_radius = data['txt_radius']
    local txt_weight, txt_size = data['txt_weight'], data['txt_size']
    local txt_fg_colour, txt_fg_alpha = data['txt_fg_colour'], data['txt_fg_alpha']
    local movex = txt_radius * math.cos(angle_to_position(graph_start_angle, angle))
    local movey = txt_radius * math.sin(angle_to_position(graph_start_angle, angle))
    cairo_select_font_face (display, "ubuntu", CAIRO_FONT_SLANT_NORMAL, txt_weight)
    cairo_set_font_size (display, txt_size)
    cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_colour, txt_fg_alpha))
    cairo_move_to (display, x + movex - (txt_size / 2), y + movey + 3)
    cairo_show_text (display, value)
    cairo_stroke (display)

    -- caption
    local caption = data['caption']
    local caption_weight, caption_size = data['caption_weight'], data['caption_size']
    local caption_fg_colour, caption_fg_alpha = data['caption_fg_colour'], data['caption_fg_alpha']
    local tox = graph_radius * (math.cos((graph_start_angle * 2 * math.pi / 360)-(math.pi/2)))
    local toy = graph_radius * (math.sin((graph_start_angle * 2 * math.pi / 360)-(math.pi/2)))
    cairo_select_font_face (display, "ubuntu", CAIRO_FONT_SLANT_NORMAL, caption_weight);
    cairo_set_font_size (display, caption_size)
    cairo_set_source_rgba (display, rgb_to_r_g_b(caption_fg_colour, caption_fg_alpha))
    cairo_move_to (display, x + tox + 5, y + toy + 1)
    -- bad hack but not enough time !
    if graph_start_angle < 105 then
        cairo_move_to (display, x + tox - 30, y + toy + 1)
    end
    cairo_show_text (display, caption)
    cairo_stroke (display)
end


-------------------------------------------------------------------------------
--                                                               go_gauge_rings
-- loads data and displays gauges
--
function go_gauge_rings(display)
    local function load_gauge_rings(display, data)
        local str, value = '', 0
        str = string.format('${%s %s}',data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)
        draw_gauge_ring(display, data, value)
    end
    
    for i in pairs(gauge) do
        load_gauge_rings(display, gauge[i])
    end
end

-------------------------------------------------------------------------------
--                                                                         MAIN
function conky_main()
    if conky_window == nil then 
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    
    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)
    
    if update_num > 5 then
        go_gauge_rings(display)
        draw_bg()
    end

    cairo_surface_destroy(cs)
    cairo_destroy(display)

    
end

