use <../../masken/metrische_masken.scad>;
color("grey")translate([0,0,215])rotate([90,0,0])translate([0,0,-105])cylinder(d=9.5, h = 210);
translate([0,-105,215])AchsenScharnier(axd = 10);

module AchsenScharnier(axd = 10)
{

  //oberbau
  translate([0,-2*axd,1.5*axd]) AchsenHalter(axd );
  translate([0,4*axd,1.5*axd]) rotate([0,0,180])AchsenHalter(axd );
  cube([30,10*axd+5,5],center = true);
  translate([0,4*axd+5,-8])rotate([0,0,30])cylinder(d2 = 30,d1=2, h=5, $fn=3);

  //unterbau
  difference()
  {
    translate([0,0,-15])union()
    {
      translate([0,3*axd,0])cube([30,4*axd+5,10],center = true);//Auflage
      color("red")translate([0,-3*axd,0])cube([30,4*axd+5,10],center = true);//Auflage
    }
    color("blue") translate([0,0,-19]) rotate([0,0,90])waagesensor(30);
  }
}//module AchsenScharnier()

module AchsenHalter(axd = 10)
{
  difference()
  {
    cube([3*axd,2.5*axd,2.5*axd], center = true);
    union()
    {
      rotate([90,0,0])translate([0,0,-1.5*axd])cylinder(d=axd, h = 3*axd);
      translate([0,-0.5*axd,0])
        rotate([90,0,0])
        metrische_mutter_schablone(axd,startw = 0, toleranz = 0.1); //creates a Maxd nut, rotated by 30deg and with an added .1 width
    }
  }
}//module AchsenScharnier()

module waagesensor(maske = 0)
{
  loecher = [[19,3],[35,3],[-35,4],[-19,4]];
  if(maske == 0)
  {
    difference()
    {
      cube([80.3,12.7,12.7], center = true);
      union()
      {
        translate([-3.75,8,0])rotate([90,0,0])cylinder(d=10.2, h=15);
        translate([3.75,8,0])rotate([90,0,0])cylinder(d=10.2, h=15);

        for(x= loecher){translate([x[0],0,-maske/2]) metrische_schraube(DIN912, x[1],laenge = maske);
        }
      }
    }
  }
  else
  {
    cube([80.3,12.7,12.7], center = true);
    translate([-3.75,25,0])rotate([90,0,0])cylinder(d=10.2, h=50);
    translate([3.75,25,0])rotate([90,0,0])cylinder(d=10.2, h=50);
    for(x= loecher)
    {
      translate([x[0],0,maske/3]) rotate([180,0,0])metrische_schraube_schablone(0, x[1],laenge = maske);
    }
  }
}//module waagesensor(axd = 10)
