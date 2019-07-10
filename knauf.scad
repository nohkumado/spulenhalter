module knauf()
{
    difference() //mit Augen
    {
            union() //Koerper
            {
                  translate([0,0, 0]) cylinder(h = 40, r1 = 26, r2 = 85,$fa = 3);
                hull()
                {  
                translate([0,0, 39]) cylinder(h = 8,  r1 = 85, r2 = 85,$fa = 3);
                color("red")translate([0,0, 43.1]) rotate_extrude(convexity = 10)
translate([83, 0, 0])
circle(r = 4.2, $fn = 100);
                }
            }
        
            union() //was Auszuschneiden ist
            {
                union() //4 Ausschnitte
                {
                     translate([0,0, -2])
                    linear_extrude(height = 50, center = false, convexity = 10, twist = 0)
                    {
                        for(i = [ [  0,  0,   0],
                                   [ 0, 0, 90],
                                   [0, 0,  180],
                                   [ 0, 0,  270] ])
                        {
                           rotate(i)
                        //rotate([  00,  0,   90])
                           translate([50,0, 0])
                            hull() 
                            {
                                translate([32,00,0]) circle(24);
                                circle(12);
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
                               translate([34,00,0])
                               polygon(points=[
                                [0,-8],[2,-10],[10,-12], //LLR
                                [20,-16],
                                [32,-23],[34,-22],[36,-21],//UUR
                                [37,-10],[38,0],[37,10],
                                [36,21],[34,22],[32,23],//UUL
                                [20,16],
                                [10,12],[2,10],[0,8] //LLL
                               ]);      
                           }
                       }
                   }
                }//4 Augen
            }//was Auszuschneiden ist   
    }
}
//knauf();