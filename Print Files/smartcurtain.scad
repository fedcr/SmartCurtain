$fn = 64;

render_mode  = "print_plate";
lid_features = "both";
cutaway      = false;
carriage_pos = 7.0;
rail_len     = 260;
trolley_x    = 0.5;

m3_screw_clear = 3.35;
m3_head_dia = 6.00;  m3_head_depth = 3.00;
m3_washer_dia = 7.40;  m3_washer_depth = 1.00;
insert_length = 5.00;  insert_bore_dia = 4.10;  insert_bore_len = 5.20;
insert_lead_dia = 4.45;  insert_lead_depth = 0.65;  insert_overdepth = 0.80;

module m3_insert_pocket(through_length = 15.0) {
    translate([0, 0, -0.05]) cylinder(d1 = insert_lead_dia + 2*insert_lead_depth + 0.1, d2 = insert_lead_dia, h = insert_lead_depth + 0.05);
    translate([0, 0, insert_lead_depth - 0.01]) cylinder(d = insert_bore_dia, h = insert_bore_len - insert_lead_depth + 0.02);
    translate([0, 0, insert_bore_len - 0.01]) cylinder(d1 = insert_bore_dia, d2 = m3_screw_clear, h = insert_overdepth + 0.01);
    translate([0, 0, -0.05]) cylinder(d = m3_screw_clear, h = through_length + 0.1);
}

module m3_shcs_seat(thk) {
    translate([0, 0, -0.05]) cylinder(d = m3_head_dia, h = m3_head_depth + 0.05);
    translate([0, 0, m3_head_depth - 0.01]) cylinder(d1 = m3_head_dia, d2 = m3_screw_clear, h = (m3_head_dia - m3_screw_clear)/2 + 0.01);
    translate([0, 0, -0.05]) cylinder(d = m3_screw_clear, h = thk + 0.1);
}

wall        = 2.4;
pcb_gap     = 0.35;
joint_clear = 0.20;

pcb_w = 80.3656;  pcb_h = 45.9740;  pcb_t = 1.6;
KX0 = 29.7434;    KY1 = 154.8384;
holes_k = [[34.6,119.5],[65.6,119.5],[34.6,150.5],[65.6,150.5]];

motor_type  = "nema17";
nema_w       = motor_type=="nema17" ? 42.3 : motor_type=="nema14" ? 35.2 : 28.6;
nema_len     = motor_type=="nema17" ? 23   : motor_type=="nema14" ? 20   : 19;
nema_boss_d  = motor_type=="28byj" ? 9   : 22;
nema_boss_h  = motor_type=="28byj" ? 1.5 : 2;
nema_shaft_d = 5;
nema_shaft_l = motor_type=="28byj" ? 10 : 21;
shaft_flats  = motor_type=="28byj" ? 2 : 1;
shaft_across = motor_type=="28byj" ? 3.0 : 4.5;
motor_clear = 0.5;
shaft_dir   = "away";

motor_gap   = (shaft_dir == "toward") ? 30.0 : 5.0;
mech_h      = 5;
rear_clear  = 2;
conn_w = 12;  conn_out = 6;  conn_h = 12;

sb_x0 = 7;  sb_w = 26;  sb_d = 8;

floor_mode = "open";
belt_win_extra = 8;

cavity_h   = 17.0;
plate_t    = 4.8;
skirt_long = 3.0;
skirt_tab  = 9.0;

ledge_ov = 1.5;  ledge_w = 12;
ledges_bottom = [14, 52, 67];
ledges_top    = [];
ledges_left   = [8, 26];
ledges_right  = [4, 18];

glue_depth = 1.6;  glue_h = 5.0;
glues = [["bottom", 39.2, 4.4], ["right", 13.0, 12.0], ["left", 39.0, 6.0]];

motor_glue_windows = true;  mglue_w = 10;

ear_d = 9.0;  ear_a = 3.3;
ears = [[-pcb_gap-ear_a, pcb_h+pcb_gap+ear_a],
        [pcb_w+pcb_gap+ear_a, pcb_h+pcb_gap+ear_a],
        [pcb_w+pcb_gap+ear_a, -pcb_gap-ear_a],
        [46.0, -pcb_gap-5.2]];

tabs      = [["right",11.0], ["right",35.0], ["top",57.0], ["top",72.0]];
tab_w = 12.0;  slit_w = 0.8;  hook_p = 0.6;  hook_f = 0.4;  groove_d = 0.5;

usbc_w = 8.94;  usbc_h = 3.26;  usbc_clear = 1.0;  usbc_funnel = 1.0;  usbc_roof_flat = 6.0;
usbc_kx = 73.6092;  usbc_front_ky = 107.27;
term_mode = "block";
term_win_w = 4.2;  term_z0 = 2.6;  term_z1 = 9.0;  term_roof_flat = 8;
j1_window = false;

vent_slot_w = 2.0; vent_slot_l = 11.0; vent_pitch = 4.0; vent_n = 5;
tmc_cx = 99.06; tmc_cy = 117.409;

enc_cx = 93.091; enc_cy = 133.743;  enc_hole_d = 7.0;
enc_body_h = 7.0; enc_bushing_h = 6.0; enc_shaft_l = 20.0;
led_k = [83.261, 116.408];  led_top = 13.2;  ir_window_d = 8.0;
tmc_socket_h = 8.5; tmc_heatsink_h = 5.0;
tail_len = 3.5;

drive_teeth = 32;
belt_w = 6;
material = "PETG";
gt2_pitch = 2.0;  gt2_groove_r = 0.747;  gt2_depth = 0.764;  gt2_belt_off = 0.254;
tip_round = 0.12;
hub_r = 7.5;  hub_h = 7;  flange_t = 1.2;
bore_comp = material == "PLA" ? 0.15 : 0.20;
shrink_s  = material == "PLA" ? 1.002 : 1.004;
comp_r    = material == "PLA" ? 0.06 : 0.09;
comp_d    = material == "PLA" ? 0.04 : 0.05;
nut_af = 5.5;  nut_m = 2.4;  setscrew_az = 0;

br_t = 6.0;  T = 12;  flange_w = 16;  slot_w = 3.4;
pad_h = 9;
up_t = 4;  boss_h = 4;  boss_d = 12;  upm = 17;

function kx(x) = x - KX0;
function ky(y) = KY1 - y;
holes = [for (h = holes_k) [kx(h[0]), ky(h[1])]];
mcx = (holes[0][0] + holes[1][0]) / 2;
mcy = (holes[0][1] + holes[2][1]) / 2;
bay = nema_w + 2*motor_clear;
tht_pads = [[41.19,14.22],[41.19,16.76],[33.57,16.76],[33.57,14.22],[55.85,23.59],[55.85,18.59],[55.85,21.09],[63.35,26.7],[63.35,15.49],[70.35,18.59],[70.35,23.59],[78.21,43.78],[75.67,43.78],[73.13,43.78],[70.59,43.78],[68.05,43.78],[65.51,43.78],[62.97,43.78],[60.43,43.78],[60.43,31.08],[62.97,31.08],[65.51,31.08],[68.05,31.08],[70.59,31.08],[73.13,31.08],[75.67,31.08],[78.21,31.08],[36.16,24.64],[38.66,24.64],[61.95,6.1],[67.03,6.1],[72.11,6.1],[77.19,6.1],[46.76,41.32],[40.98,41.32],[48.19,40.79],[48.19,44.97],[39.55,40.79],[39.55,44.97],[14.49,21.35],[15.6,21.35],[13.95,21.9],[15.04,21.9],[16.14,21.9],[14.49,22.45],[15.6,22.45],[13.95,23.0],[15.04,23.0],[16.14,23.0],[14.49,23.55],[15.6,23.55],[27.76,40.62],[22.68,40.62],[17.6,40.62],[12.52,40.62],[50.34,6.08],[55.42,6.08],[52.25,38.43],[54.79,38.43],[12.27,5.66],[17.35,5.66],[22.43,5.66],[27.51,5.66],[24.55,25.38],[29.55,25.38],[26.43,15.55],[27.7,15.55],[28.98,15.55],[24.55,21.93],[29.55,21.93],[45.24,10.39],[45.24,7.85],[45.24,5.31],[45.24,2.77],[24.55,28.82],[29.55,28.82]];

z_mtop = -motor_gap;
z_mbot = z_mtop - nema_len;
z_floor_top = (shaft_dir == "toward") ? z_mbot - rear_clear
                                      : z_mbot - nema_boss_h - nema_shaft_l - mech_h;
z_floor_bot = (floor_mode == "open") ? z_floor_top : z_floor_top - wall;
z_lid_under = pcb_t + cavity_h;
z_top  = z_lid_under + plate_t;
z_ledge_long = z_lid_under - skirt_long;
z_ledge_tab  = z_lid_under - skirt_tab;
z_wide_top = z_mtop + 0.5;
ramp_n = 6;  ramp_dz = 0.25;
inner_r = 0.6;  half = wall/2;

use_snap   = lid_features != "screws";
use_screws = lid_features != "snap";
use_ears   = use_screws || floor_mode == "open";
z_cav0 = (floor_mode == "open") ? z_floor_top - 0.1 : z_floor_top;

pd = drive_teeth*gt2_pitch/PI;  po = pd - 2*gt2_belt_off;
teeth_h = belt_w + 1;  flange_od = po + 4;  cone_h = (hub_r > po/2) ? max(1, hub_r - po/2) : 1.0;
Lp = flange_t + teeth_h + cone_h + hub_h;
z_ptop = z_mtop + nema_boss_h + 0.5 + Lp;
z_pbot = z_mbot - nema_boss_h - 0.5 - Lp;
z_teeth_top = (shaft_dir == "toward") ? z_ptop - flange_t : z_pbot + flange_t + teeth_h;
z_teeth_bot = z_teeth_top - teeth_h;
belt_z0 = z_teeth_bot - 1.5;  belt_z1 = z_teeth_top + 1.5;
if (Lp + 0.5 > nema_boss_h + nema_shaft_l - 1.0) echo("WARNING: pulley longer than the free shaft - shorten hub_h / belt_w");
assert(shaft_dir != "toward" || motor_gap >= nema_boss_h + nema_shaft_l + tail_len, "motor_gap too small: shaft would hit the PCB tails");
assert(15.395 + 1.0 <= z_lid_under, "cavity_h too small for the terminal blocks");

echo(str("Outer ~ ", pcb_w+2*(pcb_gap+wall), " x ", pcb_h+2*(pcb_gap+wall), " (+ears, bay bulge, service bay), height ", z_top - z_floor_bot));
echo(str("floor top z=", z_floor_top, "  motor body z=", z_mbot, "..", z_mtop, "  lid underside z=", z_lid_under));

module rr(x0,y0,x1,y1,r) translate([x0+r,y0+r]) offset(r=r) square([x1-x0-2*r, y1-y0-2*r]);
module cav_pcb2d()  rr(-pcb_gap,-pcb_gap,pcb_w+pcb_gap,pcb_h+pcb_gap,inner_r);
module bay2d(s=0)   translate([mcx-bay/2+s, mcy-bay/2+s]) square(bay-2*s);
module service2d()  translate([sb_x0, pcb_h+pcb_gap-2]) square([sb_w, sb_d+2]);
module cav_tight2d()  offset(r=inner_r) offset(delta=-inner_r) union() { cav_pcb2d(); service2d(); }
module cav_wide2d(s=0) offset(r=inner_r) offset(delta=-inner_r) union() { cav_pcb2d(); bay2d(s); service2d(); }
module outer2d()      offset(r=wall)             cav_wide2d();
module tongue_out2d() offset(r=half)             cav_wide2d();
module skirt_in2d()   offset(r=half+joint_clear) cav_wide2d();
module ears2d() for (e = ears) translate(e) circle(d=ear_d);
module outer_ears2d() { outer2d(); if (use_ears) ears2d(); }
module slots2d() {
    cx = kx(tmc_cx); cy = ky(tmc_cy);
    for (i = [0:vent_n-1])
        translate([cx + (i-(vent_n-1)/2)*vent_pitch, cy])
            hull() {
                translate([0,  vent_slot_l/2 - vent_slot_w/2]) circle(d=vent_slot_w, $fn=24);
                translate([0, -vent_slot_l/2 + vent_slot_w/2]) circle(d=vent_slot_w, $fn=24);
            }
}

module wall_cut(y_lo, y_hi) translate([0, y_hi, 0]) rotate([90,0,0]) linear_extrude(height = y_hi - y_lo) children();
module wall_cut_x(x_lo, x_hi, yc) translate([x_lo, yc, 0]) rotate([90,0,90]) linear_extrude(height = x_hi - x_lo) children();
module gable2d(w, z0, z1) polygon([[-w/2,z0],[w/2,z0],[w/2,z1],[0,z1+w/2],[-w/2,z1]]);
module trap2d(w, z0, z1, flat) {
    c = max(0, (w - flat)/2);
    polygon([[-w/2,z0],[w/2,z0],[w/2,z1],[w/2-c,z1+c],[-w/2+c,z1+c],[-w/2,z1]]);
}
module usb2d(grow=0) {
    hw = usbc_w/2 + usbc_clear;  zc = pcb_t + usbc_h/2;
    lo = zc - usbc_h/2 - usbc_clear;  hi = zc + usbc_h/2 + usbc_clear;
    c = hw - usbc_roof_flat/2;
    offset(delta=grow) polygon([[-hw,lo],[hw,lo],[hw,hi],[hw-c,hi+c],[-hw+c,hi+c],[-hw,hi]]);
}

term_blocks = [[kx(42.0116),4], [kx(80.0812),2], [kx(91.694),4]];
j1_pins = [for (i=[0:3]) kx(57.5056 - 5.08*i)];
assert(term_z1 + (max([for (b=term_blocks) (b[1]-1)*5.08 + term_win_w]) - term_roof_flat)/2 < z_ledge_long - 0.5,
       "terminal window roof reaches the lid joint: reduce term_z1 or raise term_roof_flat");

module tab_frame(t) {
    if (t[0] == "right") translate([pcb_w+pcb_gap, t[1], 0]) children();
    else                 translate([t[1], pcb_h+pcb_gap, 0]) rotate([0,0,90]) children();
}
module np_extrude(w) translate([0, w/2, 0]) rotate([90,0,0]) linear_extrude(height=w) children();
module groove() {
    zs = z_ledge_tab;  hp = hook_p;  hf = hook_f;
    np_extrude(tab_w-1.0)
        polygon([[half+0.01, zs-0.01], [half-groove_d, zs-0.01],
                 [half-groove_d, zs+hp+hf+0.1], [half+0.01, zs+hp+hf+0.1+groove_d+0.01]]);
}
module hook() {
    zs = z_ledge_tab;  hp = hook_p;  hf = hook_f;  n0 = half + joint_clear;
    np_extrude(tab_w-2.0)
        polygon([[n0+0.2, zs], [n0, zs], [n0-hp, zs+hp], [n0-hp, zs+hp+hf],
                 [n0, zs+2*hp+hf], [n0+0.2, zs+2*hp+hf]]);
}
module slits() {
    n0 = half + joint_clear;
    for (s = [-1, 1])
        translate([n0-0.05, s*(tab_w/2 + slit_w/2) - slit_w/2, z_ledge_tab-0.1])
            cube([wall - n0 + 0.1, slit_w, z_lid_under - z_ledge_tab + 0.1]);
}
band_base = tab_w + 2*slit_w + 0.4;
band_lid  = tab_w + 2*slit_w;

module mm(flag, v) { if (flag) mirror(v) children(); else children(); }
module side_prism(side, s, w, inward=true) {
    if (side == "bottom") translate([s, -pcb_gap, 0])    mm(!inward, [0,1,0]) rotate([90,0,90]) linear_extrude(w) children();
    if (side == "top")    translate([s, pcb_h+pcb_gap, 0]) mm(inward,  [0,1,0]) rotate([90,0,90]) linear_extrude(w) children();
    if (side == "left")   translate([-pcb_gap, s+w, 0])    mm(!inward, [1,0,0]) rotate([90,0,0])  linear_extrude(w) children();
    if (side == "right")  translate([pcb_w+pcb_gap, s+w, 0]) mm(inward, [1,0,0]) rotate([90,0,0])  linear_extrude(w) children();
}
module corbel(side, s) {
    d = pcb_gap + ledge_ov;
    side_prism(side, s, ledge_w, true) polygon([[-0.6,-0.1],[d,-0.1],[-0.6,-0.1-(d+0.6)]]);
}
module glue_pocket(g) {
    side_prism(g[0], g[1], g[2], false)
        polygon([[-0.01,-0.1],[glue_depth,-0.1],[glue_depth,glue_h],[-0.01,glue_h+glue_depth+0.01]]);
}

module base() {
    union() {
        difference() {
            translate([0,0,z_floor_bot]) linear_extrude(z_lid_under - z_floor_bot) outer_ears2d();

            translate([0,0,z_cav0]) linear_extrude(z_wide_top - z_cav0) cav_wide2d(0);
            for (i = [0:ramp_n-1])
                translate([0,0,z_wide_top + i*ramp_dz - 0.01]) linear_extrude(ramp_dz + 0.02) cav_wide2d((i+1)*ramp_dz);
            translate([0,0,z_wide_top + ramp_n*ramp_dz - 0.01])
                linear_extrude(z_lid_under - (z_wide_top + ramp_n*ramp_dz) + 0.02) cav_tight2d();

            translate([0,0,z_ledge_long]) linear_extrude(z_lid_under - z_ledge_long + 1)
                difference() { difference() { offset(r=wall+5) cav_wide2d(); tongue_out2d(); } ears2d(); }
            if (use_snap) for (t = tabs)
                translate([0,0,z_ledge_tab]) linear_extrude(z_lid_under - z_ledge_tab + 1)
                    tab_frame(t) translate([half, -band_base/2]) square([wall+5, band_base]);

            if (use_screws) for (e = ears)
                translate([e[0], e[1], z_lid_under]) rotate([180,0,0]) m3_insert_pocket(insert_length + 3);

            if (floor_mode != "open") translate([0,0,z_floor_bot-0.1]) linear_extrude(wall+0.2) slots2d();

            if (floor_mode == "open") for (e = ears)
                translate([e[0], e[1], z_floor_top]) m3_insert_pocket(insert_length + 3);

            wall_cut_x(pcb_w+pcb_gap-0.5, pcb_w+pcb_gap+wall+0.5, mcy) trap2d(pd + belt_win_extra, belt_z0, belt_z1, 8);

            for (b = term_blocks) {
                n = b[1];  w = (n-1)*5.08 + term_win_w;  xc = b[0] + (n-1)*2.54;
                if (term_mode == "block")
                    translate([xc,0,0]) wall_cut(-pcb_gap-wall-2.5, -pcb_gap+0.5) trap2d(w, term_z0, term_z1, term_roof_flat);
                else for (i = [0:n-1]) translate([b[0]+i*5.08,0,0])
                    wall_cut(-pcb_gap-wall-2.5, -pcb_gap+0.5) gable2d(term_win_w, term_z0, term_z1);
            }
            if (j1_window) for (x = j1_pins) translate([x,0,0])
                wall_cut(pcb_h+pcb_gap-0.5, pcb_h+pcb_gap+wall+0.5) gable2d(term_win_w, term_z0, term_z1);

            ux = kx(usbc_kx);  y_in = pcb_h+pcb_gap;  y_out = y_in + wall;
            translate([ux,0,0]) {
                wall_cut(y_in-1.5, y_out+0.5) usb2d();
                hull() {
                    wall_cut(y_out-usbc_funnel, y_out-usbc_funnel+0.01) usb2d();
                    wall_cut(y_out+0.5, y_out+0.51) usb2d(grow=usbc_funnel+0.5);
                }
            }
            if (use_snap) for (t = tabs) tab_frame(t) groove();

            for (g = glues) glue_pocket(g);

            if (motor_glue_windows) {
                zc0 = z_mbot + 3;  zc1 = z_mtop - 3 - mglue_w/2;
                translate([mcx,0,0]) wall_cut(mcy-bay/2-wall-1, mcy-bay/2+0.5) gable2d(mglue_w, zc0, zc1);
                wall_cut_x(mcx-bay/2-wall-1, mcx-bay/2+0.5, mcy) gable2d(mglue_w, zc0, zc1);
            }
        }

        for (s = ledges_bottom) corbel("bottom", s);
        for (s = ledges_top)    corbel("top", s);
        for (s = ledges_left)   corbel("left", s);
        for (s = ledges_right)  corbel("right", s);
    }
}

module lid() {
    lx = kx(led_k[0]);  ly = ky(led_k[1]);
    difference() {
        union() {
            translate([0,0,z_lid_under]) linear_extrude(plate_t) outer_ears2d();
            translate([0,0,z_ledge_long]) linear_extrude(z_lid_under - z_ledge_long + 0.01)
                difference() { outer2d(); skirt_in2d(); if (use_ears) offset(delta=joint_clear) ears2d(); }
            if (use_snap) for (t = tabs) {
                translate([0,0,z_ledge_tab]) linear_extrude(z_ledge_long - z_ledge_tab + 0.01)
                    tab_frame(t) translate([half+joint_clear, -band_lid/2]) square([wall-half-joint_clear, band_lid]);
                tab_frame(t) hook();
            }
        }
        translate([0,0,z_lid_under-0.1]) linear_extrude(plate_t+0.2) slots2d();
        translate([kx(enc_cx), ky(enc_cy), 0]) {
            translate([0,0,z_lid_under-0.1]) cylinder(d=enc_hole_d, h=plate_t+0.2);
            translate([0,0,z_top-0.6]) cylinder(d1=enc_hole_d, d2=enc_hole_d+1.2, h=0.61);
        }
        translate([lx, ly, 0]) {
            translate([0,0,z_lid_under-0.1]) cylinder(d=ir_window_d, h=plate_t+0.2);
            translate([0,0,z_top-1.0]) cylinder(d1=ir_window_d, d2=ir_window_d+2, h=1.01);
        }
        if (use_screws) for (e = ears) translate([e[0], e[1], z_top]) rotate([180,0,0]) m3_shcs_seat(plate_t);
        if (use_snap) for (t = tabs) tab_frame(t) slits();
    }
}

module kbox(x0,x1,y0,y1,z0,z1) translate([kx(x0), ky(y1), z0]) cube([x1-x0, y1-y0, z1-z0]);
module kcyl(x,y,d,z0,z1) translate([kx(x), ky(y), z0]) cylinder(d=d, h=z1-z0);
module dshape2d(d, across, flats=1) intersection() {
    circle(d=d, $fn=64);
    if (flats == 1 && across > 0) translate([-d, -d]) square([d + (across - d/2), 2*d]);
    if (flats == 2) square([across, 2*d], center=true);
}
module pcb_proxy() {
    color("green") difference() {
        cube([pcb_w, pcb_h, pcb_t]);
        for (h = holes) translate([h[0],h[1],-1]) cylinder(d=3.2, h=pcb_t+2);
    }
    color("gray") {
        kbox(39.73,60.79,109.62,119.42,pcb_t,15.395);
        kbox(38.73,59.79,143.97,153.77,pcb_t,15.395);
        kbox(88.41,109.47,143.54,153.34,pcb_t,15.395);
        kbox(76.80,87.70,143.56,153.36,pcb_t,15.395);
        kbox(73.71,76.25,143.18,153.34,pcb_t,10.13);
        kbox(31.49,51.49,124.35,142.35,pcb_t,4.79);
        kbox(55.01,59.88,136.86,140.74,pcb_t,12.10);
        for (y = [[125.06,126.96],[128.51,130.41],[131.96,133.86]]) kbox(54.04,59.54,y[0],y[1],pcb_t,5.99);
        kbox(63.19,71.06,136.88,141.81,pcb_t,5.28);
        kcyl(65.902,130.200,6.4,pcb_t,7.89);
        kcyl(led_k[0],led_k[1],5.8,pcb_t,led_top);
        kbox(usbc_kx-usbc_w/2, usbc_kx+usbc_w/2, usbc_front_ky, usbc_front_ky+7.3, pcb_t, pcb_t+usbc_h);
    }
    color("silver") {
        kbox(87.09,99.09,127.94,139.54,pcb_t,pcb_t+enc_body_h);
        kcyl(enc_cx,enc_cy,7,pcb_t+enc_body_h,pcb_t+enc_body_h+enc_bushing_h);
        kcyl(enc_cx,enc_cy,10,pcb_t+enc_body_h+enc_bushing_h-3,pcb_t+enc_body_h+enc_bushing_h-1);
        translate([kx(enc_cx), ky(enc_cy), pcb_t+enc_body_h+enc_bushing_h]) linear_extrude(enc_shaft_l)
            dshape2d(6, 4.5);
    }
    color("navy") {
        kbox(88.9,109.22,109.79,112.33,pcb_t,pcb_t+tmc_socket_h);
        kbox(88.9,109.22,122.49,125.03,pcb_t,pcb_t+tmc_socket_h);
        kbox(88.9,109.22,109.81,125.01,pcb_t+tmc_socket_h,pcb_t+tmc_socket_h+1.6);
        kbox(tmc_cx-4.5,tmc_cx+4.5,tmc_cy-4.5,tmc_cy+4.5,pcb_t+tmc_socket_h+1.6,pcb_t+tmc_socket_h+1.6+tmc_heatsink_h);
    }
    color("goldenrod") for (h = holes) translate([h[0], h[1], pcb_t]) cylinder(d=5.6, h=2.6);
}
module under_proxy() color("red") for (p = tht_pads) translate([p[0], p[1], -tail_len]) cylinder(d=1.8, h=tail_len, $fn=12);
module motor_proxy() {
    color("dimgray") {
        translate([mcx-nema_w/2, mcy-nema_w/2, z_mbot]) cube([nema_w, nema_w, nema_len]);
        if (shaft_dir == "toward") {
            translate([mcx, mcy, z_mtop]) cylinder(d=nema_boss_d, h=nema_boss_h);
            translate([mcx, mcy, z_mtop]) linear_extrude(nema_boss_h+nema_shaft_l) dshape2d(nema_shaft_d, shaft_across, shaft_flats);
        } else {
            translate([mcx, mcy, z_mbot-nema_boss_h]) cylinder(d=nema_boss_d, h=nema_boss_h);
            translate([mcx, mcy, z_mbot-nema_boss_h-nema_shaft_l]) cylinder(d=nema_shaft_d, h=nema_boss_h+nema_shaft_l);
        }
        cz = (shaft_dir == "toward") ? z_mbot : z_mtop - conn_h;
        translate([mcx-conn_w/2, mcy+nema_w/2-0.1, cz]) cube([conn_w, conn_out+0.1, conn_h]);
    }
    color("goldenrod") for (h = holes) translate([h[0], h[1], z_mtop]) cylinder(d=6, h=motor_gap);
}

function unit(v) = v / norm(v);
function fillet(A, B, C, r, n=8) = let(
    u1 = unit(A-B), u2 = unit(C-B), ang = acos(u1*u2), t = r/tan(ang/2),
    P1 = B + u1*t, cen = B + unit(u1+u2)*(r/sin(ang/2)),
    a1 = atan2(P1[1]-cen[1], P1[0]-cen[0]),
    P2 = B + u2*t, a2 = atan2(P2[1]-cen[1], P2[0]-cen[0]),
    da = (a2-a1 > 180) ? a2-a1-360 : (a2-a1 < -180) ? a2-a1+360 : a2-a1)
    [for (i=[0:n]) cen + r*[cos(a1+da*i/n), sin(a1+da*i/n)]];
function hub_profile() = let(z0 = flange_t + teeth_h)
    concat([[0,z0], [po/2,z0]],
           fillet([po/2,z0], [hub_r,z0+cone_h], [hub_r,Lp], 2.0),
           fillet([hub_r,z0+cone_h], [hub_r,Lp], [0,Lp], 1.2),
           [[0,Lp]]);
module gt2_teeth2d(cr, cd) {
    ro = po/2;  R = gt2_groove_r + cr;  d = gt2_depth + cd;  c = ro - d + R;
    offset(r=tip_round) offset(delta=-tip_round)
        difference() {
            circle(r=ro, $fn=drive_teeth*24);
            for (i = [0:drive_teeth-1]) rotate(i*360/drive_teeth) translate([c,0]) circle(r=R, $fn=48);
        }
}
module teardrop2d(d) union() {
    circle(d=d, $fn=32);
    polygon([[-0.7071*d/2, 0.7071*d/2], [0, 1.4142*d/2], [0.7071*d/2, 0.7071*d/2]]);
}
module gt2_pulley(cr=comp_r, cd=comp_d, hub=true, marks=0) {
    h_tot = hub ? Lp : flange_t + teeth_h;
    z_s = flange_t + teeth_h + cone_h + hub_h/2;
    bd = nema_shaft_d + bore_comp;  ba = shaft_across + bore_comp;
    scale([shrink_s, shrink_s, 1]) difference() {
        union() {
            rotate_extrude($fn=96) polygon([[0,0],[flange_od/2-0.5,0],[flange_od/2,0.5],[flange_od/2,flange_t],[0,flange_t]]);
            translate([0,0,flange_t-0.01]) linear_extrude(teeth_h+0.02) gt2_teeth2d(cr, cd);
            if (hub) rotate_extrude($fn=96) polygon(hub_profile());
        }
        translate([0,0,-0.1]) linear_extrude(h_tot+0.2) dshape2d(bd, ba, shaft_flats);
        translate([0,0,-0.01]) cylinder(d1=bd+1.2, d2=bd, h=0.6, $fn=48);
        translate([0,0,h_tot-0.6]) cylinder(d1=bd, d2=bd+1.2, h=0.61, $fn=48);
        if (hub) rotate([0,0,setscrew_az]) {
            translate([0,0,z_s]) rotate([90,0,90]) linear_extrude(hub_r+1) teardrop2d(3.4);
            translate([3.5,0,z_s]) rotate([90,0,90]) linear_extrude(nut_m+0.4)
                union() { rotate(30) circle(d=(nut_af+0.3)/cos(30), $fn=6);
                          translate([-(nut_af+0.3)/2, 0]) square([nut_af+0.3, Lp - z_s + 1]); }
        }
        for (i = [1:marks]) rotate(i*40) translate([flange_od/2-1.3, 0, -0.1]) cylinder(d=1, h=0.7, $fn=12);
    }
}
module pulley_coupon() {
    gt2_pulley(0, 0, false, 1);
    translate([22,0,0]) gt2_pulley(comp_r, comp_d, false, 2);
    translate([44,0,0]) gt2_pulley(comp_r*2, comp_d*2, false, 3);
}

tx0 = min(-pcb_gap-ear_a-ear_d/2, mcx-bay/2-wall) - 1.2;
tx1 = max(pcb_w+pcb_gap+ear_a+ear_d/2, mcx+bay/2+wall) + 1.2;
ty0 = min(-pcb_gap-5.2-ear_d/2, mcy-bay/2-wall) - 1.2;
ty1 = max(pcb_h+pcb_gap+ear_a+ear_d/2, pcb_h+pcb_gap+sb_d+wall) + 1.2;
z_tt = z_floor_top;  z_tb = z_tt - br_t;
slotA = [4,  ty0 - flange_w/2];   slotB = [62, ty0 - flange_w/2];   slotC = [38, ty1 + flange_w/2];
module slot2d(x0,y0,x1,y1,w=slot_w) hull() { translate([x0,y0]) circle(d=w, $fn=32); translate([x1,y1]) circle(d=w, $fn=32); }
module slots_asym2d() {
    slot2d(slotA[0]-T/2, slotA[1], slotA[0]+T/2, slotA[1]);
    slot2d(slotB[0]-T/2, slotB[1], slotB[0]+T/2, slotB[1]);
    hull() { translate([slotC[0]-T/2, slotC[1]]) circle(d=slot_w, $fn=32);
             translate([tx1+4, slotC[1]-slot_w/2]) square([1, slot_w]); }
}
function cradle_pads() = let(mx0 = mcx-nema_w/2, mx1 = mcx+nema_w/2, my0 = mcy-nema_w/2, my1 = mcy+nema_w/2, g = 0.3, t = 2.4, l = 8)
    [[mx1+g, my0+5.5, t, l], [mx1+g, my1-5.5-l, t, l],
     [mx0+5.5, my1+g, l, t], [mx1-5.5-l, my1+g, l, t]];
module pad(x0,y0,w,l) {
    hull() { translate([x0-1.2, y0-1.2, 0]) cube([w+2.4, l+2.4, 0.01]);
             translate([x0, y0, 1.19]) cube([w, l, 0.01]); }
    translate([x0, y0, 1.18]) cube([w, l, pad_h-1.18]);
}
module motor_tray() {
    difference() {
        union() {
            translate([0,0,z_tb]) linear_extrude(br_t) rr(tx0, ty0-flange_w, tx1, ty1+flange_w, 5);
            if (shaft_dir == "toward" && motor_type != "28byj") for (p = cradle_pads()) translate([0,0,z_tt-0.01]) pad(p[0], p[1], p[2], p[3]);
        }
        for (e = ears) translate([e[0], e[1], 0]) {
            translate([0,0,z_tb]) m3_shcs_seat(br_t);
        }
        translate([0,0,z_tb-0.1]) linear_extrude(br_t+0.2) slots_asym2d();
    }
}

ux0 = tx0 - T/2 - upm;  ux1 = tx1 + T/2 + upm;  uy0 = ty0 - flange_w - 5;  uy1 = ty1 + flange_w + 5;
z_ut = z_tb - boss_h;  z_ub = z_ut - up_t;
module mount_plate() {
    cy = (uy0 + uy1)/2;
    difference() {
        union() {
            translate([0,0,z_ub]) linear_extrude(up_t) rr(ux0, uy0, ux1, uy1, 8);
            for (b = [slotA, slotB, slotC]) translate([b[0], b[1], z_ut-0.01]) {
                cylinder(d1=boss_d+4, d2=boss_d, h=2.01);
                cylinder(d=boss_d, h=boss_h+0.01);
            }
        }
        for (b = [slotA, slotB, slotC]) translate([b[0], b[1], z_tb]) rotate([180,0,0])
            m3_insert_pocket(boss_h + up_t - 1.2);
        for (x = [ux0+9, ux1-9], y = [cy-28, cy+28]) translate([x, y, 0]) {
            translate([0,0,z_ub-0.1]) linear_extrude(up_t+0.2) slot2d(0,-6,0,6,5);
            translate([0,0,z_ut-2.5]) linear_extrude(2.6) hull() { translate([0,-6]) circle(d=10, $fn=32); translate([0,6]) circle(d=10, $fn=32); }
        }
    }
}

echo(str("TRAY ", tx1-tx0, " x ", ty1-ty0+2*flange_w, " x ", br_t+pad_h, "   slots A/B closed ", T+slot_w, " long, C open-ended; travel T=", T));
echo(str("MOUNT PLATE ", ux1-ux0, " x ", uy1-uy0, " x ", up_t+boss_h, "   bosses at A=", slotA, " B=", slotB, " C=", slotC));
echo(str("PULLEY ", drive_teeth, "T  PD=", pd, " OD=", po, " flange OD=", flange_od, " length=", Lp, "  teeth z=", z_teeth_bot, "..", z_teeth_top, "  flange top z=", z_ptop));
echo(str("Z STACK: UP ", z_ub, "..", z_ut, " | tray ", z_tb, "..", z_tt, " | motor ", z_mbot, "..", z_mtop, " | PCB 0..", pcb_t, " | lid ", z_lid_under, "..", z_top));

module pulley_assembled() {
    if (shaft_dir == "toward") translate([mcx, mcy, z_ptop]) rotate([180,0,0]) gt2_pulley();
    else translate([mcx, mcy, z_pbot]) gt2_pulley();
}
module belt_proxy(run=70) color("black")
    for (sg = [-1, 1])
        translate([mcx+3, mcy + sg*(po/2-0.38) - 0.7, z_teeth_bot+0.5]) cube([run, 1.4, belt_w-1]);

bearing_id = 5.00;  bearing_od = 16.00;  bearing_width = 5.00;
press_fit_tol = 0.10;
bearing_seat_dia = bearing_od + press_fit_tol;
bearing_shoulder = bearing_od - 2.60;
dovetail_base_w = 20.00;  dovetail_depth = 5.00;  dovetail_angle = 60.0;
slide_clearance = 0.20;  bottom_relief = 0.25;  corner_chamfer = 0.60;
bracket_length = 52.00;  bulkhead_thick = 6.00;  bracket_width = 34.00;
carriage_runner_l = 26.00;  clevis_arm_t = 6.50;
belt_width = 6.00;
pulley_flange_t = 1.40;  pulley_flange_h = 1.80;
pulley_track_od = max(20.00, bearing_seat_dia + 3.90);
pulley_web = 1.00;  clevis_boss_h = 0.60;
pulley_total_h = 2*bearing_width + pulley_web;
clevis_gap = pulley_total_h + 2*clevis_boss_h;
pulley_track_w = pulley_total_h - 2*pulley_flange_t;
tens_stroke = 18;  screw_len = 45;  screw_engage_min = 3.0;  screw_pulley_gap = 0.6;
assert(screw_len >= bulkhead_thick + tens_stroke + (carriage_runner_l - 3.5 - insert_length) + screw_engage_min,
       "tension screw too short for the stroke");

pulley_rel_x = screw_len + screw_pulley_gap - bulkhead_thick + pulley_track_od/2 + pulley_flange_h;
clevis_arm_l = pulley_rel_x - carriage_runner_l;
tan_dt = tan(dovetail_angle);  sin_dt = sin(dovetail_angle);
dovetail_neck_w = dovetail_base_w - 2*(dovetail_depth/tan_dt);
male_dt_h = dovetail_depth - bottom_relief;
flank_shift_x = slide_clearance / sin_dt;
male_neck_w = dovetail_neck_w - 2*flank_shift_x;
male_base_w = male_neck_w + 2*(male_dt_h/tan_dt);

gt2_slot_gap = 1.55;  gt2_tooth_r = 0.55;  gt2_tooth_protrude = 0.75;  gt2_teeth_per_side = 7;
trolley_l = 44.00;  trolley_base_h = 3.50;  trolley_belt_h = 8.00;  trolley_dt_h = 3.50;
curtain_hook_dia = 5.50;
track_profile = "vidga";
adapter_clearance = 0.15;  adapter_length = 38.00;
runner_neck_w  = (track_profile == "vidga") ? 5.10 : 5.80;
runner_neck_h  = (track_profile == "vidga") ? 3.20 : 3.50;
runner_wing_w  = (track_profile == "vidga") ? 9.40 : 12.60;
runner_wing_t  = (track_profile == "vidga") ? 2.40 : 2.80;
mmwave_angle = 22.5;  mmwave_pcb_w = 22.30;  mmwave_pcb_h = 16.30;  mmwave_pcb_t = 1.60;  mmwave_rear_depth = 6.00;
knob_od = 24.00;  knob_h = 17.00;  knob_skirt_h = 2.00;  knob_top_bevel = 2.00;
knurl_count = 32;  knurl_depth = 0.65;  knurl_twist_deg = 35.8;
ec11_shaft_dia = 6.12;  ec11_flat_dist = 4.58;  ec11_collar_d = 10.60;  ec11_collar_h = 2.00;
knob_panel_gap = 2.0;
rail_h = 15.0;
dt_fem_base = 10.40;
dt_fem_neck = dt_fem_base - 2*(trolley_dt_h/tan(60));
dt_male_h = trolley_dt_h - 0.20;
dt_male_neck = dt_fem_neck - 2*(adapter_clearance/sin(60));
dt_male_base = dt_male_neck + 2*(dt_male_h/tan(60));

enc_shaft_top_z = pcb_t + enc_body_h + enc_bushing_h + enc_shaft_l;
wall_z       = z_ub;
belt_z_drive = (z_teeth_bot + z_teeth_top)/2;
Zb           = belt_z_drive - wall_z;
idler_belt_nom = 6.0 + dovetail_depth + clevis_arm_t + clevis_gap/2;
idler_shim   = max(0, Zb - idler_belt_nom);
bracket_base_h = 6.0 + idler_shim;
adapter_zwing = dt_male_h + max(0.2, (dt_male_neck - runner_neck_w)/2) + runner_neck_h;
trolley_riser = max(0, Zb - rail_h - adapter_zwing - trolley_belt_h/2);
trolley_total_h = trolley_base_h + trolley_belt_h + trolley_dt_h + trolley_riser;
assert(Zb - rail_h - adapter_zwing - trolley_belt_h/2 >= 0, "belt plane lower than the rail allows: raise motor_gap or lower rail_h");

drive_cord_r = pd/2;   idler_cord_r = pulley_track_od/2 + 0.376;
belt_sep     = drive_cord_r + idler_cord_r;
belt_sep_err = 2*abs(idler_cord_r - drive_cord_r);
carriage_h = 2*clevis_arm_t + clevis_gap;
screw_axis_z = bracket_base_h + dovetail_depth + carriage_h/2;
bypass_tunnel_w = 1.38 + 2*(0.80 + belt_sep_err/4);
tr_y_front = -belt_sep/2 - gt2_slot_gap/2;
tr_y_rear  =  belt_sep/2 + bypass_tunnel_w/2;
trolley_w  = 2*(max(abs(tr_y_front), tr_y_rear) + 2.4);
ec11_stop_depth = enc_shaft_top_z - (z_top + knob_panel_gap);
assert(ec11_stop_depth >= 8, "EC11 shaft too short above the lid for the knob (use the 20 mm shaft)");
adapter_total_h = dt_male_h + max(0.2, (dt_male_neck - runner_neck_w)/2) + runner_neck_h + runner_wing_t;
echo(str("BELT PLANE  Zb=", Zb, " mm above the wall | idler shim=", idler_shim, " | trolley riser=", trolley_riser, " (rail_h=", rail_h, " assumed)"));
echo(str("BELT LINES  drive cord r=", drive_cord_r, " idler cord r=", idler_cord_r, " strand taper=", belt_sep_err, " mm | trolley channels at y=", tr_y_front, " / ", tr_y_rear, " | trolley_w=", trolley_w));
echo(str("TENSIONER   pulley_rel_x=", pulley_rel_x, " screw M3x", screw_len, " stroke ", tens_stroke, " -> loop take-up ", 2*tens_stroke));
echo(str("KNOB        ec11_stop_depth=", ec11_stop_depth, " (axial gap to lid top ", knob_panel_gap, ")"));

function dt_hw(base_w, z, ang = dovetail_angle) = base_w/2 - z/tan(ang);
module dovetail_2d(base_w, neck_w, h, tip_chamfer = 0) {
    if (tip_chamfer > 0) {
        zc = tip_chamfer / (1 + 1/tan(dovetail_angle));
        polygon(points = [[-base_w/2 + tip_chamfer, 0], [base_w/2 - tip_chamfer, 0], [dt_hw(base_w, zc), zc],
                          [dt_hw(base_w, h), h], [-dt_hw(base_w, h), h], [-dt_hw(base_w, zc), zc]]);
    } else {
        polygon(points = [[-base_w/2, 0], [base_w/2, 0], [dt_hw(base_w, h), h], [-dt_hw(base_w, h), h]]);
    }
}

module opposite_rail_end_bracket() {
    guide_channel_l = bracket_length - bulkhead_thick;

    difference() {
        union() {

            translate([0, -bracket_width/2, 0])
                cube([bracket_length, bracket_width, bracket_base_h + dovetail_depth]);

            translate([0, -dovetail_base_w/2 - 3.0, 0])
                cube([bulkhead_thick, dovetail_base_w + 6.0, screw_axis_z + 6.5]);

            for (side = [-1, 1]) {
                translate([0, side * (dovetail_base_w/2 + 1.5) - 1.5, bracket_base_h + dovetail_depth - 0.1])
                hull() {
                    cube([bulkhead_thick, 3.0, screw_axis_z - (bracket_base_h + dovetail_depth) + 4.0]);
                    translate([guide_channel_l * 0.65, 0, 0])
                        cube([2.0, 3.0, 0.5]);
                }
            }
        }

        translate([bulkhead_thick - 0.01, 0, bracket_base_h])
            rotate([90, 0, 90])
                linear_extrude(height = guide_channel_l + 0.1)
                    dovetail_2d(dovetail_base_w, dovetail_neck_w, dovetail_depth + 0.05, 0);

        translate([bracket_length - 0.8, 0, bracket_base_h])
            rotate([90, 0, 90])
                linear_extrude(height = 1.0)
                    dovetail_2d(dovetail_base_w + 1.2, dovetail_neck_w + 1.2, dovetail_depth + 0.05, 0);

        translate([-0.1, 0, screw_axis_z])
            rotate([0, 90, 0])
                cylinder(d = m3_screw_clear, h = bulkhead_thick + 0.2);

        translate([-0.05, 0, screw_axis_z])
            rotate([0, 90, 0])
                cylinder(d = m3_washer_dia, h = m3_washer_depth + 0.05);

        for (x_pos = [14.0, 38.0]) {
            for (y_side = [-1, 1]) {
                y_pos = y_side * (bracket_width/2 - 3.8);

                translate([x_pos, y_pos, -0.1])
                    cylinder(d = m3_screw_clear, h = bracket_base_h + dovetail_depth + 2.0);

                translate([x_pos, y_pos, bracket_base_h + dovetail_depth - m3_head_depth])
                    cylinder(d = m3_head_dia, h = m3_head_depth + 1.0);
            }
        }

        for (x_pos = [14.0, 38.0]) {
            translate([x_pos, 0, -0.01])
                m3_insert_pocket(through_length = bracket_base_h - 0.5);
        }
    }
}

module sliding_tensioner_carriage() {
    carriage_w = dovetail_neck_w + 5.0;

    difference() {
        union() {

            translate([0, 0, bracket_base_h + bottom_relief])
                rotate([90, 0, 90])
                    linear_extrude(height = carriage_runner_l)
                        dovetail_2d(male_base_w, male_neck_w, male_dt_h + 0.1, corner_chamfer);

            translate([0, -carriage_w/2, bracket_base_h + dovetail_depth])
                cube([carriage_runner_l, carriage_w, carriage_h]);

            hull() {
                translate([carriage_runner_l - 2.0, -carriage_w/2, bracket_base_h + dovetail_depth])
                    cube([2.0, carriage_w, clevis_arm_t]);
                translate([pulley_rel_x, 0, bracket_base_h + dovetail_depth])
                    cylinder(d = carriage_w, h = clevis_arm_t);
            }

            top_arm_z = bracket_base_h + dovetail_depth + clevis_arm_t + clevis_gap;
            hull() {
                translate([carriage_runner_l - 2.0, -carriage_w/2, top_arm_z])
                    cube([2.0, carriage_w, clevis_arm_t]);
                translate([pulley_rel_x, 0, top_arm_z])
                    cylinder(d = carriage_w, h = clevis_arm_t);
            }

            translate([pulley_rel_x, 0, bracket_base_h + dovetail_depth + clevis_arm_t - 0.01])
                cylinder(d1 = bearing_id + 3.6, d2 = bearing_id + 2.4, h = 0.61);
            translate([pulley_rel_x, 0, top_arm_z - 0.60])
                cylinder(d1 = bearing_id + 2.4, d2 = bearing_id + 3.6, h = 0.61);
        }

        translate([carriage_runner_l - 3.5, 0, screw_axis_z])
            rotate([0, -90, 0])
                m3_insert_pocket(through_length = carriage_runner_l);

        translate([0, 0, screw_axis_z])
            rotate([0, 90, 0])
                m3_insert_pocket(through_length = carriage_runner_l);

        top_face_z = bracket_base_h + dovetail_depth + carriage_h;
        translate([pulley_rel_x, 0, bracket_base_h + dovetail_depth + clevis_arm_t + clevis_gap - 1.0])
            cylinder(d = m3_screw_clear, h = clevis_arm_t + 2.0);
        translate([pulley_rel_x, 0, top_face_z - m3_head_depth])
            cylinder(d = m3_head_dia, h = m3_head_depth + 0.1);

        translate([pulley_rel_x, 0, bracket_base_h + dovetail_depth])
            m3_insert_pocket(through_length = clevis_arm_t + 1.0);

        translate([carriage_runner_l - 3.5, -carriage_w/2 - 0.1, bracket_base_h + dovetail_depth + clevis_arm_t])
            cube([4.0, carriage_w + 0.2, clevis_gap]);
    }
}

module flanged_idler_pulley() {
    flange_od = pulley_track_od + 2 * pulley_flange_h;

    actual_pulley_h = max(pulley_total_h, 2 * bearing_width + 1.0);

    difference() {
        union() {

            cylinder(d = pulley_track_od, h = actual_pulley_h);

            cylinder(d = flange_od, h = pulley_flange_t * 0.55);
            translate([0, 0, pulley_flange_t * 0.55])
                cylinder(d1 = flange_od, d2 = pulley_track_od, h = pulley_flange_t * 0.45);

            translate([0, 0, actual_pulley_h - pulley_flange_t])
                cylinder(d1 = pulley_track_od, d2 = flange_od, h = pulley_flange_t * 0.45);
            translate([0, 0, actual_pulley_h - pulley_flange_t * 0.55])
                cylinder(d = flange_od, h = pulley_flange_t * 0.55);
        }

        translate([0, 0, -0.1])
            cylinder(d = bearing_shoulder, h = actual_pulley_h + 0.2);

        translate([0, 0, -0.05])
            cylinder(d = bearing_seat_dia, h = bearing_width + 0.05);

        translate([0, 0, -0.05])
            cylinder(d1 = bearing_seat_dia + 0.8, d2 = bearing_seat_dia, h = 0.45);

        translate([0, 0, actual_pulley_h - bearing_width])
            cylinder(d = bearing_seat_dia, h = bearing_width + 0.05);

        translate([0, 0, actual_pulley_h - 0.40])
            cylinder(d1 = bearing_seat_dia, d2 = bearing_seat_dia + 0.8, h = 0.45);
    }
}

module m3_bearing_axle_sleeve() {
    actual_pulley_h = max(pulley_total_h, 2 * bearing_width + 1.0);
    if (bearing_id > 3.5) {
        difference() {
            cylinder(d = bearing_id - 0.05, h = actual_pulley_h);
            translate([0, 0, -0.1])
                cylinder(d = m3_screw_clear, h = actual_pulley_h + 0.2);
        }
    }
}

module ec11_d_shaft_2d(d_bore, flat_total_w, with_ribs = true) {
    r = d_bore / 2;
    flat_y = flat_total_w - r;
    difference() {
        intersection() {
            circle(d = d_bore);

            translate([-d_bore, -d_bore])
                square([2 * d_bore, d_bore + flat_y]);
        }

        if (with_ribs) {
            for (x_pos = [-1.10, 1.10]) {
                translate([x_pos, flat_y])
                    circle(r = 0.16, $fn = 24);
            }
        }
    }
}

module belt_to_curtain_trolley() {
    y_front_wall = tr_y_front;
    y_clamp_in   = y_front_wall + gt2_slot_gap;
    y_rear_wall  = tr_y_rear;
    y_bypass_in  = y_rear_wall - bypass_tunnel_w;

    difference() {
        union() {

            hull() {
                for (xs = [-1, 1]) for (ys = [-1, 1]) {
                    translate([xs * (trolley_l/2 - 2.0), ys * (trolley_w/2 - 2.0), 0])
                        cylinder(r = 2.0, h = trolley_total_h);
                }
            }

            hull() {
                translate([-7.5, -trolley_w/2, 0])
                    cube([15.0, 2.0, 6.0]);
                translate([0, -trolley_w/2 - 7.0, 0])
                    cylinder(d = 12.0, h = 6.0);
            }
        }

        translate([0, -trolley_w/2 - 7.0, -0.1])
            cylinder(d = curtain_hook_dia, h = 6.2);
        translate([0, -trolley_w/2 - 7.0, -0.05])
            cylinder(d1 = curtain_hook_dia + 1.4, d2 = curtain_hook_dia, h = 0.75);
        translate([0, -trolley_w/2 - 7.0, 5.30])
            cylinder(d1 = curtain_hook_dia, d2 = curtain_hook_dia + 1.4, h = 0.75);

        translate([-trolley_l/2 + 3.0, 0, trolley_base_h + trolley_belt_h + trolley_riser - 0.01])
            rotate([90, 0, 90])
                linear_extrude(height = trolley_l)
                    dovetail_2d(dt_fem_base, dt_fem_neck, trolley_dt_h + 0.1);

        translate([-trolley_l/2 - 0.5, y_bypass_in, trolley_base_h])
            cube([trolley_l + 1.0, bypass_tunnel_w, trolley_belt_h + 0.5]);

        for (side = [-1, 1]) {
            difference() {
                union() {

                    x_start = (side > 0) ? 5.5 : -trolley_l/2 - 0.5;
                    slot_len = trolley_l/2 - 5.0;
                    translate([x_start, y_front_wall, trolley_base_h])
                        cube([slot_len, gt2_slot_gap, trolley_belt_h + 0.5]);

                    x_turn = (side > 0) ? 5.5 : -7.1;
                    translate([x_turn, y_front_wall, trolley_base_h])
                        cube([1.60, 4.20, trolley_belt_h + 0.5]);
                }

                for (i = [0 : gt2_teeth_per_side - 1]) {
                    tooth_x = side * (8.5 + i * gt2_pitch);
                    translate([tooth_x, y_clamp_in - gt2_tooth_protrude + gt2_tooth_r, trolley_base_h - 0.1])
                        cylinder(r = gt2_tooth_r, h = trolley_belt_h + 1.0, $fn = 36);
                }
            }
        }

        translate([0, 0, trolley_base_h + trolley_belt_h + trolley_riser + 0.01])
            rotate([180, 0, 0])
                m3_insert_pocket(through_length = trolley_base_h + trolley_belt_h + trolley_riser + 1.0);
    }
}

module modular_track_adapter() {

    bevel_h      = max(0.2, (dt_male_neck - runner_neck_w) / 2);
    z_neck_start = dt_male_h + bevel_h;
    z_wing_start = z_neck_start + runner_neck_h;
    total_h      = z_wing_start + runner_wing_t;

    difference() {
        union() {

            translate([-adapter_length/2, 0, 0])
                rotate([90, 0, 90])
                    linear_extrude(height = adapter_length)
                        dovetail_2d(dt_male_base, dt_male_neck, dt_male_h);

            translate([-adapter_length/2, 0, dt_male_h - 0.01])
                rotate([90, 0, 90])
                    linear_extrude(height = adapter_length)
                        dovetail_2d(dt_male_neck, runner_neck_w, bevel_h + 0.02);

            hull() {
                for (xs = [-1, 1]) {
                    translate([xs * (adapter_length/2 - runner_neck_w/2), 0, z_neck_start])
                        cylinder(d = runner_neck_w, h = runner_neck_h + 0.05);
                }
            }

            hull() {
                for (xs = [-1, 1]) {

                    translate([xs * (adapter_length/2 - runner_wing_w/2), 0, z_wing_start + 0.80])
                        cylinder(d = runner_wing_w, h = runner_wing_t - 0.80);

                    translate([xs * (adapter_length/2 - runner_wing_w/2 - 0.80), 0, z_wing_start])
                        cylinder(d = runner_wing_w - 1.60, h = 0.85);
                }
            }
        }

        translate([0, 0, -0.1])
            cylinder(d = m3_screw_clear, h = total_h + 0.2);

        translate([0, 0, total_h - m3_head_depth])
            cylinder(d = m3_head_dia, h = m3_head_depth + 0.1);
        translate([0, 0, total_h - m3_head_depth - (m3_head_dia - m3_screw_clear)/2 + 0.01])
            cylinder(d1 = m3_screw_clear, d2 = m3_head_dia, h = (m3_head_dia - m3_screw_clear)/2 + 0.02);
    }
}

module angled_mmwave_mount() {
    outer_w      = mmwave_pcb_w + 4.0;
    outer_h      = mmwave_pcb_h + 4.0;
    box_depth    = mmwave_rear_depth + mmwave_pcb_t + 1.4;
    ear_offset_x = outer_w/2 + 5.5;
    base_plate_h = 3.20;
    wedge_lift_z = (outer_h/2) * sin(mmwave_angle) + base_plate_h;

    difference() {

        intersection() {
            translate([-60, -60, 0])
                cube([120, 120, 50]);

            union() {

                hull() {
                    translate([-outer_w/2, -outer_h/2, 0])
                        cube([outer_w, outer_h, base_plate_h]);
                    for (side = [-1, 1]) {
                        translate([side * ear_offset_x, 0, 0])
                            cylinder(r = 5.0, h = base_plate_h);
                    }
                }

                translate([0, 0, wedge_lift_z])
                    rotate([mmwave_angle, 0, 0])
                        translate([-outer_w/2, -outer_h/2, -12.0])
                            cube([outer_w, outer_h, 12.0 + box_depth]);
            }
        }

        intersection() {
            translate([-50, -50, base_plate_h])
                cube([100, 100, 50]);

            translate([0, 0, wedge_lift_z])
                rotate([mmwave_angle, 0, 0]) {

                    translate([-(mmwave_pcb_w - 2.4)/2, -(mmwave_pcb_h - 2.4)/2, -10.0])
                        cube([mmwave_pcb_w - 2.4, mmwave_pcb_h - 2.4, mmwave_rear_depth + 10.05]);

                    difference() {
                        translate([-mmwave_pcb_w/2, -mmwave_pcb_h/2, mmwave_rear_depth])
                            cube([mmwave_pcb_w, mmwave_pcb_h, mmwave_pcb_t + 3.0]);

                        for (ys = [-1, 1]) {
                            translate([0, ys * (mmwave_pcb_h/2), mmwave_rear_depth + mmwave_pcb_t + 0.55])
                                rotate([45, 0, 0])
                                    cube([8.0, 1.10, 1.10], center = true);
                        }
                    }

                    for (cx = [-1, 1]) for (cy = [-1, 1]) {
                        translate([cx * (mmwave_pcb_w/2 - 0.15), cy * (mmwave_pcb_h/2 - 0.15), mmwave_rear_depth - 0.2])
                            cylinder(d = 1.6, h = mmwave_pcb_t + 3.0, $fn = 24);
                    }

                    translate([-3.0, -outer_h/2 - 2.0, -6.0])
                        cube([6.0, 6.0, mmwave_rear_depth + 6.1]);
                }
        }

        for (side = [-1, 1]) {
            hull() {
                for (dy = [-1.2, 1.2]) {
                    translate([side * ear_offset_x, dy, -0.1])
                        cylinder(d = m3_screw_clear, h = 10.0);
                }
            }
        }
    }
}

module knurl_star_2d(r_out, r_in, teeth) {
    pts = [
        for (i = [0 : 2 * teeth - 1])
            let (
                ang = i * (360 / (2 * teeth)),
                rad = (i % 2 == 0) ? r_out : r_in
            )
            [rad * cos(ang), rad * sin(ang)]
    ];
    polygon(pts);
}

module knob_outer_envelope() {
    cylinder(d1 = knob_od - 1.0, d2 = knob_od, h = 0.50);
    translate([0, 0, 0.50])
        cylinder(d = knob_od, h = knob_h - knob_top_bevel - 0.50);
    translate([0, 0, knob_h - knob_top_bevel])
        cylinder(d1 = knob_od, d2 = knob_od - 2 * knob_top_bevel, h = knob_top_bevel);
}

module custom_ec11_knob() {
    r_out = knob_od / 2;
    r_in  = r_out - knurl_depth;
    knurl_zone_h = knob_h - knob_skirt_h;

    difference() {

        intersection() {
            knob_outer_envelope();

            union() {

                cylinder(d = knob_od, h = knob_skirt_h + 0.01);
                translate([0, 0, knob_skirt_h])
                    cylinder(d1 = knob_od, d2 = 2 * r_in, h = knurl_depth + 0.05);

                translate([0, 0, knob_skirt_h])
                    union() {
                      cylinder(r = r_in + 0.03, h = knurl_zone_h + 0.01);
                      intersection() {
                        linear_extrude(height = knurl_zone_h, twist =  knurl_twist_deg, slices = 64, convexity = 10)
                            knurl_star_2d(r_out, r_in, knurl_count);
                        linear_extrude(height = knurl_zone_h, twist = -knurl_twist_deg, slices = 64, convexity = 10)
                            knurl_star_2d(r_out, r_in, knurl_count);
                    }
                    }
            }
        }

        translate([0, 0, knob_h + 14.8])
            sphere(r = 16.0, $fn = 84);

        translate([-0.8, knob_od/2 - 4.2, knob_h - 1.3])
            rotate([25, 0, 0])
                cube([1.6, 5.0, 2.5]);

        translate([0, 0, -0.05])
            cylinder(d = ec11_collar_d, h = ec11_collar_h + 0.06);

        hull() {
            translate([0, 0, ec11_collar_h - 0.02])
                cylinder(d = ec11_collar_d, h = 0.04);
            translate([0, 0, ec11_collar_h + (ec11_collar_d - ec11_shaft_dia)/2])
                linear_extrude(height = 0.04)
                    ec11_d_shaft_2d(ec11_shaft_dia, ec11_flat_dist, false);
        }

        translate([0, 0, -0.1])
            linear_extrude(height = ec11_stop_depth + 0.1)
                ec11_d_shaft_2d(ec11_shaft_dia, ec11_flat_dist, true);
    }
}

module fit_verification_coupon() {
    difference() {
        translate([-28, -10, 0])
            cube([56, 20, 6.5]);

        for (i = [-1, 0, 1]) {
            translate([i * 15, 2.5, -0.1])
                linear_extrude(height = 7.0)
                    ec11_d_shaft_2d(ec11_shaft_dia + i * 0.04, ec11_flat_dist + i * 0.04, true);
        }

        translate([-8.5, -10.01, 2.0]) {
            difference() {
                cube([17.0, gt2_slot_gap + 1.2, 5.0]);
                for (k = [0 : 6]) {
                    translate([2.5 + k * gt2_pitch, gt2_slot_gap + 1.2 - gt2_tooth_protrude + gt2_tooth_r, -0.1])
                        cylinder(r = gt2_tooth_r, h = 5.5, $fn = 36);
                }
            }
        }
    }
}

module idler_assembly(p = carriage_pos) {
    color("#3b82f6") opposite_rail_end_bracket();
    translate([bulkhead_thick + p, 0, 0]) {
        color("#10b981") sliding_tensioner_carriage();
        translate([pulley_rel_x, 0, bracket_base_h + dovetail_depth + clevis_arm_t + (clevis_gap - pulley_total_h)/2]) {
            color("#f59e0b") flanged_idler_pulley();
            color("#94a3b8") m3_bearing_axle_sleeve();
        }
    }
}
module trolley_assembly() {
    color("#3b82f6") belt_to_curtain_trolley();
    color("#10b981") translate([1.5, 0, trolley_base_h + trolley_belt_h + trolley_riser + 0.20]) modular_track_adapter();
}
x_idler = mcx + rail_len;
module world_idler()   translate([x_idler, mcy, wall_z]) rotate([0,0,180]) translate([-(bulkhead_thick + carriage_pos + pulley_rel_x), 0, 0]) idler_assembly(carriage_pos);
module world_trolley() translate([mcx + trolley_x*rail_len, mcy, wall_z + Zb + trolley_base_h + trolley_belt_h/2]) rotate([180,0,0]) trolley_assembly();
module belt_strands() color("black") for (sg = [-1, 1]) hull() {
    translate([mcx, mcy + sg*drive_cord_r - 0.69, belt_z_drive - 3]) cube([0.1, 1.38, 6]);
    translate([x_idler, mcy + sg*idler_cord_r - 0.69, belt_z_drive - 3]) cube([0.1, 1.38, 6]);
}
module drive_end(show_lid = true) {
    color("orange", 0.9) base();
    if (show_lid) color("skyblue", 0.9) lid();
    pcb_proxy();  motor_proxy();  under_proxy();
    color("seagreen") motor_tray();  color("tan") mount_plate();
    color("white") pulley_assembled();
    color("#f59e0b") translate([kx(enc_cx), ky(enc_cy), enc_shaft_top_z - ec11_stop_depth]) custom_ec11_knob();
}
module print_base() translate([0,0,-z_floor_bot]) base();
module print_lid()  translate([0,0,z_top]) rotate([180,0,0]) lid();
Y_LID = -(pcb_h + 2*(pcb_gap+wall) + 22);
module joint_clip() translate([pcb_w+pcb_gap-6, tabs[0][1]-20, z_ledge_tab-8]) cube([14, 40, 24]);

module print_idler_set() {
    translate([-35, 0, 0]) rotate([0, -90, 0]) translate([-bracket_length, 0, 0]) translate([bracket_length, 0, 0]) rotate([0, 180, 0]) opposite_rail_end_bracket();
    translate([10, 0, 0]) rotate([0, -90, 0]) translate([0, 0, -(bracket_base_h + dovetail_depth + carriage_h/2)]) sliding_tensioner_carriage();
    translate([45, -12, 0]) flanged_idler_pulley();
    translate([45, 15, 0]) m3_bearing_axle_sleeve();
}
module print_rail_set() {
    translate([-26, -15, 0]) belt_to_curtain_trolley();
    translate([-26, 18, adapter_total_h]) rotate([180, 0, 0]) modular_track_adapter();
    translate([26, 15, 0]) angled_mmwave_mount();
    translate([26, -16, 0]) custom_ec11_knob();
}

if (render_mode == "print_plate") { translate([0,  75, 0]) print_idler_set(); translate([0, -45, 0]) print_rail_set(); translate([-60, 130, 0]) gt2_pulley(); }
else if (render_mode == "print_plate_case")  { print_base(); translate([0, Y_LID, 0]) print_lid(); }
else if (render_mode == "print_plate_drive") translate([0,0,-z_tb]) motor_tray();
else if (render_mode == "print_plate_mount") translate([0,0,-z_ub]) mount_plate();
else if (render_mode == "assembly") {
    difference() {
        union() { drive_end(); world_idler(); world_trolley(); belt_strands(); }
        if (cutaway) translate([-60, -60, wall_z-5]) cube([x_idler + 120, 60 + mcy, 220]);
    }
}
else if (render_mode == "belt_check") { drive_end(false); world_idler(); world_trolley(); belt_strands(); }
else if (render_mode == "section") {
    difference() {
        union() { idler_assembly(carriage_pos); translate([0, 60, 0]) trolley_assembly(); }
        translate([-10, -50, -10]) cube([140, 50, 120]);
        translate([-10, 60, -10]) cube([140, 50, 120]);
    }
}
else if (render_mode == "base") print_base();
else if (render_mode == "lid") print_lid();
else if (render_mode == "motor_tray") translate([0,0,-z_tb]) motor_tray();
else if (render_mode == "mount_plate") translate([0,0,-z_ub]) mount_plate();
else if (render_mode == "drive_pulley") gt2_pulley();
else if (render_mode == "pulley_coupon") pulley_coupon();
else if (render_mode == "idler_bracket") translate([-35, 0, 0]) rotate([0, -90, 0]) translate([-bracket_length, 0, 0]) translate([bracket_length, 0, 0]) rotate([0, 180, 0]) opposite_rail_end_bracket();
else if (render_mode == "idler_carriage") rotate([0, -90, 0]) translate([0, 0, -(bracket_base_h + dovetail_depth + carriage_h/2)]) sliding_tensioner_carriage();
else if (render_mode == "idler_pulley") flanged_idler_pulley();
else if (render_mode == "idler_sleeve") m3_bearing_axle_sleeve();
else if (render_mode == "trolley") belt_to_curtain_trolley();
else if (render_mode == "track_adapter") translate([0, 0, adapter_total_h]) rotate([180, 0, 0]) modular_track_adapter();
else if (render_mode == "mmwave_mount") angled_mmwave_mount();
else if (render_mode == "ec11_knob") custom_ec11_knob();
else if (render_mode == "fit_test_coupon") fit_verification_coupon();
else if (render_mode == "joint_base") translate([0,0,-z_ledge_tab+8]) intersection() { base(); joint_clip(); }
else if (render_mode == "joint_lid") translate([0,0,z_top]) rotate([180,0,0]) intersection() { lid(); joint_clip(); }
