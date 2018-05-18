fudge=0.1;

translate([40,30,0]) rotate([0,0,-90]) import("Pi_Zero_W.stl");
$fn=50;
enderPCB(); 

module enderPCB(){
  PCBwdth=76.4;
  PCBhght=100.7;
  PCBthck=1.5;
  translate([-PCBwdth/2,-PCBhght/2,0]){
    difference(){
      color("green") translate([0,0,-1.5]) cube([PCBwdth,PCBhght,PCBthck]);
      translate([38.4,PCBhght-2.5,-1.5-fudge/2]) cylinder(d=3.1,h=1.5+fudge);
      translate([PCBwdth-3,PCBhght-20,-1.5-fudge/2]) cylinder(d=3.1,h=1.5+fudge);
      translate([PCBwdth-3,18,-1.5-fudge/2]) cylinder(d=3.1,h=1.5+fudge);
      translate([3,2.5,-1.5-fudge/2]) cylinder(d=3.1,h=1.5+fudge);
    }
    translate([8.5,PCBhght-6.5,0]) rotate([0,0,90]) screwTerminal(); //VIN
    translate([6,83,0]) rotate([0,0,90]) jstXH(3); //Switch
    translate([5,64,0]) screwTerminal();
    translate([5,74.1,0]) screwTerminal();
    
    
    translate([PCBwdth-3.5,PCBhght-10,0]) jstXH(4);
    translate([PCBwdth-3.5,PCBhght-30.5,0]) jstXH(4);
    translate([PCBwdth-3.5,PCBhght-51,0]) jstXH(4);
    translate([PCBwdth-3.5,PCBhght-69,0]) jstXH(4);
    
    for (i=[0,7],j=[0,8.2,16.4]){
      translate([3.6+i,13.5+j,0]) jstXH(2);
    }
    
    for (i=[0,7],j=[0,8.2,16.4]){
      translate([3.6+i,13.5+j,0]) jstXH(2);
    }
    
    translate([23.5,4.5,0]) boxHeader(10);
    translate([50,9.3/2-1.5,0]) miniUSB();
    translate([74.5-14.8/2,14.6/2-2.4,0]) uSDslot();
  }
}


module screwTerminal(){
  color ("lightgreen") translate([0,0,14.5/2]) cube([10,10,14.5],true);
}


module jstXH(pos){
  color("white") translate([0,0,3.5]) cube([5.57,(pos-1)*2.5+4.9,7],true);
}


module boxHeader(pos){
  color("darkgrey")
  translate([0,0,9/2]) cube([pos/2*2.54+7.62,8.9,9],true);
}

module miniUSB(){
  color("silver")
  translate([0,0,4/2]) cube([7.7,9.3,3.9],true);
}

module uSDslot(){
  color("silver")
  translate([0,0,1]) cube([14.8,14.6,2],true);
}