//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("TITLE_JA == :1 and GENRE == :2"; "スター・ウォーズ@"; "animation")

$cTitleBasics:=$esTitleBasics.toCollection("TITLE,YEAR,TITLE_JA")

$esTitleBasics:=ds:C1482.TitleBasics.query(\
"(_akasForTitle._languageForAkas.value == :1"+\
" and "+\
"_akasForTitle.title == :2)"+\
" and _genresForTitle._genreForTitles.value == :3"; \
"ja"; "スター・ウォーズ@"; "animation")
$cTitleBasics:=$esTitleBasics.toCollection("TITLE,YEAR,TITLE_JA")