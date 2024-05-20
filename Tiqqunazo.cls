%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tiqqunazo
%
% Una clase de LaTeX personalizada basada en la clase extarticle,
%
% Fuertemente inspirada en el blog en español de Tiqqun y por la clase
% The Martian Report de Marina Rose "Mars" Geldard, con adaptaciones
% para fines editoriales.
%
% Autor: Aradenatorix
% 
% Disponible para uso de terceros bajo:
%
% La licencia MIT (https://opensource.org/licenses/MIT)
%
% Última actualización: 22/05/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Tiqqunazo}[2023 Project Documentation LaTeX class]

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA Y DEL CUERPO BASE
\LoadClass[8pt,twoside]{extbook}
% Packages Loading
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  % headheight=12pt %,          % ajuste del tamaño de la cabecera
  % top=0.6in,                % mrgen superior
  % bottom=0.6255in,          % margen inferior
  % left=0.43in,            % margen izquierdo
  % right=0.43in            % margen derecho
  ]{geometry}
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage[spanish=mexican]{csquotes}
\RequirePackage{xparse}
\RequirePackage{markdown}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig2}
% Font family definitions
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{lipsum} % TODO: Remover
\RequirePackage{epigraph}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{emoji}
\RequirePackage{fontawesome} % En vez del anterior
% \RequirePackage{fontspec}
% \RequirePackage{titlesec}

% Font Definitions
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular.ttf}
\newfontfamily\HackRegular{HackNerdFont-Regular.ttf}
% Title fonts
% \titleformat{\section}{\FiraRegular\selectfont\Large} % Large, bold
% \titleformat{\subsection}{\HackRegular\selectfont\normal} % Normal size, bold
% \titleformat{\subsubsection}{\HackRegular\selectfont\small} % Small, bold


% INFORMACIÓN DE USUARIO
  \newcommand{\imagefolder}[1]{\def\@imagefolder{#1}}
  \newcommand{\version}[1]{\def\@revision{#1}}
  \newcommand{\project}[1]{\def\@project{#1}}
  \newcommand{\logo}[1]{\def\@logo{#1}}
  \newcommand{\footertext}[2]{\def\@lfooter{#1} \def\@rfooter{#2}}
  \newcommand{\shorttitle}[1]{\def\@shorttitle{#1}} % Comando para definir un título corto
  \newcommand{\nofootertext}{\def\@lfooter{} \def\@rfooter{}}
  \newcommand{\imageref}[1]{\def\@imageref{#1}}
% ESTABLECE VALORES POR DEFECTO EN CASO CONTRARIO
\title{Documento de prueba}
\author{~}
\project{~}
\imagefolder{.}
\version{Versi\'on 2.0}
\def\@lfooter{Plantar Cara}
\def\@rfooter{\@author}
\imageref{~}

% PERSONALIZACIÓN DEL ÍNDICE DE CONTENIDOS
\renewcommand{\cftdot}{}
\cftpagenumbersoff{subsection}
\setcounter{tocdepth}{3}
\renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsecaftersnum}{\end{lrbox}}
\setlength{\cftsecnumwidth}{0pt}
\renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsubsecaftersnum}{\end{lrbox}}
\setlength{\cftsubsecnumwidth}{0pt}
\cftsetindents{subsection}{0em}{0em}
% set font for main toc title
\renewcommand{\cfttoctitlefont}{\DejaVuSans\Huge\bfseries}
\renewcommand{\cftsecfont}{\DejaVuSans}       % Set font for section entries
\renewcommand{\cftsubsecfont}{\DejaVuSans}    % Set font for subsection entries
% todo: small size for page font
\renewcommand{\cftsecpagefont}{\DejaVuSans}   % Set font for section page numbers
\renewcommand{\cftsubsecpagefont}{\DejaVuSans}% Set font for subsection page numbers

% CREACIÓN DE LA CARÁTULA
\AtBeginDocument{\pagestyle{fancyplain}\titlepage%
  \ifsectionnumbers 
    \renewcommand{\thesection}{\arabic{section}}
    \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
    \renewcommand{\thesubsubsection}{
      \arabic{section}.\arabic{subsection}.\arabic{subsubsection}
    } 
  \else 
    \ifsubsectionnumbers 
      \renewcommand{\thesection}{\kern-1em}
      \renewcommand{\thesubsection}{\arabic{subsection}}
      \renewcommand{\thesubsubsection}{
        \arabic{subsection}.\arabic{subsubsection}
      }
    \else 
      \setcounter{secnumdepth}{0} 
    \fi 
  \fi 
}
\renewcommand{\titlepage}{%
  \thispagestyle{title}
  \begin{flushleft}
    {\DejaVuSans\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
    \DejaVuSans\Large\@author
    \vspace{12pt}\linebreak 
    \textbf{\DejaVuSans\Huge\@project}
    \vspace{9pt}\linebreak 
    \ifdefined\@logo
      \edef\tmp{%
        \noexpand%
        \includegraphics[width=0.3\textwidth]{\@imagefolder/\@logo}%
        }\tmp%
    \fi 
    \linebreak\vfill
  \end{flushleft}

  % \begin{centering}
  %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
  %   \vspace{10pt}\linebreak
  % \end{centering}
  % \rule{\textwidth}{1pt} 
  \pagebreak 
}

% ESTILO DE CABECERA/PIE DE PÁGINA
\fancypagestyle{title}{%
  \renewcommand{\headrulewidth}{0pt} 
  \fancyhf{}
  \lhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
  \rhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
}

\renewcommand{\headrulewidth}{0pt}
\fancyhead[RE,RO]{}
\fancyhead[LE,LO]{}
\lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
\cfoot{\footnotesize\DejaVuSans\thepage}
\rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}

% CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
\renewcommand\section{%
  \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\DejaVuSans\Large\MakeUppercase}%
}
\let\oldsection\section
\RenewDocumentCommand{\section}{s m g o}{%
  \clearpage
  \IfNoValueF{#3}
  {
    \includegraphics[width=\textwidth]{\@imagefolder/#3}
    \linebreak    
  }
  \rule{\textwidth}{1pt}
  \IfBooleanTF{#1}{\oldsection*{#2}}{\oldsection{#2}}%
  \IfNoValueF{#4}{\label{sec:#4}\ifdrafting
                                  \textit{\color{magenta}~Anchor sec:#4}
                                \fi
                  }
}

% Set font for part title
\titleformat{\part}[display]{\DejaVuSans\Huge\bfseries}{\partname~\thepart}{0pt}{}

% CONFIGURACIÓN DE ESTILOS DE ENCABEZAMIENTO DE SUBSECCIÓN
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}{2ex}{2ex}{%
    \DejaVuSans\large}%
} 
\let\oldsubsection\subsection 
\RenewDocumentCommand{\subsection}{s m o}{%
  \IfBooleanTF{#1}{\oldsubsection*{#2}}{\oldsubsection{#2}}%
  \IfNoValueF{#3}{\label{sub:#3}\ifdrafting
                                  \textit{\color{magenta}~Anchor sub:#3}
                                \fi
                  }
}

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\DejaVuSans\large}%
}
\let\oldsubsubsection\subsubsection
\RenewDocumentCommand{\subsubsection}{s m o}{%
  \IfBooleanTF{#1}{\oldsubsubsection*{#2}}{\oldsubsubsection{#2}}%
  \IfNoValueF{#3}{\label{sss:#3}\ifdrafting
                                  \textit{\color{magenta}~Anchor sss:#3}
                                \fi
                  } 
}

\newcommand{\subsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\textbf{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\textbf{---- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{#1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{---- #1}
  \end{flushleft}
}

% OPCIONES DE BOSQUEJO
\newif\ifdrafting 
\newcommand{\drafting}{%
  \draftingtrue 
} 
\newcommand{\temp}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{blue}#1} 
  \fi 
}

\newcommand{\crit}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{red}#1} 
  \fi 
}

% CONFIGURACIÓN DEL TEXTO DE HIPERVÍNCULO
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
  \IfNoValueTF{#2}{% 
    \href{#1}{\DejaVuSans\color{linkblue}#1}%
  }
  {%
    \href{#1}{\DejaVuSans\color{linkblue}#2}%
  }%
}

% CONFIGURACIÓN DE IMÁGENES DE CABECERA DE SECCIÓN
\AtEndDocument{\DejaVuSans\vfill\textit{\@imageref}}
\NewDocumentCommand{\image}{m m g}{%
  \begin{figure}[h!]
    \centering
    \includegraphics[width=#1\textwidth]{\@imagefolder/#2}
    \IfNoValueF{#3}{
      \caption{\label{img:#2} #3}
    }
  \end{figure}
}

% APOSTILLAS
\renewcommand{\arraystretch}{1.5} 
\NewDocumentCommand{\tipbox}{s m m}{%
  \IfBooleanTF{#1}{%
    \begin{wrapfigure}{r}{0.33\textwidth}
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \DejaVuSans\textbf{\textcolor{white}{#2}}\\
        \DejaVuSans\textit{#3}\\
        \hline
      \end{tabular}
    \end{wrapfigure}
  }{%
    \begin{figure}[h]
      \centering
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \DejaVuSans\textbf{\textcolor{white}{#2}}\\
        \DejaVuSans\textit{#3}\\
        \hline
      \end{tabular}
    \end{figure}
  } 
}

% LISTAS BONITAS
\newenvironment{nicelist}[1]{%
  \parindent1em 
  \DejaVuSans\textbf{#1}
    \begin{itemize}
}
{%
  \end{itemize}%
}

% ENUMERACIONES BONITAS
\newenvironment{niceenum}[1]{%
  \parindent1em 
  \DejaVuSans\textbf{#1}
    \begin{enumerate}
}
{%
  \end{enumerate}%
}

% DESCRIPCIONES BONITAS
\newenvironment{nicedesc}[1]{%
  \parindent1em
  \DejaVuSans\textbf{#1}
    \begin{description}
}
{%
  \end{description}%
}

% OPCIONES DE NUMERACIÓN
\newif\ifsectionnumbers 
\newcommand{\sectionnumbers}{%
  \sectionnumberstrue 
}

\newif\ifsubsectionnumbers 
\newcommand{\subsectionnumbers}{%
  \subsectionnumberstrue 
}

\newif\ifresetnumbering 
\NewDocumentCommand{\resetnumbering}{g g}{%
  \def\@nextsectionnumber{1} 
  \def\@nextpagenumber{1}
  \IfNoValueF{#1}{%
    \if\relax\detokenize{#1}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextsectionnumber{#1} 
    \fi 
  }   
  \IfNoValueF{#2}{%
    \if\relax\detokenize{#2}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextpagenumber{#2} 
    \fi 
  } 
  \resetnumberingtrue 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AYUDA
\newcommand{\printhelp}{%
  \clearpage
  \textbf{\Huge ¡Bienvenido al Tiqqunazo!}\\
  
  \underline{Comandos para antes del \textbackslash begin\{document\}}\\

  \textsc{Sobrescribir o ignorar y obtener estos valores predeterminados:}
  
    \textbf{\textbackslash title\{Documento de prueba\}}
    
    \textbf{\textbackslash author\{\}}
    
    \textbf{\textbackslash project\{\}}
    
    \textbf{\textbackslash imagefolder\{.\}}
    
    \textbf{\textbackslash version\{Version 2.0\}}
    
    \textbf{\textbackslash footertext\{\textbackslash
      @title\}\{\textbackslash @author\}}
    
    \textbf{\textbackslash imageref\{\}}
    
  \textsc{Opcional para definir y cambiar los aspectos visuales:}
  
    \textbf{\textbackslash logo\{logo.png\}} \texttt{\% Pone el logotipo en la
    caratula si se proporciona}
    
    \textbf{\textbackslash nofootertext} \texttt{\% Hace que en el pie de página
    aparezca sólo el número}
    
    \textbf{\textbackslash footertext\{\}\{\}} \texttt{\% Cambia el texto del
    pie de página al texto dado}
  
  \underline{Comandos para el interior del documento}\\
  
  \textsc{Sobreescriben los comandos normales:}
  
    \textbf{\textbackslash section\{Título de la sección\}} \texttt{\%
    Compotamiento predeterminado}
    
    \textbf{\textbackslash section\{Título de la sección\}
    \{nombredeimagen.png\}} \texttt{\% Encuentra la imagen en \textbackslash 
    imagefolder y pone la imagen en la cabecera\\}
  
  \textsc{Mejoras y variantes:}
  
    \textbf{\textbackslash temp\{Texto en azul y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash crit\{Texto en rojo y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash link \{direccióndeenlace.com\}\{Texto a
    mostrar\}} \texttt{\% Igual que href, pero con estilo personalizado. si no se 
    ofrece, el 2º parámetro sustituye al primero (muestra la url como texto 
    clicable)}
    
    \textbf{\textbackslash image\{0.5\}\{nombre\_de\_imagen.png\}%
    \{Parámetro adicional opcional para la leyenda de la figura\}}%
    \texttt{\% El primer parámetro es la anchura de la imagen en formato decimal de % 
    \textbackslash textwidth \& si se proporciona, el 3º parámetro incluirá % 
    el comando \textbackslash label {img:nombre\_de\_imagen.png} para que % 
    pueda remitirse con \textbackslash ref}

    \textbf{\textbackslash begin\{nicelist\}\{Título de la lista\}...
    \textbackslash end\{nicelist\}} \texttt{\% Lo mismo que itemize pero con un 
    título}

    \textbf{\textbackslash begin\{niceenum\}\{Título de Enumeración\}... 
    \textbackslash end\{niceenum\}} \texttt{\% Lo mismo que enumerate pero con un 
    título}

    \textbf{\textbackslash tipbox\{Título del recuadro\}\{El texto que va 
    en el recuadro puede ser tan largo como quieras.\}} \texttt{\% Usa la opción 
    con asterisco para rodear el texto si sabes que después viene un 
    párrafo\\}
  
  ¡A disfrutar!\pagebreak
}

%%%%%%%%%%%%%%%%%%%%%%% AJUSTES GENERALES %%%%%%%%%%%%%%%%%%%%%%%
%\footertext{}{} % Cambia los valores del texto del pie de página
%\nofootertext % Oculta el texto del pie de página.
%\imageref{} % Referencia de dónde proceden las imágenes de cabecera si
             % las hay (aparecen en la última página como nota a pie de
             % página).
%\drafting % Comentario para ocultar las secciones \temp y \crit
%\sectionnumbers % Las secciones son números mayores, las subsecciones
                 % menores, etc.
%\subsectionnumbers % Secciones no numeradas, sólo comienzan en las
                    % subsecciones e inferiores.
%\setcounter{tocdepth}{2} % Establece la profundidad del índice en portada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
