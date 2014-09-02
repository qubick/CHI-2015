module inner(){
 	translate([1,1,0])
 		cube([6,7,1]);
 	cube([8,6,1]);
 }
 
 module box(){
 	difference(){
 		cube([10,4,3]);
 
 		translate([1,-1,1])
 			inner();
 	}
 	
 	translate([5,1,0])
 		cylinder(r=0.5, h=3, $fn=50);
 }
 
 module roller(){
 	difference(){
 		color("red")
 			translate([5,1,1.2])
 			cylinder(r=3.5, h=0.5, $fn=50);
 
 		translate([5,1,1])
 			cylinder(r=0.7, h=1, $fn=50);
 	}
 }
 
 module vex(){
 	translate([5, 1, 1.5])
 		for( i = [0:5] ){
 
 			rotate(i*360/6, [0,0,1])
 			translate([0, 3, 0])
 			cylinder(r=0.4, h=0.5, $fn=50);
 	}
 }
 
 % box();
 roller();
 vex();
