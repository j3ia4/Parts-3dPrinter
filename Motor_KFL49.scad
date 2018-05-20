module motor_PM49M(){
difference(){
    union(){
        translate([0, 0, -29/2]) cylinder(h=29, r=49.5/2, center=true, $fn=60);
        hull(){
            translate([(49.5+5+4)/2, 0, -0.5/2]) cylinder(h=0.5, r=(5+4)/2, center=true, $fn=60);
            translate([0, 0, -0.5/2]) cylinder(h=0.5, r=49.5/2, center=true, $fn=60);
        }
        hull(){
            translate([0, 0, -0.5/2]) cylinder(h=0.5, r=49.5/2, center=true, $fn=60);
            translate([-(49.5+5+4)/2, 0, -0.5/2]) cylinder(h=0.5, r=(5+4)/2, center=true, $fn=60);
        }
    }
    translate([(49.5+5+4)/2, 0, -0.5/2]) cylinder(h=0.5, r=5/2, center=true, $fn=60);
    translate([-(49.5+5+4)/2, 0, -0.5/2]) cylinder(h=0.5, r=5/2, center=true, $fn=60);
}

translate([0, 0, 1/2]) cylinder(h=1, r=10/2, center=true, $fn=60); 
translate([0, 0, 3/2]) cylinder(h=3, r=2/2, center=true, $fn=60); 
}

module gear(){
    translate([0, 0, 11/2+3]) difference(){
        cylinder(h=11, r=12.5/2, center=true, $fn=60); 
        translate([0, 0, 11/2-2.5/2-1.5]) difference(){
            cylinder(h=2.5, r=12.5/2, center=true, $fn=60); 
            cylinder(h=2.5, r=(12.5-2)/2, center=true, $fn=60); 
        }
    }
}

motor_PM49M();
color("fuchsia") gear();
