// This OpenSCAD script creates a modified rectangular prism with dimensions
// width=12mm, depth=15mm, height=30mm, and subtracts a second rectangular prism from it
attachment_x = 11.8; // nominally about 12 mm. In practice a little smaller is needed.

attachment_y = 15;
attachment_z = 30;

notch_x = attachment_x;
//notch_y = 2.15;
// notch_y is an important parameter which should be quite exact.
notch_y = 3;

notch_z = attachment_z - 7;

x_between_wells = 19.5;

module attachment_module(){
    // Main rectangular prism: width=12mm, depth=15mm, height=30mm
    difference() {
        cube([attachment_x, attachment_y, attachment_z]);
        // Subtract the second rectangular prism: width=12mm, depth=5mm, height=15mm
        translate([0, attachment_y/2 - notch_y/2, 0], color=red) { // Position the subtracting prism within the main prism
            cube([notch_x, notch_y, notch_z]);
        }
    }
}


holder_x = 3*x_between_wells;
holder_y = 10;
holder_z = 15;
module needle_holder(){
    translate([0,attachment_y, 0]){
    color([0,0,1]){
    cube([holder_x, holder_y, holder_z]);
    }
}
}

// Call the module to draw the modified rectangular prism
union(){
attachment_module();
    needle_holder();
}