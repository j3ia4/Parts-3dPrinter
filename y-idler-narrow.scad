
module y_idler_base(){
 translate(v = [0, 0, 0]) cylinder(h = 19, r=8);	
 translate(v = [0, 20, 0]) cylinder(h = 19, r=8);
 translate(v = [0, 10, 9.5]) cube(size = [16, 20, 19], center=true);
 translate(v = [-4, 10, 9.5]) cube(size = [8, 16+20, 19], center=true);
}

module y_idler_holes(){
 // M5   
 translate(v = [0, 0, -25]) cylinder(h = 50, r=2.5, $fn=30);	
 translate(v = [0, 0, 0]) rotate([0, 0, 45]) cylinder(h = 2.5, r=4.75, $fn=6);
 translate(v = [0, 0, 19-2.5]) rotate([0, 0, 45]) cylinder(h = 2.5, r=4.75, $fn=6);	
 translate(v = [0, 20, -1]) cylinder(h = 25, r=4.2);
 translate(v = [0, 0, 6]) cylinder(h = 7, r=12);
}

// Final part
module y_idler(){
 translate(v = [0, 0, 8]) rotate([0, -90, 0]) difference(){
  y_idler_base();
  y_idler_holes();
 }
}

y_idler();
