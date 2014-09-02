use <wheel-v2.scad>;

module wheel(factor){

	translate([0,0,-8]) scale([factor*2, factor*2, factor*2])
		box();
	scale([factor*2, factor*2, factor])	
		roller();

}

module frame(factor){
	//http://www.thingiverse.com/thing:95869
	difference() {
		scale([factor, factor, factor])
		//import("component/FerrisWheel.stl");
		import("component/ferris.stl");
		translate([-110, -44, -30]) rotate([0,0,2])
			cube([200, 40, 200]);
	}
}

module ferris(factor){

	//outer frame
	difference(){
		cylinder(r=30*factor, h=2*factor);

		translate([0,0,-1])
			cylinder(r=28*factor, h=4*factor);
	}

	translate([0, 0, 6*factor]) difference(){
		cylinder(r=20*factor, h=2*factor);

		translate([0,0,-1])
			cylinder(r=18*factor, h=4*factor);
	}

	//inner frame
	translate([0, 0, 6*factor]) difference(){
		cylinder(r=10*factor, h=2*factor);

		translate([0,0,-1])
			cylinder(r=8*factor, h=4*factor);
	}

	for(i=[0 : 8])
	rotate(i*360/8, [0,0,1]){
		translate([0,0, 7*factor]) cube([60*factor, 2*factor, 2*factor], center=true);
		translate([28*factor, 0, 0]) cube([2*factor,2*factor,8*factor]);
	}

}

translate([111, 22, 18])
difference(){
	ferris(2.5);

	//hole in the middle
	cylinder(r=20, h=42, center=true);
}



//base
translate([-5, -120, -8])
	cube([200, 300, 2]);

wheel(11);

//translate([30, 85, 37]) rotate([180, 0, 0])
//	frame(1);
