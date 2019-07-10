include <threads.scad>;
include <knauf.scad>;
include <Kugellagermaske.scad>;

difference()
{
union()
{
   metric_thread (diameter=52, pitch=14, length=110,  internal = false);
    rotate([180,0,0])  knauf();   
}



union()
{
translate([0,0,100.5]) kugellagermaske();
translate([0,0,-47.5]) kugellagermaske();
color("red") translate([00,0,-50]) cylinder(h=200,r=7);
}
}