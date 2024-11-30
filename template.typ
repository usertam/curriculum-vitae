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
  set text(10pt, font: "Cormorant Garamond", weight: "medium", fallback: false)
  set list(indent: 1.25em)
  set underline(stroke: .2pt)

  // Set mono text style.
  let mono = text.with(
    0.8em,
    font: "DM Mono",
    weight: "light",
    tracking: -.1pt
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
    text(1.6em,
      weight: "semibold",
      features: (smcp: 1),
      tracking: .5pt,
      author.name
    )
    h(.5em)
    link(
      "mailto:" + author.email,
      mono("<" + author.email + ">")
    )
    linebreak()
    v(.75em, weak: true)
    text(features: (smcp: 1), tracking: 0.25pt,
      author.bio
    )
    if bio != "" {
      linebreak()
      v(1.25em, weak: true)
      text(bio)
      v(.5em)
    }

    colbreak()
    set align(right)
    show text: mono
    show link: underline
    links.map(it => website(..it))
      .fold("", (x, y) => x + y)

    if author.at("email-alt", default: none) != none {
      context box(height: measure("").height,
        move(dy: -1.5pt, align(bottom, text(1.1em, font: "Twitter Color Emoji", fallback: true, "🏢"))))
      h(0.15em)
      link(
        "mailto:" + author.email-alt
      )
    }
  })

  v(1em, weak: true)

  show link: underline
  body

  v(1fr)
}

#let experience(body) = v(.25em) + context block({
  let title = text(1.2em,
    weight: "bold",
    tracking: .5pt,
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
    context place(horizon, dy: .15em,
      text(2em, sym.diamond.filled)),
    h(1.25em),
    box(
      text(weight: "bold", title) +
      if subtitle != "" {
        linebreak()
        text(style: "italic", subtitle)
      }
    )
  )
  colbreak()
  place(right,
    text(weight: "semibold", date)
    + linebreak()
    + location
  )
}) + if (body != []) {
  v(1em, weak: true)
  body
}

#let gh_item(title, desc, date, url, url_desc: "Source", body) = item(
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
  0.8em,
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

#show "HKUST": text(0.95 * 10pt, "HKUST")
#show "HKUSTSU": text(0.95 * 10pt, "HKUSTSU")

#show "(2023)": text(0.825 * 10pt, "(") + "2023" + text(0.825 * 10pt, ")")
#show "(2024)": text(0.825 * 10pt, "(") + "2024" + text(0.825 * 10pt, ")")
