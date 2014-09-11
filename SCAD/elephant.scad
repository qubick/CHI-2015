use <hinge-lego.scad>;
use <fence.scad>;

module elephant(factor){

	difference(){
		translate([0, 0, 60]) rotate([180, 0, 0]) scale([factor*0.6, factor, factor])
		import("component/Elephant_t.stl");

		translate([0, -50, -10]) cube([30, 100, 100]);
	}
}

module door(){
	translate([-75, 45, 0]) rotate([0, 0, -90])
		fence();
	translate([5, 64, 60]) rotate([90, 90, 0])
		hinge();
}

//translate([59, 215, 0]) rotate([0, 0, 90]) door();

//base
translate([0, -60, -10]) cube([1, 150, 100]);




translate([-2, 70, 35]) rotate([90, 90, 270]) box();


elephant(1.2);
