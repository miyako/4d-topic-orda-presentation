//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "anne of green gables")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear,_genresForTitle._genreForTitles.value,_namesForTitle._nameForTitle.primaryName")
$cTitleBasics:=$esTitleBasics.extract(\
"primaryTitle"; "TITLE"; \
"startYear"; "YEAR"; \
"_genresForTitle._genreForTitles.value"; "GENRE"; \
"_namesForTitle._nameForTitle.primaryName"; "NAMES"; \
"_principalsForTitle._nameForPrincipals.primaryName"; "PRINCIPALS")
