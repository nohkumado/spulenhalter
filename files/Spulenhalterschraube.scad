//use <threads.scad>;
//use <threadlib/threadlib.scad>
use </home/bboett/Downloads/3dmodel/threadlib/threadlib.scad>
use <knauf.scad>;

mutter(minkowsky =true);
//cube([5,5,5], center = true);

module mutter(aussenradius = 50,minkowsky = true,tol =0.5)
{
    schraubend = 4*aussenradius/5;
    MY_THREAD_TABLE = [
      ["special-ext", [8, .99*(schraubend-tol)/2, schraubend-tol,    [[0, -3.8], [0, 3.8], [5, 0.3], [5, -0.3]]]],
      ["special-int", [8, -1.02*(schraubend+10+tol)/2, (schraubend+10+tol), [[0, 3.99], [0, -3.99], [4.9, -0.6], [4.9, 0.6]]]],
    ];
        specs = thread_specs("special-int", table=MY_THREAD_TABLE);
        P = specs[0]; Dsupport = specs[2];
        H = (aussenradius/2 + 1) * P ;
        turns = (schraubend+tol)/P-1;
    //translate([0,0,50/3+7]) 
    difference()
    {
       knauf(29,aussenradius,minkowsky);    
         color("blue")   
         translate([0,0, -5]) 
         cylinder (d=aussenradius, h = aussenradius);
          //scale([1.1,1.1,1])metric_thread (diameter=50, pitch=8, length=54,  internal = true);
    }
    translate([0,0,4.6668]) 
    nut("special", length =  2, unit="turns", Douter = 1.1*aussenradius,table=MY_THREAD_TABLE);
   

      //translate([0,0,-40])
      //thread("M48p8-int", length =  2, unit="turns",table=MY_THREAD_TABLE);
      //nut("M48x8", length =  2, unit="turns", Douter = 1.5*aussenradius,table=MY_THREAD_TABLE);
      //       translate([-80,0,0])
      //       difference()
      // {
      //       bolt("M48p8", length =  2, unit="turns",table=MY_THREAD_TABLE);
      // color("red")
      //       translate([0,0,19])
      // cube([30,2,3],center = true);
      // }
      //translate([80,0,0])
      //nut("M48x4", length =  2, unit="turns", Douter = 1.5*aussenradius);
      //translate([80,0,-40])
      //thread("M48x4-int", length =  2, unit="turns");

     
      //nut("M48x4", length =  schraubend+tol, unit="length", Douter = 1.5*aussenradius);
      //thread("M48p8-int", turns =  turns, table=MY_THREAD_TABLE);
//difference()
//{
      //cylinder(d=1.5*schraubend, h=aussenradius/2);
  //    translate([0,0,-1])cylinder(d=Dsupport, h=aussenradius/2+2);
//}

      //thread("M48p8-int", length =  schraubend+tol, unit="length", table=MY_THREAD_TABLE);
//color("red")
      //thread("M48p8-ext", length =  aussenradius/2, unit="length", table=MY_THREAD_TABLE);
      //thread("M48p8-int", length =  aussenradius/2, unit="length", table=MY_THREAD_TABLE);
      //bolt("M48p8", length = aussenradius/2, unit="length",table=MY_THREAD_TABLE);
      //nut("M48p8", length = aussenradius/2, unit="length", Douter = 1.5*aussenradius,table=MY_THREAD_TABLE);

      ////thread("special", turns=15, table=MY_THREAD_TABLE);

      //color("magenta")
      //translate([0,0,4])
}
