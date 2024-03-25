use <catchnhole/catchnhole.scad>;

$width = 16.7;
$length = 22.8;
$length_min = 18.6;
$inner_piece_thickness = 2;
$clip_width = 8;

$half_width = $width / 2;
$d_length = $length - $length_min;

$arc_radius = ($d_length * $d_length + $half_width * $half_width) / ($d_length * 2);

$foot_thickness = 3.5;
$foot_height = 23.5;
$base_length = 35.5 - $foot_thickness;
$base_width = 36;
$base_bottom_thickness = 2.5;
$base_thickness = 7.5;
$base_width_min = $width + 6;
$tolerance = 0.3;
$rail_width = 2;

$clip_height = $base_thickness - $base_bottom_thickness + 2 * $tolerance;
$clip_length = 6;

$fs = 0.5;
$fa = 1;

module inner_piece_base()
{
    union()
    {
        intersection()
        {
            translate([0, -$half_width])
                square([$d_length, $width]);
            
            translate([$arc_radius, 0])
                circle($arc_radius);
        }
        translate([$d_length, -$half_width])
            square([$length - $d_length, $width]);
    }
}

module lip()
{
    difference()
    {
        intersection()
        {
            translate([0, -$half_width])
                square([$arc_radius, $width]);
            
            translate([$arc_radius, 0])
                circle($arc_radius);
        }
        
        translate([$arc_radius, 0])
            circle($arc_radius - 1.2);
    }
}

module axle()
{
    translate([6.5, 0]) difference()
    {
        circle(5);
        circle(3);
    }
}

module clip()
{
    polygon([
        [-$inner_piece_thickness, 0],
        [-$inner_piece_thickness, $clip_height + $inner_piece_thickness],
        [-$inner_piece_thickness, $clip_height + $inner_piece_thickness],
        [$clip_length, $clip_height + $inner_piece_thickness],
        [$clip_length, $clip_height],
        [1.5 + 2 * $tolerance, $clip_height - 1],
        [1.5 + 2 * $tolerance, $clip_height],
        [0, $clip_height],
        [0, 0]
    ]);
}

module inner_piece()
{
    translate([0, 0, $base_bottom_thickness]) difference()
    {
        union()
        {
            linear_extrude($inner_piece_thickness) inner_piece_base();
            linear_extrude(4.8) lip();
            linear_extrude(12) axle();
            
            translate([$length, 0, 0])
                rotate([90, 0, 0])
                    linear_extrude($clip_width, center = true)
                        clip();
        }
                        
        translate([$length, 0, 0])
            for(i = [-1 : 2 : 1])
                scale([-1, i, 1])
                    translate([0, $clip_width / 2, 0])
                        cube([9, 1, $inner_piece_thickness]);
    }
}

module base_profile()
{
    hull()
    {
        intersection()
        {
            translate([0, -$base_width_min / 2])
                square([$base_length, $base_width_min]);
            
            translate([$arc_radius, 0])
                circle($arc_radius);
        }
        translate([$base_length, -$base_width / 2])
            square([$foot_thickness, $base_width]);
    }
}

module base_sliders()
{
    difference()
    {
        linear_extrude($base_thickness) base_profile();
        
        translate([0, -($width / 2 + $tolerance), $base_bottom_thickness])
            cube([$length + $tolerance, $width + 2 * $tolerance, $inner_piece_thickness + 2 * $tolerance]);
            
        translate([0, -($width / 2 - $rail_width), $base_bottom_thickness])
            cube([$length + $tolerance, $width - 2 * $rail_width, 100]);
        
        translate([$length + $tolerance + 1, -($width / 2 - $rail_width), $base_bottom_thickness])
            cube([7.5, $width - 2 * $rail_width, 100]);
            
        chip = 6.8;
        translate([chip / 2, 0, $base_bottom_thickness + 50])
            cube([chip, $width + 2 * $tolerance + 100, 100], center = true); 
    }
}

module base_foot()
{
    translate([$base_length, 0, 0]) difference()
    {
        translate([0, -$base_width / 2, 0])
            cube([$foot_thickness, $base_width, $foot_height]);
        
        for (i = [-1 : 2 : 1])
        {
            translate([0, i * 12, 14])
                rotate([0, -90, 0])
                    translate([0, 0, -10])
                        bolt("M4", length = 10, kind = "countersunk");
        }
    }
}

module base()
{
    union()
    {
        base_sliders();
        base_foot();
    }
}

// inner_piece();
base();