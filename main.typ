#import "template.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  author: (
    name: "Samuel Tam",
    handle: "usertam",
    email: "hello@usertam.dev",
  ),
  bio: "Pursuing SysDevOps & Linux Development. Final Year at HKUST.",
  links: (
    ("linkedin", "linkedin.com/in/usertam"),
    ("github", "github.com/usertam"),
  ),
  repo: "https://github.com/usertam/curriculum-vitae",
  perma: "https://usertam.link/cv",
)

#experience[Development]

#gh_item(
  [Open-Source Software Developer, \
    NixOS/Nixpkgs Maintainer, _formerly Contributor_],
  "",
  "3 Years" + dot + "Since 2022",
  "pulls?q=author%3Ausertam+is%3Amerged",
  repo_desc: "Merged PRs (30+)"
)[
  As contributor to recognized open source initiatives of 20k+ stars, I collaborate with many in the open-source software community to shape the very foundation of modern software stacks used by developers.

  #v(-.25em)

  #pr_col({
    pr_list(
      "NixOS/Nixpkgs",
      "https://github.com/NixOS/nixpkgs", (
        179050, 183085, 184327, 188161, 191785, 192041, 206860, 207727, 215775, 236694,
        247789, 247792, 247793, 236110, 236693, 320065, 352329, 369766, 373359, 375602, 385701
      )
    )
    pr_list(
      "nix-community: Nix community projects",
      "https://github.com/nix-community", (
        "https://github.com/nix-community/nixos-generators/pull/156",
        "https://github.com/nix-community/nix-index/pull/183"
      )
    )
    colbreak()
    pr_list(
      "GNU LilyPond: music engraving software",
      "https://lilypond.org", (
        "https://git.savannah.gnu.org/gitweb/?p=lilypond.git;a=commit;h=adaed195306a85d611aa9f3177b8db28b01b1dc6",
      )
    )
    pr_list(
      "kitty: GPU-based terminal emulator",
      "https://sw.kovidgoyal.net/kitty", (
        "https://github.com/kovidgoyal/kitty/pull/6118",
        "https://github.com/kovidgoyal/kitty/pull/6120",
      )
    )
    pr_list(
      "libfaketime: datetime manipulation library",
      "https://github.com/wolfcw/libfaketime", (
        415,
      )
    )
  })
]

#item(
  [AWS Community Builder, AWS Educate Cloud Ambassador and 3#sym.times AWS Certified],
  "Advocating cloud computing through the lens of personal projects.",
  "January 2025",
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.07em,
      image(height: .9em, "icons/linkedin.svg")))
  + link("https://www.linkedin.com/in/usertam/details/certifications", "LinkedIn")
)[
  - AWS Certified SysOps Administrator – Associate (SOA-C02)
  - AWS Certified Cloud Practitioner (CLF-C02) & AWS Certified AI Practitioner (CLF-C01)
]

#experience[Projects]

#gh_item(
  "LLVM Toolchain" + dot + "5 build stages in 8h+ build time",
  "Bleeding-edge LLVM toolchains for cross-compilation, optimized with PGO and LTO.",
  "June 2024",
  "usertam/toolchain"
)[
  Leveraging GitHub Actions with scheduled scripts, we can perform weekly builds against the LLVM #link("https://github.com/llvm/llvm-project", `master`). The build is then optimized, stripped and patched for portability across different environments.
]

#gh_item(
  ConTeXt + "-minimals" + dot + "200+ releases",
  "Typesetting system made reproducible.",
  "August 2022",
  "usertam/context-minimals"
)[
  After analyzing the dependencies of #ConTeXt LMTX (like #LaTeX, derived from #TeX), we rewrite the installation declaratively in `nix`. This results in a far more efficient installation that is both reproducible and portable.
]

#gh_item(
  "Android Kernel Development" + dot + "1.6k+ commits ahead",
  ["What if you can run `dockerd` on your `aarch64` phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
  We use open-source kernel trees released by Qualcomm, with upstream changes and custom patches to rebuild the Android kernel, enabling support for custom kernel features (e.g. namespaces for containers).
]

#experience[Experience]

#item(
  "Undergraduate Representative",
  "Department of Computer Science and Engineering, HKUST",
  "September 2023 – Current",
  "Academic Building, Room 3528"
)[
  - Advocate for students' interests and serve as a liaison between students and faculty administration.
  - Keynote Speaker of credit-bearing seminars #link("https://www.youtube.com/watch?v=53TWNe3_z38", `Developing with GitHub`) and #link("https://csess.su.hkust.edu.hk/activity/149", `The Unix Philosophy`).
  - Co-host of Departmental Briefing for all Direct Entry students in 2023, and again in 2024.
]

#item(
  "Student Intern",
  "System and Network Administration Office, Dept. of CSE, HKUST",
  "July 2023 – Current",
  "Academic Building, Room 4202"
)[
  - Maintain \~10 departmental labs and server rooms for undergraduates and postgraduates.
  - Serve as a liaison for professional and reliable inter-departmental communications.
]

#item(
  [Honorary Advisor, _formerly Executive Committee_],
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  "April 2023 – Current",
  "Student Centre, Mailbox #3"
)[
  - Oversee executive operations, provide strategic guidance and support to the student society.
  - Principal Coordinator of CSE Festival. Master of Ceremonies of CSE Farewell Dinner. Both 100+ attendees.
]

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Final Year, Bachelor of Engineering in Computer Engineering",
  "July 2026",
  "Clear Water Bay, Kowloon",
  text(tracking: -.05pt, (
    "Advanced Deep Learning Architectures",
    "Competitive Programming in Cybersecurity II",
    "Design and Analysis of Algorithms",
    "Modern Compiler Construction",
    "Honors Object-Oriented Programming and Data Structures",
  ).join(dot))
)

#item(
  "The University of Wollongong College Hong Kong",
  "Distinction, Associate of Science in Information Systems Development",
  "July 2022",
  "Tai Wai, New Territories"
)[]
