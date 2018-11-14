width = 11;
half_width = width / 2;

thickness = 0.5;
half_thickness = thickness / 2;
quarter_thickness = thickness / 4;

heigth = 27;

module base() {
  module inset() {
    rotate([90, 90, 0]) {
      translate([-half_thickness,
                 0,
                 half_thickness])
{
        cube([thickness, 
              width + thickness, 
              quarter_thickness], 
             center=true);
      }
    }
  }
  
  module holes() {
    module hole() {
      cylinder(h = thickness, 
               r1 = quarter_thickness, 
               r2 = quarter_thickness, 
               center = true);
    }

    translate([(-width / 2) + half_thickness, half_thickness]) hole();
    translate([(-width / 2) + half_thickness, (width - half_thickness) / 2]) hole();
    translate([(-width / 2) + half_thickness, width - half_thickness, 0]) hole();
    
    translate([(width / 2) - half_thickness, width - half_thickness, 0]) hole();
    translate([(width / 2) - half_thickness, (width - half_thickness) / 2, 0]) hole();
    translate([(width / 2) - half_thickness, half_thickness, 0]) hole();
    
    translate([0, half_thickness, 0]) hole();
  }
  
    
  difference() {
    cube([width, width * 2, thickness], center = true);
    inset();
    holes();
  }
}

module cabin() {
  module slab() {
    cube([width * 0.9, width * 0.9, half_thickness], center = true);
  }
  
  module ceiling() {
    translate([0, half_width, half_thickness + heigth])
    slab();
  }

  module floor() {
    translate([0, half_width, half_thickness])
    slab();
  }
  
  color([0.3, 0, 0])
  union() {
    floor();
    ceiling();
  }

}

function cabin_heigth(t) = t < 0.5 ? t * (heigth * 4.5) : (1 - $t) * (heigth * 4.5);

module house() {
  translate([0,
             -half_thickness,
             heigth * 4.5 / 2])
  union() {
    color("gray", 0.5)
    cube([25,
          quarter_thickness,
          heigth * 4.5],
         center=true);
  }
}

module elevator() {
  union() {
    base();
//    house();

    translate([0, 0, cabin_heigth($t)])
    cabin();
  }
}

elevator();