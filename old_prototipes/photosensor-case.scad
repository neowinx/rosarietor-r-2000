module board() {
  union() {
    //Board
    color("Green", 0.25) cube([15.5, 24, 2]);
    //Solded components space
    //translate([1, 1, -1])
    //  cube([13, 22, 1]);
    //Black plastic space
    color("Red", 0.25) translate([0, 0, 2]) cube([15.5, 2, 2]);
    //Connection pins (the 3 of them)
    color("Pink", 0.25) translate([2.25, -6, 4]) cube([11, 8, 2]);
    //Photo resistor connection space
    color("Cyan", 0.25) translate([0, 2, 2]) cube([15.5, 22, 5.5]);
    //Photo resistor
    translate([7.5,26,4.5]) rotate([90,0,0]) cylinder(5,2.75,2.75,$fn=50);
  }
}

module bottom() {
  difference() {
    color("blue", 0.5) translate([-1,-1,-1]) cube([17,26,4]);
    board();
  }
}

module top() {
  difference() {
    color("brown", 0.5) translate([-1,-1,3]) cube([17,26,5]);
    board();
  }
}

top();
//bottom();