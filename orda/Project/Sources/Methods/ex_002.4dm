//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear,_genresForTitle._genreForTitles.value,_namesForTitle._nameForTitle.primaryName")
$cTitleBasics:=$esTitleBasics.extract(\
"primaryTitle"; "タイトル"; \
"startYear"; "公開年"; \
"_genresForTitle._genreForTitles.value"; "ジャンル"; \
"_namesForTitle._nameForTitle.primaryName"; "関係者"; \
"_principalForTitle._nameForPrincipal.primaryName"; "主要スタッフ")
