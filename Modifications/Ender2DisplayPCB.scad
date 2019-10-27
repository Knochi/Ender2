$fn=50;

fudge=0.1;

translate([0,-73.65/2+11.5,0]) rotaryEncoder();

lcdPCBY=(73.65-50)/2-1.15;

PCB([69,73.65,1.6],4.3,1);
translate([0,lcdPCBY,2.2+1.6]) PCB([54,50,1],2.5,1.25);
translate([0,lcdPCBY+(50-39.4)/2-5.15,2.2+1.6]) LCD([50.3,39.4,4.8],[45.5,30],drvHeight=6.8);

color("darkslategrey") 
  translate([0,(73.65-8.9)/2-5,-1.6-9/2]) cube([20.4,8.9,9],true);


module PCB(dims=[50,50,1.6], drill=4.3, drillbrdg=1){
translate([0,0,-dims.z/2])
  difference(){
    color("green") cube(dims,true);
    for (i=[-1,1],j=[-1,1])
      translate([i*((dims.x-drill)/2-drillbrdg),j*((dims.y-drill)/2-drillbrdg),0]) 
        cylinder(d=drill,h=dims.z+fudge,center=true);
  }
}


module LCD(dims,aArea,drvHeight,txt="Marlin 1.1.9"){
  difference(){
    color("white") translate([0,0,dims.z/2]) cube(dims,true);
    translate([0,drvHeight/2,dims.z*0.75]) cube([aArea.x,aArea.y,dims.z/2+fudge],true);
  }
  color("yellowgreen") translate([0,drvHeight/2,dims.z*0.75]) cube([aArea.x,aArea.y,dims.z/2],true);
  color("dimgrey") translate([0,drvHeight/2,dims.z]) text(txt,valign="center",halign="center",size=5); 
}

module rotaryEncoder(){
  color("silver") translate([0,0,6.4/2]) cube([11.8,12,6.4],true);
  color("grey") translate([0,0,6.4-fudge]) cylinder(d=6.4,h=6.9+fudge);
  color("silver")translate([0,0,6.4+6.9-fudge]) cylinder(d=6, h=8.5+fudge);
}

