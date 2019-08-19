/* Micro Servo 2.2kg  version 1.0
    Designed by Jeff Jukes  March 2016

    A generic 2.2kg Servo that can be used for illustration or for sizing parts

    Command:
                microServo2kg(out="h", arm="l");
    Options: 
            out  =       "d" or "D" otput disc
                            "a" or "A" single output arm 
                            "h" or "H" dual output arm
                            
            arm  =     "l" or "L"  arm points left
                            "r" or "R" arm points right
            lng   =      length of servol arm
        
* This work is licensed under the Creative Commons - Attribution - Non-Commercial license.
 * https://creativecommons.org/licenses/by-nc/3.0/
*/

nmp=0.02;//non manifold prevention
nmp2=nmp*2;

$fn=75;

microServo2kg(out="a", arm="l",lng = 25);

module microServo2kg(out = "H", arm = "r", lng = 15){
// micro_servo x,y,z:fix l, thk : posn
// The servo '0' is vertical shaft axis and the bottom of the mounting lugs
	micro_servo = [22, 12, 22.5,27];
	micro_servo_mtg = [33, micro_servo[1], 2.5];
    echo("Servo 2.2kg", micro_servo);
    echo("Servo 2.2kg options : l or r");
	translate([-(micro_servo[0]/2-micro_servo[1]/2),0,-micro_servo[2]/2+4.75]){		
		color("DarkSlateGrey", 1) {
                servoBody(micro_servo[0], micro_servo[1], micro_servo[2], micro_servo[3]);
                translate([0,0,micro_servo[2]/2-4.5])
                    servoMount(micro_servo_mtg[0], micro_servo_mtg[1], micro_servo_mtg[2]);
		}
        if(out =="d"|| out=="D"){
            color("White",1){   
                translate([(micro_servo[0]/2-micro_servo[1]/2),0,micro_servo[3]/2+7])
                    servoDisc(rh = lng);
            }
         }
        if(out =="a"|| out=="A"){
            if (arm == "r"|| arm=="R"){
                color("White", 1) {
                    translate([(micro_servo[0]/2-micro_servo[1]/2),0,micro_servo[3]/2+7])
                        servoarm(lng);
                    }
                }  
            if (arm == "l"|| arm=="L"){	
                color("White", 1) {
                    translate([(micro_servo[0]/2-micro_servo[1]/2),0,micro_servo[3]/2+7])
                        rotate([0, 0, 180])
                            servoarm(lng);
                 }
            }
        }
        if(out =="h"|| out=="H"){
            if (arm == "r"|| arm=="R"){
                color("White", 1) {
                    translate([(micro_servo[0]/2-micro_servo[1]/2),0,micro_servo[3]/2+7])
                        servoHorn();
                        }
            }  
            if (arm == "l"|| arm=="L"){	
                color("White", 1) {
                    translate([(micro_servo[0]/2-micro_servo[1]/2),0,micro_servo[3]/2+7])
                        rotate([0, 0, 90])
                            servoHorn();
                 }
            }
        }
    }
}

module servoBody(x=10, y=10, z=10 ,tw=15){
	cube([x, y, z], center = true);
	translate([(x/2-y/2),0,(tw/2-z/2)])
		cylinder(r=y*0.5, h=tw, center=true);
	translate([0,0,(tw/2-z/2)])
		cylinder(r=2.6, h=tw, center=true);
}

module servoMount(x=10, y=10, thk=2.5){
	difference() {	
		cube([x, y, thk], center = true);
		translate([(x*0.5)-2.5,0,0])
			cylinder(r=1.5, h=thk+nmp2, center=true); //mounting screw
		translate([(x*0.5),0,0])
			cube([2.5, 1, thk+nmp2], center=true); //Mounting Slot
		translate([-(x*0.5)+2.5,0,0])
			cylinder(r=1.5, h=thk+nmp2, center=true); //mounting screw
		translate([-(x*0.5),0,0])
			cube([2.5, 1, thk+nmp2], center=true); //Mounting Slot
	}
}

module servoDisc(rh=11.5, hub=3.5, thk=1.8, hgt=6,spokes=2){
	difference() {
		union() {
			cylinder(r=rh, h=thk, center=true);
			translate([0,0,(thk/2)-(hgt/2)])
				cylinder(r=hub, h=hgt, center=true);
		}	
		translate([0,0,(thk/2)-(hgt/2)])		
			cylinder(r=1, h=hgt+nmp2, center=true);
		for (a=[0,90,180,270]){ //holes in disc
		rotate([0,0,a])
			translate([-rh+1.5,0,0])
				cylinder(r=0.5, h=thk+nmp2, center=true);
		}
	}
}
module servoarm(rh=30, hub=3.5, thk=1.8, hgt=6){
	difference() {
        rotate([0, 0, 90]){
            union() {
                hull() {
                    cylinder(r=hub, h=thk, center=true);
                    translate([-rh,0,0])
                        cylinder(r=1.5, h=thk, center=true);
                }
            }
        translate([0,0,(thk/2)-(hgt/2)])
            cylinder(r=hub, h=hgt, center=true);
        }
        rotate([0,0,-90])	
            translate([rh,0,0])
                cylinder(r=0.5, h=thk+nmp2, center=true);
        translate([0,0,(thk/2)-(hgt/2)])		
            cylinder(r=1, h=hgt+nmp2, center=true);
	}
}
    
module servoHorn(rh=11.5, hub=3.5, thk=1.8, hgt=6){
	difference() {
		union() {
			hull() {
				cylinder(r=hub, h=thk, center=true);
				translate([-rh,0,0])
					cylinder(r=1.5, h=thk, center=true);
				translate([rh,0,0])
					cylinder(r=1.5, h=thk, center=true);
			}
		translate([0,0,(thk/2)-(hgt/2)])
			cylinder(r=hub, h=hgt, center=true);
			}
		translate([0,0,(thk/2)-(hgt/2)])		
			cylinder(r=1, h=hgt+nmp2, center=true);
		for (a=[0,180]){ //mounting blocks for spacers
			rotate([0,0,a])	
				translate([rh,0,0])
					cylinder(r=0.5, h=thk+nmp2, center=true);
		}
	}
}
