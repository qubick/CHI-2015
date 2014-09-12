cube([3,3,5]);

cylinder(r=1, h=2, $fn=50);
translate([4, 0, 0]) cylinder(r=1, h=2, $fn=100);
cylinder(r=1, h=2, $fn=50);
cylinder(r=1, h=2, $fn=50);

import("component/elephant.stl");