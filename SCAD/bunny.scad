use <hinge-lego.scad>;

module bunny(factor){
	difference(){
		scale([factor, factor, factor])
		import("component/PlayboyBunny.stl");

		translate([-60, -110, -1])
		cube([200, 50, 50]);
	}
}


//1st base
translate([0, 60, 0]) cube([300, 260, 2], center=true);
color("white") bunny(0.8);

//2nd layer
//translate([50, 0, 140])rotate([0, 60, 0]) 
	translate([-150, 8, 18]) cube([300, 184, 2]);


//big ear 
module bigear(){
translate([15, -25, 19])
difference(){
	scale([1.2,2,1])
		bunny(1);
	translate([-100, -168, -1]) cube([200, 200, 50]);
}
}
//translate([50, 0, 140]) rotate([0, 60, 0])
color("white") bigear();

translate([140, 60, 30]) rotate([90, 0, 90]) scale([2, 2, 2])
	hinge();

