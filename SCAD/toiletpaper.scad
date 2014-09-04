module toilet() {
	difference() {
	//http://www.thingiverse.com/thing:112583
	rotate([0, 90, 180]) scale([1.1, 1.1, 1.1])
		import("component/Toilet_ornament.stl");

	translate([-40, -10, -107])
	cube([50, 50, 50]);
	}
}

module outer_box(){
 	//right wall
 	translate([0, 0, 0])
 		cube([10, 0.5, 1]);
 	//left wall
 	translate([0, 5.5, 0])
 		cube([10, 0.5, 1]);

	//top wall
	translate()
		cube([.5, 6, 2]);
	//cover
 	translate([7, .5, 1])
 		cube([1, 5, 0.5]);
 }
 
module inner_slide(){
 	color("blue")
 		translate([1, 1.1, 0.8]){
 			cube([11, 3.8, 0.7]);
 			cube([1, 3.8, 1]);
 	}
}

module pulley(){
	outer_box();
	inner_slide();
}


translate([10, 30, 0]) scale([3, 3, 3])
	pulley();

//base
difference(){
	//translate([0, -15, 5]) 
		cube([50, 80, 1]);
}

//roll
translate([16, 31, 10]) rotate([-90, 0, 0])
scale([1.5, 1.5, 1.5])
difference(){
	 cylinder(h=11, $fn=100, r=5);
	translate([-5, 3, -5]) cube([12, 10, 25]);
}

/*
//toilet?
translate([40, -5, 62]) 
	toilet();
*/