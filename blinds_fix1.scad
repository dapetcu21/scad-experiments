$inner_radius = 15.8/2;
$outer_radius = $inner_radius + 10.5;
$inner_bevel = 18.2 / 2 - $inner_radius;
$height = 1.5;
$notch_size = 0.8;
$num_notches = 6;
$bevel_thickness = 1;
$bevel_height = 2.1 - $height;

$fa = 0.5;
$fs = 0.5;

union()
{
    linear_extrude($height)
    {
        difference()
        {
            circle($outer_radius);
            circle($inner_radius);
            for(i = [1:1:$num_notches])
                rotate([0, 0, i * 360 / $num_notches])
                    translate([$inner_radius, 0, 0])
                        polygon([
                            [-$notch_size, $notch_size*2], 
                            [-$notch_size, -$notch_size*2], 
                            [$notch_size, 0]
                        ]);
        }
    };
        
    translate([0, 0, $height])
        rotate_extrude()
            translate([-$inner_radius - $bevel_thickness - $inner_bevel, 0, 0])
                polygon([
                    [-$bevel_thickness * 0.5, 0], 
                    [$bevel_thickness, 0], 
                    [$bevel_thickness, $bevel_height], 
                    [0, $bevel_height]
                ]);
}