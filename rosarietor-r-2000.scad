use <modules/StepMotor_28BYJ.scad>;
use <modules/LED_Module.scad>;
use <modules/Photosensor_KY_018.scad>;
use <rosarietor-r-2000-shaft.scad>;

// Ball diameter (mm)
dia = 8;

// some expansion to relieve stress when printing parts
e = .5;

// adjusted diameter (diameter + expansion)
ad = dia + e;

// cell thickness (mm)
t = 2;
m = t / 2;

/* PARTS */

module rosario_ball() {
  color("OrangeRed", .5)
  difference() {
    sphere(d=ad, true, $fn=50);
    cylinder(r=0.5, h=10, center=true, $fn=50);
  }
}

module stepper() {
  translate([6.90,-25,-8]) rotate([90,270,0]) StepMotor28BYJ();
}

module stepper_support() {
  module screw() {
    translate([-12.6,-17.5,-8]) rotate([90]) cylinder(8,2,2,true,$fn=32);
  }
  
  difference() {
    translate([-18.25,-17.5,-10.5]) cube([44,2,5]);
    screw();
    translate([35,0,0]) screw();
  }
}

module photoresistor_support() {
  translate([-17.5,-1.5,-37]) cube([2,5,27]);
  difference() {
    color("Purple",.5) translate([-9,-1.5,-37]) cube([3,5,24]);
    translate([-7.5,3,-35]) rotate([90]) ky_18();
  }
  difference() {
    color("red",.5) translate([-15.5,-1.5,-37]) cube([25,5,4]);
    translate([-7.5,3,-35]) rotate([90]) ky_18();
    color("blue",.5) translate([-5,-3,-35]) cube([10,7,2]);
  }
}

module plate() {
  translate([2,2,-1])
  difference() {
    translate([0,0,-2.5]){
      cylinder(2,6,6,$fn=50);
      color("magenta",.5) translate([0,0,-10]) {
        difference() {
          cylinder(10,6,6,$fn=50);
          cylinder(10,5,5,$fn=50);
        }
      } 
    } 
    sphere(d=ad, true, $fn=50);
  }
}

module plate_arm() {
  translate([1,-16,-9]) rotate([24,0,0])cube([2,14,2]);
}

module led_support() {
  difference() {
    translate([2,2,10]) cylinder(h=2,d1=7,d2=7, center=true);
    translate([2,2,10]) cylinder(h=2,d1=5,d2=5, center=true);
  }
  translate([6.5,6.5,4]) cylinder(h=14,d1=2.5,d2=2.5, center=true);
  translate([5,5,10]) rotate([0,0,45]) cube([4,2,2], center=true);
}

/* MAIN DESIGN */

//shaft1
translate([0,-2]) {
  shaft(dia);
  %stepper();
}

//shaft2
//TODO: Parametrize this 1.9 magic number
translate([-2,dia + 5.9]) rotate([0,0,-90]) { 
  color("cyan",.5) shaft(dia);
  %stepper();
}

color("Crimson") translate([2,0,0]) stepper_support();
translate([0,12]) rotate([0,0,-90]) stepper_support();
//stepper supports union
translate([-17.5,-17.5,-10.5]) cube([2,4,5]);

photoresistor_support();

plate();
plate_arm();
translate([0,4,0]) rotate([0,0,-90]) plate_arm();

led_support();

/* REFERENCE OBJECTS */
// All of this components are showed only for reference not included in the model

//led
rotate([0,-180]) translate([-2,2,-15]) %led();

//photoresistor
translate([-7.5,3,-37]) rotate([90]) %ky_18();

//ball
translate([2,2,0]) %rosario_ball();

