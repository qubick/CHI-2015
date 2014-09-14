use <mathhinge.scad>;

module hinge(){
translate([1, -10, 0]) scale([1,1,1]) math_hinge();
}

module box(){
	difference(){
		cube([21, 4, 4], center=true);
		translate([0,0,2]) cube([20, 3, 4], center=true);
	}
}


translate([0, -10, 0])  hinge();
translate([11, -2, 2]) box();

//for comparison
//translate([1, -4, 0]) color("red") cube([20, 4, 3]);
