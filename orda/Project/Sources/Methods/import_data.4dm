//%attributes = {"invisible":true}
For ($t; 1; Get last table number:C254)
	If (Is table number valid:C999($t))
		PAUSE INDEXES:C1293(Table:C252($t)->)
	End if 
End for 

$files:=Folder:C1567("/DATA/SQL").files(fk ignore invisible:K87:22).query("extension == :1"; ".sql")

For each ($file; $files)
	SQL EXECUTE SCRIPT:C1089($file.platformPath; SQL On error confirm:K49:16)
End for each 