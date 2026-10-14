% ---------------------------------------------------------------------------
% Publications
%
%   pub(Id, Section, Properties).
%
% Section is one of the pub_section/2 ids in profile.pl (conference,
% workshop, thesis).  Within a section, entries are shown in the order
% they appear here (newest first); numbers [n] are computed.
%
% Properties (all optional except title, authors, venue, year):
%   title(Html)        authors([PersonId, ...])
%   venue(Html)        year(Year)
%   doi(Doi)           link(Label, Url)    pdf(Path)
%   abstract(Html)
%
% Text is raw HTML (entities such as &sharp; and tags such as <em> are
% fine).  A pub Id can be referenced by talks in talks.pl.
% ---------------------------------------------------------------------------

% -- International conferences ----------------------------------------------

pub(rtcheck_vers, conference, [
    title("Exploiting Multiple Abstract Call Patterns for Optimizing Run-Time Checks"),
    authors([ferreiro, jurjo, me, morales, lopez, herme]),
    venue("Theory and Practice of Logic Programming, special issue for the International Conference on Logic Programming (ICLP)"),
    year(2026),
    doi("10.1017/S1471068426100672"),
    pdf("pdf/rtcheck-vers.pdf"),
    abstract("In strongly-typed languages, types are verified at compile time,
      while dynamically typed languages, such as Prolog, perform type
      consistency checks entirely at run-time.  Extending dynamic
      languages with assertions allows expressing both classical types and
      more general properties, providing high expressiveness, but at the
      cost of run-time overhead.  Abstract interpretation allows safely
      approximating such program properties at compile time, which has
      been used to reduce the number of properties that require run-time
      checks, while still reporting unverified properties that can guide
      further static analyses, testing, or domain refinement.  In this
      work, we first study how to selectively integrate the run-time
      semantics of assertion properties into a multivariant, top-down,
      goal-directed abstract interpretation algorithm. We then show how
      multiple inferred calling patterns can be exploited to reduce the
      number of properties that must be checked at run-time, thus
      minimizing the overhead.  Finally, we report on an implementation of
      our approach in the Ciao system and provide performance results
      supporting that better results can be obtained.")
]).

pub(hiord_sharp, conference, [
    title("Hiord<sup>&sharp;</sup>: An Approach to the Specification and Verification of Higher-Order (C)LP Programs"),
    authors([me, jurjo, morales, lopez, herme]),
    venue("Theory and Practice of Logic Programming, special issue for the International Conference on Logic Programming (ICLP)"),
    year(2025),
    doi("10.1017/S147106842510015X"),
    pdf("pdf/hiord-sharp.pdf"),
    abstract("Higher-order constructs enable more expressive and concise code by
      allowing procedures to be parameterized by other procedures.
      Assertions allow expressing partial program specifications, which can
      be verified either at compile time (statically) or run time
      (dynamically).  In higher-order programs, assertions can also describe
      higher-order arguments.  While in the context of (C)LP, run-time
      verification of higher-order assertions has received some attention,
      compile-time verification remains relatively unexplored.  We propose a
      novel approach for statically verifying higher-order (C)LP programs
      with higher-order assertions.  Although we use the Ciao assertion
      language for illustration, our approach is quite general and we
      believe is applicable to similar contexts.  Higher-order arguments are
      described using predicate properties&mdash;a special kind of property
      which exploits the (Ciao) assertion language.  We refine the syntax
      and semantics of these properties and introduce an abstract criterion
      to determine conformance to a predicate property at compile time,
      based on a semantic order relation comparing the predicate property
      with the predicate assertions. We then show how to handle these
      properties using an abstract interpretation-based static analyzer for
      programs with first-order assertions by reducing predicate properties
      to first-order properties.  Finally, we report on a prototype
      implementation and evaluate it through various examples within the
      Ciao system.")
]).

% -- Workshops & regional venues ---------------------------------------------

pub(absdbg_nsad, workshop, [
    title("Demonstrating the Top-Down Solver in a Box"),
    authors([me, morales, lopez, herme]),
    venue("Presented at the International Workshop on Numerical and Symbolic Abstract Domains (NSAD)"),
    year(2026),
    pdf("pdf/absdbg-nsad.pdf"),
    abstract("The internal behavior of a static analyzer is often hard to inspect,
      and existing tools tend to be tailored to a specific analyzer or task.
      We present a unified, configurable debugger for top-down static
      analyzers, built on a procedure-box model that exposes the solver's
      internal steps as a controllable event stream in standard IDEs.  We
      demonstrate it on three case studies: diagnosing an abstract domain
      bug, cutting a 7.6-second analysis to 800 milliseconds via fixpoint
      tracing, and a multi-domain correctness proof.")
]).

pub(playground_prole, workshop, [
    title("Demonstrating the Ciao Prolog Playground"),
    authors([me, ferreiro, jurjo, morales, lopez, herme]),
    venue("In Proceedings of Jornadas de Programación y Lenguajes (PROLE)"),
    year(2026),
    link("Handle", "https://hdl.handle.net/11705/PROLE/2026/20"),
    pdf("pdf/ciao-playground-demo-prole.pdf"),
    abstract("We propose a demonstration of the Ciao Prolog
      Playground and the Active Logic Documents (ALDs)
      approach as a practical toolset designed to facilitate
      the teaching and learning of Prolog and formal
      methods, both on-line and in the classroom.")
]).

% -- Theses ------------------------------------------------------------------

pub(msc_thesis, thesis, [
    title("Towards Verification of Higher-Order (Constraint) Logic Programs via Abstract Interpretation"),
    authors([me]),
    venue("M.Sc. thesis with honours"),
    year(2025),
    link("Repository", "https://oa.upm.es/91841/"),
    pdf("pdf/msc-thesis.pdf"),
    abstract("Higher-order constructs enable more expressive and
      concise code by allowing procedures to be
      parameterized by other procedures, resulting in more
      modular and maintainable code.  Assertions are
      linguistic constructs for writing partial program
      specifications, which can then be verified either at
      compile time (<em>i.e.</em>, statically) or run time
      (<em>i.e.</em>, dynamically).  In the case of
      higher-order programs, assertions provide descriptions
      of the higher-order arguments of procedures.  In the
      context of (C)LP, the run-time verification of such
      higher-order assertions has received some
      attention. However, verification at compile time
      remains relatively unexplored.

      We propose a novel approach for
      the <em>compile-time</em> verification of higher-order
      (C)LP programs with assertions that describe
      higher-order arguments.  Although our presentation is
      based for concreteness on the Ciao assertion language,
      the approach is quite general and flexible, and we
      believe it can be applied to similar gradual
      approaches.  Higher-order arguments are described
      using predicate properties, a special kind of
      properties that allow using the full power of the
      (Ciao) assertion language for such arguments.

      We first present a refinement of both the syntax and
      semantics of these properties.  Next, we introduce an
      abstract criterion to determine whether a predicate
      conforms to a predicate property at compile time,
      based on a semantic order relation to compare the
      definition of a predicate property and the partial
      specification of a predicate.  We then propose a
      technique for dealing with these properties using an
      abstract interpretation-based static analyzer for
      programs with first-order assertions, by reducing
      predicate properties to first-order properties that
      are natively understood by such an analyzer.  Finally,
      we report on a prototype implementation and study the
      effectiveness of the approach with various examples
      within the Ciao system.")
]).

pub(bsc_thesis, thesis, [
    title("Improvements in Ciao Prolog's Development Environment: Developing A Rich Development Environment for Ciao on Visual Studio Code"),
    authors([me]),
    venue("B.Sc. thesis with honours"),
    year(2024),
    link("Repository", "https://oa.upm.es/82571/"),
    pdf("pdf/bsc-thesis.pdf"),
    abstract("The software industry has consistently experienced rapid and transformative
      changes since its beginning. A significant aspect of this evolution lies in
      the tools and utilities available for creating software solutions. These
      tools enable developers to focus on crafting solutions while minimizing
      time spent on non-essential tasks.

      Among these tools, the text editor is arguably one of the most crucial. In
      recent years, Visual Studio Code has emerged as the most widely used text
      editor globally. It allows users to extend its functionality through extensions
      implemented using modern web technologies.

      This project aims to explain the design and implementation of a Visual Studio
      Code extension for the Ciao programming language. The extension integrates
      core tools such as the Ciao preprocessor (CiaoPP) and the autodocumenter for
      (C)LP systems (LPdoc) in an intuitive and comprehensive way inside a modern
      and accessible text editor. This integration makes the extension suitable for
      developers of all expertise levels in logic programming and software
      verification.")
]).
