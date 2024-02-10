//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "anne of green gables")

$cTitleBasics:=$esTitleBasics.toCollection("TITLE,YEAR,TITLE_JA")
