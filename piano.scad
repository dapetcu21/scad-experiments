$piano_length = 1260;
$piano_depth = 290;
$piano_height = 600;
$board_thickness = 16;
$pedal_allowance = 50;
$piano_allowance = 70;
$back_height = 400;
$support_width = 100;

translate([($piano_length + $board_thickness) * 0.5, 0, $piano_height * 0.5]) {
    cube(size=[$board_thickness, $piano_depth, $piano_height], center=true);
}
translate([-($piano_length + $board_thickness) * 0.5, 0, $piano_height * 0.5]) {
    cube(size=[$board_thickness, $piano_depth, $piano_height], center=true);
}
translate([0, $piano_depth * 0.5 - $board_thickness * 0.5, $pedal_allowance + $back_height * 0.5]) {
    cube(size=[$piano_length, $board_thickness, $back_height], center=true);
}
translate([0, $piano_depth * 0.5 - $support_width * 0.5, $piano_height - $piano_allowance - $board_thickness * 0.5]) {
    cube(size=[$piano_length, $support_width, $board_thickness], center=true);
}
