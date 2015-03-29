$fn = 100;

mount_size = 30.4 + 0.1;

width = 40;
thick = 2.6;
deep = 40;

m3_thread = 3.1;
m3_thread_len = 5;
m3_head = 7;
m3_head_len = 3;
m3_ext = 20;

bed_mount();

module bed_mount()
{
    difference()
    {
        union()
        {
            cube([width, thick + mount_size + thick, deep]);
            translate([0,mount_size/2 + thick, deep])rotate([0,90,0]) cylinder (r = mount_size / 2 + thick, h = width);
            translate([width/2,thick + mount_size/2,0]) cylinder( r = m3_ext / 2, h = deep + mount_size/2 + thick + m3_head_len + m3_thread_len);
        }
        union()
        {
            translate([-1, thick, -1]) cube([width + 2, mount_size, deep+1]);
            translate([-1,mount_size/2 + thick, deep])rotate([0,90,0]) cylinder (r = mount_size / 2, h = width + 2);
            translate([width/2,thick + mount_size/2,-1]) cylinder( r = m3_thread / 2, h = deep + mount_size/2 + thick + m3_head_len + m3_thread_len + 2);
            translate([width/2,thick + mount_size/2,-1]) cylinder( r = m3_head / 2, h = deep + mount_size/2 + thick + m3_head_len + 1);
        }
    }
}


