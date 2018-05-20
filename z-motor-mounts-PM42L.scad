$fn=100;
r_body = 21;
r_hole = 1.75;
r_ear = 3.75;
plate_width = 55;
plate_length = 55;
plate_thickness = 5;
plate_hight = 18;

r_screw=2; // Wood screw
r_screw_head=4.5;

module mount(){
    difference(){
       translate([-plate_width/2, -plate_length/2, 0]) cube([plate_width, plate_length, plate_thickness]);
        difference(){
            cube([plate_width/2, plate_length/2, plate_thickness]);
            cylinder(h = plate_thickness, r = plate_width/2, $fn=60);
        }
    }
        
    translate([0, -plate_length/2-3, -plate_hight/2+plate_thickness]) rotate([-90, 0, 0]) difference(){
        translate([-plate_width/2, -plate_hight/2, 0]) cube([plate_width, plate_hight, plate_thickness+3]);
        translate([plate_width/2-plate_hight/2, 0, 0]){
            difference(){
                cube([plate_hight/2, plate_hight/2, plate_thickness+3]);
                cylinder(h = plate_thickness+3, r = plate_hight/2, $fn=30);
            }
        }
    }
    
    translate([-plate_width/2+plate_thickness, plate_length/2, plate_hight/2+plate_thickness]) 
    rotate([-90, 0, 90]) difference(){
        translate([-plate_length, plate_hight/2, 0]) cube([plate_length, plate_hight, plate_thickness]);
        translate([-plate_hight/2, plate_hight, 0]){
            difference(){
                cube([plate_hight/2, plate_hight/2, plate_thickness]);
                cylinder(h = plate_thickness, r = plate_hight/2, $fn=30);
            }
        }
    }
}
    
//mirror([1, 0, 0]) 

module right_mount() translate([30, 0, -plate_thickness]) difference(){
    mount();
    translate([-12.5, -plate_length/2+plate_thickness+0.5, 2-plate_hight/2+plate_thickness/2]) rotate([90, 0, 0]) cylinder(h = 3, r1=r_screw_head, r2=r_screw, $fn=30);
    translate([-12.5, -plate_length/2+plate_thickness+0.5, 2-plate_hight/2+plate_thickness/2]) rotate([90, 0, 0]) cylinder(h = 10, r=r_screw, $fn=30);
    translate([12.5, -plate_length/2+plate_thickness+0.5, 2-plate_hight/2+plate_thickness/2]) rotate([90, 0, 0]) cylinder(h = 4, r1=r_screw_head, r2=r_screw, $fn=30);
    translate([12.5, -plate_length/2+plate_thickness+0.5, 2-plate_hight/2+plate_thickness/2]) rotate([90, 0, 0]) cylinder(h = 10, r=r_screw, $fn=30);
    
    rotate([180, 0, -45]){
        
        translate([0, 0, -10]) cylinder(h = 20, r=5.5, $fn=30);
        translate([-r_body-r_ear, 0, -5]) cylinder(h = 10, r=r_hole, $fn=30);
        translate([+r_body+r_ear, 0, -5]) cylinder(h = 10, r=r_hole, $fn=30);
    }
    translate([-17, 0, -1]) cylinder(h = 50, r=4.125, $fn=15);
    translate([-17, 0, 0]) cylinder(h = 0.6, r1=5, r2=4.125, $fn=15);
}


mirror([0, 0, 1]){
    //rotate([0, 0, 180]) right_mount();
    rotate([0, 0, 90]) mirror([1, 0, 0]) right_mount();
}