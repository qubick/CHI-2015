include <write.scad>;
import("Front_Cover.stl");
cube([150, 100, 1],center=true);

import("braille.stl");
translate([-65,30,0]) scale([3,3,3]) write("Dear Zoo",100);

