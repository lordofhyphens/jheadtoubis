// first, get a jhead mount going
m3_diameter=3;
module jheadtoubis(bracket=true,nuttrap=true) {
difference() {
  *translate([0,0,(4.8+4.6+10)/2])cube([16, 16, 4.8+4.6+10], center=true);
  union() {
    cylinder(r=20/2,h=13);
    cylinder(r=16/2,h=20);
    if (bracket)
    {
      translate([0,0,5])cube([10,30,10], center=true);
    }
  }
  if (nuttrap) {
    translate([0,0,12])cylinder(r=1.8,h=10);
    translate([0,0,14])nutHole(size=4);
  }
  if (bracket)
  {
    translate([-5,12,5])rotate([0,90,0])cylinder(r=m3_diameter/2,h=10);
    translate([-5,-12,5])rotate([0,90,0])cylinder(r=m3_diameter/2,h=10);
  }
  translate([0,0,-40+(4.8+4.6+10)/2])head();
  cylinder(r=10/2,h=9.95);
  translate([0,0,8])cylinder(r=13/2,h=1.95);
  cylinder(r=2/2,h=100);
  translate([0,-25,0]) cube([50,50,50]);
  translate([0,0,13])difference() {
    cylinder(r=16/2, h=4.6);
    cylinder(r=12/2,h=4.6);
  }
}
}
jheadtoubis();
include<MCAD/nuts_and_bolts.scad>
include<ubis_model.scad>

