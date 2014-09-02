use <mathhinge.scad>;
use <fence.scad>;

//math_hinge();

module giraffe(factor){

	difference(){
		//http://www.thingiverse.com/thing:364969
		scale([factor*0.7, factor, factor])
		import("component/giraffe.stl");
		
		//giraffe from yahoo
		//import("component/Giraffe_t.stl");

		translate([0, -30, -50]) 
			cube([10, 100, 100]);
	}
}

translate([0, 0, 20]) rotate([90, 0, 0])
giraffe(10);


//base
translate([0, -60, -10])
cube([1, 150, 100]);

//translate([-50, 30, 0]) rotate([0, 0, -90])
translate([3, 0, -5]) scale([1, 0.6, 0.8])
		fence();

translate([-5, 40, 40]) rotate([90, 90, 0])
math_hinge();
