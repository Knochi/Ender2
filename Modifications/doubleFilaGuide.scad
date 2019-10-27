use <\MCAD\nuts_and_bolts.scad>

/* [Show] */
showWindow=true;
showFilaGuide=true;
inWindow=true;
showWheel=true;

/* [Hidden] */
$fn=50;
//window
width=277;
height=222;
rad=9;
thick=3;
drill=2.5; //for M3 threat
drillDistZ=175; //hole to hole Dist in z
drillDistEdge=3.3;
woodThick=11.6; //thickness of the multiplex board
fudge=0.1;

//filament guide
filaXPos=90; //distance from left edge for filament guide
wheelDia=50; //diameter of idler wheel
filaDia=1.75; //diameter of Filament

if (showWindow) window();
if (showFilaGuide) filaGuide(inWindow, showWheel);
*wheel();
*ballBearing(6.0,19,5);

*color("gold") translate([-20,-3,0]) rotate([90,0,0]) screw();


module window(){
color("lightgrey",0.5)
  rotate([90,0,0])
  difference(){
      hull(){
        for (i=[-1,1],j=[-1,1]){
          translate([(width/2-rad)*i,(height/2-rad)*j,0]) cylinder(r=rad,h=thick);
        }
      }
      for (i=[-1,1],j=[-1,1])
        translate([i*(width/2-drillDistEdge),j*drillDistZ/2,-fudge/2]) cylinder(d=drill,h=thick+fudge);
    }
}



module filaGuide(inWindow=true, wheel=true){
  wheelThick=filaDia*3*1.2; //=6.3 (1.75)
  spacing=3;
  basePos= inWindow ? [0,0,110] : [0,0,0];
  partRot= inWindow ? [-90,0,0]  : [0,0,0];
  slotWdth= 12;
  baseThick = 3;
  
  baseWdth = slotWdth + 2*baseThick;
  baseDpth = wheelThick+2+8; //+spacing + 2* 4
  drillZPos= 20.8+baseThick;
  baseHght = drillZPos + baseWdth;

 
  if (wheel) rotate(partRot) translate([0,wheelDia/2+spacing,0]) rotate([0,90,0]) wheel();
  
  rotate(partRot){
  translate([wheelThick/2,wheelDia/2+spacing,0]) arm(spacing+fudge,baseWdth);
  mirror([1,0,0]) translate([wheelThick/2,wheelDia/2+spacing,0]) arm(spacing+fudge,baseWdth,true);
  }
  if (inWindow) {
    difference(){
      union(){
        translate([0,0,drillZPos/2])
          cube([wheelThick+2+8,baseWdth,drillZPos],true);
        translate([0,0,drillZPos]) rotate([90,0,0]){ 
          cylinder(d=baseDpth,h=baseWdth,center=true);
          translate([0,0,(baseWdth+2.5)/2-fudge])cylinder(d=baseDpth,h=2.4,center=true);
        }
      }
      translate([0,0,baseHght/2+baseThick]) cube([baseWdth,slotWdth,baseHght+fudge],true);//slot
      translate([0,0,drillZPos]) rotate([90,0,0]){ 
         cylinder(d=3.2,h=baseWdth+fudge,center=true);
         translate([0,0,(baseWdth+2.5)/2]) cylinder(d=6.2,h=2.5,center=true,$fn=6);
      }
    }
  }
  
  else {
    difference(){ //base plate
      union(){
        translate([0,-5+fudge,0]) cube([40,4,15],true);
        translate([-20,-3+fudge,0]) rotate([90,0,0]) cylinder(d=15,h=4);
        translate([20,-3+fudge,0]) rotate([90,0,0]) cylinder(d=15,h=4);
      }
      translate([-20,-2.8,0]) rotate([90,0,0]) screw();
      translate([20,-2.8,0]) rotate([90,0,0]) screw();
    }
  }
}

module arm(spacing, width=15, nut=false){
   armThick=4;
    difference(){
      union(){ //arm
        rotate([0,90,0]) cylinder(d=10,h=4); //bearing spacers
        translate([1,0,0]) rotate([0,90,0]) cylinder(d=width,h=armThick);
        if (nut)translate([1+3,0,0]) rotate([0,90,0]) cylinder(d=width,h=2);
        translate([3,-wheelDia/4-spacing/2,0]) cube([armThick,wheelDia/2+spacing,width],true);
      }
      //bore
      translate([-fudge/2,0,0]) rotate([0,90,0]) cylinder(d=6,h=6+fudge);
      if (nut) translate([2,0,0]) rotate([0,90,0]) cylinder(d=11.05,h=5+fudge,$fn=6); //M6 nut 
    }
  
}


module halfSpheres(){
  wheelThick=filaDia*3*1.2;
  
  difference(){
      mirror_copy() translate([wheelThick/2,wheelDia/2+1,0]) sphere(d=wheelDia/2);
      translate([0,wheelDia/2+1,0]) rotate([0,90,0]) cylinder(d=wheelDia,h=wheelThick,center=true);    
  }
}

module wheel(){
  
  grooveDia=filaDia*1.2;
  holeDia=19;
  
  rotate_extrude($fn=150)
    union(){
      difference(){
        translate([holeDia/2,-grooveDia*1.5]) square([wheelDia/2-holeDia/2-grooveDia/2,grooveDia*3]);
        translate([(wheelDia-grooveDia)/2,0]) circle(d=grooveDia);
        mirror_copy([0,1])
        hull(){
          translate([holeDia/2+3,-grooveDia*1.5]) circle(d=grooveDia);
          translate([wheelDia/2-grooveDia*2.5,-grooveDia*1.5]) circle(d=grooveDia); //cut outer
        }
      }
      mirror_copy([0,1]) translate([(wheelDia-grooveDia)/2,grooveDia]) circle(d=grooveDia); 
      
    }
  color("silver") translate([0,0,-3]) ballBearing(6,19,6,false);
  //cylinder(d=wheelDia,h=filaDia*2);
}

module mirror_copy(v = [1, 0]) {
    children();
    mirror(v) children();
}


module ballBearing(innerDia, outerDia, thick,simple=true){
  wallThick=1.3;
  difference(){
    cylinder(d=outerDia,h=thick);
    translate([0,0,-fudge/2]) cylinder(d=innerDia,h=thick+fudge);
    if (!simple) {
      translate([0,0,thick-0.2]) ballBearing(innerDia+wallThick,outerDia-wallThick,0.2+fudge);
      translate([0,0,-fudge]) ballBearing(innerDia+wallThick,outerDia-wallThick,0.2+fudge);
    }
  }
}


module screw(){
  cylinder(d1=8,d2=4.5,h=2.55);
  translate([0,0,2.5]) cylinder(d1=4.5,d2=4,h=2.05);
  translate([0,0,4.5]) cylinder(d=4,h=7.55);
  translate([0,0,4.5+7.5]) cylinder(d1=4,d2=0.1,h=4);
}

*screwM4(16);
module screwM4(length){
  dk=8;
  k=2.3;
  s=2.5;
  
  cylinder(d1=8,d2=4,h=k);
  translate ([0,0,k-fudge])cylinder(d=4,h=16-k+fudge);
}

*doveTail(15,3,20,0.9);
module doveTail(wdth,thck,hght,scale=1){
  
  polyhedron([[-wdth/2,thck,0],[wdth/2,thck,0],[wdth/2-thck,0,0],[-(wdth/2-thck),0,0],
           [-wdth/2*scale,thck,hght],[wdth/2*scale,thck,hght],[wdth/2*scale-thck,0,hght],[-(wdth/2*scale-thck),0,hght]],
          [[3,2,1,0],[3,7,6,2],[0,4,7,3],[1,5,4,0],[2,6,5,1],[4,5,6,7]]);
}

