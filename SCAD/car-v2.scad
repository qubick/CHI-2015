use <wheel-v3.scad>;

//http://www.thingiverse.com/thing:249
module car(factor){
	difference(){
		scale([factor*0.5, factor, factor])
		import("component/ActionCar.stl");
	
		translate([-5, 0, 5]) 
		cube([10, 70, 20], center=true);
	}
}

//page base
translate([0,-30, -15]) cube([1, 60, 40]);

car(1);


//front wheel
translate([3, -13, 3]) rotate([0, 90, 0]) scale(1.5)
	axes();

//back wheel
translate([3, 15, 3]) rotate([0, 90, 0]) scale(1.5)
	axes();


scale(1.5){
	translate([0, -5, -10]) rotate([0, 90, 0]) roller();
	translate([0, 5, -10]) rotate([0, 90, 0])  roller();
}
