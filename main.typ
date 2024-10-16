#import "template.typ": *

#show: project.with(
  title: "Résumé",
  author: (
    name: "Samuel Tam",
    email: "hytamap@ust.hk",
    email-alt: "hello@usertam.dev",
    bio: "Final Year in Computer Engineering.",
  ),
  links: (
    ("icons/linkedin.svg", "https://linkedin.com/in/usertam"),
    ("icons/github.svg", "https://github.com/usertam"),
  ),
)

#experience[Projects]

#gh_item(
  "LLVM Toolchain",
  "Bleeding-edge LLVM toolchains for cross-compilation, optimized with PGO and LTO.",
  "June 2024",
  "usertam/toolchain"
)[
- Leveraging GitHub Actions along with automated scripts, we perform weekly builds against the LLVM #link("https://github.com/llvm/llvm-project", mono[master]). The build is then optimized, stripped and patched for portability across different environments.
]

#gh_item(
  "Context–minimals",
  "Typesetting system made reproducible.",
  "August 2022",
  "usertam/context-minimals"
)[
- After analyzing the dependencies of #ConTeXt LMTX (like #LaTeX, derived from #TeX), we rewrite the installation declaratively in #mono[nix]. This results in a far more efficient installation that is both reproducible and portable.
]

#gh_item(
  "Android Kernel Development",
  ["What if you can run #mono[dockerd] on your #mono[aarch64] phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
- With open-source kernel trees released by Qualcomm, we cherry-pick upstream changes and custom patches to rebuild the Android kernel, enabling support for custom kernel features (e.g. namespaces for containers).
]

#gh_item(
  "Open-Source contributions",
  [Numerous contributions I authored over the years with #mono[git].],
  smallcaps("Since 2020"),
  "pulls?q=author%3Ausertam",
  url_desc: "Pull requests"
)[
- Contributions include but not limited to #mono(link("https://gitlab.com/lilypond/", "GNU Lilypond")), #github("NixOS/nixpkgs"), #github("nix-community/nix-index"), #github("nix-community/nixos-generators"), #github("LnL7/nix-darwin"), #github("wolfcw/libfaketime"), #github("kovidgoyal/kitty").
]

#experience[Experience]

#item(
  "Department of Computer Science and Engineering, HKUST",
  "Undergraduate Representative",
  "September 2023 – Current",
  "Office, Room 3528"
)[
- Keynote Speaker of university credit-bearing seminars: #link("https://www.youtube.com/watch?v=53TWNe3_z38", mono[Developing with GitHub]) and #link("https://csess.su.hkust.edu.hk/activity/149", mono[The Unix Philosophy]).
- Co-host of the Departmental Briefing for Direct Entry Students in 2023, and again in 2024.
- Representative Speaker of CSE Program Orientation Talk in 2023.
- Advocating for students' interests and serving as a liaison to university administration.
]

#item(
  [System and Network Administration Office, \
    Department of Computer Science and Engineering, HKUST],
  "Student Intern",
  "July 2023 – Current",
  "Office, Room 4202"
)[
- Maintained all departmental computer science labs for undergraduates and postgraduates.
- Provided technical support including hand-ons repairs for lab equipment and server infrastructure.
- Served as a liaison for confidential, professional and inter-departmental communications.
]

#item(
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  "Honorary Advisor; formerly Executive Committee",
  "April 2023 – Current",
  "Student Centre, Mailbox #3"
)[
- Oversee executive operations, provide strategic guidance and support to the student society.
- Contribute to and organize public documentation and confidential records.
- Maintain build systems and proprietary technologies for operational excellency and security.
- Principal Coordinator of CSE Festival 2023; Master of Ceremonies of CSE Farewell Dinner 2023.
]

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Bachelor of Engineering in Computer Engineering",
  "July 2026",
  "Clear Water Bay, Kowloon"
)[
#course("Fall 2024", ("Cybersecurity","Artificial Intelligence Ethics"))
#course("Spring 2024", ("Advanced Deep Learning Architectures","Modern Compiler Construction",))
#course("Fall 2023", ("Design and Analysis of Algorithms",))
#course("Spring 2023", ("Introduction to Embedded Systems","Operating Systems"))
#course("Fall 2022", ("Honors Object-Oriented Programming and Data Structures",))
]

#item(
  "The University of Wollongong College Hong Kong",
  "Distinction; Associate of Science in Information Systems Development",
  "July 2022",
  "Tai Wai, New Territories"
)[]
