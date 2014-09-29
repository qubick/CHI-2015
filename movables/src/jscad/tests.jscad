include("tactileLibrary.jscad")
include("componentFactory.jscad")
include("layoutHelper.jscad")

tests = function(){
}

tests.blank_canvas = function (){
	return componentFactory.createCanvas();
}

tests.connect_hinges_to_canvas_on_four_sides = function (){

	var parts = new Array();

	hinge1 = componentFactory.createHinge();
	hinge2 = componentFactory.createHinge();
	hinge3 = componentFactory.createHinge();
	hinge4 = componentFactory.createHinge();

	canvas = componentFactory.createCanvas();

	hinge1 = layoutHelper.connect_hinge_to_canvas(hinge1, canvas, {side:'top'});
	hinge2 = layoutHelper.connect_hinge_to_canvas(hinge2, canvas, {side:'bottom'});
	hinge3 = layoutHelper.connect_hinge_to_canvas(hinge1, canvas, {side:'left'});
	hinge4 = layoutHelper.connect_hinge_to_canvas(hinge1, canvas, {side:'right'});

	parts.push(canvas);
	parts.push(hinge1);
	parts.push(hinge2);
	parts.push(hinge3);
	parts.push(hinge4);

	return union(parts);
}

tests.load_a_squirrel = function(){
	return tactileLibrary.load('squirrel', {scale:[1,1,0.25]});
}

tests.load_a_squirrel_as_abstract = function(){
	return tactileLibrary.load('squirrel', {abstract:true, scale:[1,1,0.25]});
}

tests.connect_a_squirrel_to_a_canvas = function(){
	object = tactileLibrary.load('squirrel',{abstract:false, scale:[1,1,0.25]});
	canvas = componentFactory.createCanvas();

	object = layoutHelper.connect_tactile_to_canvas(object, canvas);
	return union(object, canvas);
}

tests.trees_on_both_sides_of_a_canvas = function(){
	abstract = false;
	object1 = tactileLibrary.load('tree',{abstract:abstract, scale:[1,1,0.25]});
	object2 = tactileLibrary.load('tree',{abstract:abstract, scale:[0.5,0.5,0.25]});
	canvas = componentFactory.createCanvas();

	object1 = layoutHelper.connect_tactile_to_canvas(object1, canvas, {side:'above'});
	object2 = layoutHelper.connect_tactile_to_canvas(object2, canvas, {side:'below'});

	return union(object1, object2, canvas)
		.rotateY(-25); // rotate a bit to make it easy to see the other side
}

tests.squirrel_and_tree_on_the_same_canvas = function(){
	var parts = new Array();
	abstract = false;

	squirrel = tactileLibrary.load('squirrel',{abstract:abstract, scale:[0.75,0.75,0.25]});
	tree = tactileLibrary.load('tree',{abstract:abstract, scale:[2,0.8,0.25]});
	
	canvas = componentFactory.createCanvas();

	squirrel = layoutHelper.connect_tactile_to_canvas(squirrel, canvas);
	tree = layoutHelper.connect_tactile_to_canvas(tree, canvas);

	squirrel = squirrel.translate([0,10,0]);
	tree = tree.translate([0,-30,0]);

	parts.push(squirrel);
	parts.push(tree);
	parts.push(canvas);

	return union(parts);
}

tests.squirrel_and_tree_on_two_canvases = function(){
	var parts = new Array();
	abstract = false;

	squirrel = tactileLibrary.load('squirrel',{abstract:abstract, scale:[1,1,0.25]});
	tree = tactileLibrary.load('tree',{abstract:abstract, scale:[1,1,0.25]});
	
	canvas1 = componentFactory.createCanvas().translate([0,60,0]).scale([1,0.75,1]);;
	canvas2 = componentFactory.createCanvas().translate([0,-60,0]).scale([1,0.5,1]);

	squirrel = layoutHelper.connect_tactile_to_canvas(squirrel, canvas1);
	tree = layoutHelper.connect_tactile_to_canvas(tree, canvas2);

	parts.push(squirrel);
	parts.push(tree);
	parts.push(canvas1);
	parts.push(canvas2);
	return union(parts);
}

tests.wall_on_one_side = function(){
	var parts = new Array();

	canvas1 = componentFactory.createCanvas();
	canvas2 = componentFactory.createCanvas().scale([0.5,0.25,1]).translate([0,0,35]);

	wall1 = componentFactory.createWall(canvas2);

	parts.push(canvas1);
	parts.push(canvas2);
	parts.push(wall1);
	return union(parts);
}

tests.wall_on_four_sides = function(){
	var parts = new Array();

	canvas1 = componentFactory.createCanvas();
	canvas2 = componentFactory.createCanvas().scale([0.5,0.25,1]).translate([0,0,35]);

	wall1 = componentFactory.createWall(canvas2, {side:'left'});
	wall2 = componentFactory.createWall(canvas2, {side:'right'});
	wall3 = componentFactory.createWall(canvas2, {side:'top'});
	wall4 = componentFactory.createWall(canvas2, {side:'bottom'});	

	parts.push(canvas1);
	parts.push(canvas2);

	parts.push(wall1);
	parts.push(wall2);
	parts.push(wall3);
	parts.push(wall4);
	return union(parts);
}

tests.walls_for_two_canvases_above = function(){
	var parts = new Array();

	canvas_base = componentFactory.createCanvas();
	canvas1 = componentFactory.createCanvas().scale([0.5,0.25,1]).translate([0,30,35]);
	canvas2 = componentFactory.createCanvas().scale([0.75,0.35,1]).translate([0,-30,25]);

	wall1a = componentFactory.createWall(canvas1, {side:'top', height:35});
	wall1b = componentFactory.createWall(canvas1, {side:'bottom', height:35});
	
	wall2a = componentFactory.createWall(canvas2, {side:'left', height:25});
	wall2b = componentFactory.createWall(canvas2, {side:'right', height:25});

	parts.push(canvas_base);
	parts.push(canvas1);
	parts.push(canvas2);

	parts.push(wall1a);
	parts.push(wall1b);
	parts.push(wall2a);
	parts.push(wall2b);
	return union(parts);
}

tests.squirrel_behind_tree_with_walls = function(){
	var parts = new Array();
	abstract = false;

	squirrel = tactileLibrary.load('squirrel',{abstract:abstract, scale:[1,1,0.25]});
	tree = tactileLibrary.load('tree',{abstract:abstract, scale:[1,1,0.25]});
	
	canvas1 = componentFactory.createCanvas().translate([0,0,0]).scale([1,0.75,1]);;
	canvas2 = componentFactory.createCanvas().translate([0,0,18]).scale([1,0.5,1]);

	squirrel = layoutHelper.connect_tactile_to_canvas(squirrel, canvas1);
	tree = layoutHelper.connect_tactile_to_canvas(tree, canvas2);

	wall1 = componentFactory.createWall(canvas2, {side:'left', height:18});
	wall2 = componentFactory.createWall(canvas2, {side:'right', height:18});

	parts.push(squirrel);
	parts.push(tree);
	parts.push(wall1);
	parts.push(wall2);	
	parts.push(canvas1);
	parts.push(canvas2);
	return union(parts);
}

tests.squirrel_behind_tree_with_walls_print_view = function(){
	var parts = new Array();
	abstract = false;

	squirrel = tactileLibrary.load('squirrel',{abstract:abstract, scale:[1,1,0.25]});
	tree = tactileLibrary.load('tree',{abstract:abstract, scale:[1,1,0.25]});
	
	canvas1 = componentFactory.createCanvas().translate([0,0,0]).scale([1,0.75,1]);;
	canvas2 = componentFactory.createCanvas().translate([0,0,18]).scale([1,0.5,1]);

	squirrel = layoutHelper.connect_tactile_to_canvas(squirrel, canvas1);
	tree = layoutHelper.connect_tactile_to_canvas(tree, canvas2);

	wall1 = componentFactory.createWall(canvas2, {side:'left', height:18});
	wall2 = componentFactory.createWall(canvas2, {side:'right', height:18});

	hinge1 = componentFactory.createHinge();
	
	canvas2 = union(canvas2, tree).translate([0,-70,-18]);

	hinge1 = layoutHelper.connect_hinge_to_canvas(hinge1, canvas2, {side:'right'});
	hinge1 = hinge1.lieFlat().translate([60,-75,0]);

	parts.push(squirrel);
	parts.push(wall1);
	parts.push(wall2);	
	parts.push(canvas1);
	parts.push(canvas2);
	parts.push(hinge1);
	return union(parts);
}

tests.rocket = function(){
	var parts = new Array();
	abstract = false;
	margin = 18;

	rocket = tactileLibrary.load('rocket',{abstract:abstract, scale:[1,0.5,0.25]});
	cloud = tactileLibrary.load('cloud',{abstract:abstract, scale:[3,2.5,1]});
		
	canvas1 = componentFactory.createCanvas().translate([0,0,0]).scale([1,1,1]);
	canvas2 = componentFactory.createCanvas().scale([1,0.5,1]).translate([0,-20,margin]);

	rocket = layoutHelper.connect_tactile_to_canvas(rocket, canvas1);
	cloud = layoutHelper.connect_tactile_to_canvas(cloud, canvas2);
	
	wall1 = componentFactory.createWall(canvas2, {side:'left', height:margin});
	wall2 = componentFactory.createWall(canvas2, {side:'right', height:margin});

	parts.push(cloud);
	parts.push(rocket);
	parts.push(wall1);
	parts.push(wall2);	
	parts.push(canvas1);
	parts.push(canvas2);
	return union(parts);
}

tests.track_print_view = function(){
	track = componentFactory.createTrack({print:true});
	return track;
}

tests.a_track = function(){
	track = componentFactory.createTrack();
	return track;
}

tests.track_varying_in_lengths = function(){
	var parts = new Array();
	
	parts.push(componentFactory.createTrack({length:20}).translate([0,0,0]));
	parts.push(componentFactory.createTrack({length:25}).translate([20,0,0]));
	parts.push(componentFactory.createTrack({length:30}).translate([40,0,0]));
	parts.push(componentFactory.createTrack({length:35}).translate([60,0,0]));
	parts.push(componentFactory.createTrack({length:40}).translate([80,0,0]));
	return union(parts);
}

tests.rocket_on_a_vertical_track = function(){
	var parts = new Array();
	abstract = false;

	track = componentFactory.createTrack();
	canvas1 = componentFactory.createCanvas().translate([0,0,0]).scale([1,1,1]);
	rocket = tactileLibrary.load('rocket',{abstract:abstract, scale:[1,0.5,0.25]});

	track = layoutHelper.connect_tactile_to_canvas(track, canvas1);
	rocket = layoutHelper.connect_tactile_to_canvas(rocket, track);

	parts.push(track);
	parts.push(canvas1);
	parts.push(rocket);
	return union(parts);
}

tests.rocket_on_a_vertical_track_behind_a_cloud = function(){
	var parts = new Array();
	abstract = false;
	margin = 25;

	track = componentFactory.createTrack();
	canvas1 = componentFactory.createCanvas().translate([0,0,0]).scale([1,1,1]);
	canvas2 = componentFactory.createCanvas().scale([1,0.5,1]).translate([0,-20,margin]);

	rocket = tactileLibrary.load('rocket',{abstract:abstract, scale:[1,0.5,0.25]});
	cloud = tactileLibrary.load('cloud',{abstract:abstract, scale:[3,2.5,1]});

	track = layoutHelper.connect_tactile_to_canvas(track, canvas1);	
	rocket = layoutHelper.connect_tactile_to_canvas(rocket, track);
	cloud = layoutHelper.connect_tactile_to_canvas(cloud, canvas2);

	wall1 = componentFactory.createWall(canvas2, {side:'left', height:margin});
	wall2 = componentFactory.createWall(canvas2, {side:'right', height:margin});
	wall3 = componentFactory.createWall(canvas2, {side:'bottom', height:margin});

	parts.push(track);
	parts.push(canvas1);
	parts.push(canvas2);
	parts.push(rocket);
	parts.push(cloud);
	parts.push(wall1);
	parts.push(wall2);	
	parts.push(wall3);	
	return union(parts);
}

tests.spinner = function(){
	var parts = new Array();
	parts.push();

	ring1 = difference(
		cylinder({r:3.5, h:0.5}),
		cylinder({r:0.86, h:3})
	);
	ring1 = color('green', ring1);

	ring2 = difference(
		cylinder({r:3.5, h:2.5}),
		cylinder({r:1.2, h:2})
	);
	ring2 = color('blue', ring2);
	ring2.properties.connectorCenterAbove = 
		new CSG.Connector([0, 0, 2.5], [0, 0, 1], [1, 0, 0]);

	wheel = union(
		ring1,
		ring2.translate([0,0,0.5])
	);

	
	//ring = ring.translate([0,0,5]);

	inner_dowel = difference(
		
	 	// pin
		union(			
			// base
			cylinder({r:4, h:0.5}),
			// neck
			cylinder({r:0.6,h:2}),
			// round head
			sphere({r:0.85}).translate([0,0,2.5])
		),

		// center cut
	 	cube([3, .3 , 3]).translate([-1,-.2, 1])
	);

	// color
	inner_dowel = color('LightSkyBlue',inner_dowel);

	// 'CornflowerBlue' = 100,149,237
	wheel = color([100/255,149/255,237/255,0.5],wheel);
	//translate([0, 0, 2.5]) sphere($fn=50, r=0.85);

	wheel = wheel.translate([0,0,1]);
	
	// wheel = wheel.translate([10,0,0]).rotateX(180).translate([0,0,3]);


	spinner = union(inner_dowel, wheel);

	object = tactileLibrary.load('wheel',{abstract:false, scale:.25});
	object = layoutHelper.connect_tactile_to_canvas(object, spinner);

	//parts.push(object);
	parts.push(spinner);

	return union(parts);
}
