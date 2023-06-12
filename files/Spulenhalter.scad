//use <threads.scad>;
use <knauf.scad>;
use <Kugellagermaske.scad>;
use <customthread.scad>;

spulenhalter(minkowsky = true, l= 150);

module spulenhalter(minkowsky = true, l=200, innenradius = 26,aussenradius = 50,pitch = 10,zahn = [15,9,.1], fn = 10)
{
     difference()
    {
      union()
      {
  //translate([0,0,zahn[1]]) bolt(designator = "special", length = l, unit="length", higbee_arc=30, table=MY_THREAD_TABLE); //;
spulenschraube(l=l, aussenradius = aussenradius,pitch = pitch,zahn = zahn, fn = fn);
												       //metric_thread (diameter=50, pitch=8, length=l,    internal = false); //taper=.2,        
	 knauf(innenradius,aussenradius,minkowsky);   
      }
      color("red")
      union()
      {
	// kugellagermaske(15,10,2);//1000ZZ
	translate([0,0,l-5.99]) kugellagermaske();
	translate([00,0,-50]) cylinder(h=l+60,r=7,$fn=80);
	translate([0,0,6.5]) rotate([180,0,0])kugellagermaske();
      }
    }
}
