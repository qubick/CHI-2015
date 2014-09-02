
module door(){
	difference(){
		translate([-10, -40, -5]) rotate([0, 0, 90])
			cube([100, 3, 70]);

		for(i= [0:2])
		{
		translate([-15, -i*15, 5])
			cube([10, 10, 50]);
		}
	}
}

door();