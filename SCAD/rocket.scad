use <hinge-lego.scad>;
use <Flames.scad>;

module rocket(factor){
	//http://www.thingiverse.com/thing:12872
	//scale([factor*0.3, factor*0.2, factor*0.15])
	//import("component/rocket_body.stl");

	//translate([0, 0, 30]) scale([factor*0.3, factor*0.2, factor*0.3])
	//import("component/rocket_nose.stl");

difference(){
	//http://www.thingiverse.com/thing:33400
	scale([factor, factor, 0.5])
	import("component/polysoup.stl");

	translate([-5, 15, -1]) cube([10, 15, 3]);
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
//	import("component/flames.stl");

	scale([0.5,0.5,0.005]) image_MakeALot();
}


translate([2, 45, -35]) rotate([90, 170, 270]) 
	cloud(1);
translate([0, 35, 0]) rotate([90, 0, 90])
	hinge();

translate([2, 36, -15]) rotate([0, 90, 0]) 
	flame(.7);



//base plate
cube([1, 80, 60]);
translate([2, 40, 3]) rotate([90, 0, 90]) 
	box();

translate([0, 40, 40]) rotate([90, 0, 90])
	rocket(1);


