// source: math_hinge.jscad

// producer: OpenJSCAD CLI 0.010
hinge = function(){


return CSG.cylinder(
{start: [0,0,0], 
end: [0,0,5.966666666666667],
radiusStart: 1.5, radiusEnd: 1.5, resolution: 24}).translate([0,0,0]).union([CSG.cube({center: [1.5,1.05,2.9833333333333334],
radius: [1.5,1.05,2.9833333333333334], resolution: 16}).translate([-1.5,0,0])]).subtract([CSG.cylinder({start: [0,0,0], end: [0,0,2.25],radiusStart: 0, radiusEnd: 1.5, resolution: 24}).translate([0,0,3.7266666666666666])]).union([CSG.cylinder({start: [0,0,0], end: [0,0,6.666666666666667],radiusStart: 1.5, radiusEnd: 1.5, resolution: 24}).translate([0,0,6.666666666666667]).union([CSG.cube({center: [1.5,1.05,3.3333333333333335],radius: [1.5,1.05,3.3333333333333335], 
resolution: 16}).translate([-1.5,-2.1,6.666666666666667]),
CSG.cylinder({start: [0,0,0], end: [0,0,2.25],radiusStart: 0, radiusEnd: 1.5, resolution: 24}).translate([0,0,4.416666666666667]),
CSG.cylinder({start: [0,0,0], end: [0,0,2.25],radiusStart: 1.5, radiusEnd: 0, resolution: 24}).translate([0,0,13.333333333333334])]),CSG.cylinder({start: [0,0,0], end: [0,0,5.966666666666667],radiusStart: 1.5, radiusEnd: 1.5, resolution: 24}).translate([0,0,14.033333333333333]).union([CSG.cube({center: [1.5,1.05,2.9833333333333334],radius: [1.5,1.05,2.9833333333333334], resolution: 16}).translate([-1.5,0,14.033333333333333])]).subtract([CSG.cylinder({start: [0,0,0], end: [0,0,2.25],radiusStart: 1.5, radiusEnd: 0, resolution: 24}).translate([0,0,14.023333333333333])])]).translate([-1.5,0,0]).transform(CSG.Matrix4x4.rotation([0,0,0], [0,1,0], 90)).union([CSG.cube({center: [10,2,1.5],radius: [10,2,1.5], resolution: 16}).translate([0,2.1,0]),CSG.cube({center: [10,2,1.5],radius: [10,2,1.5], resolution: 16}).translate([0,-6.1,0])]);
};