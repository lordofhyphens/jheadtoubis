// first, get a jhead mount going
m3_diameter=3;
filament_diameter=2;
ptc_diameter=9.6;
ptc_height=6.5;
bowden_od=6;
slop_scale=1; // if you need to resize the gap from the ubis
neck_length=5.3; // actually needed for smartrapcore
//neck_length=4.6; // From reifsnyderb's drawings
module jheadtoubis(pushfit=false,bracket=true,nuttrap=true, bowden=true, regular=true, reverse=true,solid=false) {
  difference() {
    *translate([0,0,(4.8+4.6+10)/2])cube([16, 16, 4.8+4.6+10], center=true);
    union() {
      cylinder(r=(20/2) * slop_scale,h=13);
      cylinder(r=16/2,h=18.4+neck_length);

      if (solid == false) 
      if (bracket)
      {
        translate([0,0,5])cube([10,30,10], center=true);
      }
    }
    if (bowden) {
      if (reverse == true)
      { 
        translate([0,0,0])cylinder(r=bowden_od/2,h=4.5);
        translate([0,0,4.5])cylinder(r=filament_diameter/2,h=neck_length+16);
      } else if (regular == true) {
        cylinder(r=ptc_diameter/2,h=ptc_height);
        translate([0,0,12])cylinder(r=filament_diameter/2,h=neck_length+16);
      } else {
        if (pushfit)
        {
          translate([0,0,12+neck_length+1.7])cylinder(r=bowden_od/2,h=4.7);
          translate([0,0,12])cylinder(r=filament_diameter/2,h=neck_length+16);
        }
      }
      if (nuttrap) {
        translate([0,0,14])nutHole(size=4);
      }
    }
    if (solid == false) 
      if (bracket)
      {
        translate([-5,12,5])rotate([0,90,0])boltHole(size=4,length=10);
        translate([-5,-12,5])rotate([0,90,0])boltHole(size=4,length=10);
      }
    if (reverse==false)
    {
      translate([0,0,-40+(4.8+4.6+10)/2])scale([slop_scale,slop_scale,1])head();
      cylinder(r=10/2,h=9.95);
      translate([0,0,8])cylinder(r=13/2,h=1.95);
      cylinder(r=2/2,h=100);
    }
    translate([0,0,16])difference() {
      cylinder(r=16/2, h=neck_length);
      cylinder(r=12/2,h=neck_length);
    }
    if (solid==false)
    {
      translate([0,-25,0]) cube([50,50,50]);
    }
  }
} 
jheadtoubis(pushfit=false,bracket=false,nuttrap=false,bowden=true, reverse=true,solid=false);
include<MCAD/nuts_and_bolts.scad>
include<ubis_model.scad>

