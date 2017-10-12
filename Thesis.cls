% Provides a class file for undergraduate dissertation
% Do not change anything from this file unless you *REALLY* know what you are doing
% Created by: Alexandra Bonnici
% for		: Department of Systems & Control Engineering
% Modified	: 22nd September 2015

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}[2007/22/02 v1.0 LaTeX document class]
\def\baseclass{book}

\newcommand{\LinkTextColour}{\Colour}
\DeclareOption{Print}{\renewcommand{\LinkTextColour}{\color{black}}}
\DeclareOption{Library}{\renewcommand{\LinkTextColour}{\color{blue}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
   \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
   \ifin@ \@tempswatrue \@break@tfor \fi}
    \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{---------------------------------------------------}}

\usepackage{fontenc}[T1]         % to encode fonts as T1 (i.e. accents etc get handled as a single glyph

\usepackage{fancyhdr}               % to make the headers and footer
\usepackage{setspace}               % to set space between lines
\usepackage{vmargin}                % to set page dimenstions
\usepackage{afterpage}              %  allows for page breaks
\usepackage[square, numbers, comma, sort&compress]{natbib}  % for the biliography
\usepackage[centerlast,small,sc]{caption} % for figure and table captions
\usepackage{anyfontsize} % to adjust the font sizes for the declaration pages etc
\usepackage{hyperref}
\usepackage[toc, makeindex, acronym, sort=use]{glossaries}
\RequirePackage[utf8]{inputenc}



\hypersetup{pdfpagemode={UseOutlines},backref=page,bookmarks=true,bookmarksopen=true,
bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
colorlinks,linkcolor={black},citecolor={black},urlcolor={red}, pdfstartview={FitV},unicode,breaklinks=true}

% -------------------------------------------------------------------------------
% The declaration of Authorship
%--------------------------------------------------------------------------------
\newcommand\Declaration[1]{
\btypeout{Declaration of Authorship}
\addtotoc{Declaration of Authorship}
\thispagestyle{plain}
\null\vfil
{\normalsize #1}
\vfil\vfil\null}

% -------------------------------------------------------------------------------
% The copyright form
%--------------------------------------------------------------------------------
\newcommand\Copyright[1]{
\btypeout{Copyright Notice}
\addtotoc{Copyright Notice}
\thispagestyle{plain}
\null\vfil
\begin{center}{\huge\bf Copyright Notice\par}\end{center}
{\normalsize #1}
\vfil\vfil\null}

% -------------------------------------------------------------------------------
% Setting the date to use just the month and year
%--------------------------------------------------------------------------------
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}

%--------------------------------------------------------------------------------
%	Setting the page margins
%--------------------------------------------------------------------------------
\setmarginsrb   { 1.5in}  % left margin
                            { 0.6in}  % top margin
                            { 1.0in}  % right margin
                            { 0.8in}  % bottom margin
                            {  20pt}  % head height
                            {0.25in}  % head sep
                            {   9pt}  % foot height
                            { 0.3in}  % foot sep


%--------------------------------------------------------------------------------
% The page setup
%--------------------------------------------------------------------------------
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000         % No consecutive line hyphens.
\brokenpenalty=10000                        % No broken words across columns/pages.
\widowpenalty=9999                           % Almost no widows at bottom of page.
\clubpenalty=9999                               % Almost no orphans at top of page.
\interfootnotelinepenalty=9999         % Almost never break footnotes.
\setlength{\captionmargin}{20pt}

%--------------------------------------------------------------------------------
% The headers and footers
%--------------------------------------------------------------------------------
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


%--------------------------------------------------------------------------------
%	To fill in the pdf document properties
%--------------------------------------------------------------------------------
\pdfstringdefDisableCommands{\let\\\space}


%--------------------------------------------------------------------------------
%	Document variables
%--------------------------------------------------------------------------------
\newcommand*{\supervisor}[1]{\def\supname{#1}}
\newcommand*{\cosupervisor}[1]{\def\cosupname{#1}}
\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
\newcommand*{\Udegree}[1]{\def\degreename{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\university}[1]{\def\univname{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\UNIVNAME{#1}}
\newcommand*{\department}[1]{\def\deptname{#1}}
\newcommand*{\faculty}[1]{\def\facname{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}
\newcommand*{\studentcode}[1]{\def\SID{#1}}
%--------------------------------------------------------------------------------
%	The abstract page design
%--------------------------------------------------------------------------------
\newenvironment{abstract}{
  \btypeout{Abstract Page}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    {\Large\bf \@title \par} % Thesis title
    \bigskip     \bigskip
    {\huge{\textit{Abstract}} \par}
    \bigskip
\end{center}}
%
%--------------------------------------------------------------------------------
% List of figures, tables and table of contents
%--------------------------------------------------------------------------------
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{4}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}
\renewcommand\tableofcontents{
\btypeout{Table of Contents}
\addtotoc{Contents}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
   \cleardoublepage
}\end{spacing}
}
\renewcommand\listoffigures{
\btypeout{List of Figures}
\addtotoc{List of Figures}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}
              {\MakeUppercase\listfigurename}}
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand\listoftables{
\btypeout{List of Tables}
\addtotoc{List of Tables}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}

%--------------------------------------------------------------------------------
% The lemma and theorem environments
%--------------------------------------------------------------------------------
%\newtheorem{theorem}{Theorem}
%\newtheorem{lemma}[theorem]{Lemma}


%--------------------------------------------------------------------------------
% Acknowledgement page
%--------------------------------------------------------------------------------
\newcommand\acknowledgements[1]{
\btypeout{Acknowledgements}
\addtotoc{Acknowledgements}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Acknowledgements}} \par}\end{center}
{\normalsize #1}
\vfil\vfil\null}

%--------------------------------------------------------------------------------
% Dedication page
%--------------------------------------------------------------------------------
\newcommand\dedicatory[1]{
\btypeout{Dedicatory}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large \sl #1}\end{center}
\vfil\null
\cleardoublepage}

%--------------------------------------------------------------------------------
% back matter
%--------------------------------------------------------------------------------
\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}
\endinput
