$fn=50;
//window
width=277;
height=222;
rad=9;
thick=3;
drill=2.5; //for M3 threat
drillDistZ=175; //hole to hole Dist in z
drillDistEdge=3.3;
fudge=0.1;

//filament guide
filaXPos=90; //distance from left edge for filament guide
wheelDia=50; //diameter of idler wheel
filaDia=1.75; //diameter of Filament

window();

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

!filaGuide();

module filaGuide(){
  wheelThick=filaDia*3*1.2;
  echo(wheelThick);
  mirror_copy([0,1,0]){
    translate([0,wheelDia/2+1,0]) rotate([0,90,0]) wheel();
    halfSpheres(); 
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
  holeDia=3.1;
  
  rotate_extrude($fn=150)
    union(){
      difference(){
        translate([holeDia,-grooveDia*1.5]) square([wheelDia/2-holeDia-grooveDia/2,grooveDia*3]);
        translate([(wheelDia-grooveDia)/2,0]) circle(d=grooveDia);
        mirror_copy([0,1])
        hull(){
          translate([holeDia*2,-grooveDia*1.5]) circle(d=grooveDia);
          translate([wheelDia/2-holeDia*2,-grooveDia*1.5]) circle(d=grooveDia);
        }
      }
      mirror_copy([0,1]) translate([(wheelDia-grooveDia)/2,grooveDia]) circle(d=grooveDia); 
      
    }
  
  //cylinder(d=wheelDia,h=filaDia*2);
}

module mirror_copy(v = [1, 0]) {
    children();
    mirror(v) children();
}