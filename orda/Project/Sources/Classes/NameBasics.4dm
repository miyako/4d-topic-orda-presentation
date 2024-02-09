Class extends DataClass

local Function search($q : Text; $queryParams : Object) : cs:C1710.TitlePrincipalsSelection
	
	$phrase:=ds:C1482.trim($q)
	
	If ($phrase="")
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	Else 
		
		$criteria:=["titles.primaryTitle == :1 or 氏名 == :1"; $phrase+"@"]
		
		If ($queryParams#Null:C1517)
			$criteria.push($queryParams)
		End if 
		
		return This:C1470.query.apply(ds:C1482.NameBasics; $criteria)
	End if 