use <sway.scad>;
 difference(){
 	base();
 	for()
 	rotate([0,0,50])
 		cylinder(r=0.5, h=1, $fn=50);
 }
 translate([1,5,1.5])
 	//rotate([0,0,50]) //can adjust
 	%sway();
 
 translate([17,5,1])
 	cylinder(r=0.5, h=1, $fn=50);
 
 module outbox(){
 	translate([-6,-6,-1])
 	rotate([0,0,-10])
 		cube([15,3,3]);
 
 	translate([-6,3,-1])
 	rotate([0,0,10])
 		cube([15,3,3]);
 	
 	translate([-8,-7,-1])
 		cube([9,16,3]);
 }
 
 module seat(){
 	difference(){
 		difference(){
 			cylinder(r=7, h=1, $fn=50);
 			translate([0,0,-1])
 				cylinder(r=4, h=3, $fn=50);
 		}
 	outbox();
 	}
 }
 
 translate([13, 5, 2.5])
 seat();
