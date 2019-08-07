use <StepMotor_28BYJ.scad>;
use <LED_Module.scad>;
use <Photosensor_KY_018.scad>;

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
  translate([4.90,-25,-8]) rotate([90,270,0]) StepMotor28BYJ();
}

module shaft() {
  difference() {
    union () {
      //TODO: Parametrize this .9 magic number
      translate([dia/2+.9,5,0]) rotate([90,0,0]) cylinder(10,1,1,$fn=25);
      translate([dia/2+.9,-4.5,0]) rotate([90,0,0]) cylinder(7,2.5,3,$fn=25);
    }
    stepper();
  }
}

module stepper_support() {
  module screw() {
    translate([-12.6,-17.5,-8]) rotate([90]) cylinder(8,2,2,true,$fn=32);
  }
  
  difference() {
    translate([-16.25,-17.5,-10.5]) cube([42,2,5]);
    screw();
    translate([35,0,0]) screw();
  }
}

/* MAIN DESIGN */

//shaft1
translate([0,-2]) {
  shaft();
  %stepper();
}

//shaft2
//TODO: Parametrize this 1.9 magic number
translate([-2,dia + 1.9]) rotate([0,0,-90]) { 
  color("cyan",.5) shaft();
  %stepper();
}

stepper_support();
translate([0,10]) rotate([0,0,-90]) stepper_support();
//stepper supports union
translate([-17.5,-17.5,-10.5]) cube([2,2,5]);

/* REFERENCE OBJECTS */
// All of this components are showed only for reference not included in the model

//led
rotate([0,-180]) translate([0,0,-15]) %led();

//photoresistor
translate([-7.5,5,-35]) rotate([90]) %ky_18();

//ball
%rosario_ball();