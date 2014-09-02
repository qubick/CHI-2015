use <wheel-v2.scad>;

module wheel(factor){
	
	scale([factor, factor, factor*1.8]){
		box();
		roller();
	}
}

//http://www.thingiverse.com/thing:249
module car(factor){
	scale([factor*0.5, factor, factor])
	import("component/ActionCar.stl");
}

//page base
translate([5, -5, -10])
	cube([1, 60, 40]);

difference(){
	car(1);
	translate([0,0,-5]) cube([5, 60, 20]);
}

//front wheel
translate([9.5, 11, 8]) rotate([0, 90, 0])
	wheel(1.2);

//back wheel
translate([9.5, 39, 8]) rotate([0, 90, 0])
	wheel(1.2);