module kugellagermaske(durchm = 15, hoehe = 10,stift = 2)
{
  //union()
  {
    difference()
    {
      cylinder(h=hoehe,r=durchm,$fn=64);
      for(i = [ [  0,  0,   0],
          [ 0, 00, 45],
          [ 0, 00, 90],
          [ 0, 00, 135],
          [ 0, 00, 180],
          [0, 0,  225],
          [ 0, 0,  270],
          [ 0, 0,  315],
      ])
      {
        rotate(i)
          translate([durchm,00,-stift/2])
          difference()
          {
            cylinder(h=hoehe+2,r=stift,$fn=32);
            translate([0,-stift,-1])cube([stift,2*stift,durchm-1]);
          }

      }
    }
    translate([0,00,-hoehe])
      cylinder(h=hoehe,r1=1,r2=durchm,$fn=64);//progressive cone
  }

}
//kugellagermaske();
//kugellagermaske(11.5,8,1);//608
