% ---------------------------------------------------------------------------
% News
%
%   news(Date, Html).
%
% Date is date(Year, Month) or date(Year).  Newest first; the page shows
% the first news_shown/1 entries.
% ---------------------------------------------------------------------------

news_shown(5).

% TODO: add the month you joined the committees.
news(date(2026),
     "Joined the artifact evaluation committees of POPL'27 and VMCAI'27.").
news(date(2026, 10),
     "Presented <em>Demonstrating the Top-Down Solver in a Box</em> at NSAD 2026 (SPLASH/ISSTA, Oakland).").
news(date(2026, 7),
     "Presented our TPLP paper on exploiting multiple abstract call patterns to optimize run-time checks at ICLP 2026 (FLoC, Lisbon).").
news(date(2026, 6),
     "Presented Hiord<sup>&sharp;</sup> at PROLE 2026 (Alicante).").
news(date(2025, 9),
     "Presented Hiord<sup>&sharp;</sup> at ICLP 2025 (Rende), published in TPLP.").
