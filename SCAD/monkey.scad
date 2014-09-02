use <mathhinge.scad>;
use <fence.scad>;

module monkey(factor){
	difference(){
		//http://www.thingiverse.com/thing:182232
		scale([factor*0.7, factor, factor])
		import("component/Monkey_t.stl");
		//translate([0, -50, -10]) cube([200, 200, 200]);
	}
}

translate([0, 0, 5])
	monkey(1.2);

//base
translate([0, -70, -10])
	cube([1, 150, 100]);


//right door
translate([2, 25, -5]) scale([1, .5, 1.2])
	fence();

translate([-5, 55, 40]) rotate([90, 90, 0])
	math_hinge();

//left door
translate([-60, -40, 0]) rotate([0, 0, 90])
difference(){
	translate([3, -35, -5]) scale([1, .5, 1.2])
		fence();
	translate([-20, -45, 45]) //window
		cube([15, 30, 20]);
}

translate([-5, -50, 40]) rotate([90, 90, 0])
	math_hinge();
