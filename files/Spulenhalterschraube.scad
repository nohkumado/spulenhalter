// use <threads.scad>;
use <customthread.scad>;
use <knauf.scad>;

mutter(minkowsky =true);
//cube([5,5,5], center = true);

module mutter(aussenradius = 50,minkowsky = true,tol =0.5)
{
    //translate([0,0,50/3+7]) 
    difference()
    {
        knauf(29,aussenradius,minkowsky);    
          // color("blue")   
          translate([0,0, -5]) 
        cylinder(d=aussenradius-.02, h = aussenradius+4, $fn=200);
}
          //scale([1.1,1.1,1])metric_thread (diameter=50, pitch=8, length=54,  internal = true);

translate([0,0,2.2])  
 spulenmutter(l=28, aussenradius = aussenradius,pitch = 10,zahn = [15,9,.1], fn = 10) ;   
}
