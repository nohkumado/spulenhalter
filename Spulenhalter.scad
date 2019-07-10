include <threads.scad>;
include <knauf.scad>;
//ccylinder(h = 110,  r1 = 26, r2 = 26, center = true);
   metric_thread (diameter=52, pitch=14, length=110,  internal = false);
    rotate([180,0,0])knauf();   

