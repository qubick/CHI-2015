module base()
{
 	//cube([20, 10, 1]);
 	//translate([1,5,1])
 		cylinder(r=0.5, h=2, $fn=50, center=true);
		
	translate([0, 0, 1]) cylinder(r=1, h=0.5, $fn=50, center=true);

 }
 
module sway(){
 	difference(){
 		cylinder(r=1, h=1, $fn=50);
 		cylinder(r=0.7, h=2, $fn=50);
 	}
 	translate([0.7, -0.5, 0])
 		cube([15,1,1]);
 
 	translate([15,-2.5,0])
 		cube([3,5,1]);
 }
 
translate([0, 0, 1]) base();

translate([1,5,0])
 	rotate([0,0,50]) //can adjust
 	sway();
