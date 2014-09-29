include("math_hinge.jscad")

componentFactory = function(){
}

componentFactory.createHinge = function(){

	var h = hinge().rotateZ(-90);
	b = h.getBounds();

	p = [b[1].x,(b[0].y+b[1].y)/2,(b[0].z+b[1].z)/2];	
	h.properties.connector = new CSG.Connector(p, [1, 0, 0], [0, 0, 1]);

	return h;
}

componentFactory.createCanvas = function(){
	//c = color('orange',cube({center:true}));
	c = cube({center:true});
	c = c.setColor([0.8,0.8,0,0.7]); 

	c.properties.type = 'canvas';
	c.properties.upperRight = new CSG.Vector3D([0.5, 0.5, 0.5]);
	c.properties.lowerRight = new CSG.Vector3D([0.5, -0.5, 0.5]);

	c.properties.surfaceTop = new CAG.rectangle({center: [0,0], radius: [0.5, 0.5]});  

	c.properties.connectorRight = new CSG.Connector([0.5, 0, 0], [1, 0, 0], [0, 0, 1]);
	c.properties.connectorLeft = new CSG.Connector([-0.5, 0, 0], [-1, 0, 0], [0, 0, 1]);
	c.properties.connectorTop = new CSG.Connector([0, 0.5, 0], [0, 1, 0], [0, 0, 1]);
	c.properties.connectorBottom = new CSG.Connector([0, -0.5, 0], [0, -1, 0], [0, 0, 1]);

	c.properties.connectorCenterAbove = new CSG.Connector([0, 0, 0.5], [0, 0, 1], [1, 0, 0]);
	c.properties.connectorCenterBelow = new CSG.Connector([0, 0, -0.5], [0, 0, -1], [-1, 0, 0]);

	return c.scale([100,100,1]);
}

function utils_for_canvas(canvas){
	canvas.height = function(){
		return this.properties.surfaceTop.sides[0].length();
	}
	canvas.width = function(){
		return this.properties.surfaceTop.sides[1].length();
	}
	canvas.connector = function(side){
		switch (side) {
	    case "top":
	    	return this.properties.connectorTop;
	    	break;
	    case "bottom":
	    	return this.properties.connectorBottom;
	    	break;
	    case "left":
	    	return this.properties.connectorLeft;
	    	break;
		case "right":
	    	return this.properties.connectorRight;
	    	break;
		}
	}
	return canvas;
}

componentFactory.utils = function(object){
	switch (object.properties.type){
		case 'canvas':
			return utils_for_canvas(object);
		break;
	}
}

componentFactory.createWall = function(canvas, options){
	var options = options || {};
	var side = options.side || 'right';
	var wall_height = options.height || 35;

	wall = color('brown',cube({center:true}));	
	wall.properties.connector = new CSG.Connector([-0.5, 0, -0.5], [1, 0, 0], [0, 0, -1]);
	
	canvas_height = componentFactory.utils(canvas).height();	
	canvas_width = componentFactory.utils(canvas).width();

	if (side == 'right' || side == 'left'){
		wall_length = canvas_height;
	}else{
		wall_length = canvas_width;
	}

	wall = wall.scale([5,wall_length,wall_height]);

	canvas_connector = componentFactory.utils(canvas).connector(side);
	wall = wall.connectTo(
	  wall.properties.connector,
	  canvas_connector,
	  true,   // mirror 
	  0       // normalrotation
	);
	return wall;
}

componentFactory.createBoundingBox = function(object){	
	var b = object.getBounds();
	var boxcolor = 'greenyellow';
	var sz = [b[1].x - b[0].x, b[1].y - b[0].y, b[1].z - b[0].z];
	return color(boxcolor,
			cube({size:sz}).translate(b[0]));
}

// create a pedstal that would allow the given object to sit above
componentFactory.createPedestal = function(object){
	var overlap = 2;
	var base = 1;
	var padding = -2;

	p = color('brown',cube({center:true}));

	// center, bottom surface; pointing downard
	p.properties.connector = new CSG.Connector([0, 0, -0.5], [0, 0, -1], [1, 0, 0]);

	// scale and translate the pedestal based on the object
	b = object.getBounds();
	thickness = overlap + base;	
	
	sz = [b[1].x - b[0].x + padding*2, b[1].y - b[0].y + padding*2, thickness];
	t = [(b[1].x + b[0].x)/2, (b[1].y + b[0].y)/2, b[0].z - thickness/2 + overlap];

	p = p.scale(sz).translate(t);
	return p;
}


componentFactory.createTrack = function(options){
	var options = options || {};
	var length = options.length || 40;
	var print = options.print || false;

	var parts = new Array();

	// outer w,h
	var casing_width = 12;
	var casing_height = 6;

	var margin = 2;

	// opening
	var opening = 3;

	// inner w,h
	var cavity_width = casing_width - 2*margin;
	var cavity_height = casing_height - 2*margin;

	casing = cube({center:true});
	casing.properties.connector = 
		new CSG.Connector([0, -0.5, 0], [0, -1, 0], [-1, 0, 0]);
	casing = casing.scale([casing_width,casing_height,1]);

	cavity = union(
		cube({size:[cavity_width,cavity_height,3], center:true}),
		cube({size:[opening,4,3], center:true}).translate([0,1.5,0])
	);


	pin_length = 5;
	head_thickness = 5;
	cap = union(
		// pin
		cube({size:[cavity_width,cavity_height,pin_length], center:true})
			.translate([0,0,-pin_length/2]),

		// head
		casing.translate([0,0,0])
			.scale([1,1,head_thickness])
	);

	wall = cube({size:[casing_width,casing_height,head_thickness], center:true})
	
	insert = union(
		cube({size:[cavity_width-1,cavity_height-1,5], center:true}),
		cube({size:[1.5,4,5], center:true}).translate([0,1.5,0])
	);

	platform = cube({center:true});
	platform.properties.connectorCenterAbove = 
		new CSG.Connector([0, 0, -0.5], [0, 0, -1], [-1, 0, 0]);

	platform = platform
		.scale([10,10,3])
		.rotateX(90)
		.translate([0,5,0]);
	
	track = difference(casing, cavity);
	track = track.scale([1,1,length]);

	track = union(track,
		wall.translate([0,0,-(length+head_thickness)/2]));

	track = color('LightSkyBlue',track);

	cap = color('CornflowerBlue',cap.translate([0,0,(length+head_thickness)/2])),	

	movable = union(insert, platform);
	movable = color('CornflowerBlue',movable)

	if (print){
		parts.push(track.rotateX(-180).lieFlat().translate([20,0,0]));
		parts.push(cap.lieFlat().translate([-20,0,0]));
		parts.push(movable.rotateX(-90).lieFlat());
		return union(parts);
	}else{
		parts.push(track);
		parts.push(cap);
		parts.push(movable);
		return union(parts).rotateX(90);
	}
}