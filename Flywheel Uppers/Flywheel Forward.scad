module 180Motor()
{
	//Code for 180 motor - scale for cut outs and insertions

	difference()
	{
		union()
		{	
			cylinder(r = 20.4 / 2, h = 34.2);		
		}

		translate([15.4 / 2, -20, 0])
		{
			cube([10, 40, 34.2]);
		}

		translate([-15.4 / 2 - 10 , -20, 0])
		{
			cube([10, 40, 34.2]);
		}
	}
}

module MotorFlywheelHousing()
{

			translate([44 / 2, 0, 0])
			{
				rotate([0, 0, 0])
				{
					cylinder(r = 44 / 2, h = 50);
				}
			}

			translate([- 44 / 2, 0, 0])
			{
				rotate([0, 0, 0])
				{
					cylinder(r = 44 / 2, h = 50);
				}
			}

}

module 180MotorHousings()
{

		//Motor Housing 1
		translate([-22, 0, 0])
		{
			scale([1.01, 1.01, 1])
			{
				180Motor();
			}
		}
	
		//Motor Housing 2
		translate([22, 0, 0])
		{
			scale([1.01, 1.01, 1])
			{
				180Motor();
			}
		}

}


module FlywheelCutOuts()
{

		//Flywheel Spacing 1
		translate([22, 0, 34.2 - 4])
		{
			cylinder(r = 35 /2, h = 100);
		}

		//Flywheel Spacing 2
		translate([-22, 0, 34.2 - 4])
		{
			cylinder(r = 35 /2, h = 100);
		}
}

module LowerInterface()
{
	//Interface between forward upper and lower blaster receiver

	difference()
	{
		union()
		{
			translate([-22, -20, 0])
			{
				cube([44, 40, 34.2]);
			}
		}

		translate([-7, -15, 0])
		{
			cube([14, 45, 10]);
		}

		translate([0, 20, 10])
		{
			rotate([90, 0, 0])
			{
				cylinder(r = 7, h = 45);
			}
		}

	}
}

module CompleteForwardUpper()
{
	difference()
	{
		union()
		{
			MotorFlywheelHousing();
			LowerInterface();
	
			translate([0, 23, 40])
			{
				rotate([90, 0, 0])
				{
					cylinder(r = 15, h = 44);
				}
			}

		}

		180MotorHousings();
		FlywheelCutOuts();

		//Super Block - Top cut off
		translate([-50, -50, 45])
		{
			cube([100, 100, 20]);
		}

		translate([0, 50, 40])
		{
			rotate([90, 0, 0])
			{
				cylinder(r = 10, h = 500);
			}
		}
/*
		translate([-7, -20, 0])
		{
			cube([14, 45, 10]);
		}

		translate([0, 25, 10])
		{
			rotate([90, 0, 0])
			{
				cylinder(r = 7, h = 45);
			}
		}
*/
	}
}

CompleteForwardUpper();