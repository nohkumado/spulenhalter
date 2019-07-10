include <threads.scad>;
include <knauf.scad>;
//ccylinder(h = 110,  r1 = 26, r2 = 26, center = true);
   // metric_thread (diameter=52, pitch=3, length=110,  internal = false);
difference()
{
    knauf();   
 
    //union()
    //{
      color("blue")   
      translate([0,0, -4]) 
      metric_thread (diameter=52, pitch=14, length=54,  internal = true);
    //color("blue")   translate([0,0, 116]) cylinder(h = 54,  r1 = 24, r2 = 24,$fa = 3);
    //}
}

