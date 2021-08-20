use <raspberryPi.scad>
//use <rndRect.scad>
use <2020profile.scad>
use <nema17.scad>
use <enderPCB.scad>
use <linearRails.scad>

/*
  Ender 2 Modifikation to min. 300x180 build size
  Inspirations:
    simple linear rail printer: https://www.cetus3d.com/
    linear rail conversion for Ender3: https://www.blvprojects.com/blv-ender-3-pro
*/

/* TODO
  - change Y-profile to 40x40 and adapt design of BLV
  - evaluate Ball screw
*/


/* -- [AxisPositionsPercentages] -- */
xAxisPos=0; //[0:100]
yAxisPos=50; //[0:100]
zAxisPos=0; //[0:100]

/* [Dimensions] */
motorHghts=[32,32,32,40]; //x,y,z,E
axisLngths=[150,350,200]; //absolute length > travel


/* -- [show] -- */
showPCB=true;
showRaspberry=true;
showProfiles=true;
showMotors=true;
showHeadBed=true;
showHousing=true;
showWindows=false;  
showBase=true;
showTop=true;
showBack=true;
showLeft=true;
showRight=true;

/* -- [Housing] -- */
hsngDims=[380+150,350,480];
hsngMatThck=12;
bgWndwDim=[277,222,3];
smWndwDim=[277,170.7,3];
brimWdth=10;
wndwRad=9;
enderOffset=[0,70,7];
enderRot=[0,0,-90];
sltDim=[200,6]; //length width
sltOffset=[0,hsngDims.y/2-93,40]; //slot Offset relative to side center
wndwOffset=-0.2; //offset for acrylic

//magnet dimensions [dia:height]
mgntDim=[6,3];

/* [Hidden]   */
 bgWndwOffset=bgWndwDim.y/2+30; //30mm bottom
 smWndwOffset=bgWndwDim.y+30+25+smWndwDim.y/2; //25mm between windows    
fudge=0.1;
$fn=50;


translate(enderOffset) rotate(enderRot) {
  if (showPCB)
    translate([35-77,47-114.5,4+8]) enderPCB(); 

  if (showRaspberry)
    translate([ 34.20, -64.27,4+8]) rotate([0,0,-90]) raspberryPi();

 ender2();
 
  if (showMotors){
    //X-Motor
    //Z-Motor
    
    //Extruder-Motor
  }
  %translate([40,-50,10]) cube([57,130,20],true);
}

if (showHousing)
    translate([0,0,-hsngMatThck]) housing();

if (showWindows)
  color("grey",0.3){
    //bottom left
    //!projection() rotate([0,90,0])
    difference(){
      translate([-(hsngDims.x-3)/2,0,bgWndwOffset-hsngMatThck]) 
        rotate([90,0,90]) window(size="big",brim=false,thick=3,offset=wndwOffset, holesDia=mgntDim.x);
      translate(sltOffset+[-(hsngDims.x-3)/2,0,hsngDims.z/2-hsngMatThck]) 
        rotate([0,90,0]) slot(thick=3+fudge); 
    }
    //bottom right
    translate([(hsngDims.x-3)/2,0,bgWndwOffset-hsngMatThck]) 
      rotate([90,0,90]) window(size="big",brim=false,thick=3,offset=wndwOffset);
    
    //top left
    //!projection() rotate([0,90,0])
    difference(){
      translate([-(hsngDims.x-3)/2,0,smWndwOffset-hsngMatThck]) 
        rotate([90,0,90]) window(size="small",brim=false,thick=3,offset=wndwOffset, holesDia=2.2);
      translate(sltOffset+[-(hsngDims.x-3)/2,0,hsngDims.z/2-hsngMatThck]) 
        rotate([0,90,0]) slot(thick=3+fudge);
    }
    //top right
    translate([(hsngDims.x-3)/2,0,smWndwOffset-hsngMatThck]) 
      rotate([90,0,90]) window(size="small",brim=false,thick=3,offset=wndwOffset);
  }
  
module box(){
  translate([0,0,-5]) cube([100,120,10],true);
}

module housing(){
    color("wheat"){
      if(showBase)
      translate([0,0,hsngMatThck/2]) 
        cube([hsngDims.x-hsngMatThck*2,hsngDims.y,hsngMatThck],true);
      if (showTop)
      translate([0,0,hsngDims.z-hsngMatThck/2])
        cube([hsngDims.x-hsngMatThck*2,hsngDims.y,hsngMatThck],true);
    }
    color("burlyWood"){
      //right side
      translate([(hsngDims.x-hsngMatThck)/2,0,hsngDims.z/2]) rotate([0,-90,180]) side();
      //left side
      translate([-(hsngDims.x-hsngMatThck)/2,0,hsngDims.z/2]) rotate([0,-90,0]) side(true);
    }
    if (showBack){
    color("sandyBrown")
      translate([0,(hsngDims.y-hsngMatThck)/2,hsngDims.z-150/2-hsngMatThck]) 
        cube([hsngDims.x-hsngMatThck*2,hsngMatThck,150],true);
    color("rosyBrown")
      translate([0,(hsngDims.y+3)/2,(hsngDims.z-150)/2])
        cube([hsngDims.x,3,hsngDims.z-150],true);
    echo("MDFBack:",[hsngDims.x,hsngDims.z-150]);
    }
  
    module side(slot=false){
      difference(){
        cube([hsngDims.z,hsngDims.y,hsngMatThck],true);
        for (ix=[[bgWndwOffset-hsngDims.z/2,"big"],[smWndwOffset-hsngDims.z/2,"small"]]) 
          translate([ix.x,0,0]){
            rotate(90){
              window(size=ix[1],brim=true,thick=hsngMatThck+fudge,holesDia=0);
              translate([0,0,(hsngMatThck-3)/2+fudge]) window(size=ix[1],thick=3+fudge,holesDia=0);
            }
          }
        if (slot)
          translate([sltOffset.z,sltOffset.y,sltOffset.x]) slot(thick=hsngMatThck+fudge);
      }
    }
    
}

module ender2(){
  ovWdth=180;
  ovDpth=400; //the length of the Y-Axis profile (orig: 250)
  ovThick=8;
  crnRad=5;
  xBeamLngth=60;
  
  
  yOffset=(ovDpth-250)/2; //offset by extruding the Y-Axis
  //Baseplate
  color("DarkSlateGray")
   translate([-424.5+80,197.3+42,0]) linear_extrude(8) import("Ender2BasePlate_px.svg");
  
  //Z-Motor
  translate([-10,21+52,motorHghts.z+1.6+8]) Nema17(motorHghts.z);
  
  //X-Axis wth. Extruder and imported parts
  translate([0,0,zAxisPos-55]){
    color("dimGrey") translate([-27,24.7-10,155.5+8]) rotate([0,90,0]) linear_extrude(230) profile2020();
    translate([90,72.66+55.5,0]) rotate([90,0,180]){
      import("/Ender3Parts/EMotorBracket.stl"); 
      import("/Ender3Parts/EHousing.stl");
      import("/Ender3Parts/ETensioner.stl");
      import("/Ender3Parts/XMotorBracket.stl");
      translate([312-202,0,0]) import("/Ender3Parts/XTensionerPlate.stl");
    }
    //X-Motor
    translate([-57,27.8-1.6,163.5]) rotate([90,0,0]) Nema17(motorHghts.x);
    //E-Motor
    translate([18.5,87.8,204.5+1.6]) Nema17(motorHghts[3]); //.E
  }    
  //Y-Axis 
  color("dimGrey") translate([ovWdth/2,ovDpth/2,28]) rotate([90,0,0])
    linear_extrude(ovDpth) profile4040(); 
  //linear Rail
  translate([ovWdth/2+10,0,28+20]) rotate(90)  MGN12(length=axisLngths.y,pos=yAxisPos/100);
  
  
  //Motor Holder
  translate([1.37+70,120-236+yOffset,15+10])
    rotate(-90) import("/Ender3Parts/YMotorHolder.stl"); 
  //Y-Motor
    if (showMotors)  translate([70,153+yOffset,39]) rotate([0,90,0]) Nema17(motorHghts.y);
  //Y-Tensioner
  translate([-33+69.8,293.5-125-yOffset,-43+18]) 
    rotate([90,0,180]) import("/Ender3Parts/YTensioner.stl");
  //X-Beam
  color("dimGrey") translate([ovWdth/2-20-xBeamLngth,-250/2+167,18]) rotate([90,0,90]) 
    linear_extrude(xBeamLngth) profile2020();
  
  //Bed
  if (showHeadBed)
    rotate(90) MGN12(length=axisLngths.y,pos=yAxisPos/100) rotate(-90) translate([180/2+10,0,50+8+9.5])  heatBed();
  echo(180-125);
  
  // z-axis
  color("dimGrey") translate([-10,42,8]) rotate([0,0,90]) 
    linear_extrude(370) profile2040(); 
    
}




module bedCarriage(cutOuts=false){
  matThick=3; //Thickness of sheet material

  screwDist=[140,255]; //Ender 3: 235x235 --> 170, 195x315 --> 140x230
  screwHole=4.2;
  //yellow springs(20x8mm): http://s.click.aliexpress.com/e/YFNHPjE
  if (cutOuts)
    for (ix=[-1,1],iy=[-1,0,1])
      translate([ix*screwDist.x/2,iy*screwDist.y/2,0]) cylinder(d=screwHole,h=20+5); 
  else{
    cube();
  }
}

*difference(){
  translate([0,0,22]) heatBed();
  bedCarriage(true);
}

module heatBed(size=[195,315,2],brim=7.5){
//original 165x165x2
  heatPadSize=[100,150,1.5];
  heatPadDist=40;
  crnRad=3;
  workArea=[size.x-brim*2,size.y-brim*2];
  color("silver") hull()
  for (i=[-1,1],j=[-1,1])
    translate([i*(size.x/2-crnRad),j*(size.y/2-crnRad),0]) cylinder(r=crnRad,h=size.z);
  color("aqua") translate([0,0,size.z]) cube([workArea.x,workArea.y,0.1],true);

  for (iy=[-1,1])
    color("darkOrange") translate([0,iy*(heatPadSize.x+heatPadDist)/2,-heatPadSize.z/2]) rotate(90) cube(heatPadSize,true);

  /*heaterPads
  50x100 https://www.banggood.com/15W-12V-DC-50+100mm-Flexible-Waterproof-Silicon-Heater-Pad-Wiht-Wire-For-3D-Printer-p-1280175.html
  120x120 https://banggood.app.link/vzQzIdsIveb
  300W 240V 10*15cm Silicone Heated Bed Heating Pad w/ Adhesive Backing for 3D Printer Hot Bed
https://banggood.app.link/LwSPdTTJveb
  */
}


*window();
module window(size="small",brim=false, thick=3, holesDia=3, offset=0){
 
  wndwDim= (size=="small") ? smWndwDim : bgWndwDim;
  holesDim= (size=="small") ? [268,99.2] : [268,170.6];
  wndwBrim= brim ? brimWdth : 0;
  
  difference(){
    hull() for (ix=[-1,1],iy=[-1,1])
      translate([ix*(wndwDim.x/2-wndwRad-wndwBrim),iy*(wndwDim.y/2-wndwRad-wndwBrim),0]) 
        cylinder(r=wndwRad+offset,h=thick,center=true);
    for (ix=[-1,1],iy=[-1,1])
      translate([ix*holesDim.x/2,iy*holesDim.y/2,0]) cylinder(d=holesDia,h=thick+fudge,center=true);
  }
}

//slot();
module slot(thick=3){
  hull() for (ix=[-1,1])
    translate([ix*sltDim.x/2,0,0]) cylinder(d=sltDim.y,h=thick,center=true);
}