# Marathon to Athens – 42bit Run

A neon 3D runner in the browser along the Athens Authentic Marathon course.
Current stage: the last 2 km, from Vasilissis Sofias down Irodou Attikou to the
finish inside the Panathenaic Stadium.

## Play

Open `index.html` in a browser (it loads Three.js r128 from cdnjs).

- Phone: swipe left/right to change lane, swipe up or tap to jump, swipe down to slide
- Keyboard: `A`/`D` lanes, `Space` jump, `S` slide
- Day or night: the button on the start screen and in the game, or `N` while running

## What is real and what is not

- **Course:** real. `data/course-last-2km.json` holds the smoothed last 2 km of a
  2019 race GPS track, in local metres (east, north) relative to the end of the track.
- **Building footprints and positions:** real, from OpenStreetMap
  (`data/osm-last-2km.json`, buildings within 110 m of the course). They are embedded
  in `index.html` as `OSM_B`.
- **Building heights:** real for the 43 buildings that carry a height or levels tag
  in OSM; the rest get a default between 13 and 25 m.
- **Left out:** 13 footprints that the GPS track clips (the track wanders a few
  metres off the road centre), so the road stays clear.
- **Hand-built:** the Panathenaic Stadium stands, the National Garden trees, the
  Parliament, the Discobolus statue and the distant hills. Facades are drawn
  textures (apartment blocks with balconies and awnings, glass offices, neoclassical
  fronts) assigned by height and position, not the real facade of each building.

## Refreshing the map data

`scripts/fetch_osm.sh` downloads a slightly wider rectangle around the course.
The committed extract was taken with a route-hugging query (110 m around the track).

## Credits

Map data © OpenStreetMap contributors (ODbL).
