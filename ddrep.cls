% Author: Dariusz Dwornikowski
% dariusz (dot) dwornikowski (at) cs.put.poznan (dot) pl
% Based on bbarticle by Bartosz Brodecki and dcsarticle by Cezary Sobaniec
% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ddrep}[2014/01/24 v1.3 DD Script]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{geometry}
\RequirePackage[pagestyles,clearempty,psfloats,newlinetospace]{titlesec}
\RequirePackage{times}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
%\RequirePackage[scaled=0.82]{beramono}
\RequirePackage{lastpage}
\RequirePackage[dotinlabels]{titletoc}
\RequirePackage[nottoc,notlot,notlof,numbib]{tocbibind}
\RequirePackage{babel}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage{listingsutf8}
\RequirePackage{hyperref}
% for the \ding{} command to generate dingbats
\RequirePackage{pifont}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

\definecolor{light-gray}{gray}{0.95}
\definecolor{white}{rgb}{1, 1, 1}
\definecolor{green}{rgb}{0,0.45,0}
\definecolor{red}{rgb}{0.8, 0.0, 0.0}
\definecolor{blue}{rgb}{0.0, 0.0, 0.8}
\definecolor{gray}{rgb}{0.6,0.6,0.6}
\definecolor{dkgreen}{rgb}{0,0.35,0}
\definecolor{dkblue}{rgb}{0, 0.0, 0.5}
\definecolor{dkred}{rgb}{0.6, 0.0, 0.0}
\definecolor{ltgray}{rgb}{0.8,0.8,0.8}
\definecolor{midgray}{rgb}{0.4,0.4,0.4}
\definecolor{dkgray}{rgb}{0.2,0.2,0.2}

\definecolor{bgcolor}{rgb}{0.90,0.90,0.90}
\definecolor{framebg}{rgb}{0.985,0.985,0.985}
\definecolor{framerule}{rgb}{0.8,0.8,0.8}
\definecolor{directive}{rgb}{0.35,0.0,0.35}
\definecolor{linkcolor}{rgb}{0.1,0.1,0.6}
\definecolor{pathcolor}{rgb}{0.5,0,0}
\definecolor{namecolor}{rgb}{0.5,0,0.5}
\definecolor{cmdcolor}{rgb}{0,0.3,0}
\definecolor{mancolor}{rgb}{0.5,0,0}
\definecolor{codecolor}{rgb}{0.5,0,0}
\newcommand{\command}[1]{\colorbox{light-gray}{\texttt{#1}}}

\newif\if@pplogo 
%%% Symbols %%% 

\newlength{\lstxframesep}
\setlength{\lstxframesep}{0.5em}
\newlength{\lstyframesep}
\setlength{\lstyframesep}{0.5ex}
\newlength{\lstframewidth}
\setlength{\lstframewidth}{0.4pt}
\newlength{\lstxmargin}
\setlength{\lstxmargin}{\lstxframesep}
\addtolength{\lstxmargin}{\lstframewidth}

\newcommand{\ddcode}[1]{\textcolor{codecolor}{\texttt{\ttsloppy #1}}}
\newcommand{\ddpath}[1]{\textcolor{pathcolor}{\path{#1}}}
\newcommand{\ddkbd}[1]{\fbox{\small\sffamily{}#1}}
\newcommand{\name}[1]{\textcolor{namecolor}{\textsf{#1}}}



% default page layout
\newlength{\bindinglen}
\setlength{\bindinglen}{0cm}
\geometry{a4paper,tmargin=2.9cm,bmargin=2.5cm,lmargin=3cm,rmargin=3cm,
          headheight=2cm,headsep=0.9cm,footskip=1.2cm,
          marginparwidth=0.3cm,marginparsep=0.3cm,
          bindingoffset=\bindinglen}

% twoside
\DeclareOption{twoside}{
  \geometry{a4paper,twoside=true,lmargin=2cm,rmargin=2cm,
						tmargin=2.9cm,bmargin=2.5cm,headheight=2cm,headsep=0.9cm,
            asymmetric,
            bindingoffset=\bindinglen}
}


% fonts
\newcommand{\secfont}{\sffamily}
\def\normalsize{\@setfontsize{\normalsize}{10.27pt}{12pt}}

\lstdefinestyle{plain}{%
        frame=,backgroundcolor=,
        framexleftmargin=0pt,framexrightmargin=0pt,
        framextopmargin=0pt,framexbottommargin=0pt,
        xleftmargin=0pt,xrightmargin=0pt,
        aboveskip=\medskipamount,belowskip=\medskipamount}
\lstdefinestyle{linesbg}{%
        frame=tb,framesep=0pt,
        rulecolor=\color{framerule},backgroundcolor=\color{framebg},
        framexleftmargin=\lstxframesep,framexrightmargin=\lstxframesep,
        framextopmargin=\lstyframesep,framexbottommargin=\lstyframesep,
        xleftmargin=\lstxmargin,xrightmargin=\lstxmargin,
        aboveskip=\bigskipamount,belowskip=\bigskipamount}
\lstdefinestyle{linesbgn}{style=linesbg,numbers=left,
                          framexleftmargin=3em,xleftmargin=3em}
%listings
\lstset{tabsize=2,extendedchars=true,
        framerule=\lstframewidth,
        escapeinside={/*@}{@*/},
        basicstyle=\ttfamily\small,
        showspaces=false,showstringspaces=false,
        includerangemarker=false,rangeprefix=//,
        language=,numberstyle=\tiny\sffamily,
        inputencoding=utf8/latin2,
        belowcaptionskip=\medskipamount}
\lstset{style=linesbg}

% matters
\newif\if@mainmatter \@mainmattertrue
\newcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}

% default colors
\lstset{language=c}
\lstset{keywordstyle=\bfseries\color{dkgreen},
        commentstyle=\itshape\color{dkblue},
        stringstyle=\color{dkred},
        directivestyle=\color{directive}}
\lstset{language=}


% lists spacing
% \def\enumerate{%
%   \ifnum \@enumdepth >\thr@@\@toodeep\else
%     \advance\@enumdepth\@ne
%     \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
%       \expandafter
%       \list
%         \csname label\@enumctr\endcsname
%         {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
%         \if@firmlists\firmlist\fi%
%   \fi}
% 
% \def\itemize{%
%   \ifnum \@itemdepth >\thr@@\@toodeep\else
%     \advance\@itemdepth\@ne
%     \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
%     \expandafter
%     \list
%       \csname\@itemitem\endcsname
%       {\def\makelabel##1{\hss\llap{##1}}}%
%       \if@firmlists\firmlist\fi%
%   \fi}
% 
% \renewenvironment{description}
%   {\list{}{\labelwidth\z@ \itemindent-\leftmargin
%            \let\makelabel\descriptionlabel}%
%            \if@firmlists\firmlist\fi}
%   {\endlist}


% additional commands
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
% heading indent
\newlength{\headindent}
\setlength{\headindent}{\bindinglen}
\widenhead[\headindent][0pt]{\headindent}{0pt}

% \renewcommand{\date}[1]{\gdef\@date{#1}\renewcommand{\dataRaportu}{#1}}
\def\email#1{\def\@email{\small\tt#1}}
% \newcommand{\logopp}{%
% 	\includegraphics[scale=0.1]{dsg}
% }
 \newcommand{\logopp}{%
 	% \includegraphics[scale=0.2]{pp}
   \includegraphics[scale=0.3]{dsg}
 }
\newcommand{\maketitlepage}{%
  \begin{center}
	\logopp~\\[0.5cm]
  \textsc{\LARGE Pozna\'n University of Technology}\\[1.0cm]
  \textsc{\Large Institute of Computing Science}\\[0.5cm]
  \HRule \\[0.4cm]
  {\huge \bfseries\@title \\[0.4cm]}

  \HRule \\[1.5cm]
      \large
      \@author \\[1.0cm]
      \@email
  \vfill
  {\large \@date}
\end{center}
\newpage
}
%\newpagestyle{main}[\normalsize]{
\newpagestyle{main}[\footnotesize\itshape]{
%  \headrule
%  \footrule
  \sethead[\parbox[b]{\linewidth}{\fontsize{7.0}{10}\selectfont\resizebox{\linewidth}{\height}{\sffamily}\vspace{-0.4ex}}]
		[]
		[]
		{\parbox[b]{\linewidth}{
			\fontsize{7.0}{10}
			\selectfont
			% \resizebox{\linewidth}{\height}{}
			\vspace{0.8ex}
		}}
		{}
		{}
  \renewcommand{\makefootrule}{\rule[1.2\baselineskip]{\linewidth}{0.4pt}}
  \setfoot[\thepage][][\@title]%
          {\@title}{}{\thepage}
}
\pagestyle{main}


% titlesec
\titleformat{\section}{\fontsize{15}{17}\sffamily\bfseries\filright}
            {\parbox[b]{1cm}{\thesection.}}{0cm}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

\titleformat{\subsection}{\fontsize{13}{15}\sffamily\bfseries\filright}
            {\hspace{-5mm}\parbox[b]{13mm}{\filleft\thesubsection.}}{2mm}{}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\titleformat{\subsubsection}{\fontsize{12}{13}\sffamily\bfseries\filright}
            {\parbox[b]{1.8cm}{\filleft\thesubsubsection.}}{2mm}{}
\titlespacing*{\subsubsection}{-20pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\titleformat{\paragraph}{\fontsize{11}{12}\sffamily\bfseries\filright}{}{0em}{}
\titlespacing*{\paragraph}{0pt}{1ex plus 0.5ex minus .2ex}{0.2ex plus .1ex}


% titletoc
\newlength{\tocsep}
\setlength{\tocsep}{0.6ex}
  \titlecontents{section}[1cm]{\vspace{\tocsep}}%
  {\bfseries\contentslabel{1cm}}{\bfseries\hspace{-1cm}}%
  {~\titlerule*[0.2em]{.}\contentspage}[\vspace{\tocsep}]
\titlecontents{subsection}[1cm]{\vspace{\tocsep}}%
  {\contentslabel{1cm}}{\hspace*{0em}}%
  {~\titlerule*[0.2em]{.}\contentspage}[\vspace{\tocsep}]

% numbering and TOC depth
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

% paragraph separation
\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}

% abstract environment
\renewenvironment{abstract}{
  \section*{\abstractname}
  \addcontentsline{toc}{section}{\abstractname}
}
% {\clearpage}

\providecommand{\tabularnewline}{\\}


% float placement
\setcounter{totalnumber}{3}
\setcounter{bottomnumber}{1}
\setcounter{topnumber}{1}
\renewcommand{\textfraction}{0.1}
\renewcommand{\topfraction}{0.8}
\renewcommand{\bottomfraction}{0.7}
\renewcommand{\floatpagefraction}{0.7}


% default date
\date{\today}


% title page - here goes the hell ;-)
\newlength{\tmplen}
\renewcommand{\and}{\par}
\renewcommand{\maketitle}{%
  \setlength{\tmplen}{\parskip}
  \setlength{\parskip}{0pt}
  \thispagestyle{main}
	{
  	\fontsize{12.5}{15}\selectfont
  	\ttfamily
  	\begin{center}\textbf{\LARGE\@title}\par
		\vspace{4mm}
		\fontsize{10}{12}\selectfont{\@author}\par
    \vspace{4mm}
		\fontsize{10}{12}\selectfont{\@email}\par
    \vspace{4mm}
		\fontsize{10}{12}\selectfont{\@date}
  \end{center}
	}
}

% booktabs
\setlength{\heavyrulewidth}{1pt}
\setlength{\lightrulewidth}{0.4pt}
\setlength{\aboverulesep}{0.3ex}
\setlength{\belowrulesep}{0.3ex}


% Options

% B&W
\DeclareOption{bw}{
  \lstset{language=c}
  \lstset{keywordstyle=\bfseries,commentstyle=\itshape,
          stringstyle=,directivestyle=}
  \lstset{language=}
  \definecolor{directive}{rgb}{0, 0, 0}
  \definecolor{linkcolor}{rgb}{0, 0, 0}
  \definecolor{pathcolor}{rgb}{0, 0, 0}
  \definecolor{namecolor}{rgb}{0, 0, 0}
  \definecolor{cmdcolor}{rgb}{0, 0, 0}
  \definecolor{mancolor}{rgb}{0, 0, 0}
  \definecolor{codecolor}{rgb}{0, 0, 0}
}


\ProcessOptions\relax
