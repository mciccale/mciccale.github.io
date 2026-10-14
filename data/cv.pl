% ---------------------------------------------------------------------------
% Systems, service and education
% ---------------------------------------------------------------------------

% system(Name, Url, DescriptionHtml).

system("Ciao Prolog", "https://ciao-lang.org/",
    "A logic programming-based, multi-paradigm programming
     language with +20 years of active development.  The system
     integreates both static analysis and verification by
     abstract interpretation, and (property-based) testing
     facilities by using <em>assertions</em> as a common
     specification language for both.  I'm one of the
     developers of the system, and it's the main platform for
     my research.").

% service(Year, Event, Url, Role).
% Entries with the same Year are shown together; newest year first.

service(2027, "POPL'27",  "https://conf.researchr.org/home/POPL-2027",  "artifact evaluation committee member").
service(2027, "VMCAI'27", "https://conf.researchr.org/home/VMCAI-2027", "artifact evaluation committee member").
service(2025, "ICLP'25",  "https://iclp25.demacs.unical.it",            "external reviewer").

% education(Years, Degree, Institution, Notes).
% Notes is a list of extra lines, e.g. ["Grade: 9.18"].

education("2025&mdash;...", "Ph.D. in Computer Science",
          "IMDEA Software Institute &amp; Universidad Politécnica de Madrid", []).
education("2024&mdash;2025", "M.Sc. in Formal Methods in Computer Science and Engineering",
          "Universidad Politécnica de Madrid &amp; Universidad Complutense de Madrid",
          ["Grade: 9.18"]).
education("2021&mdash;2025", "B.Sc. in Computer Science",
          "Universidad Politécnica de Madrid", ["Grade: 7.37"]).
