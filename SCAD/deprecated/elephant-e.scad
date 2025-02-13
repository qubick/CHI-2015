use <mathhinge.scad>;
use <fence.scad>;

module elephant(factor){

	difference(){
		translate([0, 0, 60]) rotate([180, 0, 0]) scale([factor*0.6, factor, factor])
		import("component/Elephant_t.stl");

		translate([0, -50, -10]) cube([30, 100, 100]);
	}
}

//base
translate([0, -60, -10])
	cube([1, 150, 100]);

difference(){
	translate([-85, 45, 0]) rotate([0, 0, -90])
		fence();
	//hook
	translate([-125, 50, 30]) cube([4, 20, 20]);
}
elephant(1.2);


//translate([-5, 60, 50]) rotate([90, 90, 0])
//math_hinge();


translate([-20, 58, 5]) cube([20, 1, 70]);

translate([-10, -50,30]) cube([10, 2, 20]);
