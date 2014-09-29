include("utils.jscad")
include("squirrel.jscad")
include("tree.jscad")
include("rocket.jscad")
include("cloud.jscad")
include("wheel.jscad")

tactileLibrary = function(){
}

cloud = function(){
	
	var genereate_circle = function(x,y,z){
		dr = Math.random();
		dx = Math.random();
		dy = Math.random();
		dh = 3+2*(Math.random()-0.5);
		return cylinder({r:4+dr,h:dh,center:true}).translate([x+dx,y+dy,z]);
	}
	
	var generate_layer = function(){
		var a = new Array();
		var zs = [0];
		for (var z in zs){
			for (var i=0; i < 4; i=i+1){
				a.push(genereate_circle(3+i*5,5,z));
			}
			for (var i=0; i < 5; i=i+1){
				a.push(genereate_circle(i*5,0,z));
			}	
			for (var i=0; i < 3; i=i+1){
				a.push(genereate_circle(6+i*5,-5,z));
			}
		}
		return union(a);
	}

	model = union(
		generate_layer()
		// generate_layer().rotateX(-180).translate([0,0,-10])
	);
	return model;
}

function load_model_by_name(name){
	switch (name) {
    	case "squirrel":
    		model = squirrel_stl().rotateX(-90);
    		break;
    	case "tree":
    		model = tree_stl().rotateX(-90);
    		break;
    	case "rocket":
    		model = rocket_stl().rotateZ(90).rotateX(-90);
    		break; 
    	case "cloud":
    		model = cloud();
    		break; 
    	case "wheel":
    		model = wheel_stl();
    		break;
    }
    return model;
}

tactileLibrary.load = function(name, options){
	var options = options || {};
	var abstract = options.abstract || false;
	var scale = options.scale || [1,1,1];
	var pedestal = options.pedestal || true;

	var parts = new Array();

	// load the model 
	var model = load_model_by_name(name);

	// scale the model
	model = model.scale(scale);

	// use an abstract representation (if specified)
	if (abstract){
		model = componentFactory.createBoundingBox(model);
	}
	
	parts.push(model);

	// add a pedestal (optional)
	if (pedestal){
		ped = componentFactory.createPedestal(model);
		parts.push(ped);
	}

	return union(parts);
}