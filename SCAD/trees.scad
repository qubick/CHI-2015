use <hinge-lego.scad>;

module tree(factor){
	//http://www.thingiverse.com/thing:654
	scale([factor*0.3, factor*1.1, factor*1.2])
	import("component/tree-Whole.stl");
}


module squirrel(factor){
	//http://www.thingiverse.com/thing:7948
	scale([factor, factor, factor])
	import("component/squirrel.stl");

}

module acorn(factor){
	scale([factor, factor*1.3, factor])
	import("component/ACORN.stl");
}

module total(){
translate([-5, 50, 40]) rotate([0, 90, 90])
	hinge();

//on first layer
color("green"){
	translate([2, 20, 5]) tree(0.8);
	translate([2, 70, 5]) tree(0.8);
}
	rotate([0, -8, 0]) translate([12, 75, 30])  squirrel(0.25);

//base plate
cube([1, 100, 60]);

translate([60, 41, 0]) rotate([0, 0, 90]){
	//2nd layer
	translate([10, 0, 0]) cube([1, 50, 60]);

	//on second layer
	color("green") translate([11, 20, 5]) tree(0.8);

	//color("white") {
	translate([15, 25, 30]) rotate([40, 0, 0]) rotate([0, 270, 0]) acorn(1);
//}
}
}

difference(){
total();
translate([-10, 0, 0]) cube([10, 100, 60]);
}