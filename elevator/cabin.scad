module rail(height) {
  minkowski() {
    cube([10, 7, height / 2]);
    cylinder(r = 3, h = height / 2);
  }
}

module cabin(height, width, depth, thickness) {
  double_thickness = thickness * 2;
  quad_thickness = double_thickness * 2;
  
  union() {
    // cabin
    difference() {
      // outer box
      cube([width, depth, height]);

      union() {
        // space for the passenger and front door
        translate([thickness, thickness, thickness])
        cube([width - double_thickness, 
              depth,
              height - double_thickness]);

        // rear window
        translate([double_thickness, -thickness, (height * 0.6) - quad_thickness])
        cube([width - quad_thickness, 
              quad_thickness,
              height * 0.4]);
      }
    }
    
    // right rail
    translate([-double_thickness, (depth - 10) / 2, 0])
    rail(height);
    
    // left rail
    translate([width, (depth - 10) / 2, 0])
    rail(height);
    
    // upper hook
    

    // lower hook
  }
}