module cabin(height, width, depth, thickness) {
  double_thickness = thickness * 2;
  
  difference() {
    cube([width, depth, height]);

    translate([thickness, thickness, thickness])
    cube([width - double_thickness, 
          depth,
          height - double_thickness]);
  }
}