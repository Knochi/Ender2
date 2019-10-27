use <raspberryPi.scad>
//use <rndRect.scad>
use <2020profile.scad>
use <nema17.scad>


/* -- [Axis] -- */
xAxisPos=0;  

/* [Dimensions] */
motorHghts=[32,32,32,40]; //x,y,z,E

/* -- [show] -- */
showPCB=true;
showRaspberry=true;
showProfiles=true;
showMotors=true;
showHeadBed=true;
showHousing=true;

/* -- [Housing] -- */
hsngDims=[380,350,480];
hsngMatThck=6;
showFront=false;
showLeft=false;



/* [Hidden]   */

fudge=0.1;
$fn=50;


if (showPCB)
    translate([35-77,47-114.5,4]) enderPCB(); 

if (showRaspberry)
    translate([ 34.20, -64.27,4 ]) rotate([0,0,-90]) raspberryPi();

translate([0,0,-8])enderBase();

if (showHeadBed)
    translate([180/2+10,0,50]) heatBed();
if (showMotors){
    //X-Motor
    //Y-Motor
    translate([70,140,21]) rotate([0,90,0]) Nema17(motorHghts.y);
    //Z-Motor
    translate([-10,21+52,motorHghts.z+1.6]) Nema17(motorHghts.z);
    //Extruder-Motor
    
}

if (showHousing)
    translate([0,0,-hsngMatThck/2-20]) housing();

%translate([40,-50,10]) cube([57,130,20],true);

module box(){
  translate([0,0,-5]) cube([100,120,10],true);
}


module housing(){
    //base
    color("wheat") cube([hsngDims.x,hsngDims.y,hsngMatThck],true);
}

module enderBase(){
  ovWdth=180;
  ovDpth=250;
  ovThick=8;
  crnRad=5;
  xBeamLngth=60;
  
  color("DarkSlateGray")
   translate([-424.5+80,197.3+42,0]) linear_extrude(8) import("Ender2BasePlate_px.svg");
  color("dimGrey") translate([ovWdth/2-10,ovDpth/2,28]) rotate([90,0,0]) 
    linear_extrude(ovDpth) profile2040(); //y-Axis
  color("dimGrey") translate([ovWdth/2-20-xBeamLngth,-ovDpth/2+167,18]) rotate([90,0,90]) 
    linear_extrude(xBeamLngth) profile2020();
    // z-axis
  color("dimGrey") translate([-10,42,8]) rotate([0,0,90]) 
    linear_extrude(300) profile2040(); 
    
}

module heatBed(){
  ovWdth=165;
  ovDpth=165;
  thick=2;
  crnRad=3;
  
  color("silver") hull()
  for (i=[-1,1],j=[-1,1])
    translate([i*(ovWdth/2-crnRad),j*(ovDpth/2-crnRad),0]) cylinder(r=crnRad,h=thick);
}
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
    
    //Stepper driver
    for (i=[0:3]){
      color("black")
      translate([54,30+20*i,0.5]) cube([5,5,1],true);
    }
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