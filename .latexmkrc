# .latexmkrc
# Configurazione per Overleaf e compilazione automatica

$pdf_mode = 5; # 5 = usa xelatex (necessario per caricare font moderni)
$do_cd = 0;    # Impedisce a latexmk di entrare nelle sottocartelle
               # (così tutti i path relativi a core/ e fonts/ funzionano dalla root)
