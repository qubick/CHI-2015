use <wheel.scad>;
 %box();
 translate([0,0,-0.2]){
 	roller();
 	vex();
 }
 
 //base
 translate([-2,-6,-1])
 cube([15,10,1]);
 
 //chair
 module chair(){
 	difference(){
 		translate([-1,-1,0])
 		cube([2,2,0.7]);
 
 		cylinder(r=0.5, h=2, $fn=50);
 	}
 }
 
 translate([5, 1, 1.5])
 for(i = [0:5]){
 	color("blue")
 	rotate(i*360/6, [0,0,1])
 		translate([0, 3, 0])
 		chair();
 }
