If (FORM Event:C1606.code=On Data Change:K2:15)
	
	Form:C1466.data.col:=ds:C1482.TitleBasics.searchByPrincipals(OBJECT Get value:C1743(OBJECT Get name:C1087))
	
	OBJECT SET VALUE:C1742("q.TITLE"; "")
	
End if 