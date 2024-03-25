module planter()
{
    translate([190, 130, 0])
    import("planter.stl");
}

module planter_solid()
{
    translate([190, 130, 0])
    import("planter_solid.stl");
}

module bottom()
{
    translate([0, 0, 15]) linear_extrude(height = 5) circle(50);
}

module main()
{
    union()
    {
        planter();
        intersection()
        {
            bottom();
            planter_solid();
        }
    }
}

//main();
//bottom();
planter();
planter_solid();