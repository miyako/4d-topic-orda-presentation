If (FORM Event:C1606.code=On Data Change:K2:15)
	
	Form:C1466.data.col:=ds:C1482.NameBasics.search(OBJECT Get value:C1743(OBJECT Get name:C1087))
	
End if 