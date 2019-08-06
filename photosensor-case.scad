module board() {
  union() {
    //Board
    //color("Green", 0.5)
      cube([15, 24, 2]);
    //Solded components space
    translate([1, 1, -1])
      cube([13, 22, 1]);
    //Black plastic space
    //color("Red", 0.5)
      translate([2, 0, 2])
      cube([11, 2, 2]);
    //Connection pins (the 3 of them)
    translate([2, -6, 4])
      cube([11, 8, 2]);
    //Photo resistor connection space
    translate([1, 2, 2])
      cube([13, 21, 2]);
    //Photo resistor
    translate([7.5,25,4.5]) rotate([90,0,0]) cylinder(5,2.5,2.5,$fn=50);
  }
}

difference() {
  difference() {
    color("blue", 0.5) translate([-1,-1.5,-1.5]) cube([17, 26, 9]);
    board();
  }
}