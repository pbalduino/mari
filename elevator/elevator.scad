use <shaft.scad>
use <cabin.scad>

module elevator() {
  height = 300;
  width = 110;
  depth = 110;
  thickness = 5;

  cabin(height, width, depth, thickness);
}