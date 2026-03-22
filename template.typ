#let project(
  title: none,
  author: (name: none, handle: none, email: none, website: none),
  bio: none,
  links: (),
  repo: none,
  perma: none,
  body,
) = {
  // Set document properties and style.
  set document(title: title, author: author.name, description: bio.split(".").at(0), keywords: author.values())
  set page(paper: "a4", margin: (x: 1in, y: 1.375in))
  set par(justify: true, leading: .55em)
  set text(9pt, font: "Mona Sans", weight: "regular", fallback: false)
  show raw: text.with(1em, font: "DM Mono")
  set underline(stroke: .2pt)

  // Set tracking for Mona Sans in nixpkgs.
  show emph: if "rev" in sys.inputs {
    text.with(tracking: .25pt)
  } else {
    text
  }

  // Handle style.
  let handle(height: none, body) = context box(
    fill: luma(240),
    inset: (x: .3em, y: if height != none { height } else {
      (measure("0").height - measure(raw("0")).height)/2
    }),
    outset: (y: .2em),
    radius: .2em,
    text(.8em, font: "DM Mono", body)
  )

  // Footer style.
  set page(footer: context columns(2, {
    show "Curriculum Vitae": "Curriculum Vitæ"

    let label = if "rev" in sys.inputs {
      if "dirty" not in sys.inputs.rev {
        link(
          perma + "/" + sys.inputs.rev,
          handle(datetime.today().display("[year]-[month]-[day]") + " (" + sys.inputs.rev + ")")
        )
      } else {
        handle("20xx-xx-xx (" + sys.inputs.rev + ")")
      }
    } else {
      handle("20xx-xx-xx (preview)")
    }

    set text(.75em, luma(64), tracking: .05pt, weight: "medium")
    set align(left + bottom)

    colbreak()

    set align(right + bottom)
    linebreak()
    title
    h(.55em) + sym.dot.c + h(.55em)
    strong(delta: 100, context counter(page).display())
  }))

  // Fine header/footer adjustment.
  set page(footer-descent: 0em)

  // Header with name, description and links.
  grid(align: bottom, columns: 2, {
    text(1.5em,
      weight: "semibold",
      features: (smcp: 1),
      tracking: .25pt,
      author.name
    )
    h(.5em)
    text(1.1em, handle(height: 0.1em, "@" + author.handle))
    linebreak()
    v(.875em, weak: true)
    text(luma(64), tracking: .1pt, bio)
    h(1fr)
  }, {
    set align(right)
    show link: underline
    set text(.9em, luma(64), tracking: .1pt, weight: "medium")

    let svgicon(path, sz: {}, mv: {}) = {
      let raw = read(path)
      let craw = raw.replace("currentColor", luma(96).to-hex())
      let img = image(bytes(craw), ..sz)
      let bimg = box(height: 0em, img)
      box(move(..mv, bimg))
    }

    svgicon(mv: (dy: 1.75pt, dx: .5pt), sz: (height: 1.1em), "icons/material-symbols--globe-asia.svg") + " " + link(author.website)
    linebreak()
    svgicon(mv: (dy: 1.5pt, dx: .25pt), sz: (height: 1.05em), "icons/material-symbols--mail-rounded.svg") + " " + link("mailto:" + author.email, author.email)
  })

  v(1.5em, weak: true)

  // Set body style.
  show link: underline
  show raw: text.with(1.25em, font: "DM Mono", tracking: -.5pt, weight: "light")

  body
}

#let url(url, desc, style: emph) = {
  link(url, style(text(desc)))
  h(.2em)
  box(height: 0em, width: .5em,
    move(dy: -.7em,
      link(url, image(height: 1em, "icons/material-symbols-light--arrow-outward-rounded.svg"))
    )
  )
}

#let yt_url(url, desc, style: emph) = {
  link(url, style(text(desc)))
  h(.2em)
  box(height: 0em, width: .85em,
    move(dy: -.76em,
      link(url, image(height: 1em, "icons/material-symbols--youtube-video-outline-rounded.svg"))
    )
  )
}

#let experience(body) = v(.5em) + context block({
  let title = text(1.1em,
    weight: "medium",
    tracking: .1pt,
    features: (smcp: 1),
    body
  )
  title
  h(1fr)
  box(
    height: measure("").height,
    align(right + horizon,
      line(stroke: .1pt,
        end: (100% - .75em - measure(title).width, 0%)
      )
    )
  )
})

#let item(title, subtitle, date, location, body) = columns(2, gutter: -100%, {
  stack(dir: ltr,
    context place(horizon, dy: .35em, sym.bullet),
    box(inset: (left: 1em), {
      text(weight: "medium", title)
      linebreak()
      text(fill: luma(64), emph(subtitle))
      v(-.25em)
      body
    })
  )
  colbreak()
  place(right,
    text(weight: "medium", date)
    + linebreak()
    + text(fill: luma(64), location)
  )
})

#let gh_item(title, subtitle, date, repo, repo_desc: "Repository", body) = item(
  title,
  subtitle,
  date,
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.125em,
      image(height: .9em, "icons/github.svg")))
  + url("https://github.com/" + repo, repo_desc, style: a => a),
  body
)

#let dot = {
  h(.35em) + sym.dot.c + h(.35em)
}

#let TeX = {
  "T"
  h(-.22em)
  box(move(dy: .21em, "E"))
  h(-.11em)
  "X"
}

#let LaTeX = {
  "L"
  h(-.29em)
  box(move(dy: -.175em, text(.74em, "A")))
  h(-.1em)
  TeX
}

#let ConTeXt = {
  "Con"
  h(-.1em)
  TeX
  h(-.05em)
  "t"
}
