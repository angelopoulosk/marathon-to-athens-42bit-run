# Marathon to Athens – 42bit Run

A neon 3D runner in the browser along the Athens Authentic Marathon course.
Current stage: the last 2 km, from Vasilissis Sofias down Irodou Attikou to the
finish inside the Panathenaic Stadium.

## Play

Open `index.html` in a browser (it loads Three.js r128 from cdnjs).

- Phone: swipe left/right to change lane, swipe up or tap to jump, swipe down to slide
- Keyboard: `A`/`D` lanes, `Space` jump, `S` slide

## What is real and what is not

- **Course:** real. `data/course-last-2km.json` holds the smoothed last 2 km of a
  2019 race GPS track, in local metres (east, north) relative to the end of the track.
- **Buildings:** placeholders. Random blocks and labelled boxes for landmarks.

## Next step: real buildings

`scripts/fetch_osm.sh` downloads the OpenStreetMap footprints for the corridor
into `data/osm-last-2km.json`. The game does not read that file yet.

## Credits

Map data © OpenStreetMap contributors (ODbL), once the OSM step is wired in.
