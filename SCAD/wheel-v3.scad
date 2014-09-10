module roller(){
 	difference(){
 		//color("red")
 			translate([5,1,0])
 			cylinder(r=3.5, h=0.5, $fn=50);
 
 		translate([5,1,-.5])
 			cylinder(r=0.9, h=3, $fn=50);
 	}
}

module axes(){

	cylinder($fn=50, r=1.2, h=.5);

	difference(){
		//innder dowel
		union(){
			cylinder($fn=50, r=0.6, h=2);
			translate([0, 0, 2.5]) sphere($fn=50, r=0.85);
		}
		translate([-1, - .2, 1]) cube([3, .3 ,6]);
	}
	
}

module set(){
	axes();
	roller();
}

scale([3, 3, 2]) set();

scale([3, 3, 2]) translate([0, 8, 0]) set();