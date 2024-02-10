//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query(\
"_principalsForTitle._nameForPrincipals{1}.primaryName == :1"+\
" and "+\
"_principalsForTitle._nameForPrincipals{2}.primaryName == :2"; \
"christopher lloyd"; "michael j. fox")

$esTitleBasics:=ds:C1482.TitleBasics.searchByPrincipals("\"christopher lloyd\" \"michael j. fox\"")