// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  author: (name: "", email: "", email-alt: "", bio: ""),
  bio: "",
  links: (),
  body,
) = {
  // Set the document's basic properties.
  set document(title: title, author: author.name)
  set page(paper: "a4", margin: 1in)
  set par(justify: true, leading: .55em)
  set text(10pt, font: "Cormorant Garamond", weight: "medium")
  set list(indent: 1.25em)
  set underline(stroke: .2pt)
  
  // Set page footer.
  set page(footer: context {
    set align(center)
    set text(weight: "semibold", tracking: .5pt)
    show text: smallcaps
    "curriculum vitæ — page "
    counter(page).display()
    " of "
    [#counter(page).final().first()]
  })

  // Set mono text style.
  let mono = text.with(
    0.8em,
    font: "DM Mono",
    weight: "light",
    tracking: -.25pt
  )

  // Website links.
  let website(icon, url) = {
    box(move(dx: -.4em, dy: .125em,
      image(width: .95em, icon)))
    underline(link("https://" + url))
    linebreak()
  }

  v(1fr)

  // Header with name, description and links.
  columns(2, gutter: -100em, {
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
    text(features: (smcp: 1), tracking: 0.2pt,
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
    mono({
      if author.email-alt != "" {
        link(
          "mailto:" + author.email-alt,
          "General: <" + author.email-alt + ">"
        )
        linebreak()
      }
      links.map(it => website(..it))
        .fold("", (x, y) => x + y)
    })
  })

  body

  v(2fr)
}

#let experience(body) = style(styles => block({
  let title = text(1.2em,
    weight: "bold",
    tracking: .5pt,
    features: (smcp: 1),
    body
  )
  title
  h(1fr)
  box(
    height: measure(" ", styles).height,
    align(right + horizon,
      line(stroke: 0.1pt,
        end: (100% - 0.75em - measure(title, styles).width, 0%)
      )
    )
  )
}))

#let item(title, subtitle, date, location, body) = columns(2, gutter: -100%, {
  stack(dir: ltr,
    move(dy: -0.2em, 
      text(font: "Noto Sans Symbols 2",
        sym.diamond.filled.small)),
    h(.75em),
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

#let gh_item(title, desc, date, url, url_desc: "Repository", body) = item(
  title,
  desc,
  date,
  box(place(right + bottom,
    move(dx: -.25em, dy: .1em,
      image(width: .8em, "icons/github.svg"))))
  + underline(link("https://github.com/" + url, url_desc)),
  body
)

#let course(code, sem, name) = {
  let dot = h(.3em) + sym.dot + h(.3em)
  let code = text(weight: "semibold",
    smallcaps(upper(code.at(0)) + lower(code.slice(1))))
  list(smallcaps(code + dot + sem + dot) + name)
}

#let label(color: blue, body) = context {
  let text = text(0.7em, font: "DM Mono", weight: "bold", fill: white, tracking: -.5pt, smallcaps[#body])
  box(width: measure(text).width + 1.25em, pad(x: .5em, place(left + bottom, move(dy: .22em, block(fill: color.lighten(20%), height: 1em, width: measure(text).width + 1em, radius: 1em,
  align(center + horizon, text))))))
}

#let label-nix = label(color: color.blue.lighten(25%), "nix")

#let tex = {
  "T"
  h(-.1667em)
  box(move(dy: (.5*282168/655361)*1em, "E"))
  h(-.125em)
  "X"
}

#let latex = {
  "L"
  h(-.32em)
  box(move(dy: -.175em, text(0.75em, "A")))
  h(-.15em)
  tex
}

#let ctx = {
  "Con"
  h(-.1em)
  tex
  h(-.05em)
  "t"
}
