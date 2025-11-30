//
// ktRACK66
//
//

gap1 = 0.002;
gap2 = 0.004;
th = 2;

X=96-1;
Y=486/3;
Z=15;
F1=35-1;
F2=8-1;

AAR=14+0.8;
AAH=51;
AAX=10;
AAY=2;

AAAR=10.2+0.8;
AAAH=AAH;//45;
AAAX=10;
AAAY=2;


AAXA=12;
AAYA=2;
AAAXA=16;
AAAYA=2;



base();


module base()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) rotate([-90, 0, 0]) cylinder(h=20+5, r=(11+4)/2, $fn=100);
        translate([40/2, 20+5, 0]) rotate_extrude(angle=180, convexity=10, $fn=100) translate([40/2, 0, 0]) circle((11+4)/2);
        translate([40, -100+20+5, 0]) rotate([-90, 0, 0]) cylinder(h=100, r=(11+4)/2, $fn=100);


        translate([-(11+4)/2, 0, -11]) cube([(11+4), 20+5, 11]);
        //translate([40/2, 20+5, -11/2]) rotate_extrude(angle=180, convexity=10, $fn=100) translate([40/2, 0, 0]) square([(11+2),11],true);
        //translate([40, -100+20+5, 0]) translate([-(11+2)/2, 0, -11]) cube([(11+2), 100, 11]);

        translate([40-11/2-9, -10, -(11+4)/2]) cube([9+11/2, 2, 11+4]);
        translate([40-11/2-9, -10-20, -(11+4)/2]) cube([9+11/2, 2, 11+4]);
        translate([40-11/2-9, -10-20-20, -(11+4)/2]) cube([9+11/2, 2, 11+4]);

    }

    translate([0, 0, 0]) rotate([-90, 0, 0]) cylinder(h=20+5, r=11/2, $fn=100);
    translate([40/2, 20+5, 0]) rotate_extrude(angle=180, convexity=10, $fn=100) translate([40/2, 0, 0]) circle(11/2);
    translate([40, -100+20+5, 0]) rotate([-90, 0, 0]) cylinder(h=100, r=11/2, $fn=100);

    translate([-11/2, 0, -11]) cube([11, 20+5, 11]);
    //translate([40/2, 20+5, -11/2]) rotate_extrude(angle=180, convexity=10, $fn=100) translate([40/2, 0, 0]) square([11,11],true);
    //translate([40, -100+20+5, 0]) translate([-11/2, 0, -11]) cube([11, 100, 11]);

    //translate([-11/2, 0, -11]) cube([11, 20+5, 11]);
    translate([40/2, 20+5, -11/2]) rotate_extrude(angle=180, convexity=10, $fn=100) translate([40/2, 0, 0]) square([5,11],true);
    translate([40, -100+20+5, 0]) translate([-5/2, 0, -11]) cube([5, 100, 11]);
    
    translate([-500/2, -500/2, -100-11+5]) cube([500, 500, 100]);
}
}



module caseALL()
{
difference()
{
    union()
    {
        translate([-th, -th, -th]) cube([th+AAR*AAXA+th, th+AAR*AAYA+th+AAAR*AAAYA+th, AAH/3*2+th]);
    }

    translate([AAR/2-th, AAR/2-th, 0]) cube([AAR*(AAXA-1)+th*2, AAR*(AAYA-1)+th*2, AAH/3*2+gap1]);
    translate([AAR/2, AAR/2, 0])
    {
    for (x=[0:AAXA-1])
    {
        for (y=[0:AAYA-1])
        {
            translate([AAR*x, AAR*y, 0]) cylinder(h=AAH, r=AAR/2, $fn=100);
        }
    }
    }

    translate([AAAR/2+(AAR*AAXA-AAAR*AAAXA)/2-th, AAAR/2+th+AAR*AAYA-th, 0]) cube([AAAR*(AAAXA-1)+th*2, AAAR*(AAAYA-1)+th*2, AAAH/3*2+gap1]);
    translate([AAAR/2+(AAR*AAXA-AAAR*AAAXA)/2, AAAR/2+th+AAR*AAYA, 0])
    {
    for (x=[0:AAAXA-1])
    {
        for (y=[0:AAAYA-1])
        {
            translate([AAAR*x, AAAR*y, 0]) cylinder(h=AAAH, r=AAAR/2, $fn=100);
        }
    }
    }
}
}
module futaALL()
{
difference()
{
    union()
    {
        translate([-th, -th, AAH/3*2]) cube([th+AAR*AAXA+th, th+AAR*AAYA+th+AAAR*AAAYA+th, AAH/3*1+th]);
    }

    translate([AAR/2-th, AAR/2-th, AAH/3*2-gap1]) cube([AAR*(AAXA-1)+th*2, AAR*(AAYA-1)+th*2, AAH/3*1]);
    translate([AAR/2, AAR/2, 0])
    {
    for (x=[0:AAXA-1])
    {
        for (y=[0:AAYA-1])
        {
            translate([AAR*x, AAR*y, 0]) cylinder(h=AAH, r=AAR/2, $fn=100);
        }
    }
    }

    translate([AAAR/2+(AAR*AAXA-AAAR*AAAXA)/2-th, AAAR/2+th+AAR*AAYA-th, AAH/3*2-gap1]) cube([AAAR*(AAAXA-1)+th*2, AAAR*(AAAYA-1)+th*2, AAAH/3*1]);
    translate([AAAR/2+(AAR*AAXA-AAAR*AAAXA)/2, AAAR/2+th+AAR*AAYA, 0])
    {
    for (x=[0:AAAXA-1])
    {
        for (y=[0:AAAYA-1])
        {
            translate([AAAR*x, AAAR*y, 0]) cylinder(h=AAAH, r=AAAR/2, $fn=100);
        }
    }
    }
}
}









module case(_R, _H, _X, _Y)
{
difference()
{
    union()
    {
        translate([-th-_R/2, -th-_R/2, -th]) cube([_R*_X+th*2, _R*_Y+th*2, _H/3*2+th]);
    }
    translate([-th, -th, 0]) cube([_R*(_X-1)+th*2, _R*(_Y-1)+th*2, _H/3*2+gap1]);
    
    for (x=[0:_X-1])
    {
        for (y=[0:_Y-1])
        {
            translate([_R*x, _R*y, 0]) cylinder(h=_H, r=_R/2, $fn=100);
        }
    }
}
}



module futa(_R, _H, _X, _Y)
{
difference()
{
    union()
    {
        translate([-th-_R/2, -th-_R/2, _H/3*2]) cube([_R*_X+th*2, _R*_Y+th*2, _H/3*1+th]);
    }
    translate([-th, -th, _H/3*2-gap1]) cube([_R*(_X-1)+th*2, _R*(_Y-1)+th*2, _H/3*1]);
    
    for (x=[0:_X-1])
    {
        for (y=[0:_Y-1])
        {
            translate([_R*x, _R*y, 0]) cylinder(h=_H, r=_R/2, $fn=100);
        }
    }
}
}
