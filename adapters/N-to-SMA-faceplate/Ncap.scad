include<wedge.scad>

$fn = 100;

module snap(strength, width, depth) {
    nose = 1.0;
    cube([width, depth, strength]);
    translate([0, 0, strength]) {
        translate([0, 0.75, 0]) rotate([90,0,90]) wedge(90, depth - 0.75, nose, strength);
        translate([width - strength, 0.75, 0]) rotate([90,0,90]) wedge(90, depth - 0.75, nose, strength);
        cube([width, 0.75, nose]);
    };
};

module ncap() {
    extend = 7;
    difference() {
        union() {
            cylinder(2, 9, 9);
            translate([0,0,2]) {
                difference() {
                    difference() {
                        cylinder(extend, 8, 8);
                        cylinder(extend,6.5,6.5);
                    };
                    {
                        translate([-8,7,0]) cube([16,1,extend]);
                        translate([-8,-8,0]) cube([16,1,extend]);
                        translate([-2.5, 7 - 1, 0]) cube([5, 1, 3.5]);
                        translate([-2.5, -8 + 1, 0]) cube([5, 1, 3.5]);
                    };
                };
                translate([0, 0, 1.1]) {
                    translate([2, 7.0 - 0.44, 0])
                        rotate([90, 0, 180]) snap(0.44, 4, 3.8);
                    translate([-2, -7.0 + 0.44, 0])
                        rotate([90, 0, 0]) snap(0.44, 4, 3.8);
                };
            };
        };
        {
            
        };
    };
};

difference() {
    ncap();
    cylinder(20, 3.25, 3.25);
};

//snap(0.44, 4, 3.8);