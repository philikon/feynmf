% manpics.mp -- pictures for the feynmf manual
% Copyright (C) 1995 by Thorsten.Ohl @ Physik.TH-Darmstadt.de
% $Id: manpics.mp,v 1.5 1996/10/08 20:22:02 ohl Exp $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Feynmf is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by 
% the Free Software Foundation; either version 2, or (at your option)
% any later version.
%
% Feynmf is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input boxes

verbatimtex
  \font\sc=cmcsc10
  \font\manfnt=manfnt
  \def\LaTeX{%
    {\rm L\kern-.36em\raise.3ex\hbox{\sc a}\kern-.15em%
     T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}
  \def\cs#1{{\tt\char`\\#1}}
  \def\arg#1{{\tt\char`\{#1\char`\}}}
  \def\c{{\tt\char`\%}}
  \parindent=0pt
  \parskip=0pt
  \def\ctr#1{\vbox{\halign{\hfil##\hfil\cr#1\cr}}}
etex;

def first_latex_pass = \ enddef;
def second_latex_pass = dashed withdots enddef;
def mf_pass = dashed evenly enddef;
def dvixx_pass = dashed evenly scaled 2 enddef;

def connect (suffix from, to) =
  (from.c -- to.c cutbefore bpath.from cutafter bpath.to)
enddef;

ahlength := 4mm;
ahangle := 30;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig (1);
  h := 10cm;
  w := 13.3cm;
  pickup pencircle scaled 1.5;
  boxit.tex (btex \tt\vbox{
      \hbox{\c\ foo.tex}
      \hbox{...}
      \hbox{\cs{usepackage}\arg{feynmf}}
      \hbox{...}
      \hbox{\cs{begin}\arg{fmffile}\arg{fd}}
      \hbox{\cs{begin}\arg{fmfchar*}(100,50)}
      \hbox{...}
      \hbox{\cs{end}\arg{fmfchar*}}
      \hbox{...}
      \hbox{\cs{end}\arg{fmffile}}
      \hbox{...}}
    etex);
  boxit.mf (btex \tt\vbox{
      \hbox{\c\ fd.mf -- do not edit}
      \hbox{input feynmf}
      \hbox{beginchar(1,100*1pt\#,50*1pt\#,0);}
      \hbox{\quad vinit;}
      \hbox{\quad ...}
      \hbox{\quad vfreeze;}
      \hbox{\quad vdraw;}
      \hbox{endchar;}
      \hbox{...}}
    etex);
  boxit.log (btex \ctr{\LaTeX{} labels\cr{\tt fd.log}} etex);
  boxit.t1 (btex \ctr{\LaTeX{} labels\cr{\tt fd.t1}} etex);
  boxit.t2 (btex \ctr{\LaTeX{} labels\cr{\tt fd.t2}} etex);
  boxit.tfm (btex \ctr{font metric\cr information\cr{\tt fd.tfm}} etex);
  boxit.gf (btex \ctr{font bitmap\cr{\tt fd.300gf}} etex);
  boxit.dvi (btex \ctr{device independent\cr output file\cr{\tt foo.dvi}} etex);
  boxit.lpr (btex \ctr{printer\cr{\tt lpr}} etex);
  tex.nw = (0,h);  mf.ne = (w,h);
  dvi.sw = (0,0); lpr.se = (w,0);
  gf.c = .5[mf.c,lpr.c];
  log.c = .5[mf.c,dvi.c];
  tfm.c = .75[log.c,gf.c] - (0,2cm);
  .5[log.c,dvi.c] = .1[t1.c,t2.c];
  t2.w - t1.e = (5mm,0);
  % forsuffixes $ = tex, mf, log, tfm, gf, t1, t2, dvi, lpr:
  %   fill bpath.$ withcolor .9white;
  % endfor
  drawboxed (tex, mf, log, tfm, gf, t1, t2, dvi, lpr);
  drawarrow connect (tex, dvi) second_latex_pass;
  drawarrow connect (tex, mf) first_latex_pass;
  drawarrow connect (mf, log) mf_pass;
  drawarrow connect (mf, tfm) mf_pass;
  drawarrow connect (mf, gf) mf_pass;
  drawarrow connect (log, t1) second_latex_pass;
  drawarrow connect (log, t2) second_latex_pass;
  drawarrow connect (t1, dvi) second_latex_pass;
  drawarrow connect (t2, dvi) second_latex_pass;
  drawarrow connect (tfm, dvi) second_latex_pass;
  drawarrow connect (tfm, lpr) dvixx_pass;
  drawarrow connect (gf, lpr) dvixx_pass;
  drawarrow connect (dvi, lpr) dvixx_pass;
  circleit.latex1 (btex {\tt latex foo} etex);
  latex1.dx = latex1.dy;
  circleit.latex2 (btex {\tt latex foo} etex);
  latex2.dx = latex2.dy;
  % circleit.mf.gf (btex {\tt mf fd} etex);
  % mf.gf.dx = mf.gf.dy;
  circleit.mf.tfm (btex {\tt mf fd} etex);
  mf.tfm.dx = mf.tfm.dy;
  % circleit.mf.log (btex {\tt mf fd} etex);
  % mf.log.dx = mf.log.dy;
  circleit.dvixx (btex {\tt dvixx foo} etex);
  dvixx.dx = dvixx.dy;
  latex1.s - (0,2mm) = point .5 of connect (tex, mf);
  latex2.e + (2mm,0) = point .5 of connect (tex, dvi);
  % mf.gf.w - (2mm,0) = point .5 of connect (mf, gf);
  mf.tfm.e + (2mm,0) = point .5 of connect (mf, tfm);
  % mf.log.w - (2mm,0) = point .5 of connect (mf, log);
  dvixx.n + (0,2mm) = point .5 of connect (dvi, lpr);
  forsuffixes $ = latex1, latex2, mf.tfm, dvixx:
    fill bpath.$ withcolor .9white;
  endfor
  drawboxed (latex1, latex2, mf.tfm, dvixx);
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig (2);
  h := 10cm;
  w := 13.3cm;
  pickup pencircle scaled 1.5;
  boxit.tex (btex \tt\vbox{
      \hbox{\c\ foo.tex}
      \hbox{...}
      \hbox{\cs{usepackage}\arg{feynmp}}
      \hbox{...}
      \hbox{\cs{begin}\arg{fmffile}\arg{fd}}
      \hbox{\cs{begin}\arg{fmfchar*}(100,50)}
      \hbox{...}
      \hbox{\cs{end}\arg{fmfchar*}}
      \hbox{...}
      \hbox{\cs{end}\arg{fmffile}}
      \hbox{...}}
    etex);
  boxit.mp (btex \tt\vbox{
      \hbox{\c\ fd.mp -- do not edit}
      \hbox{input feynmp}
      \hbox{beginchar(1,100*1pt\#,50*1pt\#,0);}
      \hbox{\quad vinit;}
      \hbox{\quad ...}
      \hbox{\quad vfreeze;}
      \hbox{\quad vdraw;}
      \hbox{endchar;}
      \hbox{...}}
    etex);
  boxit.t1 (btex \ctr{\LaTeX{} labels\cr{\tt fd.t1}} etex);
  boxit.t2 (btex \ctr{\LaTeX{} labels\cr{\tt fd.t2}} etex);
  boxit.p1 (btex \ctr{encapsulated\cr PostScript\cr file\cr{\tt fd.1}} etex);
  boxit.p2 (btex \ctr{encapsulated\cr PostScript\cr file\cr{\tt fd.2}} etex);
  boxit.dvi (btex \ctr{device independent\cr output file\cr{\tt foo.dvi}} etex);
  boxit.lpr (btex \ctr{printer\cr{\tt lpr}} etex);
  tex.nw = (0,h);  mp.ne = (w,h);
  dvi.sw = (0,0); lpr.se = (w,0);
  .5[mp.c,dvi.c] = .8[t1.c,t2.c];
  t2.w - t1.e = (5mm,0);
  .5[mp.c,lpr.c] = .8[p1.c,p2.c];
  p2.w - p1.e = (5mm,2.5cm);
  drawboxed (tex, mp, t1, t2, p1, p2, dvi, lpr);
  drawarrow connect (tex, dvi) second_latex_pass;
  drawarrow connect (tex, mp) first_latex_pass;
  drawarrow connect (mp, t1) mf_pass;
  drawarrow connect (mp, t2) mf_pass;
  drawarrow connect (mp, p1) mf_pass;
  drawarrow connect (mp, p2) mf_pass;
  drawarrow connect (t1, dvi) second_latex_pass;
  drawarrow connect (t2, dvi) second_latex_pass;
  drawarrow connect (p1, dvi) second_latex_pass;
  drawarrow connect (p2, dvi) second_latex_pass;
  drawarrow connect (p1, lpr) dvixx_pass;
  drawarrow connect (p2, lpr) dvixx_pass;
  drawarrow connect (dvi, lpr) dvixx_pass;
  circleit.latex1 (btex {\tt latex foo} etex);
  latex1.dx = latex1.dy;
  circleit.latex2 (btex {\tt latex foo} etex);
  latex2.dx = latex2.dy;
  circleit.run.mp (btex {\tt mp fd} etex);
  run.mp.dx = run.mp.dy;
  circleit.dvixx (btex {\tt dvixx foo} etex);
  dvixx.dx = dvixx.dy;
  latex1.s - (0,2mm) = point .5 of connect (tex, mp);
  latex2.e + (2mm,0) = point .5 of connect (tex, dvi);
  run.mp.w - (2mm,0) = point .5 of connect (mp, t2);
  dvixx.n + (0,2mm) = point .5 of connect (dvi, lpr);
  forsuffixes $ = latex1, latex2, run.mp, dvixx:
    fill bpath.$ withcolor .9white;
  endfor
  drawboxed (latex1, latex2, run.mp, dvixx);
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef declare_boxes (text l) =
  forsuffixes $ = l:
    pair $.n, $.e, $.s, $.w, $.ne, $.se,  $.sw,  $.nw,  $.c;
  endfor
enddef;

vardef setup_boxes (text l) =
  forsuffixes $ = l:
    $.n = .5[$.nw, $.ne]; $.s = .5[$.sw, $.se];
    $.w = .5[$.nw, $.sw]; $.e = .5[$.ne, $.se];
    $.c = .5[$.n, $.s];
  endfor
enddef;

vardef border suffix b =
  b.nw -- b.ne -- b.se -- b.sw -- cycle
enddef;

beginfig (3);
  h := 10cm;
  w := 13.3cm;
  pickup pencircle scaled 1.5;

  declare_boxes (mf, tex, immediate, list);
  setup_boxes (mf, tex);

  list.n = .5[list.nw, list.ne];
  list.s = .5[list.sw, list.se];
  list.w = .5[list.nw, list.sw];
  % list.e free!
  list.c = .5[list.n, list.s];

  immediate.n = .5[immediate.nw, immediate.ne];
  immediate.s = .5[immediate.sw, immediate.se];
  % immediate.w free!
  immediate.e = .5[immediate.ne, immediate.se];
  immediate.c = .5[immediate.n, immediate.s];

  mf.sw = (0,0); mf.se = (w,0);
  tex.nw = (0,h); tex.ne = (w,h);

  mf.nw = tex.sw; mf.ne = tex.se;
  tex.sw = .5[tex.nw,mf.sw]; tex.se = .5[tex.ne,mf.se];

  list.w = .5[tex.nw,mf.sw];
  list.e - list.w = immediate.e - immediate.w = (.4w,0);
  list.nw - list.sw = (0,.8h);
  immediate.ne - immediate.se = (0,.5h);
  immediate.w = list.e; immediate.nw = list.ne; immediate.sw = list.se;

  list.ne = .7[list.nw,immediate.ne];
  list.se = .3[list.sw,immediate.se];

  fill border tex withcolor .9white; % draw border tex;
  fill border mf withcolor .6white; % draw border mf;
  fill border list withcolor .8white; % draw border list;
  fill border immediate withcolor .7white; % draw border immediate;

  path imm_to_lst, lst_to_imm, tex_to_mf;

  imm_to_lst = immediate.c .. .7[immediate.sw,immediate.nw] .. list.c;
  lst_to_imm = list.c .. .3[immediate.sw,immediate.nw] .. immediate.c;
  tex_to_mf = .85[tex.nw,tex.ne] .. .95[tex.sw,tex.se] .. .85[mf.sw,mf.se];

  drawarrow subpath (.3length(imm_to_lst), .7length(imm_to_lst)) of imm_to_lst;
  drawarrow subpath (.3length(lst_to_imm), .7length(lst_to_imm)) of lst_to_imm;
  drawarrow subpath (.3length(tex_to_mf), .7length(tex_to_mf)) of tex_to_mf;

  boxit.name.imm_to_lst (btex \cs{fmfforce} etex);
  boxit.name.lst_to_imm (btex \tt\ctr{vloc\cr vpath} etex);
  boxit.name.tex_to_mf (btex \cs{fmfcmd} etex);
  boxit.name.tex (btex \LaTeX etex);
  boxit.name.mf (btex \manfnt METAFONT etex);

  name.imm_to_lst.s = point .5length(imm_to_lst) of imm_to_lst + (-2mm,3mm);
  name.lst_to_imm.n = point .5length(lst_to_imm) of lst_to_imm - (0,2mm);
  name.tex_to_mf.se = point .5length(tex_to_mf) of tex_to_mf - (2mm,0);
  name.tex.ne = (.95w,.95h);
  name.mf.se = (.95w,.05h);

  boxit.name.lst (btex \vbox{\halign{
                    \hfil # \cr
	  	    {\sc Vertex Mode}\cr\cr
	  	    Objects:\qquad\cr
                    vertices\cr
	  	    arcs\cr
	  	    polygons\cr\cr
	  	    Commands:\qquad\cr
                    \cs{fmf}\arg{}\arg{}\cr
	  	    \cs{fmfv}\arg{}\arg{}\cr
	  	    \cs{fmfleft}\arg{}\cr
	  	    {\tt ...}\cr}}
                  etex);

  boxit.name.imm (btex \vbox{\halign{
                     \hfil #\cr
	  	     {\sc Immediate Mode}\cr\cr
	  	     Objects:\qquad\cr
                     pairs\cr
	  	     paths\cr\cr
	  	     Commands:\qquad\cr
                     \cs{fmfi}\arg{}\arg{}\cr
	  	     \cs{fmfiv}\arg{}\cr
	  	     \cs{fmfiequ}\arg{}\cr
	  	     {\tt ...}\cr}}
                 etex);

  name.lst.w = list.w + (2mm,0);
  name.imm.e = immediate.e - (2mm,0);

  forsuffixes $ =  imm_to_lst, lst_to_imm, tex_to_mf, imm, lst, tex, mf:
    fill bpath.name.$ withcolor white;
    drawunboxed (name.$);
  endfor

endfig;

end;
endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Local Variables:
compile-command:"sh -c 'mp manpics && tex mproof manpics.[0-9]* && dvips mproof'"
End:
