use <hinge.scad>;
 rotate([0,90,0]){
 	color("blue")
 	rotate([0,0,30])
 		cylinder_top();
 	%cylinder_bottom();
 }
 
 color("red")
 translate([-5,1,-1.5])
 rotate([30,0,0])
 cube([15,10,1]);
 
 translate([-5,-10,-2])
 cube([15,10,1]);
