module block_long() { //long block
 	difference(){
 		cube([6.6, 3, 0.5]);
 		
 		translate([-1,0,0])
 			rotate([0,270,180])
 			cylinder(h=8, r=1, $fn=50);
 	}
 }
 
 module block_short() { //short block
 	difference(){
 		cube([6.3, 3, 0.5]);
 		
 		translate([-0.5,0,0])
 			rotate([0,270,180])
 			cylinder(h=8, r=1, $fn=50);
 	}
 }
 
 module cylinder_bottom(){
 	difference(){
 		cylinder(h=3, r=0.9, $fn=50);
 
 		translate([0,0,-1])
 			cylinder(h=8, r=0.7, $fn=50);
 	}
 
 	translate([-.2, .1, 0])
 	rotate([0,270, 170])
 		block_short();
 }
 
 module cylinder_top(){
 
 	translate([0,0,3])
 		cylinder(h=3, r=1, $fn=50);
 	translate([0,0,-.4]) //innder dowel
 		cylinder(h=6.4, r=.4, $fn=50);
 
 	translate([0, 0, 6])
 		rotate([0,90,0])
 			block_long();
 	translate([0,0,-.6])
 
 	cylinder(h=.2, r=1, $fn=50);
 }
 
 //intersection(){
 	color("blue")
 		cylinder_top();
 
 	translate([0,-.2,-0.3])
 		rotate([0,0, -50])
 		cylinder_bottom();
 //}
 
