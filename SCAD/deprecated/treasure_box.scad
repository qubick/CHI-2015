use <hinge-01.scad>;
 rotate([0,90,0]){
 	color("blue")
 	rotate([0,0,30])
 		cylinder_top();
 	%cylinder_bottom();
 }
 
 module lead()
 difference() { 
   cylinder(r=4, h=15, $fn=50); 
   translate([-5,0,-2]) 
 	cube([10,5,20]); 
 } 
 
 //bottom box
 translate([-5,-8,-9])
 cube([15,8,8]);
 
 
 //lead
 color("red"){
 	translate([-5,5,-7.5])
 	rotate([30,0,0])
 	cube([15,2,8]);
 
 	//half cylinder
 	rotate([270,60,90])
 	translate([5,-2,-10])
 	lead();
 }
