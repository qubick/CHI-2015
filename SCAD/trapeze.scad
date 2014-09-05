use <sway.scad>;
difference(){
 	//base();
 	rotate([0,0,50])
 		cylinder(r=0.5, h=1, $fn=50);
}

module seat(){
 		difference(){
 			cylinder(r=7, h=1, $fn=50);
 			translate([0,0,-1])
 				cylinder(r=4, h=3, $fn=50);
 		}
}
//base
translate([0, 15, 16]) cube([150, 100, 1]);

module swing(){
	union(){
		translate([45, 5, 2.5])
			scale([2,2,2]) seat();
		translate([1,5,1.5])
	 		scale([2,2,2]) sway();
	}
}

module tree(){
	import("component/Gnome_TreeBranch.stl");
	//translate([40, 40, 30]) rotate ([270, 0, 0]) scale(.25, .08, .08) import("component/Gnome_TreeIndeed.stl");
	import("component/Gnome_TreeMiddle.stl");
	import("component/Gnome_TreeTop.stl");
}

scale([1, 1, 0.5]) tree();
translate([95, 80, 5]) rotate([0, 0, 290]) scale([1,1,2]) swing();