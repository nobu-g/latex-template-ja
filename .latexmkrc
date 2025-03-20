#!/usr/bin/env perl

# --- uplatexなどエンジンの設定 ---
$latex    = 'uplatex %O -synctex=1 -kanji=utf8 -halt-on-error -file-line-error %S';
$pdflatex = 'pdflatex %O -synctex=1 %S';
$lualatex = 'lualatex %O -synctex=1 %S';


$bibtex           = 'upbibtex -kanji=utf8 %O %S';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;  # 0: none, 1: pdflatex, 2: ps2pdf, 3: dvipdfmx
$pvc_view_file_via_temporary = 0;
$clean_full_ext   = "%R.synctex.gz";
@default_files    = ('main.tex');

# --- 中間ファイルや出力をbuildディレクトリにまとめる ---
$aux_dir = "build";
$out_dir = "build";
