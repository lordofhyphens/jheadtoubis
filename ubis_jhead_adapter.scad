// first, get a jhead mount going
m3_diameter=3;
bowden_od=3;
slop_scale=1; // if you need to resize the gap from the ubis
neck_length=5.3; // actually needed for smartrapcore
//neck_length=4.6; // From reifsnyderb's drawings
module jheadtoubis(bracket=true,nuttrap=true, bowden=true) {
difference() {
  *translate([0,0,(4.8+4.6+10)/2])cube([16, 16, 4.8+4.6+10], center=true);
  union() {
    cylinder(r=(20/2) * slop_scale,h=13);
    cylinder(r=16/2,h=18.4+neck_length);
    if (bracket)
    {
      translate([0,0,5])cube([10,30,10], center=true);
    }
  }
  if (bowden) {
    if (nuttrap) {
      translate([0,0,12])cylinder(r=bowden_od,h=neck_length+11);
      translate([0,0,14])nutHole(size=4);
    }
  }
  if (bracket)
  {
    translate([-5,12,5])rotate([0,90,0])boltHole(size=4,length=10);
    translate([-5,-12,5])rotate([0,90,0])boltHole(size=4,length=10);
  }
  translate([0,0,-40+(4.8+4.6+10)/2])scale([slop_scale,slop_scale,1])head();
  cylinder(r=10/2,h=9.95);
  translate([0,0,8])cylinder(r=13/2,h=1.95);
  cylinder(r=2/2,h=100);
  translate([0,-25,0]) cube([50,50,50]);
  translate([0,0,16])difference() {
    cylinder(r=16/2, h=neck_length);
    cylinder(r=12/2,h=neck_length);
  }
}
}
jheadtoubis(bracket=true,bowden=false);
include<MCAD/nuts_and_bolts.scad>
include<ubis_model.scad>

