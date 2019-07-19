include <threads.scad>;
include <knauf.scad>;
include <Kugellagermaske.scad>;

module spulenhalter()
{
    aussenradius = 43;
    innenradius = 26;
    
    translate([0,0,aussenradius/3+7])
    //difference()
    //{
    difference()
    {
        union()
        {
           metric_thread (diameter=52, pitch=14, length=110,  internal = false);
           knauf(innenradius,aussenradius);   
        }
    
    
    
        union()
        {
            translate([0,0,100.5]) kugellagermaske();
            translate([00,0,-50]) cylinder(h=200,r=7);
        }
    }
        color("red")    translate([0,0,9.5]) rotate([180,0,0])kugellagermaske();
     
//}
}
//spulenhalter();
