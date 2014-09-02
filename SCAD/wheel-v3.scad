module inner(){
 	translate([-.5,0,0])
 		cube([8,8,2]);
 	cube([9,7,2]);
}
 
module box(){

	translate([0,0.5,0])
 	difference(){
 		cube([5,1,3]);
 
 		translate([1,-0.5,0.5])
 			inner();
 	}
 	
 	translate([5,1,0])
 		cylinder(r=0.5, h=3, $fn=50);
}
 
module roller(){
 	difference(){
 		color("red")
 			translate([5,1,0])
 			cylinder(r=3.5, h=0.8, $fn=50);
 
 		translate([5,1,-.5])
 			cylinder(r=0.7, h=3, $fn=50);
 	}
}

module axes(){

	cylinder($fn=50, r=1, h=.5);

	difference(){
		//innder dowel
		union(){
			cylinder($fn=50, r=0.4, h=3);
			translate([0, 0, 3]) sphere($fn=50, r=0.7);
		}
		translate([-1, - .1, .5]) cube([3, .2 ,6]);
	}
	
}

axes();
 //box();
//translate([-5, -1, .5]) 
roller();
 //vex();
