include <Spulenhalter.scad>
include <Spulenhalterschraube.scad>
translate([0,0,48])
{   
    spulenhalter();
    translate([200,0,0])rotate([180,0,0]) mutter();
}