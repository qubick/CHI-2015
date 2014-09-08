use <hinge-lego.scad>;

module lion(factor){
//	difference(){
		scale([factor*0.6, factor, factor])
		import("component/lion-box.stl");

//		translate([0, -50, -10]) cube([10, 100, 100]);
//	}
}

module fence(){
	difference(){
		translate([-10, -40, -5]) rotate([0, 0, 90])
			cube([100, 2, 70]);

		for(i= [0:2])
		{
		translate([-15, -i*15, 5])
			cube([10, 10, 50]);
		}
	}
}

lion(30);

//base
translate([0, -60, -15])
cube([1, 150, 100]);

translate([-2, 5, -8]) rotate([270, 0, 90]) box();

module door() {
	translate([-13, 0, -3]) rotate([0, 0, 90])
		hinge();

	translate([-13, 0, 10]) rotate([0, -90, 0])
		fence();
}

translate([-1,150,0]) rotate([0, 90, 0]) door();