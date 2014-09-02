module outer_box(){
 	cube([10, 6, 0.5]);
 
	//right wall
 	translate([0, 0, .5])
 		cube([10, 0.5, 2]);
 	//left wall
 	translate([0, 5.5, .5])
 		cube([10, 0.5, 2]);

	//bottom wall
	difference(){
		translate([10, 0, 0])
			cube([.5, 6, 2.5]);
		translate([9.5, .5, 1])
			cube([2, 5, 1]);
	}
 }
 
module inner_slide(){
 	color("blue")
 		translate([1, 1.1, 1.2]){
 			cube([11, 3.8, 0.7]);
 			cube([1, 3.8, .7]);
			translate([10, 0, -.2]) cube([1, 3.8, 1.2]);
 	}
 }
 
module pulley(){
	outer_box();
	translate([5, 0, 0])
		inner_slide();
}
module  straw(){
	difference(){
		difference(){
			cylinder($fn=50, h=30, r=2, center=true);
			cylinder($fn=50, h=40, r=1.5, center=true);
		}
	
		translate([.5, -3, -15])	cube([6, 6, 40]);
	}
}

translate([20, 45, .5]) rotate([0, 90, 0])
straw();

translate([15, 30, 0]) scale([3, 3.5, 2.5])
	pulley();

//base
difference(){
	cube([50, 80, 1]);
	translate([22, 31, 3]) cube([30, 16, 4]);
}
