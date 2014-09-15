use <../SCAD/hinge-lego.scad>;
use <../SCAD/door-f.scad>;

module dog(factor){
	difference(){
		scale([factor*0.6, factor, factor])
		import("../SCAD/component/Dog_t.stl");

		translate([0, -50, -10]) cube([10, 100, 100]);
	}
}

module fence(){
	translate([8, -10, -2]) rotate([180, 0, 90])
		hinge();
	translate([-13, 0, 8]) rotate([0, -90, 0])
		door();
}


translate([0, 10, 5]) dog(1);

//base
translate([0, -60, -15]) cube([1, 150, 100]);

translate([-2, 15, -7]) rotate([90, 0, 270]) box();


translate([3, 135, 0]) rotate([0, 90, 0]) fence();