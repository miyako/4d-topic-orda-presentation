Class extends DataClass

local Function search($q : Text; $queryParams : Object) : cs:C1710.TitlePrincipalsSelection
	
	$criteria:=[]
	
	$phrases:=ds:C1482.parseSearchPhrase($q)
	
	$i:=0
	
	For each ($phrase; $phrases)
		$i+=1
		$criteria.push("(タイトル == :"+String:C10($i)+" or 氏名 == :"+String:C10($i)+")")
	End for each 
	
	If ($criteria.length=0)
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=$phrases.unshift($criteria.join(" and "))
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	return This:C1470.query.apply(ds:C1482.TitlePrincipals; $criteria)