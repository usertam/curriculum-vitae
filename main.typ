#import "template.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  author: (
    name: "Samuel Tam",
    handle: "usertam",
    email: "hello@usertam.dev",
    website: "https://usertam.dev",
  ),
  bio: "Kernel bypass, high-throughput networking and low-latency systems.",
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
  - Wrote the 10$thin$Gbps+ #url("https://doc.dpdk.org/guides-25.11/prog_guide/generic_segmentation_offload_lib.html", "Generic Segmentation Offload (GSO)") and zero-copy VPN prototype for #url("https://www.expressvpn.com/lightway", "Lightway.")
  - Implemented end-to-end IPv6 support for #url("https://www.expressvpn.com/lightway", "Lightway") in addition to existing IPv4 infra on #url("https://www.expressvpn.com/features/trustedserver", "TrustedServer.")
  - Re-architected the DNS filtering #url("https://www.expressvpn.com/features/threat-manager", "Threat Manager") pipeline, cutting evaluation time from 30 to 5 minutes.
  - Co-maintain the #url("https://www.expressvpn.com/features/trustedserver", "TrustedServer") ecosystem across multi-cloud and bare metal, reviewed fleet-wide configuration changes, coordinated deployments end-to-end and signed off weekly releases.
  - #yt_url("https://www.youtube.com/watch?v=M4jS5KQ8_YE", "Spoke") at #url("https://2025.nixcon.org", "NixCon 2025") on #url("https://www.expressvpn.com/features/trustedserver", "TrustedServer") and Nix, also represented ExpressVPN at #url("https://eventyay.com/e/88882f3e", "FOSSASIA 2026.")
]

#gh_item(
  "Free and Open-Source Software Developer",
  "NixOS/Nixpkgs maintainer",
  [May 2022---Present],
  "pulls?q=author%3Ausertam",
  repo_desc: "GitHub PRs"
)[
  - Develop and maintain software used in production and by the wider community, e.g. #url("https://github.com/NixOS/nixpkgs/pull/456251", "cloudsmith-cli").
  - Focus on reproducible builds, but also go the extra mile to fix e.g. #url("https://github.com/wolfcw/libfaketime/pull/500", "ABI incompatibility") and #url("https://gitlab.com/lilypond/lilypond/-/merge_requests/1508", "C++ crash.")
  - Ranked in the top 100 most active GitHub committers in Hong Kong, according to #url("https://committers.top/hong_kong.html", "https://committers.top/.")
]

#item(
  [AWS Community Builder, with 3#sym.times AWS Certified],
  "AWS Community Builders Program / AWS Training and Certification",
  [Jan 2025---May 2026],
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.07em,
      image(height: .9em, "icons/linkedin.svg")))
  + url("https://www.linkedin.com/in/usertam/details/certifications", [_LinkedIn_])
)[
  - AWS Certified SysOps Administrator – Associate (SOA-C02)
  - AWS Certified Cloud Practitioner (CLF-C02) & AWS Certified AI Practitioner (AIF-C01)
]

#item(
  [Honorary Advisor, _prev. UG Representative and Executive Committee_],
  "The Computer Science and Engineering Students' Society, HKUSTSU",
  [Apr 2023---Present],
  "HKUST, Clear Water Bay"
)[
  - Hosted dept. events and credit-bearing talks, like #yt_url("https://www.youtube.com/watch?v=53TWNe3_z38", "Developing with GitHub") and #url("https://csess.su.hkust.edu.hk/activity/149", "The Unix Philosophy.")
  - Provided technical mentorship and career guidance to students across departments.
]

#experience[Projects]

#gh_item(
  "Embedded Linux Replacement for reMarkable 2" + dot + "i.MX7D on ARMv7",
  [Reproducible Nix-built kernel and userland, deployed live via `kexec`.],
  "September 2025",
  "usertam/remarkable2-userland"
)[
  Produces a minimal statically-linked `musl` userland from Nixpkgs, resembling a standard GNU userland; alongside a patched Linux 5.4 kernel with custom device tree modifications (UART rerouting on the pogo pin) and binutils/GPU driver compatibility fixes for the downstream fork.
  
  Tailscale is baked in with native `tun` networking, exposing the tablet's web UI over a private network without USB tethering. Fully reproducible via Nix flakes; the built kernel image is loadable via `kexec` without reboots.
]

#gh_item(
  "LLVM Cross-Compile Toolchain" + dot + "4 build stages in 8h+ build time",
  "Self-optimising toolchain built with PGO, for embedded kernel development.",
  "June 2024",
  "usertam/toolchain"
)[
  Weekly multi-stage build of a #url("https://github.com/llvm/llvm-project", "latest LLVM tip") cross-compilation toolchain. Targets `x86_64` and `aarch64`, and incorporates ThinLTO, PGO and PLO using Linux kernel `defconfig` builds as the profiling workload.
  
  The pipeline runs 4 LLVM build stages in total: bootstrap → instrumented → profiling → PGO-optimized build, the result is an optimized toolchain with the representative compiling workload profiled. It is distributed as a portable binary tarball with relative `RPATH` to avoid glibc version pinning.
]

#gh_item(
  "Android Kernel Development" + dot + "1.8k+ commits backported",
  [I asked, "What if you can run `dockerd` on your armv8 phone natively?"],
  "September 2021",
  "usertam/dumpling-lineage-kernel"
)[
  Maintained a Linux 4.4 kernel tree for OnePlus 5T, forked from LineageOS and rebased onto the latest stable, then onto CIP #url("https://cip-project.org/about/linux-kernel-core-packages", "Super-Long-Term Stable") branch for sustained backports. Tracked and merged linux-stable across 13+ releases and sifted through Qualcomm's trees to identify fixes applicable to the MSM8998.

  Beyond stability, the defconfig was extended to enable e.g. namespaces, cgroups, that were absent from the vendor baseline, then bootstrapped a fully working container stack on Android with a read-only rootfs.
]

#pagebreak()

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

#experience[Technical Skills]

#item(
  "Programming Languages",
  v(-.3em),
  none,
  none,
  (
    "C (GNU C)",
    "C++11/17",
    "Rust",
    "Python 3",
    "Go",
    "Nix",
    "Shell (bash/mksh)"
  ).join(dot)
)

#item(
  "High-Performance Computing / Low Latency",
  v(-.3em),
  none,
  none,
  (
    "Kernel bypass (DPDK, XDP)",
    "eBPF (XDP, TC)",
    "CPU affinity",
    "NUMA-aware allocation",
    linebreak() + "ring buffers",
    "io_uring",
    "SIMD",
    "hugepages",
    "zero-copy",
    "I/O gather-scatter",
    "cache line optimization"
  ).join(dot)
)

#item(
  "Cloud Infrastructure / Paravirtualization",
  v(-.3em),
  none,
  none,
  (
    "AWS (EC2/Spot/Lambda, S3/Glacier, VPC/TGW/PrivateLink, IAM, CloudWatch/CloudTrail)",
    linebreak() + "microVM (Firecracker, cloud-hypervisor)",
  ).join(dot)
)

#item(
  "DevOps",
  v(-.3em),
  none,
  none,
  (
    "GitHub Actions",
    "GitLab CI",
    "CircleCI",
    "Docker Compose",
    "Docker Hub",
    "Podman",
    "Earthly",
    "BuildKit",
    linebreak() + "Skopeo",
    "OCI",
    "Terraform",
    "OpenTofu",
    "Pulumi",
    "Ansible",
    "Vagrant",
    "Grafana",
    "Prometheus",
    "Rundeck"
  ).join(dot)
)

#item(
  "Operating System / Kernel Internals",
  v(-.3em),
  none,
  none,
  (
    "Sysctl tuning",
    "namespaces/containers",
    "seccomp",
    "kprobes",
    "uprobes",
    "tracepoints",
    "epoll",
    "eventfd",
  ).join(dot)
)

#item(
  "Networking / Protocols",
  v(-.3em),
  none,
  none,
  (
    "TSO/USO/GSO/GRO offload",
    "TCP coalescing",
    "checksum offload",
    "D/TLS 1.3",
    "QUIC",
    "eBPF steering",
    "socket splicing",
    "congestion control",
    "netfilter subsystem",
    "veth integration testing",
    "SR-IOV",
    "virtio-net",
  ).join(dot)
)

#item(
  "Concurrency / Memory Model",
  v(-.3em),
  none,
  none,
  (
    "Lock-free queues",
    "SPSC/MPSC ring buffers",
    "mutexes",
    "futex",
    "spinlocks",
    "atomics",
    "memory ordering",
    "RCU",
    "shared memory IPC",
  ).join(dot)
)
#item(
  "Profiling / Tracing",
  v(-.3em),
  none,
  none,
  (
    "perf",
    "flamegraphs",
    "valgrind/callgrind",
    "bpftrace",
    "strace",
    "ltrace",
    "ftrace",
    "tcpdump",
    "tshark",
  ).join(dot)
)
#item(
  "Building / Toolchain",
  v(-.3em),
  none,
  none,
  (
    "LLVM/Clang",
    "PGO/LTO/PLO",
    "Nix/NixOS/Nixpkgs",
    "cross-compilation",
    "static linking",
    "bindgen"
  ).join(dot)
)

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
