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
  set page(paper: "a4", margin: 1in)
  set par(justify: true, leading: .55em)
  set text(9pt, font: "Mona Sans", weight: "regular", fallback: false)
  show raw: text.with(font: "DM Mono")
  set underline(stroke: .2pt)

  // Handle style.
  let handle(height: none, body) = context box(
    fill: luma(240),
    inset: (x: .3em, y: if height != none { height } else {
      (measure("0").height - measure(raw("0")).height)/2
    }),
    outset: (y: .2em),
    radius: .2em,
    raw(body)
  )

  // Footer style.
  set page(footer: columns(2, {
    show "Mona Sans": link("https://github.com/github/mona-sans", "Mona Sans")
    show "Typst": link("https://github.com/typst/typst", "Typst")

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
    [
      Typeset in 9#h(1em/6)pt Mona Sans. \
      Last revised on #label.
    ]

    colbreak()

    set align(right + bottom)
    linebreak()
    title
    h(.55em) + sym.dot.c + h(.55em)
    strong(delta: 100, context counter(page).display())
  }))

  // Fine header/footer adjustment.
  set page(footer-descent: 0.625em)
  v(.5fr)

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
    text(tracking: .1pt, bio)
    h(1fr)
  }, {
    set align(right)
    show link: underline
    set text(.9em, luma(64), tracking: .1pt, weight: "medium")

    text(font: "Twitter Color Emoji", "🌏") + " " + link(author.website)
    linebreak()
    text(font: "Twitter Color Emoji", "📨") + " " + link("mailto:" + author.email, author.email)
  })

  v(1.5em, weak: true)

  // Set body style.
  show link: underline
  show raw: text.with(1.2em, tracking: -.25pt, weight: "light")

  body

  v(1fr)
}

#let experience(body) = v(.25em) + context block({
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
      text(style: "italic", subtitle)
      v(-.25em)
      body
    })
  )
  colbreak()
  place(right,
    text(weight: "medium", date)
    + linebreak()
    + location
  )
})

#let gh_item(title, subtitle, date, repo, repo_desc: "Repository", body) = item(
  title,
  subtitle,
  date,
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.125em,
      image(height: .9em, "icons/github.svg")))
  + link("https://github.com/" + repo, repo_desc),
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
