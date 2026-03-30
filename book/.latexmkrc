$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$pdf_mode = 1;
$bibtex_use = 2;
$makeindex = 'makeindex -s svind.ist %O -o %D %S';
$pdf_previewer = 'open -a Skim';
$pdf_update_method = 0;  # Skim auto-detects changes
