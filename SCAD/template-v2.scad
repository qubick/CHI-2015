use <hinge-lego.scad>;

module window(factor){	
	scale([factor, factor, factor*0.5])
		import("component/window-pane_v2.stl");

}

module moon(factor){
	scale([factor, factor, factor])
		import();
}

//1st base
translate([0, 60, 0]) cube([300, 240, 2], center=true);


//2nd layer
translate([160, 0, 60])rotate([0, 130, 0]) 
	translate([-150, 8, 15]) %cube([200, 150, 2]);


translate([240, 25, 130]) rotate([0, 130, 0])
	window(2);

//translate([9, 27, 19]) rotate([0, 90, 0]) scale([2, 2, 2])
	//box();


translate([140, 60, 30]) rotate([90, 0, 90]) scale([2, 2, 2])
	hinge();

