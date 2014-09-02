use <pulley.scad>;
 
 translate([0,-6,1])
 outer_box();
 
 inner_slide();
 
 translate([-1,5,3])
 rotate([90,0,0])
 cylinder(r=2, h=4, $fn=50);
