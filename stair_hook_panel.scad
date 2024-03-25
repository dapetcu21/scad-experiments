use <catchnhole/catchnhole.scad>;

$panel_width = 100;
$panel_height = 100;
$panel_thickness = 8;
$bolts_placement = 25;
$bolts_distance = 80;
$bolt_type = "M4";
$hook_thickness = 2;

module roundedcube(xdim ,ydim ,zdim, rdim) {
  hull() {
    translate([rdim,rdim,0]) cylinder(h=zdim,r=rdim);
    translate([xdim-rdim,rdim,0]) cylinder(h=zdim,r=rdim);
    translate([rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim);
    translate([xdim-rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim);
  }
}

module bolt_and_nut()
{
    rotate([90, 0, 0])
    {
        nutcatch_parallel($bolt_type);
        bolt($bolt_type, length=$panel_thickness + $hook_thickness, kind="countersunk");
    }
};

difference()
{
    translate([-$panel_width / 2, $panel_thickness, 0]) rotate([90, 0, 0])
        roundedcube($panel_width, $panel_height, $panel_thickness, 7);
    
    translate([0, $panel_thickness, $bolts_placement])
    {
        translate([-$bolts_distance / 2, 0, 0]) bolt_and_nut();
        translate([$bolts_distance / 2, 0, 0]) bolt_and_nut();
    };
}