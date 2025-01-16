#import "template.typ": *

#show: project.with(
  title: "Résumé",
  author: (
    name: "Samuel Tam",
    email: "hello@usertam.dev",
    bio: [Open-Source Software Developer. Final Year at HKUST.],
  ),
  links: (
    ("icons/linkedin.svg", "linkedin.com/in/usertam"),
    ("icons/github.svg", "github.com/usertam"),
  ),
)

#experience[Projects]

#gh_item(
  "LLVM Toolchain",
  "Bleeding-edge LLVM toolchains for cross-compilation, optimized with PGO and LTO.",
  "June 2024",
  "usertam/toolchain"
)[
  Leveraging GitHub Actions with scheduled scripts, we can perform weekly builds against the LLVM #link("https://github.com/llvm/llvm-project", mono[master]). The build is then optimized, stripped and patched for portability across different environments.
]

#gh_item(
  ConTeXt + "-minimals",
  "Typesetting system made reproducible.",
  "August 2022",
  "usertam/context-minimals"
)[
  After analyzing the dependencies of #ConTeXt LMTX (like #LaTeX, derived from #TeX), we rewrite the installation declaratively in #mono[nix]. This results in a far more efficient installation that is both reproducible and portable.
]

#gh_item(
  "Android Kernel Development",
  ["What if you can run #mono[dockerd] on your #mono[aarch64] phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
  We use open-source kernel trees released by Qualcomm, with upstream changes and custom patches to rebuild the Android kernel, enabling support for custom kernel features (e.g. namespaces for containers).
]

#experience[Contributions]

#v(-.1em)

As part of the open-source software community, we contribute to the modern foundation of software stacks consumed by other developers, fostering collaboration and innovation on global software supply chain. 

#v(-.25em)

#columns(2, gutter: 1.25em)[
  #set list(indent: 0pt, body-indent: 0.75em)
  #set text(0.875em, font: "DM Mono", weight: "light", tracking: -0.1pt)

  - #link("https://github.com/NixOS/nixpkgs", text(weight: "regular", "Nixpkgs Maintainer")) 
    #set text(0.8em, tracking: -0.25pt)
    #link("https://github.com/NixOS/nixpkgs/pull/179050", "[1]")
    #link("https://github.com/NixOS/nixpkgs/pull/183085", "[2]")
    #link("https://github.com/NixOS/nixpkgs/pull/184327", "[3]")
    #link("https://github.com/NixOS/nixpkgs/pull/188161", "[4]")
    #link("https://github.com/NixOS/nixpkgs/pull/191785", "[5]")
    #link("https://github.com/NixOS/nixpkgs/pull/192041", "[6]")
    #link("https://github.com/NixOS/nixpkgs/pull/206860", "[7]")
    #link("https://github.com/NixOS/nixpkgs/pull/207727", "[8]")
    #link("https://github.com/NixOS/nixpkgs/pull/215775", "[9]")
    #link("https://github.com/NixOS/nixpkgs/pull/236694", "[10]")
    #link("https://github.com/NixOS/nixpkgs/pull/247789", "[11]")
    #link("https://github.com/NixOS/nixpkgs/pull/247792", "[12]")
    #link("https://github.com/NixOS/nixpkgs/pull/247793", "[13]")
    #link("https://github.com/NixOS/nixpkgs/pull/236110", "[14]")
    #link("https://github.com/NixOS/nixpkgs/pull/236693", "[15]")
    #link("https://github.com/NixOS/nixpkgs/pull/320065", "[16]")
    #link("https://github.com/NixOS/nixpkgs/pull/352329", "[17]")
    #link("https://github.com/NixOS/nixpkgs/pull/369766", "[18]")
    #link("https://github.com/NixOS/nixpkgs/pull/373359", "[19]")
  - #link("https://github.com/nix-community", text(weight: "regular", "nix-community: Nix community projects"))
    #set text(0.8em, tracking: -0.25pt)
    #link("https://github.com/nix-community/nixos-generators/pull/156", "[1]")
    #link("https://github.com/nix-community/nix-index/pull/183", "[2]")

  #colbreak()

  - #link("https://lilypond.org", text(weight: "regular", "GNU LilyPond: music engraving software"))
    #set text(0.8em, tracking: -0.25pt)
    #link("https://git.savannah.gnu.org/gitweb/?p=lilypond.git;a=commit;h=adaed195306a85d611aa9f3177b8db28b01b1dc6", "[1]")
  - #link("https://sw.kovidgoyal.net/kitty", text(weight: "regular", "kitty: GPU-based terminal emulator"))
    #set text(0.8em, tracking: -0.25pt)
    #link("https://github.com/kovidgoyal/kitty/pull/6118", "[1]")
    #link("https://github.com/kovidgoyal/kitty/pull/6120", "[2]")
  - #link("https://github.com/wolfcw/libfaketime", text(weight: "regular", "libfaketime: datetime manipulation library"))
    #set text(0.8em, tracking: -0.25pt)
    #link("https://github.com/wolfcw/libfaketime/pull/415", "[1]")
]

#experience[Experience]

#item(
  "Department of Computer Science and Engineering, HKUST",
  "Undergraduate Student Representative",
  "September 2023 – Current",
  "Academic Building, Room 3528"
)[
- Keynote Speaker of credit-bearing seminars #link("https://www.youtube.com/watch?v=53TWNe3_z38", mono[Developing with GitHub]) and #link("https://csess.su.hkust.edu.hk/activity/149", mono[The Unix Philosophy]).
- Co-host of the Departmental Briefing for Direct Entry Students in 2023, and again in 2024.
- Representative Speaker of CSE Program Orientation Talk in 2023.
]

#item(
  [System and Network Administration Office, \
    Department of Computer Science and Engineering, HKUST],
  "Student Intern",
  "July 2023 – Current",
  "Academic Building, Room 4202"
)[
- Maintain all departmental computer science labs for undergraduates and postgraduates.
- Provide technical support including hand-ons repairs for lab equipment and server infrastructure.
- Serve as a liaison for professional and reliable inter-departmental communications.
]

#item(
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  "Honorary Advisor, formerly Executive Committee",
  "April 2023 – Current",
  "Student Centre, Mailbox #3"
)[
- Principal Coordinator of CSE Festival 2023. Master of Ceremonies of CSE Farewell Dinner 2023.
- Oversee executive operations, provide strategic guidance and support to the student society.
- Formerly maintained public documents, confidential records and systems for operational excellency.
]

#experience[Certificates]

#item(
  "Amazon Web Services (AWS)",
  v(-.5em) + text(number-type: "lining", style: "normal", [
    - AWS Certified SysOps Administrator – Associate (SOA-C02)
    - AWS Certified Cloud Practitioner (CLF-C02)
    - AWS Certified AI Practitioner (CLF-C01)
  ]),
  "January 2025",
  context box(height: measure("").height,
    move(dy: 1pt, align(bottom, image(height: 0.9em, "icons/linkedin.svg"))))
  + h(0.35em)
  + link("https://www.linkedin.com/in/usertam/details/certifications/", "LinkedIn")
)[]#v(.25em)

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Final Year, Bachelor of Engineering in Computer Engineering",
  "July 2026",
  "Clear Water Bay, Kowloon",
  (
    "Advanced Deep Learning Architectures",
    "Design and Analysis of Algorithms",
    "Cybersecurity",
    "Introduction to Embedded Systems",
    "Honors Object-Oriented Programming and Data Structures",
  ).join(dot)
)

#item(
  "The University of Wollongong College Hong Kong",
  "Distinction, Associate of Science in Information Systems Development",
  "July 2022",
  "Tai Wai, New Territories"
)[]
