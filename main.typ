#import "template.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  author: (
    name: "Samuel Tam",
    handle: "usertam",
    email: "hello@usertam.dev",
    website: "https://usertam.dev"
  ),
  bio: "Pursuing SysDevOps and Linux Development.",
  links: (
    ("linkedin", "linkedin.com/in/usertam"),
    ("github", "github.com/usertam"),
  ),
  repo: "https://github.com/usertam/curriculum-vitae",
  perma: "https://usertam.link/cv",
)

#experience[Development]

#gh_item(
  [Free and Open-Source Software Developer, \
    NixOS/Nixpkgs Maintainer, _formerly Contributor_],
  "",
  "Since May 2022",
  "pulls?q=author%3Ausertam",
  repo_desc: "All PRs"
)[
  - I contribute to recognized projects used by developers worldwide, both personally and professionally.
  - #link("https://www.youtube.com/watch?v=M4jS5KQ8_YE", "Presented at NixCon 2025") about our roadmap for weaving Nix into private company workflows.
]

#item(
  [AWS Community Builder with 3#sym.times AWS Certified, _formerly AWS Cloud Ambassador_],
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

#experience[Experience]

#item(
  [Junior Linux Infrastructure Engineer, _formerly Engineering Intern_],
  "ExpressVPN / Kape Technologies",
  "Since April 2025",
  "Hopewell Centre, Wan Chai"
)[
  - Maintain #link("https://www.expressvpn.com/features/trustedserver", [_TrustedServer_]), ephemeral and in-memory OS which production servers run in tight release cycles.
  - Innovate on #link("https://www.expressvpn.com/lightway", [_Lightway_]), the company's pioneering VPN protocol, specifically on end-to-end IPv6 support.
  - Revamp #link("https://www.expressvpn.com/features/threat-manager", [_Threat Manager_]) refresh frequency and coverage, refactor incremental updates for bandwidth.
]

#item(
  [Honorary Advisor, _formerly UG Representative and Executive Committee_],
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  "September 2023",
  "HKUST, Clear Water Bay"
)[
  - Oversee executive operations, provide strategic guidance and support to the student society.
  - Advocate for students' interests and serve as a liaison between students and faculty staff.
  - Keynote Speaker of credit-bearing seminars #link("https://www.youtube.com/watch?v=53TWNe3_z38", [_Developing with GitHub_]) and #link("https://csess.su.hkust.edu.hk/activity/149", [_The Unix Philosophy_]).
  - Co-host of Departmental Briefing for all Direct Entry students in 2023, and again in 2024.
]

#item(
  "Student Intern",
  "System and Network Administration Office, Dept. of CSE, HKUST",
  "July 2023",
  "HKUST, Clear Water Bay"
)[
  - Maintain with manual labor, the labs and server rooms for departmental students and faculty staff.
  - Sometimes serve as anchor for privileged, professional inter-departmental communications.
]

#experience[Projects]

#gh_item(
  "LLVM Toolchain" + dot + "5 build stages in 8h+ build time",
  "Bleeding-edge LLVM toolchains for cross-compilation, optimized with PGO and LTO.",
  "June 2024",
  "usertam/toolchain"
)[
  Leveraging GitHub Actions with scheduled scripts, we can perform weekly builds against the #link("https://github.com/llvm/llvm-project", "latest LLVM on git"). The build is then optimized, stripped and patched for portability across different environments.
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

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Bachelor of Engineering in Computer Engineering",
  "July 2025",
  "Clear Water Bay",
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
  [Tai Wai, _formerly Kowloon City_]
)[]
