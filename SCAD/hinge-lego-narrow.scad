use <mathhinge.scad>;

module hinge(){
translate([1, -10, 0]) scale([1,2,2]) math_hinge();
}

module box(){
	difference(){
		cube([24, 10, 6], center=true);
		translate([0,0,2]) cube([22, 8, 6], center=true);
	}
}


translate([0, -10, 0]) hinge();
translate([11, -2, 2]) box();

//for comparison
//translate([0, -5, 0]) cube([20, 4, 3]);
