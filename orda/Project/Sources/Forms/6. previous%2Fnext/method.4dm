$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		If (Form:C1466.data.col#Null:C1517)\
			 && (OB Instance of:C1731(Form:C1466.data.col; 4D:C1709.EntitySelection))
			
			Form:C1466.data.item:=Form:C1466.data.item#Null:C1517 ? Form:C1466.data.item : Form:C1466.data.col.first()
			
			Form:C1466.hasPrevious:=Formula:C1597(Form:C1466.data.item.indexOf(Form:C1466.data.col)>0)
			Form:C1466.hasNext:=Formula:C1597(Form:C1466.data.item.indexOf(Form:C1466.data.col)<(Form:C1466.data.col.length-1))
			
			Form:C1466.previous:=Formula:C1597(Form:C1466.hasPrevious() ? Form:C1466.data.item.previous() : {})
			Form:C1466.next:=Formula:C1597(Form:C1466.hasNext() ? Form:C1466.data.item.next() : {})
			
			OBJECT SET ENABLED:C1123(*; "Previous"; Form:C1466.hasPrevious())
			OBJECT SET ENABLED:C1123(*; "Next"; Form:C1466.hasNext())
			OBJECT SET ENABLED:C1123(*; "First"; OBJECT Get enabled:C1079(*; "Previous"))
			OBJECT SET ENABLED:C1123(*; "Last"; OBJECT Get enabled:C1079(*; "Next"))
			
		Else 
			OBJECT SET VISIBLE:C603(*; "@"; False:C215)
		End if 
		
	: ($event.code=On Clicked:K2:4)
		
		OBJECT SET ENABLED:C1123(*; "Previous"; Form:C1466.hasPrevious())
		OBJECT SET ENABLED:C1123(*; "Next"; Form:C1466.hasNext())
		OBJECT SET ENABLED:C1123(*; "First"; OBJECT Get enabled:C1079(*; "Previous"))
		OBJECT SET ENABLED:C1123(*; "Last"; OBJECT Get enabled:C1079(*; "Next"))
		
	: ($event.code=On Unload:K2:2)
		
		OB REMOVE:C1226(Form:C1466; "hasPrevious")
		OB REMOVE:C1226(Form:C1466; "hasNext")
		OB REMOVE:C1226(Form:C1466; "previous")
		OB REMOVE:C1226(Form:C1466; "next")
		
End case 