use <hinge-lego.scad>;
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

translate([-2, 15, -7]) rotate([90, 0, 270]) box();

module fence(){
	translate([-14, 0, -5]) rotate([0, 0, 90])
		hinge();

	translate([-13, 0, 8]) rotate([0, -90, 0])
		door();
}

translate([3, 135, 0]) rotate([0, 90, 0]) fence();