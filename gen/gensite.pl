:- module(_, [main/1]).
:- use_package([assertions, pillow]).

:- doc(title, "Static site generator for mciccale.github.io").
:- doc(module, "Builds @tt{index.html} from the facts in @tt{data/}
   and the HTML fragments in @tt{content/}.  Run it from the repository
   root (see the @tt{Makefile}).

   All text in the data files is treated as raw HTML and copied as
   is, so entities such as @tt{&amp;amp;} and tags such as @tt{<em>}
   can be used freely.").

:- use_module(library(lists), [append/3, member/2, nth/3]).
:- use_module(library(stream_utils), [file_to_string/2, write_string/2]).

% Content (plain facts, no module headers)
:- include('../data/profile.pl').
:- include('../data/people.pl').
:- include('../data/pubs.pl').
:- include('../data/talks.pl').
:- include('../data/cv.pl').

% ---------------------------------------------------------------------------
% Entry point

main(Args) :-
    ( Args = [Out] -> true ; Out = 'index.html' ),
    page(Doc),
    html2terms(Str, Doc),
    open(Out, write, S),
    write_string(S, Str),
    close(S).

% Pillow writes character codes > 255 as numbers; emit them as numeric
% character references instead, so any Unicode text in the data is safe.
:- multifile html_expansion/2.
html_expansion(C, entity(E)) :-
    integer(C), C > 255, !,
    number_codes(C, Cs),
    atom_codes(E, [0'#|Cs]).

% A section body is a list of blocks; container(Label, Content) is a
% labelled block rendered with the standard section header.
html_expansion(container(Label, Content),
               div([class=container], [nl, Header, nl, Content, nl])) :-
    section_header(Label, Header).

% Text for screen readers only (visually hidden).
html_expansion(sr_only(Text), span([class="visually-hidden"], Text)).

% ---------------------------------------------------------------------------
% Page skeleton

page([declare("DOCTYPE html"), nl,
      html([lang=en], [nl, Head, nl, Body, nl]), nl]) :-
    head(Head),
    body(Body).

head(head([nl,
    meta$[charset="UTF-8"], nl,
    meta$[name=viewport, content="width=device-width, initial-scale=1.0"], nl,
    link$[rel=preconnect, href="https://fonts.googleapis.com"], nl,
    link$[rel=preconnect, href="https://fonts.gstatic.com", crossorigin], nl,
    link$[href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,500;1,400&family=DM+Mono:wght@300;400&display=swap",
          rel=stylesheet], nl,
    link$[rel=stylesheet, type="text/css", href="style.css"], nl,
    script([src="script.js", defer], []), nl,
    title(Title), nl])) :-
    site_title(Title).

body(body([nl,
           a([class="skip-link", href="#content"], "Skip to content"), nl,
           Nav, nl,
           main([id=content], [nl, Hero, nl | Sections]), nl,
           Footer, nl])) :-
    nav(Nav),
    hero(Hero),
    findall(S, (section_id(Id), section(Id, S)), Sections0),
    interleave_nl(Sections0, Sections),
    footer(Footer).

% Sections, in display order (also drives the navigation bar).
section_id(research).
section_id(publications).
section_id(talks).
section_id(systems).
section_id(service).
section_id(education).

% ---------------------------------------------------------------------------
% Navigation, hero and footer

nav(nav(['aria-label'="Main"], [nl, div([class=container], [nl,
        a([href="./", class="nav-name"], Name), nl,
        span([class="nav-mark", 'aria-hidden'=true], "&vDash;"), nl,
        ul([class="nav-links"], Items), nl]), nl])) :-
    site_title(Name),
    findall(li([a([href=Href], Label)]),
            ( section_id(Id), atom_codes(Id, Label), Href = [0'#|Label] ),
            Items0),
    cv_pdf(CV),
    append(Items0, [li([a([href=CV], "cv")])], Items1),
    interleave_nl(Items1, Items).

hero(div([class=hero], [nl, div([class=container], [nl,
        div([class="hero-top"], [nl,
            div([nl, p([class="hero-affil"], Affil), nl, h1(Name), nl]), nl
            | Avatars]), nl,
        div([class="hero-bottom"], [nl, Bio, nl,
            div([class="hero-links"], [span([class="footer-text"], Email)]), nl]), nl]),
     nl])) :-
    affiliation(Affil),
    site_title(Name),
    email_text(Email),
    findall(img$[id=Id, class=avatar, src=Src, alt=Alt, width=95, height=95],
            avatar(Id, Src, Alt), Avatars0),
    interleave_nl(Avatars0, Avatars),
    fragment('content/bio.html', Bio).

footer(footer([nl, div([class=container], [nl,
        span([class="footer-text"], Name), nl,
        span([class="footer-text"], Email), nl]), nl])) :-
    site_title(Name),
    email_text(Email).

% ---------------------------------------------------------------------------
% Sections

section(Id, section([id=Id], Body)) :-
    section_body(Id, Body).

section_body(research, [container(["Research interests"], [Text])]) :-
    fragment('content/research.html', Text).

section_body(publications, Blocks) :-
    findall(container([Label], [ol([class="pub-list"], Pubs)]),
            ( pub_section(Sec, Label),
              findall(P, (pub(Id, Sec, _), pub_entry(Id, P)), Pubs0),
              interleave_nl(Pubs0, Pubs) ),
            Blocks).

section_body(talks, Blocks) :-
    findall(container([Label], [ul([class="pub-list"], Talks)]),
            ( talk_section(Sec, Label),
              findall(T, (talk(Id, Sec, Ps), talk_entry(Id, Ps, T)), Talks0),
              interleave_nl(Talks0, Talks) ),
            Blocks).

section_body(systems, [container(["Systems"], [div([class="proj-grid"], Cards)])]) :-
    findall(div([class="proj-card"], [nl,
                h3([class="proj-name"], NameHtml), nl,
                p([class="proj-desc"], Desc), nl]),
            ( system(Name, Url, Desc),
              ( Url = "" -> NameHtml = Name ; NameHtml = a([href=Url], Name) ) ),
            Cards0),
    interleave_nl(Cards0, Cards).

section_body(service, [container(["Service"], [ul([class=list], Items)])]) :-
    findall(Y, service(Y, _, _, _), Ys0),
    remove_dups(Ys0, Ys),
    findall(li([class="list-element"], Entries),
            ( member(Y, Ys),
              findall([a([href=Url], Event), " ", Role, ".", nl],
                      service(Y, Event, Url, Role), Entries) ),
            Items0),
    interleave_nl(Items0, Items).

section_body(education, [container(["Education"], [ol([class="edu-list"], Items)])]) :-
    findall(li([class="edu-item"], [nl,
                div([class="edu-year"], Years), nl,
                div([nl, p([class="edu-degree"], Degree), nl,
                     p([class="edu-school"], School), nl | NoteHtml]), nl]),
            ( education(Years, Degree, School, Notes),
              findall([p([class="edu-note"], N), nl], member(N, Notes), NoteHtml) ),
            Items0),
    interleave_nl(Items0, Items).

section_header(Label,
    div([class="section-header"], [nl,
        h2([class="section-label"], Label), nl,
        div([class="section-rule"], []), nl])).

% ---------------------------------------------------------------------------
% Publications and talks

pub_number(Id, N) :-
    findall(I, (pub_section(S, _), pub(I, S, _)), Ids),
    nth(N, Ids, Id), !.

pub_entry(Id, li([class=pub], [nl,
        div([class="pub-num"], ["[", NumStr, "]"]), nl,
        div([class="pub-body"], [nl,
            h3([class="pub-title"], Title), nl,
            p([class="pub-authors"], Authors), nl,
            p([class="pub-venue"], Venue), nl,
            div([class="pub-links"], Links), nl,
            Abstract, nl]), nl])) :-
    pub(Id, _, Ps),
    pub_number(Id, N), number_codes(N, NumStr),
    pub_title_authors(Id, Title, Authors),
    member(venue(V), Ps), member(year(Y), Ps), number_codes(Y, YS),
    Venue = [V, ", ", YS],
    abstract_dom_id(Id, AbsId),
    Context = [" of &ldquo;", Title, "&rdquo;"],
    pub_links(Ps, AbsId, Context, Links0), interleave_nl(Links0, Links),
    ( member(abstract(A), Ps) ->
        Abstract = div([class="pub-abstract", id=AbsId, hidden], [nl, p(A), nl])
    ; Abstract = []
    ).

abstract_dom_id(Id, AbsId) :-
    atom_codes(Id, Cs),
    append("abstract-", Cs, AbsId).

pub_title_authors(Id, Title, Authors) :-
    pub(Id, _, Ps),
    member(title(Title), Ps),
    member(authors(As), Ps),
    author_list(As, Authors).

% Link texts carry hidden context ("PDF of <title>") so that they are
% unambiguous for screen readers when read out of context.
pub_links(Ps, AbsId, Context, Links) :-
    findall(a([href=U], [Lbl, sr_only(Context)]),
            (member(P, Ps), pub_link(P, Lbl, U)), Links0),
    ( member(abstract(_), Ps) ->
        Links = [button([type=button, class="abstract-toggle",
                         'aria-expanded'=false, 'aria-controls'=AbsId],
                        ["Abstract", sr_only(Context)]) | Links0]
    ; Links = Links0
    ).

pub_link(doi(D),       "DOI", U) :- append("https://doi.org/", D, U).
pub_link(link(Lbl, U), Lbl,   U).
pub_link(pdf(F),       "PDF", F).

talk_entry(Id, Ps, li([class=talk], [nl,
        div([class="pub-body"], [nl,
            h3([class="pub-title"], Title), nl,
            p([class="pub-authors"], Authors), nl,
            p([class="pub-venue"], [Event, ", ", Place, ", ", YS]), nl,
            div([class="pub-links"], Links), nl]), nl])) :-
    pub_title_authors(Id, Title, Authors),
    member(event(Event), Ps),
    member(place(Place), Ps),
    member(year(Y), Ps), number_codes(Y, YS),
    Context = [" of the talk &ldquo;", Title, "&rdquo; (", Place, ", ", YS, ")"],
    findall(a([href=F], [Lbl, sr_only(Context)]),
            (member(P, Ps), talk_link(P, Lbl, F)), Links0),
    interleave_nl(Links0, Links).

talk_link(slides(F), "Slides", F).
talk_link(photo(F),  "Photo",  F).

% "A, B, C and D", with the site owner highlighted.
author_list(Ids, Html) :-
    findall(N, (member(Id, Ids), author_name(Id, N)), Names),
    join_and(Names, Html).

author_name(me, strong([class=me], Name)) :- !,
    person(me, Name, _).
author_name(Id, Name) :-
    person(Id, Name, _), !.
author_name(Id, _) :-
    throw(error(unknown_person(Id), author_name/2)).

join_and([], []).
join_and([X], [X]).
join_and([X, Y], [X, " and ", Y]).
join_and([X, Y, Z|R], [X, ", "|T]) :-
    join_and([Y, Z|R], T).

% ---------------------------------------------------------------------------
% Utilities

% Contents of an HTML fragment file, copied verbatim.
fragment(File, Str) :-
    file_to_string(File, Str).

% Separate list elements with newlines (only for readable HTML source).
interleave_nl([], []).
interleave_nl([X], [X]) :- !.
interleave_nl([X|Xs], [X, nl|Ys]) :-
    interleave_nl(Xs, Ys).

remove_dups([], []).
remove_dups([X|Xs], [X|Ys]) :-
    remove_dups_(Xs, X, Xs1),
    remove_dups(Xs1, Ys).

remove_dups_([], _, []).
remove_dups_([X|Xs], X, Ys) :- !, remove_dups_(Xs, X, Ys).
remove_dups_([Y|Xs], X, [Y|Ys]) :- remove_dups_(Xs, X, Ys).
