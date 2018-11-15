use <shaft.scad>
use <cabin.scad>

module elevator() {
  cabin_height = 300;
  cabin_width = 110;
  cabin_depth = 110;

  shaft_height = 2000;
  
  thickness = 5;

  union() {
    shaft(shaft_height, cabin_width, cabin_depth, thickness);

    translate([thickness * 2, thickness * 2, thickness + ($t * (shaft_height - cabin_height))])
    cabin(cabin_height, cabin_width, cabin_depth, thickness);
  }
}

elevator();