use <mathhinge.scad>;


module door(){
	//http://www.thingiverse.com/thing:107081
	difference(){
		import("component/door-logo.stl");
		//translate([-1, -17, 0]) cube([10, 10, 50]);
	}
}

cube([150, 1, 100]);
translate([100, 7, 50]) rotate([0, 90, 0]) math_hinge();

translate([100, 28, 50]) rotate([0, 90, 0])
	door();


