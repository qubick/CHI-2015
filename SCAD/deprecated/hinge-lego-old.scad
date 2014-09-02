use <mathhinge.scad>;

translate([-10,2.5,10]) rotate([90, 0, 0])
	math_hinge();


//base with cube
//cube([50, 30, 1], center=true);

difference(){
	cube([22, 5, 4], center=true);
	translate([0,0,2]) cube([21, 3.5, 6], center=true);
}