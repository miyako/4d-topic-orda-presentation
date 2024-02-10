Class extends Entity

Alias genres _genresForTitle._genreForTitles
Alias alternatives _akasForTitle
Alias attributes alternatives._typesForAkas._attributeForTypes
Alias principals _principalsForTitle._nameForPrincipals
Alias names _namesForTitle._nameForTitle
exposed Alias TITLE primaryTitle
exposed Alias YEAR startYear
exposed Alias TIME runtimeMinutes
exposed Alias CATEGORY titleType

local Function _titleForLanguage($language : Text)
	
	var $eTitleAkas : cs:C1710.TitleAkasEntity
	
	If (This:C1470.alternatives#Null:C1517)
		$eTitleAkas:=This:C1470.alternatives.query("language.value == :1"; $language).first()
	End if 
	
	return $eTitleAkas#Null:C1517 ? $eTitleAkas.title : ""
	
exposed Function get TITLE_JA() : Text
	
	return This:C1470._titleForLanguage("ja")
	
Function query TITLE_JA($event : Object) : Object
	
	return ds:C1482.TitleBasics._queryForLanguage($event; "ja")  //This == DataClass, not Entity
	
exposed Function get GENRE() : Text
	
	return This:C1470.genres#Null:C1517 ? This:C1470.genres.extract("value").join(",") : ""
	
Function query GENRE($event : Object)->$result : Object
	
	$query:="genres.value "+$event.operator+" :1"
	$parameters:=[$event.value]
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)