% ---------------------------------------------------------------------------
% Profile and page structure
% ---------------------------------------------------------------------------

site_title("Marco Ciccalè").
affiliation("IMDEA Software Institute &amp; UPM @ Madrid, Spain").
email_text("marco [dot] ciccale [at] software [dot] imdea [dot] org").
cv_pdf("pdf/cv.pdf").

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
