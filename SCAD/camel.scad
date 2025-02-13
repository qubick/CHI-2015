use <hinge-lego.scad>;
use <fence.scad>;

module camel(factor){
	//rotate([0, 0, 90])
	//difference(){
		scale([factor, factor, factor])
		import("component/Camel_t_fixed.stl");

		//http://www.thingiverse.com/thing:173865/#files
		//import("component/camel-simple.stl");
		//translate([-3, -100, -100]) cube([200, 200, 200]);
	//}
}

translate([0, 0, 0])
	camel(1);

//right door
module right_door(){
	rotate([0, 0, 90]) translate([68, 32, -5]) scale([1, .5, 1.2])
		fence();
	translate([-58, 55, 50]) rotate([90, 90, 0])
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
	translate([-16, -17, 55]) rotate([0, 90, 0])
		hinge();
}

translate([-54, 10, -100]) rotate([0, 0, 270]) right_door();
translate([14, -30, -105]) left_door();

//translate([0, 0, 5]) camel(1.2);

//base
translate([0, -70, -10])cube([1, 150, 100]);

rotate([0, 270, 0]) {
	translate([40, 70, 1]) box();
	translate([40, -60, 1]) box();
}