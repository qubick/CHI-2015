//
// Library containing helper functions for laying out components and objects 
//

layoutHelper = function(){}

layoutHelper.connect_tactile_to_canvas = function(object, canvas, options){
	var options = options || {};
	var side = options.side || 'above';
	switch (side) {
    case "above":
    	canvas_connector = canvas.properties.connectorCenterAbove;
    	break;
    case "below":
    	canvas_connector = canvas.properties.connectorCenterBelow;
    	break;
    }

	object = object.connectTo(
	  object.properties.connector, 
	  canvas_connector,
	  true,   // mirror 
	  0       // normalrotation
	);
	return object;
}

layoutHelper.connect_hinge_to_canvas = function(hinge, canvas, options){
	var options = options || {};
	var side = options.side || 'right';
	
	// get the connector
	switch (side) {
    case "top":
    	canvas_connector = canvas.properties.connectorTop;
    	break;
    case "bottom":
    	canvas_connector = canvas.properties.connectorBottom;
    	break;
    case "left":
    	canvas_connector = canvas.properties.connectorLeft;
    	break;
	case "right":
    	canvas_connector = canvas.properties.connectorRight;
    	break;
	}

	// connect the hinge to the canvas
	hinge = hinge.connectTo(
	  hinge.properties.connector, 
	  canvas_connector,
	  true,   // mirror 
	  0       // normalrotation
	);

	return hinge;
}
