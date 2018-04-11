$fn=50;
percOpen=100*$t; // [0:100]
pinDist=95;
railWdth=5;
railHght=pinDist+railWdth;
railDp=250;
redPinPos=railDp*(percOpen/100);
prpPinYPos=redPinPos>=pinDist ? 0 : sqrt(pow(pinDist,2)-pow(redPinPos,2));
prpPinXPos=redPinPos>=pinDist ? redPinPos-pinDist : 0;
doorAng = redPinPos>=pinDist ? 90 : asin(redPinPos/pinDist);
doorHght = 400;
doorThck = 10;
doorYOffset =10;
echo($t);

//rails
union(){
  translate([-railWdth/2,-railWdth/2]) square([railDp,railWdth]);
  translate([-railWdth/2,railWdth/2-railHght]) square([railWdth,railHght]);
}

//pins
color("red") translate([redPinPos,0,0]) cylinder(h=3,d=3);
color("purple") translate([prpPinXPos,-prpPinYPos,0]) cylinder(h=3,d=3);

//door


translate([prpPinXPos,-pinDist+(pinDist-prpPinYPos),0])
rotate([0,0,-doorAng])
  translate([-doorThck/2,doorYOffset-doorHght+pinDist,3]) cube([doorThck,400,30]);