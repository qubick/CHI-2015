include('componentFactory.jscad')

// bounding_box = function(object){
// 	var b = object.getBounds();
// 	var boxcolor = 'greenyellow';
// 	var sz = [b[1].x - b[0].x, b[1].y - b[0].y, b[1].z - b[0].z];
// 	return color(boxcolor,
// 			cube({size:sz}).translate(b[0]));
// }

// tactile = function(){
// }

// tactile.e = function(){
// 	return cube();
// }

// tactile.create = function(stlmodel, options){
// 		var options = options || {};
// 		var abstract = options.abstract || false;
// 		var scale = options.scale || [1,1,1];
	 	
// 	 	//[1,0.5,1]
// 		model = stlmodel.scale(scale);

// 		if (abstract)
// 			obj = bounding_box(model);		
// 		else
// 			obj = model;
// 		return add_pedestal_z(obj);
// }



// add_pedestal_y = function(object){
// 	var overlap = 5;
// 	var base = 3;
// 	var padding = -3;

// 	b = object.getBounds();	
// 	thickness = overlap + base;	
// 	t = [0, b[1].y + thickness/2 - overlap, (b[1].z - b[0].z)/2];
// 	sz = [b[1].x - b[0].x + padding*2, thickness, b[1].z - b[0].z + padding*2];

// 	pedestal = color('brown',cube({size:sz, center:true}));

// 	return union(
// 		object,
// 		pedestal.translate(t)
// 	);
// }

// add_pedestal_z = function(object){
// 	// var overlap = 2;
// 	// var base = 5;
// 	// var padding = -2;

// 	// b = object.getBounds();	
// 	// thickness = overlap + base;	
	
// 	// sz = [b[1].x - b[0].x + padding*2, b[1].y - b[0].y + padding*2, thickness];
// 	// t = [(b[1].x + b[0].x)/2, (b[1].y + b[0].y)/2, b[0].z - thickness/2 + overlap];

// 	pedestal = componentFactory.createPedestal(object);
// 	// pedestal.scale(sz);

// 	return union(
// 		object,
// 		pedestal
// 	);
// }

place_object_on_canvas = function(object, canvas){
	obj_bottom_z = object.getBounds()[0].z;
	cvs_top_z = canvas.getBounds()[1].z;

	obs = object.getBounds();
	cbs = canvas.getBounds();

	var get_center = function(p){
		return {x:(p[1].x+p[0].x)/2, y:(p[1].y+p[0].y)/2}
	};

	canvas_center = get_center(cbs);
	object_center = get_center(obs);	

	// calculate dx, dy in order to center the object on the canvas
	dx = canvas_center.x - object_center.x;
	dy = canvas_center.y - object_center.y;
	dz = obj_bottom_z - cvs_top_z;
	t = [dx, dy, -dz];
	return union(
		object.translate(t),
		canvas
	);
}