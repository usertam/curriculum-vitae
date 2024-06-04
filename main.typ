#import "template.typ": *

#show: project.with(
  title: "Résumé",
  author: (
    name: "Samuel Tam",
    email: "hytamap@ust.hk",
    email-alt: "hello@usertam.dev",
    bio: "Penultimate Year in Computer Engineering.",
  ),
  links: (
    ("icons/linkedin.svg", "linkedin.com/in/usertam"),
    ("icons/github.svg", "github.com/usertam"),
  ),
)

#experience[Projects]

#gh_item(
  smallcaps("Résumé"),
  "Expressively written and typeset, readable like Markdown.",
  "May 2024",
  "usertam/resume"
)[
- This résumé is written in Typst, a declarative and markup-based domain-specific language.
- Built with Nix for reproducibility and custom fonts support.
]

#gh_item(
  smallcaps("Nixfiles"),
  "Write system configurations once, deploy anywhere.",
  "December 2023",
  "usertam/nixfiles"
)[
- Best-effort and continuous effort to ensure my development environment stays universal cross-platform.
- The declarative configuration covers trivial shell options, to host-specific patches and package overrides.
- Reproducibility, dependency management and hermetic builds are asserted by Nix and GitHub Actions.
]

#gh_item(
  smallcaps("Context–minimals"),
  "Typesetting system made reproducible.",
  "August 2022",
  "usertam/context-minimals"
)[
- We analyzed the dependency chain of the #ctx LMTX distribution, and re-implemented the install \ to lessen the maintenance, also to ensure reproducibility for every install and build.
]

#gh_item(
  smallcaps("Android Kernel Development"),
  ["What if you can run Docker on your arm64 phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
- With open-source tarballs and kernel trees released by vendors, we can cherry-pick, rework changes and \ rebuild the Android kernel, with custom configs (e.g. namespaces support) and Linux LTS patches.
]

#gh_item(
  smallcaps("Open-source contributions"),
  "Numerous contributions I authored over the years with Git.",
  smallcaps("Since 2020"),
  "pulls?q=is%3Apr+is%3Aclosed+author%3Ausertam", url_desc: "Pull requests"
)[]

#experience[Experience]

#item(
  [
    HKUST, Department of Computer Science and Engineering, \
    System and Network Administration Office
  ],
  "Student Helper",
  "July 2023 – Current",
  "Room 4202"
)[
- Maintained computer laboratories for all departmental students within the Academic Building.
- Provided technical support for server infrastructure, including the assembly of hardware components.
- Served as a liaison for confidential communications, facilitating secure delivery to the Admin Office.
]

#item(
  [
    HKUST, Center for Education Innovation, \
    Enrichment Program for Gifted Learners — Python for Everyone
  ],
  "Teaching Assistant",
  "July 2023",
  [Computer Barn A, Room 4402]
)[
- Provided technical support to the professor, delivering code concepts and debugging instructions.
- Contributed to curriculum development, i.e. revisions to improve accuracy of lecture materials.
- Evaluated student performance by assessing and providing feedback on exercises and final projects.
]

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Bachelor of Engineering in Computer Engineering",
  "July 2026",
  "Clear Water Bay, Kowloon"
)[
#course("COMP5214", "Spring 2024", "Advanced Deep Learning Architectures")
#course("COMP4901Y", "Spring 2024", "Large-Scale Machine Learning for Foundation Models")
#course("COMP3711", "Fall 2023", "Design and Analysis of Algorithms")
#course("COMP2012H", "Fall 2022", "Honors Object-Oriented Programming and Data Structures")
]

#item(
  "The University of Wollongong College Hong Kong",
  "Associate of Science in Information Systems Development, Distinction",
  "July 2022",
  "Tai Wai, New Territories"
)[
#course("AST21403", "Spring 2022", "Software Development Project")
#course("AST20203", "Spring 2022", "Internet Security")
#course("AST20401", "Fall 2021", "Database Systems and Design")
]
