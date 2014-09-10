use <hinge-lego.scad>;
use <Flames.scad>;

module rocket(factor){
	difference(){
	//http://www.thingiverse.com/thing:33400
	scale([factor, factor, factor*0.5])
	import("component/polysoup.stl");

	translate([-5, 13, -1]) cube([10, 15, 3]);
	}
}

module cloud(factor){
	//http://www.thingiverse.com/thing:654
	scale([factor*1.5, factor*2, factor*0.6])
	import("component/Cloud.stl");
}


module flame(factor){
	//http://www.thingiverse.com/thing:7948
	scale([factor, factor, factor])
	import("component/flames.stl");

	scale([0.5,0.5,0.005]) image_MakeALot();
}

module plate(){
	difference() {
	cube([1, 60, 80]);
	translate([-1, 28, 15]) cube([3, 5, 30]);
	}
}
//translate([2, 36, -15]) rotate([0, 90, 0]) 
	//flame(.7);

//base plate
 plate();
translate([0,0, 20]) {
	translate([3, 30, 40]) rotate([90, 0, 90])
		rocket(1);

	translate([-2, 28, 20]) {
		cube([2, 35, 10]);
		cube([5, 5, 10]);
		translate([0, 33, 0]) cube([5, 2, 10]);
	}
}