module knauf(innen,aussen)
{
    minkowski() // invalidate for debugging, don't forget to reactivate before printing
    {
        hoehe = aussen/3;
        secau = sqrt(2*pow(aussen,2))-6;
        secin = sqrt(2*pow((aussen - innen),2))-6;
        shrad = 0.7*(aussen-innen)-1;
           
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
                                kleinerrad = min(secin/2,innen/2);
                               rotate(i)
                            //rotate([  00,  0,   90])
                                
                               translate([innen +secin/2,0, 0])
                                hull() 
                                {
                                    translate([ innen +secin/2,00,0]) circle(3*kleinerrad);
                                    circle(kleinerrad);
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
                                   translate([innen +3 ,00,0])
                                   polygon(points=[
                                   [0,-secin/8-1], [2,-secin/8-3],//LLR
                                    
                                    [min(shrad-2, aussen-innen-5),-secau/8-4],[shrad,-secau/8-2],//UUR
                                    [min(shrad+2, aussen-innen-5),0],
                                    [min(shrad, aussen-innen-5),secau/8+2],[shrad-2,secau/8+4],//UUL
                                    [2,secin/8+3],[0,secin/8+1] //LLL
                                   ]);      
                               }
                           }
                       }
                    }//4 Augen
                }//was Auszuschneiden ist   
        }
        //sphere(3);
    }//minkowsky
} 

//knauf(26,85);
//  knauf(16,43);
//knauf(26,43);
 