// This OpenSCAD script creates a modified rectangular prism with dimensions
// width=12mm, depth=15mm, height=30mm, and subtracts a second rectangular prism from it
holder_y = 5;
attachment_x = 12;
attachment_y = 3*holder_y;
attachment_z = 30;

module attachment_module(){
    // Main rectangular prism: width=12mm, depth=15mm, height=30mm
    difference() {
        cube([attachment_x, attachment_y, attachment_z]);
        // Subtract the second rectangular prism: width=12mm, depth=5mm, height=15mm
        translate([0, attachment_y/3, 0]) { // Position the subtracting prism within the main prism
            cube([12, 5, attachment_z-5]);
        }
    }
}


module needle_holder(){
    cube([]);
}

// Call the module to draw the modified rectangular prism
union(){
attachment_module();
    needle_holder();
}