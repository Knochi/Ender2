use <raspberryPi.scad>
//use <rndRect.scad>
use <2020profile.scad>
use <nema17.scad>
use <enderPCB.scad>


/* -- [Axis] -- */
xAxisPos=0; //[0:150]
yAxisPos=0; //[0:150]
zAxisPos=0; //[0:200]

/* [Dimensions] */
motorHghts=[32,32,32,40]; //x,y,z,E

/* -- [show] -- */
showPCB=true;
showRaspberry=true;
showProfiles=true;
showMotors=true;
showHeadBed=true;
showHousing=true;
showWindows=true;  
showBase=true;
showTop=true;
showBack=true;
showLeft=true;
showRight=true;

/* -- [Housing] -- */
hsngDims=[380,350,480];
hsngMatThck=12;
bgWndwDim=[277,222,3];
smWndwDim=[277,170.7,3];
brimWdth=10;
wndwRad=9;
enderOffset=[-55,0,7];
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


translate(enderOffset){
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
  ovDpth=250;
  ovThick=8;
  crnRad=5;
  xBeamLngth=60;
  
  //Baseplate
  color("DarkSlateGray")
   translate([-424.5+80,197.3+42,0]) linear_extrude(8) import("Ender2BasePlate_px.svg");
  
  //Z-Motor
  translate([-10,21+52,motorHghts.z+1.6+8]) Nema17(motorHghts.z);
  
  //X-Axis wth. Extrude
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
    translate([18.5,87.8,204.5+1.6]) Nema17(motorHghts[3]);
  }    
  //Y-Axis profile
  color("dimGrey") translate([ovWdth/2-10,ovDpth/2,28]) rotate([90,0,0]) 
    linear_extrude(ovDpth) profile2040(); 
  
  translate([1.37+70,120-236,15+10])
    rotate(-90) import("/Ender3Parts/YMotorHolder.stl"); 
  color("dimGrey") translate([ovWdth/2-20-xBeamLngth,-ovDpth/2+167,18]) rotate([90,0,90]) 
    linear_extrude(xBeamLngth) profile2020();
  translate([-33+69.8,293.5-125,-43+18]) rotate([90,0,180]) import("/Ender3Parts/YTensioner.stl");
  //Y-Motor
  if (showMotors)  translate([70,153,39]) rotate([0,90,0]) Nema17(motorHghts.y);
  if (showHeadBed)
    translate([180/2+10,62.5-yAxisPos,50+8+9.5]) heatBed();
  echo(180-125);
  
  // z-axis
  color("dimGrey") translate([-10,42,8]) rotate([0,0,90]) 
    linear_extrude(370) profile2040(); 
    
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