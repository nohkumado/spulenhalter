module knauf(innen,aussen)
{
    hoehe = aussen/3;
    rotate([180,0,0])
    difference() //mit Augen
    {
            union() //Koerper
            {
                  translate([0,0, 0]) cylinder(h = hoehe, r1 = innen, r2 = aussen,$fa = 3);
                //hull()
                //{  
                translate([0,0, hoehe-1]) cylinder(h = 8,  r1 = aussen, r2 = aussen,$fa = 3);
                //color("red")translate([0,0, aussen/2]) rotate_extrude(convexity = 10)
//translate([aussen-2, 0, 0])
//circle(r = 4.2, $fn = 100);
                //}
            }
        
            union() //was Auszuschneiden ist
            {
                union() //4 Ausschnitte
                {
                     translate([0,0, -2])
                    linear_extrude(height = hoehe+30, center = false, convexity = 10, twist = 0)
                    {
                        for(i = [ [  0,  0,   0],
                                   [ 0, 0, 90],
                                   [0, 0,  180],
                                   [ 0, 0,  270] ])
                        {
                           rotate(i)
                        //rotate([  00,  0,   90])
                           translate([0.61*aussen,0, 0])
                            hull() 
                            {
                                translate([0.37*aussen,00,0]) circle(innen);
                                circle(innen/2);
                            }
                        }
                    }
                }//4 Ausschnitte
        
                union() //4 Augen
                {
                    color("green")translate([0,0,-2])
                linear_extrude(height = 50, center = false, convexity = 10, twist = 0)
                    {
                  
                        for(i = [ [  0,  0,   45],
                                   [ 0, 0, 135],
                                   [0, 0,  225],
                                   [ 0, 0,  315] ])
                        {
                           rotate(i)
                           {
                               translate([0.4*aussen,00,0])
                               polygon(points=[
                                /*[0,-8],[2,-10],[10,-12], //LLR
                                [20,-16],
                                [32,-23],[34,-22],[36,-21],//UUR
                                [37,-10],[38,0],[37,10],
                                [36,21],[34,22],[32,23],//UUL
                                [20,16],
                                [10,12],[2,10],[0,8] //LLL
                               */
                               [0,-innen/4-2], [2,-innen/4-4], [6,-innen/4-6],//LLR
                                
                                [0.45*aussen-6,-0.9*innen+2],[0.45*aussen,-0.9*innen+4],[0.45*aussen,-0.9*innen+6],//UUR
                               [0.45*aussen+2,0],
                                
                                [0.45*aussen,0.9*innen-4],[0.45*aussen-3,0.9*innen],[0.45*aussen-6,0.9*innen],//UUL
                                
                                [6,innen/4+6],[2,innen/4+4],[0,innen/4+2] //LLL
                               ]);      
                           }
                       }
                   }
                }//4 Augen
            }//was Auszuschneiden ist   
    }
}
//knauf(26,85);
//minkowski()
//{
  //knauf(14,43);
//  sphere(3);
//} 
