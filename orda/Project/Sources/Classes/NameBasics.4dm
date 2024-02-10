Class extends DataClass

local Function search($q : Text; $queryParams : Object) : cs:C1710.TitlePrincipalsSelection
	
	$phrase:=ds:C1482.trim($q)
	
	If ($phrase="")
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=["NAME == :1 or titles.primaryTitle == :1 or titles.alternatives.title == :1 or principalTitles.primaryTitle == :1 or principalTitles.alternatives.title == :1"; "@"+$phrase+"@"]
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	$criteria.push({queryPath: True:C214})
	
	return This:C1470.query.apply(ds:C1482.NameBasics; $criteria)