use <hinge-lego.scad>;

module window(factor){	
	//http://www.thingiverse.com/thing:191122/#files
	scale([factor, factor, factor*0.5])
		import("component/window-pane_v2.stl");

}

module moon(factor){
	scale([factor, factor, factor*2])
		import("component/moon.stl");
}

//1st base
translate([0, 60, 0]) cube([300, 240, 2], center=true);

translate([0,70,10]) color("white") moon(1.8);



//2nd layer
translate([160, 0, 60])rotate([0, 130, 0]) 
	translate([-150, 8, 15]) %cube([200, 150, 2]);


translate([245, 145, 130]) rotate([180, 130, 0])
	window(2);
/*
translate([80, 210, 0]) 
	color("red") window(1.5);
translate([0,250,10]) color("red") moon(1.3);
*/
translate([140, 60, 30]) rotate([90, 0, 90]) scale([2, 2, 2])
	hinge();

