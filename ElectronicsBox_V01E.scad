translate([40,30,0]) rotate([0,0,-90]) import("Pi_Zero_W.stl");

enderPCB(); 

module enderPCB(){
  PCBwdth=76.4;
  PCBhght=100.7;
  PCBthck=1.5;
  
  color("green") translate([0,0,-1.5/2]) cube([PCBwdth,PCBhght,PCBthck],true);
  translate([-PCBwdth/2+5,30,0]) screwTerminal();
}

screwTerminal();
module screwTerminal(){
  color ("lightgreen") translate([0,0,5]) cube([7.5,10,10],true);
}

jstXH(4);
module jstXH(pos){
  color("white") translate([0,0,3.5]) cube([5.57,(pos-1)*2.5+4.9,7],true);
}