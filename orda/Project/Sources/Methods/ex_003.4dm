//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear")

$esTitleBasics:=ds:C1482.TitleBasics.query("TITLE == :1 and YEAR >= :2"; "@black@"; 2000)
$cTitleBasics:=$esTitleBasics.toCollection("TITLE,YEAR")