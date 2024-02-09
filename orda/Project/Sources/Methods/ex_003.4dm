//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear")

$esTitleBasics:=ds:C1482.TitleBasics.query("タイトル == :1 and 公開年 >= :2"; "@black@"; 2000)
$cTitleBasics:=$esTitleBasics.toCollection("タイトル,公開年")