

map <buffer> <leader>st ggi\documentclass{}<CR><CR>\author{Joris Gallin}<CR>\title{<++>}<CR><CR>\begin{document}<CR>\maketitle<CR><CR><++><CR><CR>\end{document}<Esc>gg2wa

map <leader>b a \textbf{} <++><Esc>2ba
map <leader>i a \textit{} <++><Esc>2ba
map <leader>u a \underline{} <++><Esc>2ba
map <leader>e a \emph{} <++><Esc>2ba

map <leader>S i\section{} <CR><CR><++><Esc>2kwa
map <leader>s i\subsection{} <CR><CR><++><Esc>2kwa
map <leader>ss i\subsubsection{} <CR><CR><++><Esc>2kwa
