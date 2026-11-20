# Marathon to Athens – 42bit Run

A 3D runner in the browser along the Athens Authentic Marathon course, from the
start in Marathon to the finish inside the Panathenaic Stadium.

Play it: https://angelopoulosk.github.io/marathon-to-athens-42bit-run/

## Modes

- **From Marathon (42 km):** the whole course with its real elevation profile. You can
  start at km 0, 5, 10, 15, 20, 25, 30 or 35.
- **Last 2 km:** Vasilissis Sofias, Irodou Attikou and the stadium, with real buildings.

## Controls

- Phone: swipe left/right to change lane, swipe up or tap to jump, swipe down to slide,
  hold the ⚡ button to boost
- Keyboard: `A`/`D` lanes, `Space` jump, `S` slide, hold `Shift` (or `B`) to boost
- Day or night: the button on the start screen and in the game, or `N` while running

Uphill slows you down and downhill speeds you up. Boost multiplies your speed and
smashes through barriers, banners and water stations while its bar lasts; wreaths
refill it. The strip under the bars is the elevation profile with your position.

## What is real and what is not

- **Course and elevation:** real. The route and altitude come from a 2019 race GPS
  track, smoothed, as control points every 20 m embedded in `index.html` (`CPX`, `CPY`,
  `CPE`). `data/course-last-2km.json` holds the last 2 km separately. Heights are drawn
  at true scale, with no exaggeration.
- **Last 2 km, building footprints and positions:** real, from OpenStreetMap
  (`data/osm-last-2km.json`, buildings within 110 m of the course), embedded as `OSM_B`.
- **Last 2 km, building heights:** real for the 43 buildings that carry a height or
  levels tag in OSM; the rest get a default between 13 and 25 m. 13 footprints that the
  GPS track clips are left out so the road stays clear.
- **Km 0 to 40:** the buildings, trees and spectators are generated, with density
  that follows the towns along the way (Nea Makri, Pikermi, Pallini, Gerakas, Agia
  Paraskevi, Mesogeion Avenue). They are not the real buildings. Town names appear at
  approximate kilometres.
- **Ground:** only the road's own altitude is known, so the land beside it is drawn
  level with the road.
- **Hand-built:** the Panathenaic Stadium stands, the National Garden trees, the
  Parliament, the Discobolus statue and the distant hills. Facades are drawn textures
  assigned by height and position, not the real facade of each building.

## Refreshing the map data

`scripts/fetch_osm.sh` downloads a slightly wider rectangle around the last 2 km.
The committed extract was taken with a route-hugging query (110 m around the track).

## Credits

Map data © OpenStreetMap contributors (ODbL). 3D with three.js.
