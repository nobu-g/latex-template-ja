#!/usr/bin/env perl

$latex            = 'uplatex %O -synctex=1 -kanji=utf8 -halt-on-error -file-line-error %S';
# $latex_silent     = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex -kanji=utf8 %O %S';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;  # 0: none, 1: pdflatex, 2: ps2pdf, 3: dvipdfmx
$pvc_view_file_via_temporary = 0;
$clean_full_ext   = "%R.synctex.gz";
$aux_dir          = "build";
$out_dir          = "build";
