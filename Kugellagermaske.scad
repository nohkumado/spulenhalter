module kugellagermaske()
{
    union()
    {
        difference()
        {
            cylinder(h=10,r=15,$fn=64);
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
                 translate([15,00,-1])
             difference()
                 {
                   cylinder(h=12,r=2,$fn=32);
                   translate([0,-2,-1])cube([2,4,14]);
                 }
             
             }
         }
         color("green") 
     translate([0,00,-10])
     cylinder(h=10,r1=1,r2=15,$fn=64);
     }
         
 }
 //kugellagermaske();