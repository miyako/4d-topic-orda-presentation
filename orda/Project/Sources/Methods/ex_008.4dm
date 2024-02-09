//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query(\
"_principalsForTitle._nameForPrincipals{1}.primaryName == :1"+\
" and "+\
"_principalsForTitle._nameForPrincipals{2}.primaryName == :2"; \
"Steven Spielberg"; "Peter Jackson")

$esTitleBasics:=ds:C1482.TitleBasics.searchByPrincipals("\"Steven Spielberg\" \"Peter Jackson\"")