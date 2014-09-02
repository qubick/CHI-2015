module outer_box(){
 	cube([6, 6, 0.5]);
 
	//right wall
 	translate([0, 0, .5])
 		cube([6, 0.5, 2.5]);
 	//left wall
 	translate([0, 5.5, .5])
 		cube([6, 0.5, 2.5]);

	//cover
 	translate([2, .5, 2])
 		cube([1, 5, 0.5]);
 }
 
 module inner_slide(){
 	color("blue")
 		translate([-1, 1.1, 1.1]){
 			cube([12, 3.8, 0.7]);
 			cube([1, 3.8, 2]);
 	}
 }
 
module pulley(){
 % outer_box();
 inner_slide();
}

scale([3, 3, 3])
	pulley();

//base
cube([50, 80, 1]);

translate([0, 0, 10]) rotate([-90, 0, 0])
difference(){
	cylinder(h=18, $fn=100, r=5);
	translate([-5, 0, -5]) cube([12, 10, 25]);
}
