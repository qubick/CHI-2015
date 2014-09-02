use <mathhinge.scad>;
use <fence.scad>;

module cobra(factor){

	difference(){
		//http://www.thingiverse.com/thing:39157
		rotate([0, 0, 250])
		scale([factor*0.7, factor*0.5, factor])
		import("component/cobra.stl");
		
//		translate([0, -30, -95]) 
	//		cube([100, 100, 100]);
	}
}

translate([-30, 0, 5]) cobra(0.4);


//base
translate([0, -60, -10])
cube([1, 150, 100]);

//translate([-50, 30, 0]) rotate([0, 0, -90])
translate([-8, 0, -5]) scale([1, 0.6, 0.7])
		fence();

translate([-5, 40, 40]) rotate([90, 90, 0])
math_hinge();
