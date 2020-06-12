use <Spulenhalter.scad>
use <Spulenhalterschraube.scad>
smooth = true;
translate([98,0,0]) mutter(minkowsky = smooth);//true with minkowsky
spulenhalter(minkowsky = smooth);
