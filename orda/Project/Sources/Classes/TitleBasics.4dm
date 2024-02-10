Class extends DataClass

local Function searchByTitle($q : Text; $queryParams : Object) : cs:C1710.TitleBasicsSelection
	
	$criteria:=[]
	
	$phrases:=ds:C1482.parseSearchPhrase($q)
	
	$i:=0
	
	For each ($phrase; $phrases)
		$i+=1
		$criteria.push("("+["primaryTitle == :"; $i; " or alternatives.title == :"; $i].join("")+")")
	End for each 
	
	If ($criteria.length=0)
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=$phrases.unshift($criteria.join(" and "))
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	$criteria.push({queryPath: True:C214})
	
	return This:C1470.query.apply(ds:C1482.TitleBasics; $criteria)
	
local Function searchByNames($q : Text; $queryParams : Object) : cs:C1710.TitleBasicsSelection
	
	$criteria:=[]
	
	$phrases:=ds:C1482.parseSearchPhrase($q)
	
	$i:=0
	
	For each ($phrase; $phrases)
		$i+=1
		$criteria.push(["names{"; $i; "}.primaryName == :"; $i].join(""))
	End for each 
	
	If ($criteria.length=0)
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=$phrases.unshift($criteria.join(" and "))
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	$criteria.push({queryPath: True:C214})
	
	return This:C1470.query.apply(ds:C1482.TitleBasics; $criteria)
	
local Function searchByPrincipals($q : Text; $queryParams : Object) : cs:C1710.TitleBasicsSelection
	
	$criteria:=[]
	
	$phrases:=ds:C1482.parseSearchPhrase($q)
	
	$i:=0
	
	For each ($phrase; $phrases)
		$i+=1
		$criteria.push(["principals{"; $i; "}.primaryName == :"; $i].join(""))
	End for each 
	
	If ($criteria.length=0)
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=$phrases.unshift($criteria.join(" and "))
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	$criteria.push({queryPath: True:C214})
	
	return This:C1470.query.apply(ds:C1482.TitleBasics; $criteria)
	
local Function searchByNamesOrPrincipals($q : Text; $queryParams : Object) : cs:C1710.TitleBasicsSelection
	
	$criteria:=[]
	
	$phrases:=ds:C1482.parseSearchPhrase($q)
	
	$i:=0
	
	For each ($phrase; $phrases)
		$i+=1
		$criteria.push("("+["principals{"; $i; "}.primaryName == :"; $i].join("")+" or "+["names{"; $i; "}.primaryName == :"; $i].join("")+")")
	End for each 
	
	If ($criteria.length=0)
		return $queryParams=Null:C1517 ? This:C1470.all() : This:C1470.all($queryParams)
	End if 
	
	$criteria:=$phrases.unshift($criteria.join(" and "))
	
	If ($queryParams#Null:C1517)
		$criteria.push($queryParams)
	End if 
	
	$criteria.push({queryPath: True:C214})
	
	return This:C1470.query.apply(ds:C1482.TitleBasics; $criteria)
	