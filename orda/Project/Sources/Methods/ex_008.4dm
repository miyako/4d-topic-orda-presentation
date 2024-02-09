//%attributes = {"invisible":true}
$esMOVIE:=ds:C1482.MOVIE.query(\
"_principalsForTitle._nameForPrincipals{1}.primaryName == :1"+\
" and "+\
"_principalsForTitle._nameForPrincipals{2}.primaryName == :2"; \
"Steven Spielberg"; "Peter Jackson")

$esMOVIE:=ds:C1482.MOVIE.searchByPrincipals("\"Steven Spielberg\" \"Peter Jackson\"")