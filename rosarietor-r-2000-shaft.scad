use <modules/StepMotor_28BYJ.scad>;

module shaft(dia) {
  difference() {
    color("green",.5) union () {
      //TODO: Parametrize this .9 magic number
      translate([dia/2+2.9,5,0]) rotate([90,0,0]) cylinder(10,1.25,1.25,$fn=25);
      translate([dia/2+2.9,-4.5,0]) rotate([90,0,0]) cylinder(7,3,4,$fn=25);
    }
    color("Orange") translate([4.5,-12,-1.70]) cube([5,6.25,3.25]);
  }
}

shaft(8);
%translate([6.90,-25,-8]) rotate([90,270,0]) StepMotor28BYJ();