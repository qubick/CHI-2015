use <../SCAD/hinge-lego.scad>;
use <../SCAD/fence.scad>;

module monkey(factor){
	difference(){
		//http://www.thingiverse.com/thing:182232
		scale([factor*0.7, factor, factor])
		import("../SCAD/component/Monkey_t.stl");
		translate([0, -50, -10]) cube([200, 200, 200]);
	}
}

//right door
module right_door(){
	rotate([0, 0, 90]) translate([68, 32, -5]) scale([1, .5, 1.2])
		fence();
	translate([-80, 49, 62]) rotate([270, 90, 0])
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
	translate([-13, -39, 65]) rotate([180, 90, 0])
		hinge();
}

translate([-54, 5, -100]) rotate([0, 0, 270]) right_door();
translate([14, -30, -105]) left_door();

/*
translate([0, 0, 5]) monkey(1.2);


//base
translate([0, -70, -10])cube([1, 150, 100]);

rotate([0, 270, 0]) {
	translate([40, 65, 2]) box();
	translate([40, -53, 2]) box();
}
*/