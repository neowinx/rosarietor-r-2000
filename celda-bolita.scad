
// El diametro de la bolita
diameter = 7;
// adjusted diameter (diameter + expansion)
ad = diameter + 1;
// cell thickness
t = 2;
m = t / 2;

module cell () {
  //translate([0, 0, ad - m * 3])
  difference () {
    color("blue", 0.5)
      cube ([ad + t, ad + t, ad + t], true);
    color("red", 0.5)
      cube ([ad, ad, ad * 2], true);
  }
}

module pyramid () {
  //translate([0, 0, m])
  difference () { 
    color("Green", 0.5) 
      rotate([0,180,45]) translate([0, 0, 0]) cylinder(ad, ad - m, 0.8, $fn=4);
    color("DeepPink", 0.5) 
      rotate([0,180,45]) cylinder(ad, (ad + t + m) / 2, 0.3, $fn=4);
  }
}

//sphere(d=ad, true, $fn=100);
cell();
translate([0, 0, - ad + t + m])
pyramid();