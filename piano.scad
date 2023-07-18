piano_length = 1325; // This matters so that the edges are flush
piano_depth = 285; // This unfortunately matters, will mean cutting 15mm off a 300mm board
piano_height = 600;
board_thickness = 18;
pedal_allowance = 70;
piano_allowance = 70; // 5mm tolerance is ok here
back_height = piano_height - piano_allowance - pedal_allowance - board_thickness;
back_length = piano_length - 2 * board_thickness;
support_width = 600 - back_height - 2; // Wood width is 600, cut is 2mm

module wood(w, h, d) {
    cube(size=[w, h, d], center=true);
    echo("Wood: ", w, h, d);
}

translate([(piano_length - board_thickness) * 0.5, 0, piano_height * 0.5]) {
    wood(board_thickness, piano_depth, piano_height);
}
translate([-(piano_length - board_thickness) * 0.5, 0, piano_height * 0.5]) {
    wood(board_thickness, piano_depth, piano_height);
}
translate([0, piano_depth * 0.5 - board_thickness * 0.5, pedal_allowance + back_height * 0.5]) {
    wood(back_length, board_thickness, back_height);
}
translate([0, piano_depth * 0.5 - support_width * 0.5, piano_height - piano_allowance - board_thickness * 0.5]) {
    wood(back_length, support_width, board_thickness);
}