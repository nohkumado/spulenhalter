include <threads.scad>;
include <knauf.scad>;
include <Kugellagermaske.scad>;

module spulenhalter()
{
    difference()
    {
        union()
        {
           metric_thread (diameter=52, pitch=14, length=110,  internal = false);
            knauf(26,43);   
        }
    
    
    
        union()
        {
            translate([0,0,100.5]) kugellagermaske();
            color("red")  translate([0,0,-11.5]) rotate([180,0,0])kugellagermaske();
            translate([00,0,-50]) cylinder(h=200,r=7);
        }
    }
}
//spulenhalter();
