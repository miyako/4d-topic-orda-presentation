//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear")
$cTitleBasics:=$esTitleBasics.extract("primaryTitle"; "タイトル"; "startYear"; "公開年")