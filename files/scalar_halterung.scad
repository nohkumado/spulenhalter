use <../../masken/metrische_masken.scad>;
use <../../masken/hinge.scad>;
use <../../masken/hammernut.scad>;
use <../../../mechanical/profile_30x30/extrusion_profile.scad>;
openingAngle  =00; //careful doesn't work
toleranz = 0.4;
translate([0,099,242])
{
  //color("grey") 
  //translate([0,105*(1-sin(openingAngle)),105*sin(openingAngle)])
  %translate([0,-210-34*sin(openingAngle),30/2*(1-cos(openingAngle))])
    translate([0,105,0])
    rotate([openingAngle,0,0])
    rotate([-90,0,0])
    cylinder(d=10, h = 210);
  translate([0,-72,-34/2]) AchsenScharnier(axd = 10, angle = openingAngle, width = 34, tol= toleranz);
}
color("grey") translate([0,027.0,208.0]) rotate([0,0,90]) %waagesensor(0);
color("grey") %extrusion_profile(size=30, height=200);
//translate([40,0,0]) //kappe();

//ScharnierHalterung();
//waagesensor(30);
module kappe(profil= 30,h1 = 5, h2=20)
{
  difference()
  {
    union()
    {
      color("red")
        translate([0,0,h1/2]) cube([profil+4,profil+4,h1],center = true);
      translate([0,0,h1+h2/2]) cube([profil-.5,profil-.5,h2],center = true);
    }
    translate([0,0,h1])
    {
      scale([1.15,1.15,1]) extrusion_profile(size=profil, height=h2+h1);
      extrusion_profile(size=profil, height=h2+h1);
      scale([0.92,0.92,1]) extrusion_profile(size=profil, height=h2+h1);
    }
  }

}

module ScharnierHalterung()
{
  //basisplatform
  translate([15,0,30])
  {
    scale([1,0.95,0.95])
      translate([-50,0,0])
      rotate([0,0,90])
      aluInsert(alpro = profile(30), h = 100);
    translate([-50,0,1])
      cube([100,30,2],center=true);
  }
}//module ScharnierHalterung()
module AchsenScharnier(axd = 10, angle = 45, width = 30, tol = 0.1)
{

  //oberbau
  translate([0,-(10*axd+5)/2,0])
    rotate([angle,0,0])
    translate([0,+(10*axd+5)/2,0])
    difference()
    {
      union()
      {
        translate([0,-2*axd,1.5*axd]) 
        {
          AchsenHalter(axd );
          dreieck = [ [0,0], [2.0*axd,0], [0,2.5*axd] ];
          color("magenta")
            translate([15,-2.5*axd/2,-2.5*axd/2])
            rotate([90,0,-90])
            linear_extrude(height=2)
            polygon(dreieck);
          color("red")
            translate([-13,-2.5*axd/2,-2.5*axd/2])
            rotate([90,0,-90])
            linear_extrude(height=2)
            polygon(dreieck);

        }
        translate([0,4*axd,1.5*axd]) rotate([0,0,180])AchsenHalter(axd );
        cube([34,10*axd+5,5],center = true);//Halteplatte
        translate([0,4*axd+5,-8])rotate([0,0,30])cylinder(d2 = width,d1=2, h=5, $fn=3);//Druckspitze
      }
    }

  //color("magenta")
  translate([0,-4.7*axd -7,-6.25])
    rotate([0,90,0])
    translate([0,0,-width/2])
    {
      hinge(outd=10,axe= 5,h=width,parts=5, tol =tol, print ="left", plate = "bottom",fld=2.4, opento= -90, maxalpha = 56, cutoutd =1); 
      hinge(outd=10,axe= 5,h=width,parts=5, tol =tol, print ="right", plate = "bottom",fld=2.4, opento= 90, maxalpha = 56, cutoutd =2); 
    }



  //color("black")
  //unterbau
  difference()
  {
    union()
    {
      translate([0,0,-width/2])
      {
        translate([0,3*axd,0])cube([width,4*axd+5,10],center = true);//Auflage, Gewicht
        translate([0,-3*axd,-3.5])cube([width,4*axd+5,17],center = true);//Auflage
      }
    }
    union()
    {
      color("blue") translate([0,0,-19]) rotate([0,0,90])waagesensor(30);
      //translate([0,-4.7*axd-2.6,-6.25])
      //  rotate([0,0,180])
      //  rotate([0,90,0]) translate([0,0,-width/2])
      //  hinge(outd=10,axe= 2,h=width,parts=5, tol =tol,mask = 2*tol,print="left", plate = "top",fld=2.4, opento= 90); 
      translate([0,-4.7*axd-2.6,-6.25])
        //scale([1.1,1.1,1.1])
      {
        //     rotate([-90,0,0])rotate([0,90,0])translate([0,0,-width/2])
        //       hinge(outd=10,axe= 2,h=width,parts=5, tol =tol,print="rigth", plate = "bottom",fld=0, opento= 0); 
        //     rotate([-90,0,0])
        //       rotate([0,-90,0])
        //       translate([0,0,-width/2])
        //       hinge(outd=10,axe= 2,h=width,parts=5, tol =tol,print="right", plate = "bottom",fld=0, opento= 0); 
      }
    }
  }
  translate([0,-27,-26.25])
  {
    color("red")
      rotate([180,0,0]) kappe(30,10,20);
  }
}//module AchsenScharnier()

module AchsenHalter(axd = 10, tol = 0.1)
{
  difference()
  {
    cube([3*axd,2.5*axd,2.5*axd], center = true);
    union()
    {
      rotate([90,0,0])translate([0,0,-1.5*axd])cylinder(d=axd+4*tol, h = 3*axd);
      translate([0,-0.5*axd,0])
        rotate([90,0,0])
        metrische_mutter_schablone(axd,startw = 0, toleranz = tol); //creates a Maxd nut, rotated by 30deg and with an added .1 width
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
      sensorKoerper();

      union()
      {
        translate([-3.75,8,0])rotate([90,0,0])cylinder(d=10.2, h=15,$fn=200);
        translate([3.75,8,0])rotate([90,0,0])cylinder(d=10.2, h=15,$fn=200);

        for(x= loecher){translate([x[0],0,-15]) metrische_schraube_schablone(0, x[1],laenge = 30);
        }
      }
    }
  }
  else
  {
    sensorKoerper();
    translate([-3.75,25,0])rotate([90,0,0])cylinder(d=10.2, h=50,$fn=200);
    translate([3.75,25,0])rotate([90,0,0])cylinder(d=10.2, h=50,$fn=200);
    for(x= loecher)
    {
      translate([x[0],0,maske/3]) rotate([180,0,0])metrische_schraube_schablone(0, x[1],laenge = maske);
    }
  }
}//module waagesensor(axd = 10)
module sensorKoerper()
{
  cube([80.3,12.7,12.7], center = true); //hauptkoerper
  translate([0,0,12.7/2]) //Klebepatch
    cube([20.3,12.7,1], center = true); //Klebepatch
  translate([0,0,-12.7/2]) //Klebepatch
    cube([20.3,12.7,1], center = true); //Klebepatch
  //Pfeil
  translate([80.3/2,0,0]) 
  {
    cube([1,1,12.7], center = true); //hauptkoerper
    translate([0,0,-12.7/4]) 
      rotate([0,90,0])
      cylinder(d=12.7/2, h = 1, $fn=3);
  }
  //SensorKabel
  color("red")
    translate([-20,12.7/2,0]) 
    cube([31,1,12.7], center = true); //Klebepatch
}//module sensorKoerper()
