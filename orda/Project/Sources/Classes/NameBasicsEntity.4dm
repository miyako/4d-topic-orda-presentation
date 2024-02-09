Class extends Entity

Alias titles _titleForName._titleForNames
Alias professions _professionsForName._professionForName
Alias 氏名 primaryName

Function get 役職() : Text
	
	return This:C1470.professions#Null:C1517 ? This:C1470.professions.extract("value").join(",") : ""
	
Function query 役職($event : Object)->$result : Object
	
	$query:="professions.value "+$event.operator+" :1"
	$parameters:=[$event.value]
	
	$result:=New object:C1471("query"; $query; "parameters"; $parameters)
	