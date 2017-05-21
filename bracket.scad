// clasp
clasp_length = 60;
inner_radius = 40;
tube_thickness = 7;
compression_gap = 10;
clasp_size = 20;

// bolt
depth = 10;
washer_size = 8;
bolt_size = 5;

difference()
{
  // main clasp body
  linear_extrude(height=clasp_length)
  {
    // tube with a compression gap
    difference()
    {
      // a tube
      difference()
      {
        union()
        {
          circle(r=inner_radius+tube_thickness);
          translate([0, inner_radius+tube_thickness, 0]) circle(r=clasp_size);
        }
        circle(r=inner_radius);

      }
      // compression gap in the tube
      translate([0,inner_radius + tube_thickness,0])
        square(
          [
            compression_gap+1,
            clasp_size*2 + 1
          ]
          , center=true
        );
    }
  }
  // washer recesses and drilled out hole
  union() {
    translate([
      0,
      inner_radius+(tube_thickness+clasp_size)/2,
      clasp_length/2
    ])
    rotate([0,90,0]) cylinder(r=bolt_size, h=clasp_size*2, center=true);

    translate([
      clasp_size,
      inner_radius+(tube_thickness+clasp_size)/2,
      clasp_length/2]
    ) rotate([0,90,0])
        cylinder(h=depth,r=washer_size,center=true);
    translate([
      -clasp_size,
      inner_radius+(tube_thickness+clasp_size)/2,
      clasp_length/2]
    ) rotate([0,90,0])
        cylinder(h=depth,r=washer_size,center=true);
  }
}
