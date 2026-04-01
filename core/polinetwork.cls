%% polinetwork.cls
%% PoliNetwork APS — Document Class
%% 
%% Modular LaTeX class inspired by Awesome-CV structure.
%% Supports XeLaTeX and LuaLaTeX via fontspec.
%%
%% Usage:
%%   \documentclass[legal]{polinetwork}    % for legal documents (privacy, T&C)
%%   \documentclass[letter]{polinetwork}   % for letters
%%   \documentclass[report]{polinetwork}   % for reports with title page
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polinetwork}[2026/04/01 PoliNetwork APS Document Class v1.0]

%% ========================================================================
%% CLASS OPTIONS
%% ========================================================================

\newif\if@pnletter   \@pnletterfalse
\newif\if@pnreport   \@pnreportfalse
\newif\if@pnlegal    \@pnlegalfalse

\DeclareOption{letter}{\@pnlettertrue}
\DeclareOption{report}{\@pnreporttrue}
\DeclareOption{legal}{\@pnlegaltrue}

% Pass all unknown options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Base class
\LoadClass[a4paper, 11pt]{article}

%% ========================================================================
%% REQUIRED PACKAGES
%% ========================================================================

% Page geometry
\RequirePackage[
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
  headheight=1.5cm,
  headsep=0.8cm,
  footskip=1.5cm
]{geometry}

% Font support (XeLaTeX / LuaLaTeX)
\RequirePackage{fontspec}
\RequirePackage{eurosym}
\RequirePackage{unicode-math}

% Typography
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{parskip}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{tikz}

% Tables
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{longtable}

% Lists
\RequirePackage{enumitem}

% Links
\RequirePackage[
  colorlinks=true,
  linkcolor=pn-link,
  urlcolor=pn-link,
  citecolor=pn-primary,
  bookmarks=true,
  bookmarksnumbered=true
]{hyperref}

% Header/Footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% Conditionals
\RequirePackage{ifthen}
\RequirePackage{xifthen}

%% ========================================================================
%% LOAD POLINETWORK PACKAGES
%% ========================================================================

\RequirePackage{polinetwork-colors}
\RequirePackage{polinetwork-commands}

%% ========================================================================
%% FONT CONFIGURATION
%% ========================================================================

% DM Sans — primary body/display font
\newfontfamily\dmsansfont{DMSans}[
  Path           = fonts/,
  Extension      = .ttf,
  UprightFont    = *-Variable,
  BoldFont       = *-Variable,
  ItalicFont     = *-Variable-Italic,
  BoldItalicFont = *-Variable-Italic,
  UprightFeatures= {RawFeature={axis={wght=400}}},
  BoldFeatures   = {RawFeature={axis={wght=700}}},
  ItalicFeatures = {RawFeature={axis={wght=400}}},
  BoldItalicFeatures = {RawFeature={axis={wght=700}}},
]

% Poppins — headlines & wordmark
\newfontfamily\poppinsfont{Poppins}[
  Path           = fonts/,
  Extension      = .ttf,
  UprightFont    = *-Regular,
  BoldFont       = *-Bold,
  ItalicFont     = *-Italic,
  BoldItalicFont = *-MediumItalic,
  FontFace       = {m}{n}{*-Medium},
  FontFace       = {sb}{n}{*-SemiBold},
]

\newfontfamily\poppinsmedium{Poppins-Medium}[
  Path           = fonts/,
  Extension      = .ttf,
]

% Red Hat Text — labels, captions, small text
\newfontfamily\redhattextfont{RedHatText}[
  Path           = fonts/,
  Extension      = .ttf,
  UprightFont    = *-Variable,
  BoldFont       = *-Variable,
  ItalicFont     = *-Variable-Italic,
  BoldItalicFont = *-Variable-Italic,
  UprightFeatures= {RawFeature={axis={wght=400}}},
  BoldFeatures   = {RawFeature={axis={wght=700}}},
  ItalicFeatures = {RawFeature={axis={wght=400}}},
  BoldItalicFeatures = {RawFeature={axis={wght=700}}},
]

% Set main document fonts
\setmainfont{DMSans}[
  Path           = fonts/,
  Extension      = .ttf,
  UprightFont    = *-Variable,
  BoldFont       = *-Variable,
  ItalicFont     = *-Variable-Italic,
  BoldItalicFont = *-Variable-Italic,
  UprightFeatures= {RawFeature={axis={wght=400}}},
  BoldFeatures   = {RawFeature={axis={wght=700}}},
  ItalicFeatures = {RawFeature={axis={wght=400}}},
  BoldItalicFeatures = {RawFeature={axis={wght=700}}},
]

% Aliases for use in commands.sty
\let\headlinefont\poppinsfont
\let\labelfont\redhattextfont

%% ========================================================================
%% PARAGRAPH & SPACING
%% ========================================================================

\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 1pt}
\onehalfspacing

% Tolleranza per giustificazione testo (riduce Overfull \hbox)
\tolerance=1000
\emergencystretch=3em

% Line color for body text
\color{pn-text}

%% ========================================================================
%% SECTION STYLING  
%% ========================================================================

\RequirePackage{titlesec}

% Section: blue bar + Poppins bold
% Awesome-CV style sections: Primary color, bold, with a horizontal rule below
\titleformat{\section}
  {\Large\poppinsfont\bfseries\color{pn-text}}
  {\thesection\hspace{6pt}}
  {0pt}
  {}[\vspace{-0.6em}{\color{pn-rule}\rule{\textwidth}{1pt}}]

\titleformat{\subsection}
  {\large\poppinsfont\bfseries\color{pn-text-secondary}}
  {\thesubsection\hspace{6pt}}
  {0pt}
  {}

\titleformat{\subsubsection}
  {\normalsize\poppinsfont\bfseries\color{pn-text-secondary}}
  {\thesubsubsection\hspace{6pt}}
  {0pt}
  {}

% Spacing
\titlespacing*{\section}{0pt}{18pt}{8pt}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}

%% ========================================================================
%% LIST STYLING
%% ========================================================================

\setlist{
  leftmargin=1.5em,
  itemsep=3pt,
  parsep=0pt,
  topsep=4pt,
}

% Awesome-CV style itemize: simple clean bullet
\setlist[itemize]{
  label={\footnotesize\textcolor{pn-primary}{\textbullet}},
  leftmargin=2em
}

\setlist[enumerate]{
  label={\textcolor{pn-primary}{\arabic*.}},
}

\setlist[description]{
  font=\normalfont\color{pn-primary}\bfseries,
}

%% ========================================================================
%% HEADER / FOOTER (fancyhdr)
%% ========================================================================

\pagestyle{fancy}
\fancyhf{} % clear defaults

% Footer on all pages
\fancyfoot[L]{%
  \raisebox{-0.3em}{\pnInsertLogo[0.45cm]}\hspace{4pt}%
  \pnWordmark[10pt]%
}
\fancyfoot[R]{%
  \footnotesize\poppinsfont\color{pn-text-secondary}%
  \pn@str@page~\thepage~\pn@str@of~\pageref*{LastPage}%
}

% Rule styling
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5pt}
\renewcommand{\footrule}{\vspace*{-8pt}\hbox to\headwidth{\color{pn-rule}\leaders\hrule height \footrulewidth\hfill}\vspace*{8pt}}
\renewcommand{\footrulewidth}{0pt}

% First page style: no running header
\fancypagestyle{firstpage}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{%
    \small\color{pn-text-muted}%
    \pn@str@page~\thepage~\pn@str@of~\pageref*{LastPage}%
  }
  \fancyfoot[R]{%
    \footnotesize\color{pn-text-muted}%
    \pn@associationname%
  }
}

% Title page style (no header/footer)
\fancypagestyle{titlepage}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

%% ========================================================================
%% HYPERREF METADATA
%% ========================================================================

\AtBeginDocument{%
  \hypersetup{
    pdftitle={\pn@doctitle},
    pdfauthor={\pn@associationname},
    pdfsubject={\pn@docsubject},
    pdfcreator={XeLaTeX with polinetwork.cls},
  }%
}

%% ========================================================================
%% CONVENIENCE: AUTO-SETUP BASED ON DOCUMENT TYPE
%% ========================================================================

% Legal documents (privacy, T&C): use numbered sections, no title page
\if@pnlegal
  % Enable paragraph numbering for legal docs
  \setcounter{secnumdepth}{3}
\fi

% Reports: will use \pnMakeTitlePage
\if@pnreport
  \setcounter{secnumdepth}{3}
\fi

% Letters: simpler layout
\if@pnletter
  \setcounter{secnumdepth}{0}
  % Tighter margins for letters
  \geometry{top=2cm, bottom=2cm, left=2.5cm, right=2.5cm}
\fi

\endinput
