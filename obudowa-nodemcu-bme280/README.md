# Obudowa: NodeMCU V3 (ESP8266, CH340C, USB-C) + GY-BME/P280

Parametryczna obudowa w OpenSCAD. Ma dwie komory oddzielone litą przegrodą:

- **elektronika**: podłużne szczeliny w ścianach, w pokrywie i w dnie, otwór na USB-C w ścianie czołowej,
- **czujnik**: ażur (plaster miodu albo okrągłe oczka) w obu ścianach bocznych, w ścianie końcowej, w pokrywie i w dnie.

![podgląd](img/podglad.png)

Wymiary zewnętrzne: **111 × 38 × 30,6 mm** (z kołnierzami do uchwytu u dołu podstawy: 119 mm).
Podstawa i pokrywa to razem ok. 29 cm³ materiału, a uchwyt ścienny ok. 24 cm³.

## Pliki

| plik | co to jest |
|---|---|
| `obudowa.scad` | model parametryczny; wszystkie wymiary są na górze pliku i w panelu Customizer |
| `stl/obudowa_podstawa.stl` | podstawa ułożona do druku (dnem do stołu) |
| `stl/obudowa_pokrywa.stl` | pokrywa ułożona do druku (górą do stołu) |
| `stl/obudowa_uchwyt_scienny.stl` | uchwyt ścienny ułożony do druku (płytą do stołu) |
| `img/` | rendery; `kable.png` to trasa kabli czujnika, `przykrecanie.png` przykręcanie czujnika, `uchwyt.png` uchwyt ścienny |

### Części w OpenSCAD

Po otwarciu `obudowa.scad` widać **podstawę i pokrywę ułożone do druku** (`part = "print"`).
Pojedynczą część wybierasz w zmiennej `part` (albo w panelu Customizer):

- `base` daje podstawę, `lid` pokrywę, `mount` uchwyt ścienny, a `print_all` wszystkie 3 części naraz.
  Potem **F6** (render) i **F7** (zapis STL).
- `wall` pokazuje obudowę wsuwaną w uchwyt na ścianie.
- `assembly`, `exploded` i `section` to tylko podgląd złożenia. Płytki i kable są w nim
  półprzezroczystym tłem, widocznym w F5. Do renderu F6 ani do pliku STL nie trafiają.

Pełny render F6 trwa kilkanaście sekund. Podgląd F5 przy tylu otworach czasem gubi część otworów,
a F6 zawsze liczy poprawnie.

## Najważniejsze założenia (sprawdź przed drukiem)

1. **NodeMCU leży elementami w dół** (ESP-12 i USB-C od spodu), pinami i kablami do góry,
   tak jak na zdjęciach. Stoi na 4 dystansach 6 mm, pod otworami w rozstawie 52 × 25 mm.
2. **USB-C**: otwór 13 × 7,5 mm mieści obudowę typowego wtyku. Jego środek leży
   1,6 mm pod spodem laminatu (`usb_z`), bo gniazdo SMD wysokości ok. 3,2 mm jest przylutowane od spodu.
   Jeśli wtyk Twojego kabla jest grubszy, zwiększ `usb_w` i `usb_h`.
3. **Nad laminatem jest 19 mm miejsca** (`above_clear`) na goldpiny, wtyczki dupont i zagięte kable,
   z zapasem. Jeśli pokrywa naciska na kable, zwiększ ten parametr.
4. **Czujnik stoi pionowo i razem z wtyczką tworzy literę L**, odwróconą: piny i wtyczka są u góry.
   - Układ BME280 patrzy na ażurową ścianę końcową (ok. 5,5 mm od niej).
   - Komora czujnika ma **40 mm**. Moduł z pinami i zagiętymi kablami (ok. 30 mm) mieści się
     z zapasem ok. 6 mm do przegrody. Sprawdziłem to na modelu.
   - Za płytką stoi niska ramka: dwie nóżki i poprzeczka z otworami w rozstawie **10 mm** (`sens_hole_dx`)
     oraz półka, na której płytka stoi dolną krawędzią. Wtyczka jest nad ramką,
     więc moduł z założoną wtyczką wkłada się po prostu od góry.
   - Wysokość otworów jest liczona od osi rzędu pinów: `sens_pin_hole` = 8,2 mm, ustalone ze zdjęcia.
     Półka jest 2,4 mm pod otworami (`sens_hole_e`). Zmierz oba wymiary na swojej płytce;
     luz w otworach czujnika wybacza ok. ±0,3 mm.
5. **Kable czujnika** wychodzą z wtyczki prosto w stronę przegrody, bo wtyczka leży na wysokości
   przepustu 10 × 4 mm u góry przegrody. Pokrywa domyka przepust żebrem.
   Dalej kable biegną górą komory elektroniki do pinów NodeMCU. Rysunek: `img/kable.png`.
6. **Przegroda** jest domyślnie podwójna. Między ściankami jest 3 mm szczeliny powietrznej,
   otwartej w dnie i w pokrywie, więc działa jak komin i ciepło z ESP uchodzi do góry.
   `therm_gap = 0` daje zwykłą pojedynczą litą ściankę, a obudowa skraca się o 5 mm.

Wersja bez wkrętów do czujnika (wtyczka w kołysce, dociskana słupkiem w pokrywie): `sensor_mount = "cradle"`.

## Druk

- PLA wystarczy do pomieszczeń; w słońcu lub przy grzejniku użyj PETG albo ASA.
- Warstwa 0,2 mm, 3 obrysy, wypełnienie 15–20 %, **bez podpór**. Oczka są sześciokątami
  „ostrzem do góry”, rowki zatrzasku i spód półki pod czujnik mają ścianki pod 45°,
  a poprzeczka ramki czujnika to krótki most (ok. 17 mm), więc nic nie wymaga podpór.
- Pokrywa trzyma się na kołnierzu i 4 ząbkach zatrzasku. Jeśli wchodzi za ciasno, zwiększ `fit` (np. 0.3)
  albo zmniejsz `snap` (np. 0.3). Przy obu końcach są wcięcia do podważenia pokrywy.

## Montaż

1. Przykręć NodeMCU 4 wkrętami **M2 × 6** samogwintującymi (`pilot_d = 1.7`).
   Otwory w płytce mają ok. 3 mm, a łeb M2 ok. 3,5–4 mm, więc najlepiej dać podkładkę M2
   albo wkręty z łbem z kołnierzem. Pod M2.5 ustaw `pilot_d = 2.2`, pod M3 `2.6`.
   Jeśli nie masz wkrętów, ustaw `board_fix = "peg"`:
   wtedy na dystansach są kołki, a pokrywa ma 4 dociski, które trzymają płytkę.
2. Nałóż wtyczkę na piny czujnika. Włóż czujnik od góry w szczelinę między ścianą końcową a ramką:
   pinami i wtyczką do góry, układem BME280 do ściany. Płytka staje dolną krawędzią na półce ramki,
   a wtyczka leży poziomo nad ramką.
3. Przytrzymaj płytkę palcem od góry. Przez okienko w ścianie końcowej wkręć 2 wkręty
   **M2 × 6** w poprzeczkę ramki (rysunek: `img/przykrecanie.png`):
   - nałóż wkręt na śrubokręt z magnesem (albo przyklej go odrobiną plasteliny),
   - wsuń śrubokręt z wkrętem w lewy albo prawy koniec okienka; okienko ma 6 mm wysokości,
     więc łebek przez nie przechodzi, a jego zaokrąglone końce są dokładnie na osi otworów,
   - wkręt przechodzi przez otwór w płytce i wkręca się w poprzeczkę; łebek dociska płytkę do uchwytu.

   Otwory w czujniku mają 3–3,5 mm, więc pod łeb wkrętu M2 daj **podkładkę M2**
   (albo użyj wkrętów z łbem z kołnierzem), żeby łeb nie przeszedł przez otwór.
   Pod M2.5 ustaw `sens_pilot_d = 2.2`, pod M3 `2.6`.
4. Poprowadź 6 przewodów z wtyczki prosto przez przepust w przegrodzie i podłącz je do pinów NodeMCU.
5. Przepust zatkaj kawałkiem pianki, plasteliny albo kroplą kleju na gorąco,
   żeby ciepłe powietrze nie przechodziło do komory czujnika.
6. Zatrzaśnij pokrywę. Przez otworki w dnie można spinaczem wcisnąć RST i FLASH.

## Uchwyt ścienny

![uchwyt](img/uchwyt.png)

- Obudowa wisi **poziomo, pokrywą do pokoju**. Na dole podstawy, przy obu końcach, są kołnierze
  ze skosem 45°. Kołnierze wsuwają się **od góry** w dwie prowadnice uchwytu na jaskółczy ogon.
  Na dole prowadnic są ograniczniki, na których obudowa stoi; żeby ją zdjąć, unosisz ją do góry.
- Prowadnice trzymają kołnierze od przodu, więc obudowa nie odchyli się od ściany.
  U góry wejście prowadnic jest rozszerzone, żeby łatwo trafić.
- Między dnem obudowy a ścianą zostaje **5 mm szczeliny** (`mnt_gap`). Otwory w dnie dalej działają,
  a chłodna albo ciepła ściana mniej wpływa na pomiar.
- **USB-C jest po lewej** (`usb_side = "left"`; dla prawej strony ustaw `"right"`).
  Prowadnica po stronie USB ma wycięcie, przez które przechodzi wtyk kabla.
- Uchwyt przykręcasz do ściany **2 wkrętami 3,5–4 mm** z kołkami, w rozstawie 70 mm (`screw_wall_dx`).
  Otwory są stożkowe, a łby chowają się za obudową.
- Druk: płytą do stołu, bez podpór. Jeśli obudowa wchodzi za ciasno, zwiększ `mnt_clear` (np. 0.35)
  i przedrukuj sam uchwyt.
- Jeśli nie chcesz kołnierzy na podstawie (obudowa tylko na półkę), ustaw `wall_mount = false`.

## Żeby odczyt temperatury był dokładny

- Nie ustawiaj obudowy tak, żeby komora czujnika była **nad** elektroniką, bo ciepło idzie do góry.
  W uchwycie ściennym obudowa wisi poziomo i ten warunek jest spełniony: ciepło z ESP uchodzi
  szczelinami w górnej ścianie, obok komory czujnika, a nie przez nią.
- Uchwyt najlepiej przykręcić na ścianie wewnętrznej, z dala od grzejnika, okna i słońca, ok. 1,5 m nad podłogą.
- Na półce małe gumowe nóżki pod spodem dają szczelinom w dnie i kominowi dopływ powietrza.
- W ESPHome odczyt co 60 s wystarczy (`update_interval: 60s`). BME280 pracuje wtedy w trybie wymuszonym
  i prawie się nie grzeje. Ewentualną stałą odchyłkę skoryguj filtrem `offset` po porównaniu z termometrem.
