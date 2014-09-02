use <mathhinge.scad>;
use <door-f.scad>;

module dog(factor){
	difference(){
		scale([factor*0.6, factor, factor])
		import("component/Dog_t.stl");

		translate([0, -50, -10]) cube([10, 100, 100]);
	}
}


dog(1);

//base
translate([0, -60, -15])
cube([1, 150, 100]);

translate([-5, 0, -5]) rotate([0, 0, 90])
math_hinge();

translate([-13, 0, 8]) rotate([0, -90, 0])
door();