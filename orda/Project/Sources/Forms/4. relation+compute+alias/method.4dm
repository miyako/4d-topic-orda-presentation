$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Form:C1466.data:={col: Null:C1517; all: ds:C1482.TitleBasics.all(); sel: Null:C1517; pos: Null:C1517; item: Null:C1517}
		
		Form:C1466.data.col:=Form:C1466.data.all
		
End case 