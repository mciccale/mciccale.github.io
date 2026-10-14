# mciccale.github.io

Personal website.  `index.html` is **generated**: edit the files below and
run `make`, then commit both the sources and the regenerated `index.html`
(GitHub Pages serves it as is).

Requires [Ciao](https://ciao-lang.org/) (`ciaoc` on the `PATH`).

## Where things live

| What                              | File                       |
|-----------------------------------|----------------------------|
| Name, affiliation, email, avatars | `data/profile.pl`          |
| Co-authors                        | `data/people.pl`           |
| Publications                      | `data/pubs.pl`             |
| Talks                             | `data/talks.pl`            |
| News                              | `data/news.pl`             |
| Systems, service, education       | `data/cv.pl`               |
| Bio paragraphs                    | `content/bio.html`         |
| Research interests text           | `content/research.html`    |
| Page structure                    | `gen/gensite.pl`           |
| Styling                           | `style.css`                |

Text in the data files is raw HTML: use entities (`&amp;`, `&sharp;`,
`&mdash;`) and inline tags (`<em>`, `<sup>`) as needed.

## Adding a publication

Add a `pub/3` fact to `data/pubs.pl`, newest first within its section:

```prolog
pub(my_paper, conference, [
    title("A New Result"),
    authors([me, herme]),          % ids from data/people.pl
    venue("Some Conference (SC)"),
    year(2027),
    doi("10.1234/abcd"),
    pdf("pdf/my-paper.pdf"),
    abstract("...")
]).
```

Numbering, author formatting and the abstract toggle are generated.

## Adding a talk

Add a `talk/3` fact to `data/talks.pl`.  It refers to the publication by
id, so the title and authors are not repeated:

```prolog
talk(my_paper, conference, [
    event("Some Conference (SC)"), place("Madrid, Spain"), year(2027),
    slides("pdf/my-paper-slides.pdf"), photo("img/talk-sc27.jpeg")
]).
```
