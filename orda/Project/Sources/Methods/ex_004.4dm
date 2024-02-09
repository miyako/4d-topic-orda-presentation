//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$cTitleBasics:=$esTitleBasics.toCollection("タイトル,公開年,ジャンル")