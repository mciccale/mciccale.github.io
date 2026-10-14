% ---------------------------------------------------------------------------
% Profile and page structure
% ---------------------------------------------------------------------------

site_title("Marco Ciccalè").
affiliation("IMDEA Software Institute &amp; UPM @ Madrid, Spain").
email_text("marco [dot] ciccale [at] software [dot] imdea [dot] org").
cv_pdf("pdf/cv.pdf").

% Page metadata (search results, link previews, schema.org).
% Plain text here: no HTML entities.
site_url("https://mciccale.github.io/").
meta_description("Marco Ciccalè is a Ph.D. student at the IMDEA Software Institute and Universidad Politécnica de Madrid working on abstract interpretation and static analysis of logic programs, and a developer of Ciao Prolog.").
meta_image("assets/pfp-190.webp").
meta_job_title("Ph.D. student").
meta_affiliation("IMDEA Software Institute", "https://software.imdea.org/").

% avatar(Id, Src, Alt).  Shown in the hero, left to right.
% Images are shown at 95px; use 190px files (2x for high-density screens).
avatar("avatar-1", "assets/pfp-190.webp",
       "Me on safari, in a sun hat and mirrored sunglasses, with a herd of wildebeest behind me.").
avatar("avatar-2", "assets/iclp-190.webp", "Me giving a talk at ICLP'25.").
avatar("avatar-3", "assets/gru-190.webp",  "Gru, a golden retriever, with his tongue out.").

% Long-form prose lives in plain HTML fragments under content/:
%   content/bio.html       paragraphs shown under the name
%   content/research.html  body of the "Research interests" section

% Publication and talk sections, in display order.
pub_section(conference, "Publications: international conferences").
pub_section(workshop,   "Publications: workshops &amp; regional venues").
pub_section(thesis,     "Publications: theses").

talk_section(conference, "Talks: international conferences").
talk_section(workshop,   "Talks: workshops &amp; regional venues").
