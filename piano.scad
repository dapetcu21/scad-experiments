$piano_length = 1260;
$piano_depth = 290;
$piano_height = 600;
$board_width = 16;
$pedal_allowance = 50;
$piano_allowance = 70;
$board1_height = 100;
$board2_height = 200;

union()
{
    translate([($piano_length + $board_width) * 0.5, 0, $piano_height * 0.5]) {
        cube(size=[$board_width, $piano_depth, $piano_height], center=true);
    }
    translate([-($piano_length + $board_width) * 0.5, 0, $piano_height * 0.5]) {
        cube(size=[$board_width, $piano_depth, $piano_height], center=true);
    }
    translate([0, $piano_depth * 0.5 - $board_width * 0.5, $pedal_allowance + $board1_height * 0.5]) {
        cube(size=[$piano_length, $board_width, $board1_height], center=true);
    }
    translate([0, $piano_depth * 0.5 - $board_width * 0.5, $piano_height - $piano_allowance - $board2_height * 0.5]) {
        cube(size=[$piano_length, $board_width, $board2_height], center=true);
    }
}
