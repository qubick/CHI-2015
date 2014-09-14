use <hinge-lego.scad>;
use <fence.scad>;

module giraffe(factor){

	difference(){
		scale([factor*1.3, factor*0.9, factor])
		import("component/giraffe.stl");
		
		translate([-50, -50, -11]) 
			cube([100, 100, 10]);
	}
}

module door(){
	//translate([-50, 30, 0]) rotate([0, 0, -90])
	translate([3, 0, -5]) scale([1, 0.6, 0.8])
		fence();

	translate([-16, 55, 50]) rotate([90, 90, 90])
		hinge();
}

translate([0, 10, 30]) rotate([90, 0, 270])
giraffe(15);


//base
translate([0, -60, -10])
	cube([1, 150, 100]);
translate([-2, 65, 30]) rotate([180, 90, 0]) box();

//for one piece print
//translate([-56, 60, -100]) rotate([0, 0, 270])
translate([11, 0, 100]) door();