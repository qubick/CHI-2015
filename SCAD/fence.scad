module fence(){

	for(i= [0:6])
	{
		translate([-15, 50-16*i, 5])
			cube([2, 15, 70]);
	}
	translate([-16, -45, 60])
		cube([1, 110, 10]);

	translate([-16, -45, 10])
		cube([1, 110, 10]);
}

fence();