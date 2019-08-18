module laser_support() {
  rotate([180]) translate([63,-100,-11]) import("modules/lasercase.stl", convexity=3, center=true);
  rotate([0,0,90]) translate([-30,-22]) %import("modules/laserplate.stl", convexity=3, center=true);
  translate([35,0]) cube([20,20,2]);
}

laser_support();