use <mathhinge.scad>;

module hinge(){
translate([1, -10, 0]) scale([2,2,2]) math_hinge();
}

module box(){
	difference(){
		cube([42, 8, 6], center=true);
		translate([0,0,2]) cube([40, 6, 6], center=true);
	}
}


translate([-10, 0, 0]) hinge();
translate([21,-3,2]) box();

//for comparison
//translate([0, -5, 0]) cube([20, 4, 3]);
