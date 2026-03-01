#import "template.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  author: (
    name: "Samuel Tam",
    handle: "usertam",
    email: "hello@usertam.dev",
    website: "https://usertam.dev",
  ),
  bio: "High-performance networking and production systems.",
  links: (
    ("linkedin", "linkedin.com/in/usertam"),
    ("github", "github.com/usertam"),
  ),
  repo: "https://github.com/usertam/curriculum-vitae",
  perma: "https://usertam.link/cv",
)

#experience[Experience]

#item(
  [Junior Linux Infrastructure Engineer, _prev. Engineering Intern_],
  "ExpressVPN / Kape Technologies",
  [Apr 2025---Present],
  "Hopewell Centre, Wan Chai"
)[
  - Wrote the first _#link("https://doc.dpdk.org/guides-25.11/prog_guide/generic_segmentation_offload_lib.html", "Generic Segmentation Offload")_ prototype of our flagship VPN protocol, _#link("https://www.expressvpn.com/lightway", "Lightway")_.
  - Above achieved 3#sym.times throughput vs. WireGuard® userspace (microbench, CPU-bound workload over `veth`).
  - Readied end-to-end IPv6 on _#link("https://www.expressvpn.com/lightway", "Lightway")_, and revamped selective DNS filtering known as _#link("https://www.expressvpn.com/features/threat-manager", "Threat Manager")_.
  - Code owner of _#link("https://www.expressvpn.com/features/trustedserver", "TrustedServer")_, architect new deployments end-to-end, and sign-off weekly releases.
]

#gh_item(
  "Free and Open-Source Software Developer",
  "Contribute more commonly as a NixOS/Nixpkgs maintainer.",
  [May 2022---Present],
  "pulls?q=author%3Ausertam",
  repo_desc: "All PRs, GitHub"
)[
  - #link("https://www.youtube.com/watch?v=M4jS5KQ8_YE", "Presented") at _#link("https://2025.nixcon.org", "NixCon 2025")_ about our roadmap for weaving Nix into private company workflows.
  - Contribute to open-source projects used by developers worldwide, both personally and professionally.
]

#item(
  "Student Intern",
  "System and Network Administration Office, Dept. of CSE, HKUST",
  [Jul 2023---Apr 2025],
  "HKUST, Clear Water Bay"
)[
  - Touched actual server racks and retired old hardware; provisioned new BIOS, degaussed HDDs.
  - Maintained the labs, to check and repair OEM desktops/monitors/cabling, and un-jam the printers.
  - Sometimes served as anchor for privileged, inter-departmental delivery and communications.
]

#item(
  [Honorary Advisor, _prev. UG Representative and Executive Committee_],
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  [Apr 2023---Present],
  "HKUST, Clear Water Bay"
)[
  - Hosted department events, also credit-bearing talks, like #link("https://www.youtube.com/watch?v=53TWNe3_z38", [_Developing with GitHub_]) and #link("https://csess.su.hkust.edu.hk/activity/149", [_The Unix Philosophy_]).
  - Now to oversee executive operations, and provide strategic guidance to the student society.
  - People come to me for technical or personal advice, and I enjoy giving them what they need.
]

#experience[Projects]

#gh_item(
  "LLVM Cross-Compile Toolchain" + dot + "5 build stages in 8h+ build time",
  "With Profile-Guided Optimization (PGO) and Link-Time Optimization (LTO).",
  "June 2024",
  "usertam/toolchain"
)[
  Leveraging GitHub Actions with scheduled scripts, we can perform weekly builds against the #link("https://github.com/llvm/llvm-project", "latest LLVM on git"). The build is then optimized, stripped and patched for portability across different environments.
]

#gh_item(
  ConTeXt + "-minimals" + dot + "200+ releases",
  "Typesetting system made reproducible with Nix.",
  "August 2022",
  "usertam/context-minimals"
)[
  After analyzing the dependencies of #ConTeXt LMTX (like #LaTeX, derived from #TeX), we rewrite the installation declaratively in Nix. This results in a far more efficient installation that is both reproducible and portable.
]

#gh_item(
  "Android Kernel Development" + dot + "1.8k+ commits backported",
  ["What if you can run `dockerd` on your `aarch64` phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
  We use open-source kernel trees released by Qualcomm, with upstream changes and custom patches to rebuild the Android kernel, enabling support for custom kernel features (e.g. namespaces for containers).
]

#experience[Education & Certifications]

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
  [AWS Community Builder, with 3#sym.times AWS Certified],
  "Advocating cloud computing through the lens of personal projects.",
  "January 2025",
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.07em,
      image(height: .9em, "icons/linkedin.svg")))
  + link("https://www.linkedin.com/in/usertam/details/certifications", "LinkedIn")
)[
  - AWS Certified SysOps Administrator – Associate (SOA-C02)
  - AWS Certified Cloud Practitioner (CLF-C02) & AWS Certified AI Practitioner (AIF-C01)
]

#item(
  "The University of Wollongong College Hong Kong",
  "Distinction, Associate of Science in Information Systems Development",
  "July 2022",
  [Tai Wai]
)[]
