use <mathhinge.scad>;


module door(){
	//http://www.thingiverse.com/thing:107081
	difference(){
		import("component/door-logo.stl");
		//translate([-1, -17, 0]) cube([10, 10, 50]);
	}
}

module church(factor){
	//http://www.thingiverse.com/thing:357349
	rotate([0, 0, 270]) 
	scale([factor*0.4, factor, factor*0.75])
	import("component/church.stl");
}

translate([-40, 40, 5])
church(1);

//base
cube([130, 1, 120]);

module door_hinge(){

translate([65, 7, 50]) rotate([0, 90, 0]) math_hinge();

translate([65, 28, 50]) rotate([0, 90, 0])
	door();
}

translate([40, 15, 5]) 
scale([0.5, 0.5, 0.5,])
door_hinge();

