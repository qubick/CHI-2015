
module block_long() { //long block
 	difference(){
 		cube([6.6, 3, 1]);
 		
 		translate([-1,0,0])
			rotate([0,270,180])
 			cylinder(h=8, r=1, $fn=50);
	}
}

module block_short() { //long block
 	difference(){
 		cube([6.1,3,1]);
 		
 		translate([-1,0,0])
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
 
 	translate([-.1, .1, .1])
 	rotate([0,270,180])
 		block_short();
 }
 
 module cylinder_top(){
 
 	translate([0,0,3])
 		cylinder(h=3, r=1, $fn=50);
 	translate([0,0,-.4]) //innder dowel
 		cylinder(h=6.4, r=.5, $fn=50);
 
 	translate([0, 0, 6])
 		rotate([0,90,0])
 			block_long();
 //	translate([0,0,-.6])
 
 //	cylinder(h=.2, r=1, $fn=50);
 }
 
 color("blue")
 translate([0,-.2,-0.3])
 	rotate([0,0, -50])
 	cylinder_bottom();
 
 
 cylinder_top();
