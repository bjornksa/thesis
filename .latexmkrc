$ENV{'TZ'}='Europe/Oslo';
$out_dir='out';
$bibtex_fudge=1;
ensure_path( 'TEXINPUTS', './beamer/' );
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
    system("makeglossaries \"$_[0]\"");
}