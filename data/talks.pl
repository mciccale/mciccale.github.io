% ---------------------------------------------------------------------------
% Talks
%
%   talk(PubId, Section, Properties).
%
% PubId refers to a pub/3 entry in pubs.pl: the title and authors are
% taken from there.  Section is one of the talk_section/2 ids in
% profile.pl.  Entries are shown in the order they appear here.
%
% Properties:
%   event(Html)   place(Html)   year(Year)
%   slides(Path)  photo(Path)
% ---------------------------------------------------------------------------

% -- International conferences ----------------------------------------------

talk(rtcheck_vers, conference, [
    event("International Conference on Logic Programming (ICLP), Federated Logic Conference (FLoC)"),
    place("Lisbon, Portugal"),
    year(2026),
    slides("pdf/rtcheck-vers-slides-iclp.pdf"),
    photo("img/talk-iclp26.jpeg")
]).

talk(hiord_sharp, conference, [
    event("International Conference on Logic Programming (ICLP)"),
    place("Rende (CS), Italy"),
    year(2025),
    slides("pdf/hiord-sharp-slides-iclp.pdf"),
    photo("img/talk-iclp25.jpeg")
]).

% -- Workshops & regional venues ---------------------------------------------

talk(absdbg_nsad, workshop, [
    event("International Workshop on Numerical and Symbolic Abstract Domains (NSAD)"),
    place("Oakland, California U.S."),
    year(2026),
    slides("pdf/absdbg-nsad-slides.pdf")
]).

talk(hiord_sharp, workshop, [
    event("Jornadas de Programación y Lenguajes (PROLE)"),
    place("Alicante, Spain"),
    year(2026),
    slides("pdf/hiord-sharp-slides-prole.pdf"),
    photo("img/talk-prole26.jpeg")
]).
