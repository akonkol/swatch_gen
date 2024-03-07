swatch_width = 75;
swatch_depth = 40;
swatch_height = 3;
swatch_radius = 3;
rule_depth = 0.5;
rule_length = 71;
padding=2;

make="Not Specified";
make_length = len(make);
model="Nada";


hole_od=4.5;
hole_offset = 5.5; 

hole_x = hole_offset;
hole_y = swatch_depth - hole_offset;

make_x = hole_x + hole_od;
textarea_width = swatch_width - make_x - padding;
letter_size = textarea_width / make_length;

make_y = swatch_depth - letter_size - (1.6*padding);

rule_x = padding;
rule_y = 29;//make_y - padding;

model_x = make_x;
model_y = rule_y - (1.6 * padding) - letter_size;

depth_1=1;
depth_2=1.5;
depth_3=2.0;
depth_4=2.5;
depth_width=18;
depth_height=16;

filament_swatch();


module filament_swatch() {
  difference() {
    roundedcube(swatch_width, swatch_depth, swatch_height, swatch_radius);
    linear_extrude(swatch_height +2){
      translate([hole_x, hole_y,0]){
        circle(hole_od/2);
      }
    }
    translate([make_x,make_y,swatch_height-1]){
      linear_extrude(1){
        text(make, size=letter_size);
      }
    }
    translate([rule_x,rule_y,swatch_height-1]){
        cube([rule_length, rule_depth, swatch_height - 1]);
    }
    translate([model_x,model_y,swatch_height-1]){
        linear_extrude(1){
          text(model, size=letter_size);
        }
    }    
    translate([padding, padding,swatch_height - depth_1]){
        cube([17.5, depth_height, depth_1]);
    }
    translate([padding + 17.5 , padding,swatch_height - depth_2]){
        cube([18, depth_height, depth_2]);
    }
    translate([padding + 17.5 + 18, padding,swatch_height - depth_3]){
        cube([18, depth_height, depth_3]);
    }
    translate([padding + 17.5 + 18 + 18 , padding,swatch_height - depth_4]){
        cube([18, depth_height, depth_4]);
    }
 }
}


module roundedcube(xdim, ydim, zdim, rdim){
    $fn=64;
    hull(){
      translate([rdim, rdim, 0])cylinder(r=rdim, h=zdim);
      translate([xdim - rdim, rdim, 0])cylinder(r=rdim, h=zdim);

      translate([rdim, ydim- rdim, 0])cylinder(r=rdim, h=zdim);
      translate([xdim - rdim, ydim-rdim, 0])cylinder(r=rdim, h=zdim);
    }
}
