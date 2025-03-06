#let project(
  title: none,
  author: (name: none, handle: none, email: none),
  bio: none,
  links: (),
  body,
) = {
  // Set the document's basic properties.
  set document(title: title, author: author.name, description: bio.split(".").at(0), keywords: author.values())
  set page(paper: "a4", margin: (x: 1in, y: 0.75in))
  set par(justify: true, leading: .55em)
  set text(9pt, font: "Mona Sans", weight: "regular", fallback: false)
  set underline(stroke: .2pt)
  show link: underline

  // Handle style.
  let handle = box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 1pt),
    outset: (y: 2pt),
    radius: 2pt,
  )

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
    text(1.1em, handle(raw("@" + author.handle)))
    linebreak()
    v(.875em, weak: true)
    text(tracking: 0.15pt, bio)
    linebreak()

    v(.5em)

    colbreak()
    set align(right)
    set text(0.85em, tracking: .2pt)

    v(.25em)

    // Email link.
    context box(height: measure("").height,
      move(dy: -2.25pt,
        text(font: "Twitter Color Emoji", "✉️")))
    link("mailto:" + author.email)
    linebreak()

    // All social links.
    links.map(it => {
      let (name, url) = it
      context box(height: measure("").height,
        move(dx: -.25em, dy: -.125em,
          image(height: 1em,
            "icons/" + name + ".svg")))
        link("https://" + url, url)
      linebreak()
    }).join()
  })

  v(1em, weak: true)

  // Set monospace style.
  show raw: text.with(
    1.2em,
    font: "DM Mono",
    weight: "light",
    tracking: -.35pt
  )

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
  context box(height: measure("").height,
    move(dx: -.25em, dy: -.125em,
      image(height: .9em, "icons/github.svg")))
  + link("https://github.com/" + url, url_desc),
  body
)

#let pr_list(repo_name, repo_link, pull_ids) = box(list(body-indent: 0.75em, {
  link(repo_link, text(weight: "regular", repo_name))
  set text(0.75em, tracking: -0.25pt)
  pull_ids.enumerate().map(it => " " + link(
    if (type(it.at(1)) == int) { repo_link + "/pull/" + str(it.at(1)) } else { it.at(1) },
    "[" + str(it.at(0) + 1) + "]")
  ).join()
}))

#let dot = {
  h(.275em) + sym.dot.c + h(.275em)
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
