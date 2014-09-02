use <hinge-02.scad>;
use <mathhinge.scad>;

module hinge(){
	cylinder_top();
	translate([0,-.2,-0.3]) rotate([0,0, -50])
 		cylinder_bottom();
}

module USA(factor){
	//http://www.thingiverse.com/thing:10273
	scale([factor, factor*1.2, factor*2])
	import("component/USA_FLAG.stl");
}

module waving(factor){
	//http://www.thingiverse.com/thing:72753
	scale([factor, factor, factor])
	import("component/flagscaled.stl");
}

//hinge();
translate([52, 15, 120]) rotate([0, 90, 0]) scale([2, 2, 2])
math_hinge();


translate([52, 17, 70]) rotate([90, 0, 90])
	USA(20);

//rotate([0, 0, 40]) translate([3, -67, 0]) 
//waving(1);

//dowel
translate([50, 0, 10])
cube([7, 7, 130]);

//base page
//cube([300, 1, 200]);
