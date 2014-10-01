use <mathhinge.scad>;

module hinge(){
translate([1, -10, 0]) scale([2,2,2]) mathhinge();
}

module box(){
	difference(){
		cube([43, 9, 6], center=true);
		translate([0,0,2]) cube([41, 7, 6], center=true);
	}
}


translate([0, -11, 0]) hinge();
translate([21,-3,2]) box();

//for comparison
//translate([0, -5, 0]) cube([20, 4, 3]);
