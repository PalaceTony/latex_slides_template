\ProvidesClass{lutbeamer}[2021/12/17]

\RequirePackage{etoolbox}
\newcommand{\@DashColor}{darkblue}
\newcommand{\@DashHeight}{1.5mm}

\newcommand{\testcolor}[1]{\colorbox{#1}{\textcolor{#1}{test}} \texttt{#1}}
\newcommand{\hrefcol}[2]{\textcolor{orange}{\href{#1}{#2}}}


\newbool{LUTdark}
\PassOptionsToClass{aspectratio=169}{beamer} % Default, may be overridden
\DeclareOption{cyandash}{\renewcommand{\@DashColor}{darkblue}}
\DeclareOption{nodash}{\renewcommand{\@DashHeight}{0mm}}
\DeclareOption{light}{\boolfalse{LUTdark}}
\DeclareOption{dark}{\booltrue{LUTdark}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}


% \usepackage{caladea,carlito}
% \renewcommand{\familydefault}{\sfdefault}

\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}



\RequirePackage{graphicx,lutcolor,ifthen}

% Following commands will not be activated for article mode.
\mode<presentation>

% No navigation symbols
\setbeamertemplate{navigation symbols}{}

% phantom items 
\setbeamercovered{transparent} % invisible

% nomenclature
\usepackage[symbols,nomain,acronyms,makeindex,section=subsection]{glossaries-extra}
\newglossary{latin}{lat}{latout}{Latin alphabet}
\newglossary{greek}{grk}{grkout}{Greek alphabet}
\newglossary{sub}{sub}{subout}{Subscripts}
\newglossary{sup}{sup}{supout}{Superscripts}
\newglossary{dimless}{diml}{dimlout}{Dimensionless numbers}
\newglossary{notation}{not}{notout}{Notation}
\glsnoexpandfields
\glstocfalse
% \makeglossaries
\input{nomenclature.tex}

% packages
\usepackage{amsfonts,amsmath,oldgerm}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\minimize}{minimize} % minimize operator
\usepackage[T1]{fontenc}


\usepackage{graphicx}
\usepackage{subfig}
\usepackage{tikz}
\usepackage{verbatim}


% line spacing
\linespread{1.1}\selectfont % <---

% item spacing
% \let\tempone\itemize
% \let\temptwo\enditemize
% \renewenvironment{itemize}{\tempone\addtolength{\itemsep}{0.35\baselineskip}}{\temptwo}

% bibliography style
\usepackage[style=apa, natbib=true, backend=biber]{biblatex}
% \usepackage[autocite=footnote,style=authortitle,backend=bibtex]{biblatex} 
\addbibresource{references.bib}
% \let\cite\autocite

% Set colours
\setbeamercolor{alerted text}{fg=darkblue}
\setbeamercolor{headline}{fg=white,bg=orange}
\setbeamercolor{author}{fg=black}
\setbeamercolor{example text}{fg=orange,bg=grey}
\setbeamercolor{block title}{fg=white,bg=darkblue}
\setbeamercolor{block body}{fg=black,bg=grey}
\setbeamercolor{block body example}{fg=black,bg=grey}
\setbeamercolor{caption name}{fg=black}
\newcommand{\@LUTlogo}{logos/HKUSTGZ_icon_titile.jpg}
\ifbool{LUTdark}{
  \setbeamercolor{normal text}{fg=white}
  \setbeamercolor{background canvas}{bg=black}
  \setbeamercolor{structure}{fg=white}
  \setbeamercolor{title}{fg=white,bg=black}
  \setbeamercolor{footline}{fg=white}
  \setbeamercolor{itemize items}{fg=darkblue}
  \renewcommand{\@LUTlogo}{logos/LUT-LOGO-WHITE-PNG}
}{
  \setbeamercolor{normal text}{fg=black}
  \setbeamercolor{background canvas}{bg=white}
  \setbeamercolor{frametitle}{fg=black,bg=white}
  \setbeamercolor{structure}{fg=darkblue}
  \setbeamercolor{footline}{fg=black}
  \setbeamercolor{itemize items}{fg=darkblue}
  \renewcommand{\@LUTlogo}{logos/HKUSTGZ_icon_titile.jpg}
}

% font sizes
\usefonttheme[onlymath]{serif}
\setbeamerfont{author}{size=\footnotesize}
\setbeamerfont{date}{size=\scriptsize}
\setbeamerfont{caption}{size=\fontsize{6}{8}\selectfont}
\setbeamerfont{normal text}{size=\footnotesize}
\setbeamerfont{equation}{size=\footnotesize}
\setbeamerfont{subsection in toc}{size=\footnotesize}
\setbeamerfont{section in toc}{size=\normalsize}
\renewcommand*{\bibfont}{\footnotesize}
\setbeamertemplate{itemize/enumerate body begin}{\footnotesize}
\setbeamertemplate{itemize/enumerate subbody begin}{\scriptsize}

% Code to get prettier boxes
\setbeamertemplate{blocks}[rounded][shadow=true]

% Bullets in several levels
\setbeamertemplate{itemize item}{\textbf{\normalsize\guillemotright}}
\setbeamertemplate{itemize subitem}{\normalsize\textendash}
\setbeamertemplate{itemize subsubitem}{\normalsize\textbullet}

% pink squares and triangle for items
\newcommand{\redsquareitem}{\item[\textcolor{pink}{\tiny$\blacksquare$}]}
\newcommand{\redtriangleitem}{\item[\textcolor{pink}{$\blacktriangleright$}]}

% to have a separate numbering for back-up slides 
\usepackage{appendixnumberbeamer}

% table of content in itemize style
\setbeamertemplate{section in toc}[square]
\setbeamertemplate{subsection in toc}[default]

% Define frame title and subtitle layout
\usepackage{adjustbox}
\setbeamertemplate{frametitle}
{   \hbox{%
    \begin{beamercolorbox}[wd=.75\paperwidth,ht=17mm,dp=0mm, left]{frametitle}
      \usebeamerfont{frametitle}\MakeUppercase{\insertframetitle}\\
      \vspace{0.1ex}{\textcolor{\@DashColor}{\rule[0ex]{1cm}{\@DashHeight}}
        \usebeamerfont{framesubtitle}\insertframesubtitle~\vphantom{phantomText}}\\
    \end{beamercolorbox}% 
    \begin{beamercolorbox}[wd=.25\paperwidth,ht=15mm,dp=2mm, left]{frametitle}
      \hfill{\vspace{0ex}\adjustbox{margin=-5em 0.8em 0em 0em}{\includegraphics[height=4ex]{\@LUTlogo}}}
    \end{beamercolorbox}
  }%
  \vskip0pt%
}

% 
\newcommand{\setdepartment}[1]{\def\department{#1}}
\titlegraphic{\adjustbox{margin=-4.7em 0em 0em 0em}{\includegraphics[height=5ex]{\@LUTlogo}}}

% Define the title page
\setbeamertemplate{title page}
{
  \hbox{%
    \begin{beamercolorbox}[wd=0.74\paperwidth,sep=8pt,left]{institute}
      \usebeamerfont{institute}{\department\par \insertinstitute}
    \end{beamercolorbox}
    \begin{beamercolorbox}[wd=0.2\paperwidth,sep=8pt,left]{institute}
      \usebeamercolor[fg]{titlegraphic}\hfill\inserttitlegraphic
    \end{beamercolorbox}
  }%
  \begin{centering}
    \begin{beamercolorbox}[sep=8pt,left]{title}
      \usebeamerfont{title}\MakeUppercase{\inserttitle}\par%
      \textcolor{\@DashColor}{\rule[0ex]{1cm}{\@DashHeight}}
    \end{beamercolorbox}%
    \begin{beamercolorbox}[sep=8pt,left]{subtitle}
      \ifx\insertsubtitle\@empty%
      \else%
        \vskip0em%
        {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
      \fi%     
    \end{beamercolorbox}
    \vskip0em\par
    \footnotesize{
    \begin{beamercolorbox}[sep=8pt,left]{author}
      \begin{tabular}[t]{@{}l@{\hspace{10pt}}p{0.45\textwidth}@{}}
        % Prime Supervisor: &  \\
        % Co-Supervisor: &  \\
        % Project Mentor: &  \\
      \end{tabular}
    \end{beamercolorbox}
    }
  \end{centering}
}


% % Include necessary packages
% \usepackage{graphicx}
% \usepackage{tikz}

% % Define the title page
% \setbeamertemplate{title page}
% {
%   \begin{tikzpicture}[remember picture,overlay]
%     \node[at=(current page.center)] {\includegraphics[width=\paperwidth,height=\paperheight]{logos/blurred_bg.pdf}};
%   \end{tikzpicture}
%   \hbox{%
%     \begin{beamercolorbox}[wd=0.74\paperwidth,sep=8pt,left]{institute}
%       \usebeamerfont{institute}{\department\par \insertinstitute}
%     \end{beamercolorbox}
%     \begin{beamercolorbox}[wd=0.2\paperwidth,sep=8pt,left]{institute}
%       \usebeamercolor[fg]{titlegraphic}\hfill\inserttitlegraphic
%     \end{beamercolorbox}
%   }%
%   \begin{centering}
%     \begin{beamercolorbox}[sep=8pt,left]{title}
%       \usebeamerfont{title}\MakeUppercase{\inserttitle}\par%
%       \textcolor{\@DashColor}{\rule[0ex]{1cm}{\@DashHeight}}
%     \end{beamercolorbox}%
%     \begin{beamercolorbox}[sep=8pt,left]{subtitle}
%       \ifx\insertsubtitle\@empty%
%       \else%
%         \vskip0em%
%         {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
%       \fi%     
%     \end{beamercolorbox}
%     \vskip0em\par
%     \footnotesize{
%     \begin{beamercolorbox}[sep=8pt,left]{author}
%       \begin{tabular}[t]{@{}l@{\hspace{10pt}}p{0.45\textwidth}@{}}
%         Prime Supervisor: & Prof. Lei CHEN \\
%         Co-Supervisor: & Prof. Jia LI \\
%         Project Mentor: & Dr. Jenny, Beijinni LI \\
%       \end{tabular}
%     \end{beamercolorbox}
%     }
%   \end{centering}
% }



% Define the bottom of each standard frame
\setbeamertemplate{footline}{
  % bottom bar
  \begin{beamercolorbox}[wd=\paperwidth, ht=10pt, dp=1pt]{footline}
    \usebeamerfont{footline}

    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=south west,
        xshift=10mm,
        yshift=.4mm]
      at (current page.south west)
      {\insertdate};
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=south west,
        xshift=35mm,
        yshift=.4mm]
      at (current page.south west)
      {\insertauthor, DSA Thrust, Information Hub,~\insertshortinstitute};
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=south east,
        xshift=-5mm,
        yshift=0.5mm]
      at (current page.south east)
      {\insertframenumber \,/\, \inserttotalframenumber};
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=south east,
        xshift=-15mm,
        yshift=0.4mm]
      at (current page.south east)
      {\insertshorttitle};
    \end{tikzpicture}

  \end{beamercolorbox}
}

% % add navigation symbols
% \setbeamercolor{mycolor}{fg=white}%,bg=structure!30}
% \addtobeamertemplate{footline}{
%   \leavevmode%
%   \hbox{%
%     \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=.5ex,right,rightskip=5mm]{mycolor}%
%       \usebeamercolor[fg]{navigation symbols}\insertslidenavigationsymbol%
%       \insertframenavigationsymbol%
%       \insertsubsectionnavigationsymbol%
%       \insertsectionnavigationsymbol%
%       \insertdocnavigationsymbol%
%       \insertbackfindforwardnavigationsymbol%
%     \end{beamercolorbox}%
%   }%
%   \vskip0.5pt%
% }{}

\mode<all>
