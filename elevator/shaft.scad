module shaft(height, cabin_width, cabin_depth, thickness) {
  double_thickness = thickness * 2;
  quad_thickness = double_thickness * 2;

  difference() {
    cube([cabin_width + quad_thickness, cabin_depth + quad_thickness, height]);

    translate([thickness, thickness, thickness])
    cube([cabin_width + double_thickness, cabin_depth + quad_thickness, height]);
  }
}

  cabin_height = 300;
  cabin_width = 110;
  cabin_depth = 110;

  shaft_height = 3000;
  
  thickness = 5;

  union() {
    shaft(shaft_height, cabin_width, cabin_depth, thickness);
  }