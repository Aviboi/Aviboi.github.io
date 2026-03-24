// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Avram Dreyer",
  title: "Avram Dreyer - CV",
  footer: context { [#emph[Avram Dreyer -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Mar 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "us-letter",
  page-top-margin: 2cm,
  page-bottom-margin: 2cm,
  page-left-margin: 2cm,
  page-right-margin: 2cm,
  page-show-footer: false,
  page-show-top-note: false,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 0, 0),
  colors-headline: rgb(0, 0, 0),
  colors-connections: rgb(0, 0, 0),
  colors-section-titles: rgb(0, 0, 0),
  colors-links: rgb(0, 0, 0),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "XCharter",
  typography-font-family-name: "XCharter",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "XCharter",
  typography-font-family-section-titles: "XCharter",
  typography-font-size-body: 10pt,
  typography-font-size-name: 25pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.2em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: true,
  links-show-external-link-icon: false,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: false,
  header-connections-display-urls-instead-of-usernames: true,
  header-connections-separator: "|",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.55cm,
  section-titles-space-below: 0.3cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.15cm,
  sections-space-between-regular-entries: 0.42cm,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: true,
  entries-short-second-row: false,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "-" ,
  entries-highlights-space-left: 0cm,
  entries-highlights-space-above: 0.25cm,
  entries-highlights-space-between-items: 0.19cm,
  entries-highlights-space-between-bullet-and-text: 0.3em,
  date: datetime(
    year: 2026,
    month: 3,
    day: 24,
  ),
)


= Avram Dreyer

#connections(
  [#link("mailto:ajd335@cornell.edu", icon: false, if-underline: false, if-color: false)[ajd335\@cornell.edu]],
  [#link("tel:+1-201-898-9735", icon: false, if-underline: false, if-color: false)[(201) 898-9735]],
  [#link("https://avramdreyer.com/", icon: false, if-underline: false, if-color: false)[avramdreyer.com]],
)


== Education

#education-entry(
  [
    #strong[Cornell University], BS in Mechanical Engineering -- Ithaca, NY

  ],
  [
    #strong[Aug 2025 – May 2029]

  ],
  main-column-second-row: [
    - #strong[GPA: 4.06\/4.3;] ASME, Cornell Astronomical Society, Amateur Radio Club, Cornell Maker Club

    - #strong[#emph[Relevant Coursework:]] Statics, Differential Equations, Intro to Computing, Intro to Lasers and Photonics

  ],
)

#education-entry(
  [
    #strong[Bergen County Technical High School], Diploma in Engineering -- Teterboro, NJ

  ],
  [
    #strong[Sept 2020 – June 2025]

  ],
  main-column-second-row: [
    - #strong[GPA: 3.99\/4.0;] National Honor Society, High Honor Roll, Departmental Award for Physics

  ],
)

== Projects

#regular-entry(
  [
    #strong[Satellite Thermal Heatsink] -- #strong[Houston, TX]

  ],
  [
    #strong[Sept 2024 – Apr 2025]

  ],
  main-column-second-row: [
    - Collaborated to design and build a novel thermal management system for a 1U CubeSat satellite.

    - Designed in Fusion360 and thermal analysis with ANSYS Mechanical. Fabricated out of custom copper.

    - Selected as one of five finalist teams in the nation for the NASA HUNCH space hardware design competition.

    - Presented at Johnson Space Center to NASA engineers for potential implementation in flight hardware.

  ],
)

== Technical Experience

#regular-entry(
  [
    #strong[Mechanical Subteam Member], #strong[Cornell Autonomous Sailboat Team] -- Ithaca, NY

  ],
  [
    #strong[Feb 2026 – present]

  ],
  main-column-second-row: [
    #summary[Student Project Team at Cornell University competing in the SailBot International Robotic Sailing Regatta (IRSR)]

    - Fabricated a five foot long hull using a fiberglass and resin composite layup.

    - Designed and built sail rigging using Solidworks and 3D printed PLA.

  ],
)

#regular-entry(
  [
    #strong[Sailing and STEM Instructor], #strong[Camp Wigwam For Boys] -- Waterford, ME

  ],
  [
    #strong[June 2025 – Aug 2025]

  ],
  main-column-second-row: [
    - Led and mentored a bunk of campers while managing an activity area.

    - Educated kids in model rocketry and other STEM projects.

    - Assisted in the successful construction and launch of a high-powered I-engine model rocket.

  ],
)

== Research Experience

#regular-entry(
  [
    #strong[ZT Group], #strong[Cornell University] -- Ithaca, NY

  ],
  [
    #strong[Mar 2026 – present]

  ],
  main-column-second-row: [
    #summary[Undergraduate Researcher]

    - Research group at Cornell University led by Professor Zhiting Tian, studying nanoscale thermal transport techniques.

    - Investigated the use of nanoscale thermal switches with applications in semiconductor electronics and aerospace.

  ],
)

#regular-entry(
  [
    #strong[Parziale Group], #strong[Stevens Institute of Technology] -- Hoboken, NJ

  ],
  [
    #strong[Sept 2024 – June 2025]

  ],
  main-column-second-row: [
    #summary[Research Intern]

    - Research group at Stevens Institute of Technology studying hypersonic fluid flow at speeds above Mach 5.

    - Interned under Professor Nicholaus Parziale's research group, conducting hypersonic fluid dynamics research.

    - Studied hypersonic boundary layers using Krypton Tagging Velocimetry (KTV) in the Stevens Shock Tunnel.

    - Contributed to graduate-level fluid dynamics research for the US Navy Office of Naval Research (ONR).

  ],
)

== Skills and Interests

#strong[Technologies:] Python, Autodesk Fusion 360, Autodesk Inventor, MATLAB, ANSYS Mechanical, Arduino

#strong[Skills:] Soldering, Digital Electronics, Numerical Simulation, 3D Design

#strong[Interests:] Hiking, Electronic Music, Climbing, Reading
