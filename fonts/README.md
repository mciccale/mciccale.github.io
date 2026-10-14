# Fonts

Self-hosted web fonts, subset to Latin, Latin-1, general punctuation and
mathematical symbols (WOFF2).  Both are licensed under the SIL Open
Font License 1.1 (see the OFL-*.txt files).

| File                         | Family, style        | Source |
|------------------------------|----------------------|--------|
| eb-garamond-regular.woff2    | EB Garamond 400      | https://github.com/octaviopardo/EBGaramond12 |
| eb-garamond-medium.woff2     | EB Garamond 500      | idem |
| eb-garamond-italic.woff2     | EB Garamond 400 italic | idem |
| dm-mono-regular.woff2        | DM Mono 400          | https://github.com/googlefonts/dm-mono |

Generated with:

    pyftsubset <font>.ttf --flavor=woff2 \
      --unicodes="U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2190-22FF,U+25B2,U+25BC,U+266F" \
      --output-file=<name>.woff2
