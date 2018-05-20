rod_d1=8;
rod_d2=6;
rod_spacing=27;
mount_hole_spacing=18.9;
mount_hole_d=3;
mount_nut_d=6.5;
// How much to lift stop mount
stop_offset=0;
nut=6;
thick=16;
wall=2;
mount_plate_width=mount_hole_d+wall;
mount_plate_length=rod_spacing-1;

module mount(){
difference() {
    union() {
        translate([rod_spacing/2, 0, 5]) rod_snap(rod_d1, rod_d1+wall*3, thick-5);
        translate([-rod_spacing/2, 0, 5]) rod_snap(rod_d2, rod_d2+wall*3, thick-5);
        translate([-rod_spacing/2+1,-mount_plate_width-rod_d1/2,0]) cube([mount_plate_length, mount_plate_width, thick]);
    }
    translate([2.5+2+1, 0, 0]){
        // Mounting holes
        translate([-20+5, 0, 3]) rotate([90, 0, 0]) cylinder(d=mount_hole_d, h=20, center=true, $fn=15);
        translate([-20+5+mount_hole_spacing, 0, 3]) rotate([90, 0, 0]) cylinder(d=mount_hole_d, h=20, center=true, $fn=15);
        // Space for the welds
        translate([-20+5+mount_hole_spacing+4, -9, 0]) cube([3, 2, thick]);
        translate([-20+5+2, -9, 7]) cube([15, 2, 3]);
    }
}
}

module rod_snap(id, od, h) {
    difference() {
        cylinder(d=od, h=h, $fn=od*3);
        cylinder(d=id, h=h, $fn=od*3);
        translate([-id*0.85/2, 0, 0]) cube([id*0.85, od, h]);
    }
}

translate([0, 0, 16]) rotate([180, 0, 0]) mount();