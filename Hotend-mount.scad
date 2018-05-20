
fnresolution = 0.4;
height=11;

diametre_M4=4;
head_M4=8;
bolt_M4=8.5;

//translate([0, 30, 28]) rotate([180, 0, 0]) flange();
mount();
    
module mount(){
translate([0, height/2, 0]){
    difference(){
        translate([0, 0, 14]) rotate([90, 0, 0]) support();
        flange();
    }
    translate([23, -height/2, 2]) cylinder(h=4, r=3.1/2, center=true, $fn=30);
    difference(){
        union(){
            translate([23, -height/2, 13.5/4]) cylinder(h=13.5/2, r=height/2, center=true, $fn=60);
            translate([19.5, -height/2, 13.5/2]) cube([height/2, height, 13.5], center=true);
        }
        translate([23, -height/2, 13.5*3/4]) cylinder(h=13.5/2, r=height/2*1.1, center=true, $fn=60);
        translate([23, -height/2, height/4]) cylinder(h=20, r=3.1/2, center=true, $fn=30);
        translate([23, -height/2, 1.5]) cylinder(h=4, r=6/2, center=true, $fn=30);
    }
    difference(){
        translate([-34/2-20+13, -height/2, 27]) rotate([90, 30, 0]) scale([2.2, 1, 1]) cylinder(h=height, r=5, center=true, $fn=30);
        translate([-34/2-20+12, -height/2, 28]) rotate([90, 30, 0]) scale([1.5, 1, 1]) cylinder(h=20, r=3, center=true, $fn=30);
        translate([-1, 0, 0]) flange();
    }
    difference(){
        union(){
            translate([-34/2-20, -height/2-20, 0]) cube([7, 40, 34]);
            translate([-34/2-20, -height, 0]) cube([20, height, 28]);
            translate([-34/2-20+7, -height/2, 17]) scale([1, 1.75, 2.45]) sphere(r=7, center=true);     
        }
        translate([-34/2-20+12, -height/2, 28]) rotate([90, 30, 0]) scale([1.5, 1, 1]) cylinder(h=20, r=3, center=true, $fn=30);
        translate([0-34/2-25, 11.5+1-6.5, 34-5.5]) rotate([0, 90, 0]) cylinder(h=10, r=diametre_M4/2, $fn=30);
        translate([-34/2-16, 11.5+1-6.5, 34-5.5]) rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(h=3, r=bolt_M4/2, $fn=6);
        translate([-34/2-25, -11.5+1-6.5, 34-5.5]) rotate([0, 90, 0]) cylinder(h=10, r=diametre_M4/2, $fn=30);
        translate([-34/2-16, -11.5+1-6.5, 34-5.5]) rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(h=3, r=bolt_M4/2, $fn=6);
        translate([-34/2-25, 11.5+1-6.5, 5.5]) rotate([0, 90, 0]) cylinder(h=10, r=diametre_M4/2, $fn=30);
        translate([-34/2-16, 11.5+1-6.5, 5.5]) rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(h=3, r=bolt_M4/2, $fn=6);
        translate([-34/2-25, -11.5+1-6.5, 5.5]) rotate([0, 90, 0]) cylinder(h=10, r=diametre_M4/2, $fn=30);
        translate([-34/2-16, -11.5+1-6.5, 5.5]) rotate([0, 90, 0]) rotate([0, 0, 30]) cylinder(h=3, r=bolt_M4/2, $fn=6);
    }
}    
}

module flange(){
    difference(){
        translate([0, 0, 14]) rotate([90, 0, 0]) support();
        translate([0, 0, -50+14]) cube([100, 100, 100], center=true);
    }
}  

module support(){
   translate([10.5, -12, height/2]) rotate([90, 0, 0]) cylinder(h=4, r=3.1/2, center=true, $fn=30);
   translate([-10.5, -12, height/2]) rotate([90, 0, 0]) cylinder(h=4, r=3.1/2, center=true, $fn=30);
    difference(){
        translate([0, 0, height/2]) cube([34, 28, height], center=true);
        translate([0, 0, -4]) hotend();
        // Gaps
        translate([0, 0, 10]) cube([40, 1, 20], center=true);
        translate([-34/2, 40/2, 10]) cube([1, 40, 20], center=true);
        // Screw holes
        translate([10.5, 0, height/2]) rotate([90, 0, 0]) cylinder(h=50, r=3.1/2, center=true, $fn=30);
        translate([10.5, 14-4/2, height/2]) rotate([90, 0, 0]) cylinder(h=4, r=6.4/2, center=true, $fn=6);
        translate([10.5, -14+4/2, height/2]) rotate([90, 0, 0]) cylinder(h=4, r= 6/2, center=true, $fn=30);
        translate([-10.5, 0, height/2]) rotate([90, 0, 0]) cylinder(h=50, r=3.1/2, center=true, $fn=30);
        translate([-10.5, 14-4/2, height/2]) rotate([90, 0, 0]) cylinder(h=4, r=6.4/2, center=true, $fn=6);
        translate([-10.5, -14+4/2, height/2]) rotate([90, 0, 0]) cylinder(h=4, r=6/2, center=true, $fn=30);
    }
}


module hotend(){
    union() {
			translate([0,0,0]) fncylinder(r=8.2, h=7);
			translate([0,0,6]) fncylinder(r=6.2, h=8);
			translate([0,0,13]) fncylinder(r=8.2, h=8);
			translate([0,0,20]) fncylinder(r=11.2, h=26);
    }
}

module fncylinder(r,r2,h,fn){
	if (fn==undef) {
		if (r2==undef) {
			cylinder(r=r,h=h,$fn=2*r*3.14/fnresolution);
		} else {
			cylinder(r=r,r2=r2,h=h,$fn=2*r*3.14/fnresolution);
		}
	} else {
		if (r2==undef) {
			cylinder(r=r,h=h,$fn=fn);
		} else {
			cylinder(r=r,r2=r2,h=h,$fn=fn);
		}
	}
}