feet_thickness = 20;
feet_width = 50;
height = 2000;
width = 550 - feet_thickness * 2;
depth = 600;

ply_thickness = 10;

module wood(w, h, d) {
    cube(size=[w, h, d], center=true);
    echo("Wood: ", w, h, d);
}

// Feet
translate([-(width + feet_thickness) * 0.5, -(depth - feet_width) * 0.5, height * 0.5]) {
    wood(feet_thickness, feet_width, height);
}
translate([(width + feet_thickness) * 0.5, -(depth - feet_width) * 0.5, height * 0.5]) {
    wood(feet_thickness, feet_width, height);
}
translate([-(width + feet_thickness) * 0.5, (depth - feet_width) * 0.5, height * 0.5]) {
    wood(feet_thickness, feet_width, height);
}
translate([(width + feet_thickness) * 0.5, (depth - feet_width) * 0.5, height * 0.5]) {
    wood(feet_thickness, feet_width, height);
}

// Shelves
module shelf(pos_y) {
    block_height = 50; // Doesn't really matter
    union() {
        translate([0, 0, pos_y + ply_thickness * 0.5]) {
            wood(width, depth, ply_thickness);
        }
        translate([-(width - feet_thickness) * 0.5, -(depth - feet_width) * 0.5, pos_y - block_height * 0.5]) {
           wood(feet_thickness, feet_width, block_height);
        }
        translate([(width - feet_thickness) * 0.5, -(depth - feet_width) * 0.5, pos_y - block_height * 0.5]) {
           wood(feet_thickness, feet_width, block_height);
        }
        translate([-(width - feet_thickness) * 0.5, (depth - feet_width) * 0.5, pos_y - block_height * 0.5]) {
           wood(feet_thickness, feet_width, block_height);
        }
        translate([(width - feet_thickness) * 0.5, (depth - feet_width) * 0.5, pos_y - block_height * 0.5]) {
           wood(feet_thickness, feet_width, block_height);
        }
    }
}

shelf(height - ply_thickness);
shelf(1350);

plank_width=feet_width;
translate([(width + feet_thickness) * 0.5, 0, 100]) {
    wood(feet_thickness, depth - 2 * feet_width, plank_width);
}
translate([-(width + feet_thickness) * 0.5, 0, 100]) {
    wood(feet_thickness, depth - 2 * feet_width, plank_width);
}
translate([0, (depth + feet_thickness) * 0.5, 800]) {
    wood(width + 2 * feet_thickness, feet_thickness, plank_width);
}
