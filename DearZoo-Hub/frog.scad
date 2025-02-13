use <../SCAD/hinge-lego.scad>;
use <../SCAD/fence.scad>;

module frog(factor){

	difference(){
		translate([0, 0, 20]) scale([factor*0.5, factor, factor*1.3])
		import("../SCAD/component/frog.stl");

		translate([0, -50, -10]) cube([30, 100, 100]);
	}
}

module door(){
	translate([-75, 45, 0]) rotate([0, 0, -90])
		fence();
	translate([5, 64, 60]) rotate([90, 90, 0])
		hinge();
}

//base
translate([0, -60, -10])
	cube([1, 150, 100]);

translate([-2, 70, 35]) rotate([90, 90, 270]) box();
frog(1.2);


translate([59, 230, 0]) rotate([0, 0, 90]) door();

