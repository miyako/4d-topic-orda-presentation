//%attributes = {"invisible":true}
$es映画:=ds:C1482.映画.query(\
"_principalForTitle._nameForPrincipal{1}.primaryName == :1"+\
" and "+\
"_principalForTitle._nameForPrincipal{2}.primaryName == :2"; \
"Steven Spielberg"; "Peter Jackson")

$es映画:=ds:C1482.映画.searchByPrincipals("\"Steven Spielberg\" \"Peter Jackson\"")