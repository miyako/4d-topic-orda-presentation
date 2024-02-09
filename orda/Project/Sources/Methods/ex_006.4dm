//%attributes = {"invisible":true}
$esTitleBasics:=ds:C1482.TitleBasics.query("primaryTitle == :1"; "@black@")

$es映画:=ds:C1482.TitleBasics.query(\
"(_akasForTitle._languageForAkas.value == :1"+\
" and "+\
"_akasForTitle.title == :2)"+\
" and _genresForTitle._genreForTitles.value == :3"; \
"ja"; "@秘密"; "animation")
$c映画:=$es映画.toCollection("タイトル,公開年,日本語タイトル")

$es映画:=ds:C1482.映画.query("日本語タイトル == :1 and ジャンル == :2"; "@秘密"; "animation")
$c映画:=$es映画.toCollection("タイトル,公開年,日本語タイトル")