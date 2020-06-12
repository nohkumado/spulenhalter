//use <threads.scad>;
use </home/bboett/Downloads/3dmodel/threadlib/threadlib.scad>
use <knauf.scad>;
use <Kugellagermaske.scad>;

 spulenhalter(l = 130,minkowsky = true);

module spulenhalter(l = 200,minkowsky = true, tol = .5)
{
  aussenradius = 50;
  schraubend = 4*aussenradius/5;
  innenradius = 26;
  //intersection() 
  //{
    difference()
    {
      union()
      {
        //metric_thread (diameter=50, pitch=8, length=l-90,  
        //bolt("M10", turns=50);
        //bolt("M36");
        //bolt("M36", turns = 56.2);
    MY_THREAD_TABLE = [
      ["special-ext", [8, .99*(schraubend-tol)/2, schraubend-tol,    [[0, -3.8], [0, 3.8], [5, 0.3], [5, -0.3]]]],
      ["special-int", [8, -1.02*(schraubend+10+tol)/2, (schraubend+10+tol), [[0, 3.99], [0, -3.99], [4.9, -0.6], [4.9, 0.6]]]],
    ];
                   //["special", [pitch,//distance crete a crete
                   // Rrot,             //internanl radius thread
                   //Dsupport,          //diameter bolt ?? same as Rrot, no?
                   //[[r0, z0], [r1, z1], ..., [rn, zn]]]] //radius, zpos to draw shape of teeth

//thread("special", turns=15, table=MY_THREAD_TABLE);

color("magenta")
        translate([0,0,aussenradius/2])
        bolt("special", length = l, unit="length",table=MY_THREAD_TABLE);
//color("blue")
        //translate([aussenradius,0,aussenradius/2])cylinder(r=aussenradius, h = l);
            //taper=.2,
            //internal = false);
color("black")
        knauf(innenradius,aussenradius,minkowsky);   
      }
      union()
      {
        //kugellagermaske(15,10,2);//1000ZZ
color("blue")
        translate([0,0,l+aussenradius/2-13]) kugellagermaske();
        translate([00,0,-50]) cylinder(h=1.5*l,r=7);
        translate([0,0,6.5]) rotate([180,0,0])kugellagermaske();
      }
    }
   // color("red") translate([00,0,-10]) cylinder(h=l+aussenradius/tan(45),r1=aussenradius+l*tan(45), r2= 1); //tapering
  //} 

}
//spulenhalter(true);
