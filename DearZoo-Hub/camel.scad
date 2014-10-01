use <hinge-lego.scad>;
use <../SCAD/fence.scad>;

module camel(factor){
	//rotate([0, 0, 90])
	difference(){
		scale([factor, factor, factor])
		import("../SCAD/component/Camel_t.stl");

		translate([1, -50, -5]) cube([50, 150, 100]);
	}
}

//right door
module right_door(){
	rotate([0, 0, 90]) translate([68, 32, -5]) scale([1, .5, 1.2])
		fence();
	translate([-58, 55, 60]) rotate([90, 90, 0])
		hinge();
}

//left door
module left_door(){
	difference(){
		scale([1, .5, 1.2])
			fence();
		translate([-20, -10, 45]) //window
			cube([15, 30, 20]);
	}
	translate([-19, -17, 65]) rotate([0, 90, 0])
		hinge();
}

//translate([-54, 10, -100]) rotate([0, 0, 270]) right_door();
//translate([14, -30, -105]) left_door();

translate([0, 0, 5]) camel(1.2);

//base
translate([0, -70, -10])cube([1, 150, 100]);

rotate([0, 270, 0]) {
	translate([40, 65, 2]) box();
	translate([40, -53, 2]) box();
}