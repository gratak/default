// =====================================================================
//  Obudowa czujnika:  NodeMCU V3 (ESP8266, CH340C, USB-C)  +  GY-BME/P280
// ---------------------------------------------------------------------
//  Plik daje DWIE CZĘŚCI DO DRUKU: podstawę i pokrywę.
//    part = "print" (domyślnie) - obie części ułożone do druku
//    part = "base" / "lid"      - jedna część; F6, potem F7 = plik STL
//    part = "assembly" / "exploded" / "section" - tylko podgląd złożenia;
//           płytki i kable są wtedy półprzezroczystym tłem i nie trafiają do STL
//
//  Dwie komory w jednym pudełku:
//    * ELEKTRONIKA – podłużne szczeliny (ściany, pokrywa, dno), USB-C z boku
//    * CZUJNIK     – ażur (plaster miodu albo okrągłe oczka)
//  Między nimi lita przegroda. Domyślnie PODWÓJNA: dwie pełne ścianki
//  i pionowa szczelina powietrzna otwarta w dnie i w pokrywie (komin).
//  therm_gap = 0  ->  zwykła pojedyncza lita ścianka.
//
//  NodeMCU leży jak na zdjęciach: elementami (ESP-12, USB-C) w DÓŁ,
//  pinami i kablami do GÓRY, na 4 dystansach pod otworami 52 x 25 mm.
//
//  CZUJNIK stoi pionowo i razem z wtyczką dupont 1x6 tworzy literę L:
//  układ BME280 patrzy na ażurową ścianę końcową, wtyczka leży poziomo
//  na podeście, kable wychodzą w stronę przegrody. Płytka jest przykręcona
//  2 wkrętami M2.5 x 6 do ramki za nią; śrubokręt (najlepiej magnetyczny)
//  wkłada się przez okienko w ścianie końcowej.
//
//  KABLE CZUJNIKA: z wtyczki poziomo do przegrody, przy niej w górę,
//  przez przepust u góry przegrody (10 x 4 mm, pokrywa domyka go żebrem),
//  dalej górą komory elektroniki do pinów NodeMCU. Trasa ok. 7-8 cm.
//
//  DRUK bez podpór: podstawa dnem do stołu, pokrywa górą do stołu.
//  PLA/PETG, warstwa 0.2 mm, 3 obrysy, wypełnienie 20 %.
// =====================================================================

/* [Co pokazać] */
// Części do druku albo podgląd złożenia
part = "print"; // [print:Obie części do druku, base:Podstawa, lid:Pokrywa, assembly:Podgląd - złożona, exploded:Podgląd - rozłożona, section:Podgląd - przekrój]
// W podglądzie pokaż płytki i kable (półprzezroczyste, nie trafiają do STL)
show_pcb = true;

/* [NodeMCU V3] */
pcb_l   = 57;   // długość płytki
pcb_w   = 30;   // szerokość płytki
pcb_t   = 1.6;  // grubość laminatu
hole_dx = 52;   // rozstaw otworów montażowych wzdłuż (środek-środek)
hole_dy = 25;   // rozstaw otworów w poprzek
// Wysokość dystansów = luz pod płytką (od spodu: ESP-12, USB-C, przyciski ~3.3 mm)
under_clear = 6;
// Miejsce nad laminatem: goldpiny + wtyczki dupont + zagięte kable
above_clear = 17;

/* [USB-C] */
usb_w = 13;    // szerokość otworu (mieści obudowę wtyku kabla)
usb_h = 7.5;   // wysokość otworu
// Środek gniazda względem SPODU laminatu (gniazdo jest od spodu, więc ujemnie)
usb_z = -1.6;
// Przesunięcie gniazda w poprzek względem środka płytki
usb_y = 0;

/* [Mocowanie NodeMCU] */
// screw = wkręty w dystanse; peg = kołki w otworach + dociski w pokrywie
board_fix = "screw"; // [screw:Wkręty, peg:Kołki i docisk pokrywą]
standoff_d = 5;
// Otwór pod wkręt: M2.5 samogwintujący ~2.2 mm, M3 ~2.6 mm
pilot_d = 2.2;
// Średnica kołka (otwory w płytce mają ok. 3 mm)
peg_d = 2.6;
// Otworki w dnie pod przyciskami RST i FLASH (wciskane spinaczem)
button_holes = true;

/* [Czujnik BME280] */
sens_len = 30;      // długość wewnętrzna komory czujnika
// screw = płytka przykręcona do ramki; cradle = bez wkrętów (wtyczka w kołysce, docisk pokrywą)
sensor_mount = "screw"; // [screw:Przykręcany do ramki, cradle:Wtyczka w kołysce + docisk]
sens_w = 15.5;      // szerokość płytki czujnika (wzdłuż rzędu pinów)
sens_d = 11.6;      // wysokość płytki czujnika (od krawędzi z pinami do przeciwnej)
sens_t = 1.6;       // grubość płytki czujnika
// Rozstaw otworów montażowych czujnika (środek-środek)
sens_hole_dx = 10;
// Odległość: oś rzędu pinów -> oś otworów montażowych (sprawdź na swojej płytce)
sens_pin_hole = 8.2;
// Otwór pod wkręt w ramce: M2.5 samogwintujący ~2.2 mm, M3 ~2.6 mm
sens_pilot_d = 2.2;
// Odstęp strony z układem BME280 od ściany końcowej (mieszczą się łebki wkrętów)
sens_gap = 4.5;
// Wysokość okienka na śrubokręt w ścianie końcowej
win_h = 5.5;
plug_w = 15.24;     // szerokość wtyczki dupont 1x6 (6 x 2.54)
plug_h = 2.54;      // grubość wtyczki
plug_ped = 2;       // wtyczka leży na podeście tej wysokości (czujnik nad dnem)
// --- tylko dla sensor_mount = "cradle" ---
cradle_x = 6;       // początek kołyski (od przegrody)
cradle_len = 10;    // długość kołyski
// Słupek w pokrywie dociskający wtyczkę czujnika
plug_holddown = true;

/* [Ściany i przegroda] */
wall = 2;
floor_t = 2;
lid_t = 2;
corner_r = 3;
gap_usb = 1;       // luz: krawędź płytki - ściana z USB
gap_div = 2;       // luz: krawędź płytki - przegroda
gap_side = 2;      // luz boczny (z każdej strony)
div_t = 2;         // grubość ścianki przegrody
// Szczelina powietrzna między ściankami przegrody (0 = jedna lita ścianka)
therm_gap = 3;
wire_w = 10;       // przepust na kable w przegrodzie - szerokość
wire_d = 4;        // przepust - głębokość od góry przegrody

/* [Pokrywa i zatrzaski] */
lip_h = 2.5;       // wysokość kołnierza pokrywy
lip_t = 1.2;       // grubość kołnierza
fit = 0.2;         // luz pasowania (zwiększ, jeśli pokrywa wchodzi za ciasno)
snap = 0.5;        // wysokość ząbków zatrzasku (0 = tylko na wcisk)
snap_len = 10;     // długość ząbka

/* [Wentylacja] */
slot_w = 2;          // szerokość szczelin
slot_pitch = 4.5;    // rozstaw szczelin
floor_slots = true;  // szczeliny także w dnie pod płytką
hole_shape = "hex";  // [hex:Plaster miodu, circle:Okrągłe oczka]
hole_size = 3.5;     // wielkość oczka ażuru
hole_web = 1.2;      // mostek między oczkami

/* [Hidden] */
$fn = 40;
eps = 0.01;

// ---------------------------------------------------------------------
//  Wymiary wynikowe  (oś X: od ściany z USB, Y: od przodu, Z: od dna)
// ---------------------------------------------------------------------
in_w    = pcb_w + 2*gap_side;                  // szerokość wnętrza
el_len  = gap_usb + pcb_l + gap_div;           // długość komory elektroniki
in_h    = under_clear + pcb_t + above_clear;   // wysokość wnętrza
div_tot = therm_gap > 0 ? 2*div_t + therm_gap : div_t;

L  = 2*wall + el_len + div_tot + sens_len;     // długość zewnętrzna
W  = in_w + 2*wall;                            // szerokość zewnętrzna
Hb = floor_t + in_h;                           // wysokość podstawy
H  = Hb + lid_t;                               // wysokość całkowita

x_d1 = wall + el_len;       // przegroda od strony elektroniki
x_s0 = x_d1 + div_tot;      // początek komory czujnika
x_s1 = x_s0 + sens_len;     // koniec komory czujnika
yc   = W/2;

r_in    = max(corner_r - wall, 0.4);
pcb_x0  = wall + gap_usb;
pcb_y0  = wall + gap_side;
pcb_z0  = floor_t + under_clear;   // spód laminatu
div_top = Hb - lip_h - 0.2;        // góra przegrody w podstawie (wyżej są żebra pokrywy)
lip_in  = wall + fit + lip_t;      // wewnętrzna krawędź kołnierza
zg      = Hb - lip_h/2;            // wysokość zatrzasków

holes = [for (i = [0, 1], j = [0, 1])
         [pcb_x0 + (pcb_l - hole_dx)/2 + i*hole_dx,
          pcb_y0 + (pcb_w - hole_dy)/2 + j*hole_dy]];

// --- czujnik (układ L: płytka pionowo, wtyczka poziomo) ---
screw_s  = sensor_mount == "screw";
hl       = 12.5;                              // długość wtyczki dupont (model poglądowy)
pin_z    = floor_t + plug_ped + plug_h/2;     // oś rzędu pinów = oś wtyczki
s_hz     = pin_z + sens_pin_hole;             // oś otworów montażowych
s_hys    = [yc - sens_hole_dx/2, yc + sens_hole_dx/2];
s_back   = screw_s ? x_s1 - sens_gap - sens_t // tył płytki (strona z wtyczką)
                   : x_s0 + 5.5 + hl + 2.5;
s_face   = s_back + sens_t;                   // strona z układem BME280
plug_end = s_back - 2.5 - hl;                 // koniec wtyczki, z którego wychodzą kable

// ramka do przykręcenia czujnika: dwie nóżki omijające wtyczkę + poprzeczka
fr_t   = 5;                 // grubość (X)
fr_leg = 2.4;               // grubość nóżki (Y)
fr_in  = plug_w/2 + 0.6;    // wewnętrzna krawędź nóżki od osi
fr_h   = 7;                 // wysokość poprzeczki
ped_x0 = s_back - 13.5;     // podest pod wtyczką
ped_x1 = s_back - 1;

// kołyska (sensor_mount = "cradle")
holddown  = !screw_s && plug_holddown;
rail_t    = 1.2;
cradle_iw = plug_w + 0.4;
plug_z    = floor_t + plug_ped;               // spód wtyczki
post_x    = x_s0 + cradle_x + cradle_len/2;

echo(str("Obudowa zewn.: ", L, " x ", W, " x ", H, " mm  (dł. x szer. x wys.)"));
if (screw_s)
    echo(str("Czujnik: otwory montażowe ", s_hz, " mm nad spodem obudowy, ",
             "rozstaw ", sens_hole_dx, " mm; wkręty M2.5x6 przez okienko w ścianie końcowej"));

// ---------------------------------------------------------------------
//  Pomocnicze kształty 2D
// ---------------------------------------------------------------------
module rrect(s, r) {
    if (r > 0) translate([r, r]) offset(r = r) square([s[0] - 2*r, s[1] - 2*r]);
    else square(s);
}

// szczelina wzdłuż +Y (0..len), wyśrodkowana w X
module stadium(len, w) {
    hull() {
        translate([0, w/2]) circle(d = w);
        translate([0, len - w/2]) circle(d = w);
    }
}

// rząd szczelin pionowych (wzdłuż Y) w prostokącie w x h
module slot_row(w, h, m = 0) {
    n  = floor((w - 2*m - slot_w) / slot_pitch);
    ox = (w - n*slot_pitch) / 2;
    if (n >= 0) for (i = [0:n]) translate([ox + i*slot_pitch, m]) stadium(h - 2*m, slot_w);
}

// pojedyncze oczko ażuru; heksagon "ostrzem do góry" drukuje się bez podpór
module cell() {
    if (hole_shape == "hex") rotate(30) circle(r = hole_size/sqrt(3), $fn = 6);
    else circle(d = hole_size, $fn = 24);
}

function hit(cx, cy, rx, ry, ex) =
    len([for (e = ex) if (cx + rx > e[0] && cx - rx < e[2] &&
                          cy + ry > e[1] && cy - ry < e[3]) 1]) > 0;
function hitc(cx, cy, rr, ec) =
    len([for (c = ec) if (norm([cx - c[0], cy - c[1]]) < c[2] + rr) 1]) > 0;
// odległość punktu p od odcinka a-b
function seg_dist(p, a, b) =
    let(ab = b - a, t = max(0, min(1, ((p - a)*ab) / (ab*ab)))) norm(p - (a + t*ab));
function hits(cx, cy, rr, es) =
    len([for (s = es) if (seg_dist([cx, cy], [s[0], s[1]], [s[2], s[3]]) < s[4] + rr) 1]) > 0;

// siatka oczek (plaster miodu) mieszcząca się w prostokącie w x h z marginesem m;
// bez otworów w miejscach: ex = prostokąty [x0,y0,x1,y1], ec = koła [x,y,r],
// es = podłużne otwory [x0,y0,x1,y1,r] (odcinek + promień)
module cell_grid(w, h, m = 1.2, ex = [], ec = [], es = []) {
    f  = hole_size;
    hh = hole_shape == "hex" ? 2*hole_size/sqrt(3) : hole_size;
    px = f + hole_web;
    py = px*sqrt(3)/2;
    nx = floor((w - 2*m - f) / px);
    ny = floor((h - 2*m - hh) / py);
    ox = (w - nx*px) / 2;
    oy = (h - ny*py) / 2;
    if (nx >= 0 && ny >= 0)
        for (j = [0:ny], i = [0:nx]) {
            cx = ox + i*px + (j % 2)*px/2;
            cy = oy + j*py;
            if (cx + f/2 <= w - m + eps &&
                !hit(cx, cy, f/2 + hole_web/2, hh/2 + hole_web/2, ex) &&
                !hitc(cx, cy, hh/2, ec) && !hits(cx, cy, hh/2, es))
                translate([cx, cy]) cell();
        }
}

// ---------------------------------------------------------------------
//  Przenoszenie wzorów 2D na ściany (narzędzia do wycinania)
// ---------------------------------------------------------------------
// ściana przednia i tylna: 2D (u,v) -> (x0+u, z0+v)
module through_long_walls(x0, z0) {
    for (y = [wall + 1, W + 1])
        translate([x0, y, z0]) rotate([90, 0, 0]) linear_extrude(wall + 2) children();
}
// ściana czołowa (x = 0 lub x = L): 2D (u,v) -> (y0+u, z0+v)
module through_end_wall(xw, y0, z0) {
    translate([xw - 1, y0, z0]) rotate([90, 0, 90]) linear_extrude(wall + 2) children();
}

// trójkątny ząbek wzdłuż X (0..len), wystaje w -Y, symetryczny względem z = 0
module ridge(len, h) {
    rotate([0, 90, 0]) linear_extrude(len) polygon([[h, 0], [-h, 0], [0, -h]]);
}
// to samo po stronie tylnej (lustro względem środka szerokości)
module both_sides() {
    children();
    translate([0, W, 0]) mirror([0, 1, 0]) children();
}

// okienko w ścianie końcowej na śrubokręt (przed układem BME280)
module sensor_window_2d() {
    hull() for (y = s_hys) translate([y, s_hz]) circle(d = win_h);
}

// ---------------------------------------------------------------------
//  PODSTAWA
// ---------------------------------------------------------------------
module base() {
    difference() {
        union() {
            difference() {
                // bryła z fazką 0.4 mm przy stole (kompensacja "stopy słonia")
                hull() {
                    translate([0.4, 0.4, 0]) linear_extrude(eps) rrect([L - 0.8, W - 0.8], corner_r - 0.4);
                    translate([0, 0, 0.4]) linear_extrude(Hb - 0.4) rrect([L, W], corner_r);
                }
                // komora elektroniki
                translate([wall, wall, floor_t]) linear_extrude(Hb) rrect([el_len, in_w], r_in);
                // komora czujnika
                translate([x_s0, wall, floor_t]) linear_extrude(Hb) rrect([sens_len, in_w], r_in);
                // szczelina termiczna między ściankami przegrody
                if (therm_gap > 0)
                    translate([x_d1 + div_t, wall, floor_t]) cube([therm_gap, in_w, Hb]);
                // nad przegrodą wspólna wnęka na kołnierz pokrywy
                translate([wall, wall, div_top]) linear_extrude(Hb) rrect([L - 2*wall, in_w], r_in);
            }
            // dystanse pod NodeMCU
            for (h = holes) translate([h[0], h[1], floor_t - eps]) {
                cylinder(d1 = standoff_d + 2, d2 = standoff_d, h = 1);
                cylinder(d = standoff_d, h = under_clear + eps);
                if (board_fix == "peg") translate([0, 0, under_clear]) {
                    cylinder(d = peg_d, h = pcb_t + 0.7);
                    translate([0, 0, pcb_t + 0.7 - eps])
                        cylinder(d1 = peg_d, d2 = peg_d - 0.8, h = 0.5);
                }
            }
            if (screw_s) {
                // ramka za płytką czujnika: nóżki po bokach wtyczki + poprzeczka z otworami
                for (s = [-1, 1])
                    translate([s_back - fr_t, s > 0 ? yc + fr_in : yc - fr_in - fr_leg, floor_t - eps])
                        cube([fr_t, fr_leg, s_hz + fr_h/2 - floor_t + eps]);
                translate([s_back - fr_t, yc - fr_in - fr_leg, s_hz - fr_h/2])
                    cube([fr_t, 2*(fr_in + fr_leg), fr_h]);
                // podest pod wtyczką (podpiera ją, nie ustala położenia płytki)
                translate([ped_x0, yc - plug_w/2, 0])
                    cube([ped_x1 - ped_x0, plug_w, floor_t + plug_ped - 0.3]);
            } else {
                // kołyska wtyczki czujnika: podest + dwie prowadnice
                translate([x_s0 + cradle_x, yc - cradle_iw/2 - rail_t, 0])
                    cube([cradle_len, cradle_iw + 2*rail_t, plug_z]);
                for (s = [-1, 1])
                    translate([x_s0 + cradle_x, yc + s*(cradle_iw + rail_t)/2 - rail_t/2, 0])
                        cube([cradle_len, rail_t, plug_z + plug_h + 0.6]);
            }
        }

        // otwory pod wkręty NodeMCU
        if (board_fix == "screw")
            for (h = holes) translate([h[0], h[1], 0.8]) cylinder(d = pilot_d, h = Hb);
        // otwory pod wkręty czujnika (poziomo, w poprzeczce ramki)
        if (screw_s)
            for (y = s_hys) translate([s_back - fr_t - 1, y, s_hz]) rotate([0, 90, 0])
                cylinder(d = sens_pilot_d, h = fr_t + 2);

        // USB-C (z fazką od zewnątrz)
        usb_cut();

        // przepust na kable w przegrodzie (zamykany od góry żebrem pokrywy)
        translate([x_d1 - 1, yc - wire_w/2, div_top - wire_d])
            rotate([90, 0, 90]) linear_extrude(div_tot + 2) rrect([wire_w, wire_d + 3], 1.5);

        // szczelina termiczna otwarta w dnie (komin)
        if (therm_gap > 0)
            translate([x_d1 + div_t, wall + 1.5, -1]) cube([therm_gap, in_w - 3, floor_t + 2]);

        // ELEKTRONIKA: pionowe szczeliny w ścianie przedniej i tylnej
        through_long_walls(wall + 3, floor_t + 1.5)
            slot_row(x_d1 - 2 - (wall + 3), div_top - 1.5 - (floor_t + 1.5));

        // ELEKTRONIKA: podłużne szczeliny w dnie pod płytką
        if (floor_slots)
            for (k = [-2:2])
                translate([pcb_x0 + 9, yc + k*slot_pitch, -1])
                    rotate(-90) linear_extrude(floor_t + 2) stadium(pcb_l - 17, slot_w);

        // otworki pod RST / FLASH
        if (button_holes)
            for (yb = [7, pcb_w - 7])
                translate([pcb_x0 + 2.5, pcb_y0 + yb, -1]) cylinder(d = 2.5, h = floor_t + 2);

        // CZUJNIK: ażur w ścianach bocznych
        through_long_walls(x_s0, floor_t) cell_grid(sens_len, div_top - floor_t);
        // ... w ścianie końcowej (+ okienko na śrubokręt przed układem)
        through_end_wall(L - wall, wall, floor_t)
            cell_grid(in_w, div_top - floor_t, 1.2, [], [],
                      screw_s ? [[s_hys[0] - wall, s_hz - floor_t, s_hys[1] - wall, s_hz - floor_t,
                                  win_h/2 + 0.8]] : []);
        if (screw_s) through_end_wall(L - wall, 0, 0) sensor_window_2d();
        // ... i w dnie (bez oczek pod ramką i podestem / pod kołyską)
        translate([x_s0, wall, -1]) linear_extrude(floor_t + 2)
            if (screw_s)
                cell_grid(sens_len, in_w, 1.2,
                          [[ped_x0 - x_s0 - 0.5, yc - fr_in - fr_leg - wall - 0.5,
                            s_back - x_s0 + 0.5, yc + fr_in + fr_leg - wall + 0.5]]);
            else
                cell_grid(sens_len, in_w, 1.2,
                          [[cradle_x - 0.5, in_w/2 - cradle_iw/2 - rail_t - 0.5,
                            cradle_x + cradle_len + 0.5, in_w/2 + cradle_iw/2 + rail_t + 0.5]]);

        // rowek zatrzasku wzdłuż ścian bocznych
        if (snap > 0)
            both_sides() translate([wall, wall, zg]) ridge(L - 2*wall, snap + 0.1);

        // fazka wejścia pokrywy
        translate([0, 0, Hb - 0.5]) hull() {
            translate([wall, wall, 0]) linear_extrude(eps) rrect([L - 2*wall, in_w], r_in);
            translate([wall - 0.5, wall - 0.5, 0.5]) linear_extrude(0.1)
                rrect([L - 2*wall + 1, in_w + 1], r_in + 0.5);
        }

        // wcięcia do podważenia pokrywy (oba końce)
        for (xx = [-1, L - wall/2])
            translate([xx, yc - 4, Hb - 1]) cube([wall/2 + 1, 8, 2]);
    }
}

module usb_cut() {
    zc = pcb_z0 + usb_z;
    y0 = pcb_y0 + pcb_w/2 + usb_y - usb_w/2;
    through_end_wall(0, y0, zc - usb_h/2) rrect([usb_w, usb_h], 1.5);
    hull() {
        translate([-eps, y0 - 0.6, zc - usb_h/2 - 0.6]) rotate([90, 0, 90])
            linear_extrude(eps) rrect([usb_w + 1.2, usb_h + 1.2], 2.1);
        translate([0.6, y0, zc - usb_h/2]) rotate([90, 0, 90])
            linear_extrude(eps) rrect([usb_w, usb_h], 1.5);
    }
}

// ---------------------------------------------------------------------
//  POKRYWA (w położeniu złożonym)
// ---------------------------------------------------------------------
module lid() {
    rib_xs = therm_gap > 0 ? [x_d1, x_s0 - div_t] : [x_d1];
    pin_holddown = board_fix == "peg";
    // zakres szczelin nad elektroniką (omija dociski, jeśli są)
    ex0 = pin_holddown ? holes[0][0] + 4 : wall + 6;
    ex1 = pin_holddown ? holes[3][0] - 4 : x_d1 - 4;

    difference() {
        union() {
            // płyta z fazką 0.6 mm na górnej krawędzi
            hull() {
                translate([0, 0, Hb]) linear_extrude(lid_t - 0.6) rrect([L, W], corner_r);
                translate([0.6, 0.6, Hb]) linear_extrude(lid_t) rrect([L - 1.2, W - 1.2], corner_r - 0.6);
            }
            // kołnierz wchodzący w podstawę
            translate([0, 0, Hb - lip_h]) linear_extrude(lip_h + eps) difference() {
                translate([wall + fit, wall + fit])
                    rrect([L - 2*(wall + fit), W - 2*(wall + fit)], max(r_in - fit, 0.3));
                translate([lip_in, lip_in]) square([L - 2*lip_in, W - 2*lip_in]);
            }
            // żebra domykające przegrodę i przepust kabli
            for (x = rib_xs)
                translate([x, wall + fit, Hb - lip_h]) cube([div_t, in_w - 2*fit, lip_h + eps]);
            // ząbki zatrzasków: środek komory elektroniki i komory czujnika
            if (snap > 0)
                for (xc = [(wall + x_d1)/2, (x_s0 + x_s1)/2])
                    both_sides() translate([xc - snap_len/2, wall + fit, zg]) ridge(snap_len, snap);
            // słupek dociskający wtyczkę czujnika (tylko wersja z kołyską)
            if (holddown)
                translate([post_x, yc, plug_z + plug_h + 0.3])
                    cylinder(d = 4, h = Hb - (plug_z + plug_h + 0.3) + eps);
            // dociski płytki (tylko przy mocowaniu na kołki)
            if (pin_holddown)
                for (h = holes) translate([h[0], h[1], pcb_z0 + pcb_t + 0.3]) difference() {
                    cylinder(d = 5, h = Hb - (pcb_z0 + pcb_t + 0.3) + eps);
                    translate([0, 0, -1]) cylinder(d = peg_d + 0.8, h = 2.5);
                }
        }
        // szczeliny nad elektroniką (poprzeczne)
        translate([ex0, lip_in + 1.5, Hb - 1]) linear_extrude(lid_t + 2)
            slot_row(ex1 - ex0, W - 2*lip_in - 3);
        // szczelina termiczna otwarta w pokrywie
        if (therm_gap > 0)
            translate([x_d1 + div_t, lip_in + 1, Hb - 1]) cube([therm_gap, W - 2*lip_in - 2, lid_t + 2]);
        // ażur nad czujnikiem
        translate([x_s0, lip_in, Hb - 1]) linear_extrude(lid_t + 2)
            cell_grid(x_s1 - fit - lip_t - x_s0, W - 2*lip_in, 1.2, [],
                      holddown ? [[post_x - x_s0, yc - lip_in, 2 + 0.8]] : []);
    }
}

// pokrywa obrócona do druku (góra na stole)
module lid_print() {
    translate([0, W, Hb + lid_t]) rotate([180, 0, 0]) lid();
}

// ---------------------------------------------------------------------
//  Modele poglądowe płytek i kabli (tylko podgląd, nie drukować)
// ---------------------------------------------------------------------
pin_x0 = (pcb_l - 14*2.54) / 2;
row_y  = [(pcb_w - 27.94)/2, pcb_w - (pcb_w - 27.94)/2];
// piny z wtyczkami (współrzędne płytki: x od krawędzi z USB)
dup = [[pin_x0 + 13*2.54, row_y[1]], [pin_x0 + 12*2.54, row_y[1]],
       [pin_x0 + 9*2.54,  row_y[1]], [pin_x0 + 8*2.54,  row_y[1]],
       [pin_x0 + 5*2.54,  row_y[0]], [pin_x0 + 4*2.54,  row_y[0]]];
dup_top = pcb_z0 + pcb_t + 2.5 + 12;

module nodemcu_ghost() {
    translate([pcb_x0, pcb_y0, pcb_z0]) {
        color([0.13, 0.13, 0.14]) difference() {
            cube([pcb_l, pcb_w, pcb_t]);
            for (i = [0, 1], j = [0, 1])
                translate([(pcb_l - hole_dx)/2 + i*hole_dx, (pcb_w - hole_dy)/2 + j*hole_dy, -1])
                    cylinder(d = 3, h = pcb_t + 2);
        }
        // od spodu: ESP-12 przy końcu dalszym od USB
        color([0.78, 0.78, 0.8]) translate([pcb_l - 24, (pcb_w - 16)/2, -3.2]) cube([24, 16, 3.2]);
        // gniazdo USB-C
        color([0.85, 0.85, 0.87]) translate([-0.2, pcb_w/2 + usb_y - 4.47, usb_z - 1.63])
            cube([7.35, 8.94, 3.26]);
        // RST / FLASH
        for (yb = [7, pcb_w - 7]) color([0.9, 0.9, 0.9]) translate([0.8, yb - 1.4, -2]) cube([3.5, 2.8, 2]);
        // CH340C, AMS1117
        color([0.05, 0.05, 0.05]) translate([8, pcb_w/2 - 3, -1.7]) cube([7, 6, 1.7]);
        color([0.05, 0.05, 0.05]) translate([21, pcb_w/2 - 3.5, -1.7]) cube([6.5, 7, 1.7]);
        // goldpiny od góry
        for (y = row_y, i = [0:14]) translate([pin_x0 + i*2.54, y, pcb_t]) {
            color([0.1, 0.1, 0.1]) translate([-1.27, -1.27, 0]) cube([2.54, 2.54, 2.5]);
            color([0.9, 0.75, 0.3]) translate([-0.32, -0.32, 0]) cube([0.64, 0.64, 8.5]);
        }
        // wtyczki dupont
        for (p = dup) color([0.07, 0.07, 0.07]) translate([p[0] - 1.27, p[1] - 1.27, pcb_t + 2.5])
            cube([2.54, 2.54, 12]);
    }
}

// czujnik w układzie L: płytka pionowo, listwa + wtyczka poziomo w stronę przegrody
module bme_ghost() {
    color([0.36, 0.16, 0.55]) difference() {
        translate([s_back, yc - sens_w/2, pin_z - 1.3]) cube([sens_t, sens_w, sens_d]);
        for (y = s_hys) translate([s_back - 1, y, s_hz]) rotate([0, 90, 0]) cylinder(d = 3, h = sens_t + 2);
    }
    // układ BME280 między otworami, od strony ściany końcowej
    color([0.82, 0.82, 0.84]) translate([s_face, yc - 1.25, s_hz - 1.25]) cube([0.93, 2.5, 2.5]);
    // końcówki pinów
    for (i = [0:5]) color([0.85, 0.85, 0.85])
        translate([s_face, yc - 6.35 + i*2.54 - 0.32, pin_z - 0.32]) cube([1.8, 0.64, 0.64]);
    // listwa goldpin + wtyczka dupont 1x6
    color([0.12, 0.12, 0.12]) translate([s_back - 2.5, yc - plug_w/2, pin_z - plug_h/2]) cube([2.5, plug_w, plug_h]);
    color([0.07, 0.07, 0.07]) translate([plug_end, yc - plug_w/2, pin_z - plug_h/2]) cube([hl, plug_w, plug_h]);
    // łebki wkrętów
    if (screw_s)
        for (y = s_hys) color([0.6, 0.6, 0.65]) translate([s_face, y, s_hz]) rotate([0, 90, 0])
            cylinder(d = 4.5, h = 1.7);
}

wire_cols = [[0.55, 0.3, 0.2], [0.1, 0.1, 0.1], [0.95, 0.95, 0.95],
             [0.55, 0.55, 0.55], [0.75, 0.1, 0.4], [0.1, 0.35, 0.85]];

module wire(pts, d = 1.3) {
    for (k = [0:len(pts) - 2])
        hull() { translate(pts[k]) sphere(d = d, $fn = 10); translate(pts[k + 1]) sphere(d = d, $fn = 10); }
}

// kable: z wtyczki czujnika do przegrody, w górę, przez przepust, górą do pinów NodeMCU
module wires_ghost() {
    zw = div_top - wire_d + 1.5;
    for (i = [0:5]) {
        t  = dup[i];
        tx = pcb_x0 + t[0];
        ty = pcb_y0 + t[1];
        yn = yc - 3.5 + i*1.4;
        color(wire_cols[i]) wire([
            [plug_end + 0.5, yc - 6.35 + i*2.54, pin_z],
            [plug_end - 2.5, yc - 5 + i*2, pin_z + 1.5],
            [x_s0 + 1.2, yn, pin_z + 6],
            [x_s0 + 1.2, yn, zw],
            [x_d1 - 2, yn, zw],
            [tx + (tx < x_d1 - 8 ? 3 : 1.5), ty + (ty > yc ? -1.5 : 1.5), dup_top + 1.2],
            [tx, ty, dup_top + 0.5],
            [tx, ty, dup_top - 0.5]]);
    }
}

module models() { nodemcu_ghost(); bme_ghost(); wires_ghost(); }

// ---------------------------------------------------------------------
//  Wybór części / podgląd
// ---------------------------------------------------------------------
module enclosure(lift = 0) {
    color([0.93, 0.93, 0.9]) base();
    color([0.62, 0.78, 0.93]) translate([0, 0, lift]) lid();
}
module scene(lift = 0, cut = false) {
    if (cut) difference() {     // przekrój: odcięta przednia połowa obudowy
        enclosure(lift);
        translate([-1, -1, -1]) cube([L + 2, yc + 1, H + 60]);
    }
    else enclosure(lift);
    if (show_pcb) %models();    // tło: widoczne w F5, pomijane w F6 i w STL
}

if (part == "print")         { base(); translate([0, -W - 6, 0]) lid_print(); }
else if (part == "base")     base();
else if (part == "lid")      lid_print();
else if (part == "assembly") scene();
else if (part == "exploded") scene(32);
else if (part == "section")  scene(0, true);
