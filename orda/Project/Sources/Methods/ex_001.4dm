//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "anne of green gables")

$cTitleBasics:=$esTitleBasics.toCollection("primaryTitle,startYear")
$cTitleBasics:=$esTitleBasics.extract("primaryTitle"; "TITLE"; "startYear"; "YEAR")