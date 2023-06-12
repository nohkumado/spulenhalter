use <../../../threadlib/threadlib.scad>;
/**
function circle to round up the point of the thread profile
and spulenschraube with a cuistom thread

to adjust the tooth shape, to your liking: 
       polygon(MY_THREAD_TABLE[0][1][3]);
*/
//sample function
difference()
{
	union()
	{
	// color("blue")  spulenschraube(l=50, aussenradius = 50,pitch = 10,zahn = [15,9,.1], fn = 0);
translate([0,0,-1])spulenmutter(l=40, aussenradius = 50,pitch = 10,zahn = [15,9,.1], fn = 10);
		
	}
translate([-75/2,0,-1])cube([75,75,50]);
}
// aussenradius = 50;pitch = 10;zahn = [15,9,.1]; fn = 10;
  // MY_THREAD_TABLE = threaddata(pitch,aussenradius, zahn,fn=10, alpha=-40,omega=40);
	// echo("data", MY_THREAD_TABLE);
  // thread(designator = "M50xc-ext", length = 10, unit="length", higbee_arc=30, table=MY_THREAD_TABLE); //;
  // thread(designator = "M50xc-int", length = 10, unit="length", higbee_arc=30, table=MY_THREAD_TABLE); //;
	// color("blue")
  // translate([0,0,5*zahn[1]]) thread(designator = "M55x4-ext", length = 10, unit="length", higbee_arc=30); //;
  // translate([0,0,6*zahn[1]]) thread(designator = "M55x4-int", length = 10, unit="length", higbee_arc=30); //;
	// spec1 = thread_specs(designator = "M50xc-ext", table=MY_THREAD_TABLE);
	// color("red")
	// translate([spec1[1],0,0])polygon(spec1[3]);
	// spec2 = thread_specs(designator = "M50xc-int", table=MY_THREAD_TABLE);
	// translate([-spec2[1],0,0.5])polygon(spec2[3]);
	// echo("drot:",spec1[1],spec2[1]," delta ",(spec1[1]+spec1[2]));
	// spec3 = thread_specs(designator = "M55x4-ext");
	// color("red")
	// translate([spec3[1],0,1])polygon(spec3[3]);
	// spec4 = thread_specs(designator = "M55x4-int");
	// translate([-spec4[1],0,1.5])polygon(spec4[3]);
	// echo("drotorg:",spec3[1],spec4[1]," delta ",(spec3[1]+spec4[2]));

//----------------------- library ----------------------------------
function circle(r, alpha, dx= 0, dy= 0)= [dx+r*cos(alpha),dy+r*sin(alpha)];  

function threaddata(pitch,aussenradius, zahn,fn=10, alpha=-40,omega=40)= 
let(
  dzx =  zahn[0]/2,
  dzy =  zahn[1]/2,
  d3x = zahn[2]*zahn[0],
  d3y = zahn[2]*zahn[1]
)[
    //[DESIGNATOR, [P, Rrot, Dsup, profile]]
    //["special", [pitch, outer_diameter/2, inner_diameter,
    [
         "M50xc-ext", [pitch, aussenradius/2-dzx-2, 1.09*(aussenradius - zahn[0]-4), [
                     // [0, _tr], [0, -_tr], [_tr/2, -_tr], //basis * left side
                              // for(w=[-90:step:90]) circle(r=_tr,alpha=w, dx=_tr),
                             // [_tr/2, _tr]
                     [0, dzy], [0, -dzy], [dzx, -d3y], //basis * left side

// [zahn[0], -dzy],
                              for(w=[alpha:fn:omega]) circle(r=d3y,alpha=w, dx=dzx),
                             [dzx, d3y]
                            ]
                    ],
				],
				[
					"M50xc-int", [pitch,  -(aussenradius/2+1), 1.15*(aussenradius), [
                     // [0, _tr], [0, -_tr], [_tr/2, -_tr], //basis * left side
                              // for(w=[-90:step:90]) circle(r=_tr,alpha=w, dx=_tr),
                             // [_tr/2, _tr]
                     [0, -1.12*dzy], [0, 1.12*dzy], [0.95*dzx, 1.5*d3y], 
                              for(w=[omega:-fn:alpha]) circle(r=1.5*d3y,alpha=w, dx=0.88*dzx),
                             [0.95*dzx, -1.5*d3y]
                            ]
                    ],
						
									],
									["M55x4-ext", [4, 24.8210, 50.1260, [[0, -1.7456], [0, 1.7456], [2.5315, 0.2841], [2.5315, -0.2841]]]],
["M55x4-int", [4, -27.9460, 55.4460, [[0, 1.9620], [0, -1.9620], [2.4610, -0.5412], [2.4610, 0.5412]]]],

      ];


			
module spulenschraube(l=110, aussenradius = 50,pitch = 10,zahn = [15,9,.1], fn = 10)
{
  MY_THREAD_TABLE = threaddata(pitch,aussenradius, zahn,fn=10, alpha=-40,omega=40);
	
      // echo ("special : ",MY_THREAD_TABLE[0]);
      // echo ("special defs : ",MY_THREAD_TABLE[0][1][3]);
      // echo ("poly: ",MY_THREAD_TABLE[0][1][4]);

  translate([0,0,zahn[1]]) bolt(designator = "M50xc", length = l, unit="length", higbee_arc=30, table=MY_THREAD_TABLE); //;
}

module spulenmutter(l=110, aussenradius = 50,pitch = 10,zahn = [15,9,.1], fn = 10)
{
  MY_THREAD_TABLE = threaddata(pitch,aussenradius, zahn,fn=10, alpha=-40,omega=40);
	
      // echo ("special : ",MY_THREAD_TABLE[0]);
      // echo ("special defs : ",MY_THREAD_TABLE[0][1][3]);
       // echo ("poly: ",MY_THREAD_TABLE[1][1][3]);

       // color("red")translate([50,0,0])polygon(MY_THREAD_TABLE[0][1][3]);
       // color("green")translate([50,0,2])polygon(MY_THREAD_TABLE[1][1][3]);

nut(designator= "M50xc", length = l, unit="length", higbee_arc=30, Douter=aussenradius+zahn[0], table=MY_THREAD_TABLE); //;
  // thread(designator= "special", length = l, unit="length", higbee_arc=30, table=MY_THREAD_TABLE); //;
}
