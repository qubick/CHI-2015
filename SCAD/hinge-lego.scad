use <mathhinge.scad>;

module hinge(){
translate([1, -10, 0]) math_hinge();
}

module box(){
	difference(){
		cube([22, 5, 4], center=true);
		translate([0,0,2]) cube([21, 3.5, 6], center=true);
	}
}


hinge();
translate([12,0,2]) box();

//for comparison
//translate([0, -5, 0]) cube([20, 4, 3]);
