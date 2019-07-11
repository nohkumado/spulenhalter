include <threads.scad>;
include <knauf.scad>;


module mutter()
{
    difference()
    {
        knauf(29,50);    
          color("blue")   
          translate([0,0, -45]) 
          metric_thread (diameter=52, pitch=14, length=54,  internal = true);
    }
}

//mutter();
