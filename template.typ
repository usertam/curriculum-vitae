#let project(
  title: none,
  author: (name: none, email: none, email-alt: none, bio: none),
  bio: none,
  links: (),
  body,
) = {
  // Set the document's basic properties.
  set document(title: title, author: author.name)
  set page(paper: "a4", margin: (x: 1in, y: 0.75in))
  set par(justify: true, leading: .55em)
  set text(9pt, font: "Mona Sans", weight: "regular", fallback: false)
  set underline(stroke: .2pt)

  // Set mono text style.
  let mono = text.with(
    .9em,
    font: "DM Mono",
    weight: "light",
    tracking: -.25pt
  )

  // Handle.
  let handle = box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 1pt),
    outset: (y: 2pt),
    radius: 2pt,
  )

  // Website links.
  let website(icon, url) = {
    context box(height: measure("").height,
      move(dy: 1pt, align(bottom, image(height: 0.9em, icon))))
    h(0.35em)
    link("https://" + url, url)
    linebreak()
  }

  v(1fr)

  // Header with name, description and links.
  columns(2, gutter: -100%, {
    text(1.5em,
      weight: "semibold",
      features: (smcp: 1),
      tracking: 0.25pt,
      author.name
    )
    h(.5em)
    handle(mono("@usertam"))
    linebreak()
    v(.875em, weak: true)
    text(tracking: 0.15pt, author.bio)
    linebreak()
    v(1.25em, weak: true)
    text(bio)
    v(.5em)

    colbreak()
    set align(right)
    show text: mono
    show link: underline

    // Email link.
    context box(height: measure("").height,
      move(dy: -1.5pt, align(bottom, text(1.1em, font: "Twitter Color Emoji", fallback: true, "✉️"))))
    h(0.15em)
    link(
      "mailto:" + author.email
    )
    linebreak()

    // All website links.
    links.map(it => website(..it)).join()
  })

  v(1em, weak: true)

  show link: underline
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
      line(stroke: 0.1pt,
        end: (100% - 0.75em - measure(title).width, 0%)
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

#let gh_item(title, desc, date, url, url_desc: "Repository", body) = item(
  smallcaps(title),
  desc,
  date,
  box(place(right + bottom,
    move(dx: -.25em, dy: .1em,
      image(width: .8em, "icons/github.svg"))))
  + link("https://github.com/" + url, url_desc),
  body
)

#let mono = text.with(
  0.95em,
  font: "DM Mono",
  weight: "light",
  tracking: -.35pt
)

#let github(url) = {
  mono(link("https://github.com/" + url, url))
}

#let dot = {
  h(.4em) + box(place(center + bottom, $dot$)) + h(.4em)
}

#let course(sem, courses, extra: none) = {
  smallcaps(text(weight: "semibold", sem))
  courses.fold("", (x, y) => x + dot + y)
  if (extra != none) {
    dot
    smallcaps(text(weight: "semibold", extra.at(0)))
    extra.at(1).fold("", (x, y) => x + dot + y)
  }
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
