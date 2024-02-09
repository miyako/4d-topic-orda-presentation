//%attributes = {"invisible":true}
$esTitlePrincipals:=ds:C1482.TitlePrincipals.query(\
"(_titleForPrincipals.primaryTitle == :1 or _nameForPrincipals.primaryName == :1)"+\
" and "+\
"(_titleForPrincipals.primaryTitle == :2 or _nameForPrincipals.primaryName == :2)"; \
"Steven Spielberg@"; "@tintin@")

$esSTAFF:=ds:C1482.STAFF.search("\"Steven Spielberg\" tintin")
