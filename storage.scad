$feet_thickness = 18;
$feet_width = 100;
$height = 2000;
$width = 600;
$depth = 800;

$ply_thickness = 10;

// Feet
translate([-($width + $feet_thickness) * 0.5, -($depth - $feet_width) * 0.5, $height * 0.5]) {
    cube(size=[$feet_thickness, $feet_width, $height], center = true);
}
translate([($width + $feet_thickness) * 0.5, -($depth - $feet_width) * 0.5, $height * 0.5]) {
    cube(size=[$feet_thickness, $feet_width, $height], center = true);
}
translate([-($width + $feet_thickness) * 0.5, ($depth - $feet_width) * 0.5, $height * 0.5]) {
    cube(size=[$feet_thickness, $feet_width, $height], center = true);
}
translate([($width + $feet_thickness) * 0.5, ($depth - $feet_width) * 0.5, $height * 0.5]) {
    cube(size=[$feet_thickness, $feet_width, $height], center = true);
}

// Shelfs
module shelf($pos_y) {
    $block_height = 50;
    union() {
        translate([0, 0, $pos_y + $ply_thickness * 0.5]) {
            cube(size=[$width, $depth, $ply_thickness], center=true);
        }
        translate([-($width - $feet_thickness) * 0.5, -($depth - $feet_width) * 0.5, $pos_y - $block_height * 0.5]) {
           cube(size=[$feet_thickness, $feet_width, $block_height], center=true); 
        }
        translate([($width - $feet_thickness) * 0.5, -($depth - $feet_width) * 0.5, $pos_y - $block_height * 0.5]) {
           cube(size=[$feet_thickness, $feet_width, $block_height], center=true); 
        }
        translate([-($width - $feet_thickness) * 0.5, ($depth - $feet_width) * 0.5, $pos_y - $block_height * 0.5]) {
           cube(size=[$feet_thickness, $feet_width, $block_height], center=true); 
        }
        translate([($width - $feet_thickness) * 0.5, ($depth - $feet_width) * 0.5, $pos_y - $block_height * 0.5]) {
           cube(size=[$feet_thickness, $feet_width, $block_height], center=true); 
        }
    }
}

shelf($height - $ply_thickness);
shelf(1000);
shelf(1500);
shelf(1250);
