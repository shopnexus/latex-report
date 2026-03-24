\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-thesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,oneside]{memoir}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,mathptmx}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{tikz}
\RequirePackage[center]{caption}

\RequirePackage{fancyhdr,hyperref}
\RequirePackage[super,square,sort]{natbib}

% Vietnamese labels
\RequirePackage[vietnamese]{babel}

% Custom commands
\newcommand{\Month}{
  \ifcase \the\month
  \or Tháng 1
  \or Tháng 2
  \or Tháng 3
  \or Tháng 4
  \or Tháng 5
  \or Tháng 6
  \or Tháng 7
  \or Tháng 8
  \or Tháng 9
  \or Tháng 10
  \or Tháng 11
  \or Tháng 12
  \fi
}

\newcommand{\@upperuniname}{BỘ KHOA HỌC VÀ CÔNG NGHỆ}
\newcommand{\@uniname}{HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG}

\newcommand{\@deptname}{-------------------------------------}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}

\newcommand{\@reporttype}{Graduation Thesis}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}

% \newcommand{\@stumajor}{Computer Science}
% \newcommand{\stumajor}[1]{\renewcommand{\@stumajor}{#1}}

\renewcommand{\@title}{Report title}

\newcommand{\@defcouncil}{Council}
\newcommand{\defcouncil}[1]{\renewcommand{\@defcouncil}{#1}}

\newcommand{\@supervisor}{Supervisor}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

\newcommand{\@secretary}{Secretary}
\newcommand{\secretary}[1]{\renewcommand{\@secretary}{#1}}

\newcommand{\@reviewer}{Reviewer}
\newcommand{\reviewer}[1]{\renewcommand{\@reviewer}{#1}}

\newcommand{\@groupnum}{GroupNum}
\newcommand{\groupnum}[1]{\renewcommand{\@groupnum}{#1}}

\newcommand{\@stuname}{STUDENT:\ H (xxxxxxx)}
\newcommand{\stuname}[1]{\renewcommand{\@stuname}{#1}}

\newcommand{\@reportplace}{Hà Nội}
\newcommand{\reportplace}[1]{\renewcommand{\@reportplace}{#1}}

\newcommand{\@reporttime}{\Month{} năm \the\year}
\newcommand{\reporttime}[1]{\renewcommand{\@reporttime}{#1}}

% Configurations
\usetikzlibrary{calc}

\geometry{
  paper=a4paper,
  left=3cm,
  right=2cm,
  vmargin=2cm,
  includeheadfoot=true,
  headheight=30pt
}

\renewcommand{\large}{\fontsize{15}{15}\selectfont}
\renewcommand{\Large}{\fontsize{20}{20}\selectfont}

\OnehalfSpacing
\raggedbottom
\renewcommand{\arraystretch}{1.2}

% Set depth of numbering for sections and table of contents
\setsecnumdepth{subsection}
\settocdepth{subsection}

% Set numwidths (see Section 9)
\setlength{\cfttablenumwidth}{3em}
\setlength{\cftfigurenumwidth}{3em}

\AtBeginDocument{
  \renewcommand*\bibname{Tài liệu tham khảo}
  \renewcommand{\contentsname}{Mục lục}
  \renewcommand{\listtablename}{Danh sách bảng}
  \renewcommand{\listfigurename}{Danh sách hình}
  \renewcommand{\chaptername}{Chương}
  \renewcommand{\appendixname}{Phụ lục}
}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=red,
  urlcolor=blue
}

\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{fancy}
\fancyhf{}

\if@twoside
  \fancyhead[EL,OR]{\bfseries\nouppercase\rightmark}
\else
  \fancyhead[R]{\bfseries\nouppercase\rightmark}
\fi

\fancyfoot[C]{\thepage}

% Custom pages and sections
\def\coverpage{
  \pagestyle{empty}
  \large\bfseries

  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=3pt](
    $(current page.north west) + (3.0cm,-2.0cm)$
    ) rectangle (
    $(current page.south east) + (-2.0cm,2.0cm)$
    );
    \draw[line width=1pt](
    $(current page.north west) + (2.9cm,-1.9cm)$
    ) rectangle (
    $(current page.south east) + (-1.9cm,1.9cm)$
    );
  \end{tikzpicture}

  \vspace*{-3\baselineskip}
  \begin{center}
    \MakeUppercase{\@upperuniname}

    \MakeUppercase{\@uniname}

    \MakeUppercase{\@deptname}
    \vfill
    \includegraphics[scale=0.6]{graphics/ptit.png}
    \vfill
    \MakeUppercase{\@reporttype}
    \vfill
    {\Large\MakeUppercase{\parbox[c]{0.8\linewidth}{\centering\@title}}}
    % \vfill
    % {\mdseries Major: \@stumajor}
  \end{center}
  \vfill
  \hfill\parbox[t]{13cm}{
    Môn học \@defcouncil

    Giảng viên hướng dẫn: \parbox[t]{7cm}{\@supervisor}

    %MEMBER SECRETARY: \@secretary
    % REVIEWER: \@reviewer
    Thực hiện bởi nhóm \parbox[t]{7cm}{\@groupnum} 


    \@stuname
  }
  \vfill
  \mdseries
  \begin{center}
    \MakeUppercase{\@reportplace, \@reporttime}
  \end{center}
  \normalsize
  \clearpage%

  \pagestyle{fancy}
}

\providecommand{\phantomsection}{}
\newenvironment{preface}[1]{
  \clearpage%
  \thispagestyle{plain}
  {\noindent \bfseries \Huge #1}%
  \phantomsection\addcontentsline{toc}{chapter}{#1}
  \vspace{1em}
  \par
}{
  \clearpage%
}
