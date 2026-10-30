#import "template.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  author: (
    name: "Samuel Tam",
    handle: "usertam",
    email: "hello@usertam.dev",
    website: "https://usertam.dev",
  ),
  bio: "Linux infrastructure, automation and high-performance networking.",
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
  - #text(weight: "medium", url("https://www.expressvpn.com/features/trustedserver", "TrustedServer.")) Develop and maintain our multi-cloud and bare metal server fleet with weekly releases.
  - Leverage the mixed stack of Debian live-build hooks, Ansible with Jinja and integrated Python scripts.
  - Fully own monitoring and deployments to the Grafana/VictoriaMetrics migration project.
  - Automate TLS certificate issuance and renewal cycles, across multiple protocols and brands.
  - Refactored the DNS filtering known as #url("https://www.expressvpn.com/features/threat-manager", "Threat Manager,") cutting eval time from hours to minutes.
  - #text(weight: "medium", url("https://www.expressvpn.com/lightway", "Lightway.")) Started the paradigm shift to batch packet processing, including desktop and mobile.
  - Completed IPv6 tunnelling on both the protocol and on the server-side, end-to-end.
  - Attended #url("https://www.expressvpn.com/events", "FOSSASIA 2026") and mentored the team #url("https://www.sit.kmutt.ac.th/cs-wins-fossasia-hackathon-2026/", "winning the hackathon.")
  - #yt_url("https://www.youtube.com/watch?v=5EgRIxAAT9M", "Spoke") at #url("https://hkoscon.org/2026", "HKOSCon 2026") on how a hardware offload makes its way to a VPN.
  - #yt_url("https://www.youtube.com/watch?v=M4jS5KQ8_YE", "Spoke") at #url("https://2025.nixcon.org", "NixCon 2025") on how we are using Nix in the company.
]

#gh_item(
  "Free and Open-Source Software Developer",
  "A fellow NixOS/Nixpkgs maintainer.",
  [May 2022---Present],
  "pulls?q=author%3Ausertam",
  repo_desc: "GitHub PRs"
)[
  - Develop and maintain software used in production and by the wider community, e.g. #url("https://github.com/NixOS/nixpkgs/pull/456251", "cloudsmith-cli.")
  - Focus on reproducible builds, but also go the extra mile to fix e.g. #url("https://github.com/wolfcw/libfaketime/pull/500", "ABI incompatibility") and #url("https://gitlab.com/lilypond/lilypond/-/merge_requests/1508", "C++ crash.")
]

#item(
  [Honorary Advisor, _prev. UG Representative and Executive Committee_],
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  [Apr 2023---Apr 2026],
  "HKUST, Clear Water Bay"
)[
  - Hosted dept. events and credit-bearing talks, like #yt_url("https://www.youtube.com/watch?v=53TWNe3_z38", "Developing with GitHub") and #url("https://csess.su.hkust.edu.hk/activity/149", "The Unix Philosophy.")
  - Provided technical mentorship and career guidance to students across departments.
]

#let skill-block(headline, detail) = {
  set par(justify: false, leading: .7em)
  set text(weight: "medium")
  headline
  linebreak()
  v(-.25em)
  set text(
    size: 0.85em,
    font: "DM Mono",
    tracking: -.25pt,
    fill: luma(96),
    weight: "medium",
  )
  box(inset: (left: 1em), detail)
}

#v(.5em)

#experience[Technical Skills]

#item(
  "Linux Administration / Operations",
  v(-.3em),
  none,
  none,
  (
    "Bare-metal and cloud fleet deployment",
    "IPMI",
    "systemd",
    "sysctl tuning",
    "namespaces/containers",
    linebreak() + "seccomp",
    "kernel build and config",
    "Nix/NixOS/Nixpkgs",
  ).join(dot)
)

#item(
  "Automation / Infrastructure as Code",
  v(-.3em),
  none,
  none,
  (
    "Ansible",
    "Jinja",
    "Python 3",
    "Shell (bash/mksh)",
    "Terraform",
    "OpenTofu",
    "GitHub Actions",
    "CircleCI",
  ).join(dot)
)

#item(
  "Monitoring / Observability",
  v(-.3em),
  none,
  none,
  (
    "Grafana",
    "VictoriaMetrics/Logs/Traces",
    "Prometheus",
    "AWS CloudWatch",
  ).join(dot)
)

#item(
  "Networking / Protocols",
  v(-.3em),
  none,
  none,
  (
    "TCP/UDP",
    "D/TLS 1.3",
    "QUIC",
    "netfilter",
    "congestion control",
    "TSO/USO/GSO/GRO and checksum offload",
    linebreak() + "SR-IOV",
    "virtio-net",
    "veth integration testing",
  ).join(dot)
)

#item(
  "Troubleshooting / Profiling",
  v(-.3em),
  none,
  none,
  (
    "tcpdump",
    "tshark",
    "strace",
    "ltrace",
    "ftrace",
    "bpftrace",
    "perf",
    "flamegraphs",
    "valgrind/callgrind",
  ).join(dot)
)

#item(
  "High-Performance / Low Latency",
  v(-.3em),
  none,
  none,
  (
    "Kernel bypass (DPDK/VPP)",
    "eBPF (on XDP, TC)",
    "DMA",
    "NUMA/CPU affinity",
    "zero-copy",
    linebreak() + "I/O gather-scatter",
    "io_uring",
    "lock-free ring buffers",
  ).join(dot)
)

#item(
  "Cloud / Virtualization / Containers",
  v(-.3em),
  none,
  none,
  (
    "AWS (EC2, VPC, Lambda, CloudFront, S3)",
    "Firecracker",
    "VirtIO",
    "Docker",
    "Podman",
    "OCI",
  ).join(dot)
)

#item(
  "Programming Languages",
  v(-.3em),
  none,
  none,
  (
    "Python 3",
    "Shell (bash/mksh)",
    "C (GNU C)",
    "C++11/17",
    "Rust",
    "Go",
    "Nix",
  ).join(dot)
)

#pagebreak()

#experience[OSS Projects]

#gh_item(
  "Declarative and Reproducible Fleet Management",
  "Nix monorepo to manage my homelab and server fleet.",
  "October 2026",
  "usertam/nixfiles"
)[
  I roll my own distro release on my servers, with automatic builds and deployments. This way I get to customize both the kernel and packages down to the source level, but also be confident in that nothing will drift.
]

#gh_item(
  "Rooted Tailscale daemon on Android",
  "Patched to work natively with Tailscale SSH and MagicDNS.",
  "October 2026",
  "usertam/tailscaled-android"
)[
  I made some patches against Tailscale upstream to build a working CLI variant on Android, so I can fully control my mobile from anywhere. An eBPF module is written to redirect MagicDNS.
]

#gh_item(
  "Userland and Kernel Replacement for reMarkable 2",
  "Nix-built kernel and userland, reproducible.",
  "September 2025",
  "usertam/remarkable2-userland"
)[
  Produces a minimal static musl userland, but far more comprehensive than a toybox; also a custom kernel build for UART debugging and native TUN networking.
]

#gh_item(
  "LLVM Cross-Compile Toolchain" + dot + "4 build stages in 8h+ build time",
  "Weekly PGO-built toolchain, for embedded kernel development.",
  "June 2024",
  "usertam/toolchain"
)[
  An optimized build of #url("https://github.com/llvm/llvm-project", "latest LLVM tip") into a cross-compilation toolchain. Targets `x86_64` and `aarch64`, and incorporates ThinLTO, PGO and PLO, profiling kernel defconfig builds.
]

#gh_item(
  "Android Kernel Development" + dot + "1.8k+ commits backported",
  [Running `dockerd` on arm64 natively, and on a phone.],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
  A Linux 4.4 kernel tree for OnePlus 5T from LineageOS, rebased onto CIP #url("https://cip-project.org/about/linux-kernel-core-packages", "Super-Long-Term Stable") branch for sustained backports. Patched to enable namespaces/cgroups that were previously disabled.
]

#v(.75em)

#experience[Education]

#item(
  "The Hong Kong University of Science and Technology",
  "Bachelor of Engineering in Computer Engineering",
  "July 2025",
  "Clear Water Bay",
  list(
    "Advanced Deep Learning Architectures",
    "Competitive Programming in Cybersecurity II",
    "Design and Analysis of Algorithms",
    "Modern Compiler Construction",
    "Honors Object-Oriented Programming and Data Structures",
  )
)

#item(
  "The University of Wollongong College Hong Kong",
  "Distinction, Associate of Science in Information Systems Development",
  "July 2022",
  [Tai Wai]
)[]
