//Project Anubis - Lower Receiver for Open Source Community Blaster
// (c) Michael Harratt 2014 - Available under license CC-BY-SA 4.0 International

module MagazineGeometry()
{
		//Measure for complete Nerf N-Strike Magazine footprint
		polygon(points = [[0, 4],
								[0, 20],
								[12, 24],
								[69, 24],
								[81, 20],
								[81, 4],
								[69, 0],
								[12, 0]]
					);
}

module MagazineWellHole()
{
	scale([ 83 / 81, 26 / 24, 1])
	{
		linear_extrude(height = 65)
		{
			MagazineGeometry();
		}
	}
}

module MagazineWellShroud()
{

	scale([93 / 81, 36 / 24, 1])
	{
		linear_extrude(height = 65)
		{
			MagazineGeometry();
		}
	}

}

module MagRetentionHole()
{
	union()
	{
		translate([0, -2, 0])
		{
			cube([5, 40, 5]);
		}

		translate([0, 38, 2.5])
		{
			rotate([90, 0, 0]) cylinder(r = 5/ 2, h = 40);
		}

		translate([-5, 14.5, 2.5])
		{
			rotate([0, 90, 0])
			{
				cylinder(r = 3, r2 = 2.5, h = 5);
			}
		}
	}
}

module TriggerClusterInterface()
{

	difference()
	{
		union()
		{
			translate([50, 0, 0])
			{
				cube([50, 8, 20]);
			}

			translate([50, 21, 0])
			{
				cube([50, 8, 20]);
			}
		}

		//Cluster Mounting Holes
		translate([60, 40, 10])
		{
			rotate([90, 0, 0]) cylinder(r=2, h = 50);
		}

		translate([80, 40, 10])
		{
			rotate([90, 0, 0]) cylinder(r=2, h = 50);
		}

	}

}

module MagWellRearHousing()
{

	cube([30, 29, 55]);

}

module MagWellForwardHousing()
{
	difference()
	{
		translate([27, 8, 0])
		{	
			cube([30, 12, 40]);
		}

		translate([35, 50, 30])
		{
			rotate([90, 0, 0]) 
			{
				cylinder(r = 2, h = 100); //Screw Hole
			}
		}

		translate([50, 50, 30])
		{
			rotate([90, 0, 0]) 
			{
				cylinder(r = 2, h = 100); //Screw Hole
			}				
		}
	}
}

//Produce a working lower receiver
module CompleteLowerReceiver()
{
	difference()
	{
		union()
		{
			translate([-8, 0, 0])
			{
				MagWellRearHousing();
			}

			translate([60, 0, 0])
			{
				MagWellForwardHousing();
			}

			translate([-5, -4, 0])
			{
				MagazineWellShroud();
			}
		
			translate([-100, 0, 0])
			{
				TriggerClusterInterface();
			}
		}

		translate([0, 0, 45])
		{
			MagRetentionHole();
		}

		translate([(86 / 81), (29 / 24), 0])
		{
			MagazineWellHole();
		}
	}
}

CompleteLowerReceiver();
//MagWellForwardHousing();