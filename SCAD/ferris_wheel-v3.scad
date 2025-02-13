use <wheel-v3.scad>;

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
module wheel_frame(){
	translate([30, -24, 3]) scale(.25)
		difference(){
			ferris(2.5);

		//hole in the middle
		cylinder(r=20, h=42, center=true);
	}

	translate([0, -30, 0]) scale(6) roller();
}

translate([0, 64, 2]) wheel_frame();

translate([30, 40, 1]) scale(6)
	axes();



//base
cube([60, 80, 1]);

