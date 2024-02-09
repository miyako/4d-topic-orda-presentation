//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$esTitleBasics:=ds:C1482.TitleBasics.query(\
"(_akasForTitle._languageForAkas.value == :1"+\
" and "+\
"_akasForTitle.title == :2)"+\
" and _genresForTitle._genreForTitles.value == :3"; \
"ja"; "@秘密"; "animation")
$cTitleBasics:=$esTitleBasics.toCollection("TITLE,YEAR,TITLE_JA")

$esMOVIE:=ds:C1482.MOVIE.query("TITLE_JA == :1 and GENRE == :2"; "@秘密"; "animation")
$cMOVIE:=$esMOVIE.toCollection("TITLE,YEAR,TITLE_JA")