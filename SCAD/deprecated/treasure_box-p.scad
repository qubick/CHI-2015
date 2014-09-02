use <hinge.scad>;
 rotate([0,90,0]){
 	color("blue")
 	//rotate([0,0,30])
 	translate([0,4,0])
 	cylinder_top();
 	
 	cylinder_bottom();
 }
 
 module lead()
 difference() { 
   cylinder(r=4, h=15, $fn=50); 
   translate([-5,0,-2]) 
 	cube([10,5,20]); 
 } 
 
 //bottom box
 translate([-5,-8,-9])
 cube([15,8,7.99]);
 
 
 //lead
 color("red"){
 	translate([-5,4,-9])
 	//rotate([30,0,0])
 	cube([15,2,8]);
 
 	//half cylinder
 	translate([10,6,-4.99])
 	rotate([180,90,0])
 	lead();
 }
