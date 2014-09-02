use <hinge-lego.scad>;
/*
use <hinge-02.scad>;
cylinder_top();
translate([0, -.2, -.3])
 	rotate([0, 0, -50])
 	cylinder_bottom();
*/
//http://www.thingiverse.com/thing:85978

module ship(factor){
	difference(){
		scale([factor*0.8, factor, factor])
		import("component/Base.stl");

		translate([-100, -80, 0])
		cube([100, 200, 100]);
	}
}

module dowel(factor){
	difference(){
		scale([factor, factor*0.8, factor])
		import("component/Sail.stl");
		
		translate([15, 0, 0])
		cube([100, 200, 10], center=true);
	}
}

module sail(factor){
	difference(){
		scale([factor, factor, factor*3])
		import("component/Sail.stl");
		
		translate([-37, -3, 2]) rotate([90, 0, 0])
		color("red")
		cube([10, 40, 250], center=true);
	}
}



//base
cube([1, 250, 200], center=true);

translate([41, 30, 0]) rotate([90, 0, 0])
	dowel(2);

translate([0, 0, -80]) 
	ship(2);

translate([9, 27, 19]) rotate([0, 90, 0]) scale([2, 2, 2])
	box();


translate([6, 180, 0]) rotate([270, 0, 90])
	sail(2);

translate([0, 160, 30]) rotate([0, 90, 0]) scale([2, 2, 2])
	hinge();

