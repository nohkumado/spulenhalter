include <threads.scad>;
include <knauf.scad>;


module mutter()
{
    difference()
    {
        knauf(26,70);    
          color("blue")   
          translate([0,0, -4]) 
          metric_thread (diameter=52, pitch=14, length=54,  internal = true);
    }
}

mutter();
