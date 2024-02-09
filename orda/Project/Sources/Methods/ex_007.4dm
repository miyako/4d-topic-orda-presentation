//%attributes = {"invisible":true}
$es主要スタッフ:=ds:C1482.TitlePrincipals.query(\
"(_titleForPrincipal.primaryTitle == :1 or _nameForPrincipal.primaryName == :1)"+\
" and "+\
"(_titleForPrincipal.primaryTitle == :2 or _nameForPrincipal.primaryName == :2)"; \
"Steven Spielberg@"; "@tintin@")

$es主要スタッフ:=ds:C1482.主要スタッフ.search("\"Steven Spielberg\" tintin")
