Class extends Entity

Alias genres _genresForTitle._genreForTitles
Alias alternatives _akasForTitle
Alias attributes alternatives._typesForAkas._attributeForTypes
Alias principals _principalForTitle._nameForPrincipal
Alias names _namesForTitle._nameForTitle
exposed Alias タイトル primaryTitle
exposed Alias 公開年 startYear
exposed Alias 上映時間 runtimeMinutes
exposed Alias カテゴリー titleType

exposed Function get 日本語タイトル() : Text
	
	var $eTitleAkas : cs:C1710.TitleAkasEntity
	
	If (This:C1470.alternatives#Null:C1517)
		$eTitleAkas:=This:C1470.alternatives.query("language.value == :1"; "ja").first()
	End if 
	
	return $eTitleAkas#Null:C1517 ? $eTitleAkas.title : ""
	
Function query 日本語タイトル($event : Object)->$result : Object
	
	$query:="alternatives.language.value == :1 and alternatives.title "+$event.operator+" :2"
	$parameters:=["ja"; $event.value]
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)
	
exposed Function get ジャンル() : Text
	
	return This:C1470.genres#Null:C1517 ? This:C1470.genres.extract("value").join(",") : ""
	
Function query ジャンル($event : Object)->$result : Object
	
	$query:="genres.value "+$event.operator+" :1"
	$parameters:=[$event.value]
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)