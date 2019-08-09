module ky_18() {
  module pin() {
    //Black plastic Signal
    color("Red", 0.25) translate([4, 0, 2]) cube([2, 2, 2]);
    //Connection pin
    color("Pink", 0.25) {
      translate([4.5, 0.5, 4]) cube([1, 1, 1]);
      translate([4.5, -4.5, 5]) cube([1, 6, 1]);
    }
  }
  
  module photoresistor_pin() {
    translate([6,12, 2]) cube([1, 1, 1]);
    translate([6,12, 3]) cube([1, 12, 1]);
  }
 
  //Board
  color("Green", 0.25) cube([15.5, 24, 2]);
 
  //Connection pins (the 3 of them)
  pin();
  translate([2.5,0,0]) pin();
  translate([5,0,0]) pin();
  
  //Photoresistor pins (2 of them)
  photoresistor_pin();
  translate([2,0,0]) photoresistor_pin();
  
  //Photo resistor
  translate([7.5,26,4.5]) rotate([90,0,0]) cylinder(2,2.5,2.5,$fn=50);
}

ky_18();