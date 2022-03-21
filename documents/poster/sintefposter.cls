% Poster class for SINTEF with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefposter}[2021/03/12 Poster class for SINTEF]

% Language options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax

% Posters will be printed, so they should always be in CMYK.
\PassOptionsToPackage{cmyk}{xcolor}

\LoadClass[12pt, a2paper,innermargin=2cm]{tikzposter}

% Load SINTEF-specific graphic elements
\RequirePackage{sintefcolor}

\definecolorpalette{sintef} {
  \definecolor{colorOne}{named}{sintefgrey}
  \definecolor{colorTwo}{named}{black}
  \definecolor{colorThree}{named}{black}
}

\definecolor{myDarkRed}{cmyk}{0, 0.75, 0.7, 0.18}



\definecolorstyle{sintef} {}{
  % Background Colors
  \colorlet{backgroundcolor}{colorOne!50}
  \colorlet{framecolor}{colorOne!50}
  % Title Colors
  \colorlet{titlefgcolor}{colorThree}
  \colorlet{titlebgcolor}{colorOne!50}
  % Block Colors
  \colorlet{blocktitlebgcolor}{white}
  \colorlet{blocktitlefgcolor}{colorThree}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{colorThree}
  % Innerblock Colors
  \colorlet{innerblocktitlebgcolor}{white}
  \colorlet{innerblocktitlefgcolor}{colorThree}
  \colorlet{innerblockbodybgcolor}{white}
  \colorlet{innerblockbodyfgcolor}{colorThree}
  % Note colors TODO check what makes sense here
  \colorlet{notefgcolor}{colorThree}
  \colorlet{notebgcolor}{sintefyellow}
  \colorlet{noteframecolor}{colorTwo}
}

\definebackgroundstyle{sintef}{
  \draw[inner sep=0pt, line width=0pt, fill=backgroundcolor] 
  (bottomleft) rectangle (topright);
  \node[inner sep=0pt] (metu) at   
  (0.45\paperwidth-9cm,0.5\paperheight-6.5cm)
      {\includegraphics[width=0.4\paperwidth]{images/9.4.png}};
}

\definetitlestyle{sintef}{
width=0.9\paperwidth, roundedcorners=0, linewidth=0pt, innersep=0cm,
titletotopverticalspace=3cm, titletoblockverticalspace=2cm
}{}

\RequirePackage{fontspec}
\renewcommand\TP@maketitle{%
    \begin{minipage}{0.8\titlewidth}
        {\fontsize{35pt}{22pt}\selectfont \@title \par}
        \vspace*{2em}
        {\textcolor{red}{\rule{4cm}{2mm}}\par}
        \vspace*{2em}
        {\LARGE \@author \par}
        \vspace*{1em}
        {\@institute}
    \end{minipage}
}

\defineblockstyle{sintef}{ 
  titlewidthscale=1, bodywidthscale=1, titleleft,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=15mm,
  bodyverticalshift=10mm, roundedcorners=0, linewidth=0pt,
  titleinnersep=1cm, bodyinnersep=1cm
}{
  \draw[color=framecolor, fill=blockbodybgcolor,
  rounded corners=\blockroundedcorners] (blockbody.south west)
  rectangle (blockbody.north east);
  \ifBlockHasTitle
    \draw[color=framecolor, fill=blocktitlebgcolor,
    rounded corners=\blockroundedcorners] (blocktitle.south west) -- 
    (blocktitle.north west) -- (blocktitle.north east) -- (blocktitle.south 
    east);
  \fi
}

\definelayouttheme{sintef}{
  \usecolorstyle[colorPalette=sintef]{sintef}
  \usebackgroundstyle{sintef}
  \usetitlestyle{sintef}
  \useblockstyle{sintef}
}
\usetheme{sintef}

\tikzposterlatexaffectionproofoff
