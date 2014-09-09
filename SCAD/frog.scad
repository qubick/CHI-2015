use <hinge-lego.scad>;
use <fence.scad>;

module frog(factor){

	difference(){
		translate([0, 0, 20]) scale([factor*0.5, factor, factor*1.3])
		import("component/frog.stl");

		translate([0, -50, -10]) cube([30, 100, 100]);
	}
}

//base
translate([0, -60, -10])
	cube([1, 150, 100]);

module door(){
	translate([-75, 45, 0]) rotate([0, 0, -90])
		fence();
	translate([5, 61, 50]) rotate([90, 90, 0])
		hinge();
}


translate([-2, 80, 35]) rotate([90, 90, 270]) box();

translate([59, 230, 0]) rotate([0, 0, 90]) 
door();
frog(1.2);

