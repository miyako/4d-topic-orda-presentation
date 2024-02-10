Class extends DataStoreImplementation

exposed Function logout() : Boolean
	
	If (Application type:C494=4D Server:K5:6)
		var $activity : Object
		$activity:=Get process activity:C1495(Sessions only:K5:36)
		var $sessions : Collection
		$sessions:=$activity.sessions.query("type == :1 and ID == :2"; "rest"; Session:C1714.id)
		var $session : Object
		$session:=$sessions.length#0 ? $sessions[0] : Null:C1517
		If ($session#Null:C1517)
			DROP REMOTE USER:C1633($session.ID)
			return True:C214
		Else 
			return False:C215
		End if 
	Else 
		return False:C215
	End if 
	
local Function parseSearchPhrase($q : Text) : Collection
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	
	$i:=1
	$phrases:=[]
	
/*
u0022:quote
u0026:asterisk
u0040:arobase
*/
	While (Match regex:C1019("(\\u0022?)([^\\u0022\\u0026\\u0040]+)(\\1)"; $q; $i; $pos; $len))
		$phrase:=This:C1470.trim(Substring:C12($q; $pos{2}; $len{2}))
		Case of 
			: ($phrase="")
			Else 
				$phrases.push("@"+$phrase+"@")
		End case 
		$i:=$pos{3}+$len{3}
	End while 
	
	return $phrases
	
local Function trim($q : Text) : Text
	
	$in:=$q
	
	$in:=Replace string:C233($in; Char:C90(0x0022); ""; *)
	$in:=Replace string:C233($in; Char:C90(0x0026); ""; *)
	$in:=Replace string:C233($in; Char:C90(0x0040); ""; *)
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	
	Case of 
		: (Match regex:C1019("^\\s*$"; $in; 1; $pos; $len))
			return ""
		: (Match regex:C1019("^\\s*(.+?)\\s*$"; $in; 1; $pos; $len))
			return Substring:C12($in; $pos{1}; $len{1})
	End case 