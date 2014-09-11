use <hinge-lego.scad>;
use <fence.scad>;

module cobra(factor){

	difference(){
		//http://www.thingiverse.com/thing:39157
		rotate([0, 0, 250])
		scale([factor*0.7, factor*1, factor*1.2])
		//import("component/cobra.stl");
		import("component/snake.stl");
		
//		translate([0, -30, -95]) 
	//		cube([100, 100, 100]);
	}
}

module door(){
	//translate([-50, 30, 0]) rotate([0, 0, -90])
	translate([-8, 0, -5]) scale([1, 0.6, 0.7])
		fence();

	translate([-27, 54, 45]) rotate([0, 90, 0])
		hinge();
}

translate([-6, 20, 0]) rotate([0, 0, 270]) cobra(0.4);


//base
translate([0, -60, -10]) cube([1, 150, 100]);
translate([-2, 50, 30]) rotate([90, 90, 270]) box();


translate([22, 130, 0]) door();