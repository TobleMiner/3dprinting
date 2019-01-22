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
    union() {
        cylinder(2, 9, 9);
        translate([0,0,2]) {
            difference() {
                difference() {
                    cylinder(extend, 7.75, 7.75);
                    cylinder(extend,6.25,6.25);
                };
                {
                    translate([-8,6.75,0]) cube([16,1,extend]);
                    translate([-8,-7.75,0]) cube([16,1,extend]);
                    translate([-3, 6.25 - 1, 0]) cube([6, 2, 3.5]);
                    translate([-3, -7.75 + 1, 0]) cube([6, 2, 3.5]);
                };
            };
            translate([0, 0, 1.1]) {
                translate([2, 6.75 - 0.44, 0])
                    rotate([90, 0, 180]) snap(0.44, 4, 3.8);
                translate([-2, -6.75 + 0.44, 0])
                    rotate([90, 0, 0]) snap(0.44, 4, 3.8);
            };
        };
    };
};

difference() {
    ncap();
    cylinder(20, 3.3, 3.3);
};
