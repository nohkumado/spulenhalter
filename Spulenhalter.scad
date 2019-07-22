include <threads.scad>;
include <knauf.scad>;
include <Kugellagermaske.scad>;

module spulenhalter(minkowsky = true)
{
    aussenradius = 43;
    innenradius = 26;
    intersection() 
    {
    difference()
    {
        union()
        {
           metric_thread (diameter=50, pitch=8, length=110,  
            //taper=.2,
            internal = false);
           knauf(innenradius,aussenradius,minkowsky);   
        }
    
    
    
         union()
        {
            translate([0,0,100.5]) kugellagermaske();
            translate([00,0,-50]) cylinder(h=200,r=7);
           translate([0,0,6.5]) rotate([180,0,0])kugellagermaske();
            }
    }
    color("red") translate([00,0,-10]) cylinder(h=179,r1=60, r2= 1);
} 
     
}
//spulenhalter(true);
