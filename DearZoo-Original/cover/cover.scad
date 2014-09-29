include <write.scad>;
translate([0, -15, 0]) import("Front_Cover.stl");
cube([150, 100, 1],center=true);

translate([-70, -23, 0]) scale([1.7,1.7,1]) import("braille.stl");
translate([-30, 17,0]) scale([2.5,2.5,2.5]) write("Dear Zoo",100);

