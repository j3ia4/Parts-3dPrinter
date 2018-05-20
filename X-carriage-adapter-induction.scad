
diametre_M4=4;
head_M4=8;
bolt_M4=8.5;

module adapter() {
difference(){    
    union(){
        translate([-7, -7, 0]) cube([37, 37, 7]);
        translate([-4-6-20, -3.5+7, 0]) cube([43+20, 16, 7]);
    }
    
    translate([-3.5, 11.5, 3.5]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    translate([-3.5, 11.5, 0]) cylinder(h=3.5, r=bolt_M4/2, $fn=6);
    translate([-3.5+30, 11.5, 3.5]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    translate([-3.5+30, 11.5, 0]) cylinder(h=3.5, r=bolt_M4/2, $fn=6);
    
    translate([0, 0, 0]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    
    translate([0, 0, 3]) cylinder(h=20, r=head_M4/2, $fn=30);
    
    translate([0, 23, 0]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    
    translate([0, 23, 3]) cylinder(h=20, r=head_M4/2, $fn=30); 
    
    translate([23, 23, 0]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    
    translate([23, 23, 3]) cylinder(h=20, r=head_M4/2, $fn=30); 
    
    translate([23, 0, 0]) cylinder(h=20, r=diametre_M4/2, $fn=30);
    
    translate([23, 0, 3]) cylinder(h=20, r=head_M4/2, $fn=30); 
}
translate([-3.5, 11.5, 0]) cylinder(h=3.5, r=diametre_M4/2, $fn=30);
translate([-3.5+30, 11.5, 0]) cylinder(h=3.5, r=diametre_M4/2, $fn=30);
}

module sensor(){
    difference(){
        translate([2, 28, 0]) cube([19, 40, 7]);
        // Slots for inductive sensor
        hull(){
            translate([2+(19-10.5)/2, 28+10, 0]) cylinder(h=20, r=3.1/2, $fn=30); 
            translate([2+(19-10.5)/2, 28+25, 0]) cylinder(h=20, r=3.1/2, $fn=30); 
        }
        
        hull(){
            translate([2+(19-10.5)/2, 28+10, 4]) rotate([0, 0, 30]) cylinder(h=3, r=6/2, $fn=30); 
            translate([2+(19-10.5)/2, 28+25, 4])  rotate([0, 0, 30]) cylinder(h=3, r=6/2, $fn=30); 
        }
        
        hull(){
            translate([2+(19-10.5)/2+10.5, 28+10, 0]) cylinder(h=20, r=3.1/2, $fn=30); 
            translate([2+(19-10.5)/2+10.5, 28+25, 0]) cylinder(h=20, r=3.1/2, $fn=30); 
        }
        
        hull(){
            translate([2+(19-10.5)/2+10.5, 28+10, 4])  rotate([0, 0, 30]) cylinder(h=3, r=6/2, $fn=30); 
            translate([2+(19-10.5)/2+10.5, 28+25, 4])  rotate([0, 0, 30]) cylinder(h=3, r=6/2, $fn=30); 
        }
    }
}

rotate([0, 0, 0]){
    adapter();
    translate([9, 0, 0]) sensor();
}