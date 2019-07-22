include <threads.scad>;
include <knauf.scad>;


module mutter(minkowsky = true)
{
    //translate([0,0,50/3+7]) 
    difference()
    {
        knauf(29,50,minkowsky);    
          color("blue")   
          translate([0,0, -5]) 
          scale([1.1,1.1,1])metric_thread (diameter=50, pitch=8, length=54,  internal = true);
    }
}
//mutter(false);
