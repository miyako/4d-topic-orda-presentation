//%attributes = {"invisible":true}
TRUNCATE TABLE:C1051([NameBasics:8])
TRUNCATE TABLE:C1051([NameTitles:10])
TRUNCATE TABLE:C1051([NameProfessions:9])
TRUNCATE TABLE:C1051([Profession:12])
SET DATABASE PARAMETER:C642([NameBasics:8]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([NameTitles:10]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([NameProfessions:9]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Profession:12]; Table sequence number:K37:31; 0)

var $f : 4D:C1709.File

$f:=File:C1566("/DATA/IMDb/name.basics.tsv")

var $h : 4D:C1709.FileHandle

$h:=$f.open({mode: "read"; charset: "utf-8"; breakModeRead: Document with LF:K24:22})

var $headers : Boolean
$headers:=True:C214

While (Not:C34($h.eof))
	
	$line:=$h.readLine()
	$values:=Split string:C1554($line; "\t")
	
	If ($headers)
		$headers:=False:C215
		continue
	End if 
	
	For ($i; 0; 5)
		$values[$i]:=$values[$i]#"\\N" ? $values[$i] : Null:C1517
	End for 
	
	var $eNameBasics : cs:C1710.NameBasicsEntity
	$eNameBasics:=ds:C1482.NameBasics.new()
	$eNameBasics.nconst:=$values[0]
	$eNameBasics.primaryName:=$values[1]
	$eNameBasics.birthYear:=$values[2]#Null:C1517 ? Num:C11($values[2]) : Null:C1517
	$eNameBasics.deathYear:=$values[3]#Null:C1517 ? Num:C11($values[3]) : Null:C1517
	$eNameBasics.save()
	
	var $professions : Collection
	$professions:=$values[4]#Null:C1517 ? Split string:C1554($values[4]; ","; ck ignore null or empty:K85:5) : []
	
	var $tconsts : Collection
	$tconsts:=$values[5]#Null:C1517 ? Split string:C1554($values[5]; ","; ck ignore null or empty:K85:5) : []
	
	For each ($tconst; $tconsts)
		var $esTitleBasics : cs:C1710.TitleBasicsEntity
		$esTitleBasics:=ds:C1482.TitleBasics.query("tconst == :1"; $tconst).first()
		If ($esTitleBasics#Null:C1517)
			var $eNameTitles : cs:C1710.NameTitlesEntity
			$eNameTitles:=ds:C1482.NameTitles.new()
			$eNameTitles.titleBasicsId:=$esTitleBasics.getKey()
			$eNameTitles.nameBasicsId:=$eNameBasics.getKey()
			$eNameTitles.save()
		End if 
	End for each 
	
	var $eNameProfessions : cs:C1710.NameProfessionsEntity
	var $eProfession : cs:C1710.ProfessionEntity
	
	For each ($profession; $professions)
		
		$eProfession:=ds:C1482.Profession.query("value == :1"; $profession).first()
		If ($eProfession=Null:C1517)
			$eProfession:=ds:C1482.Profession.new()
			$eProfession.value:=$profession
			$eProfession.save()
		End if 
		
		$eNameProfessions:=ds:C1482.NameProfessions.new()
		$eNameProfessions.nameBasicsId:=$eNameBasics.getKey()
		$eNameProfessions.professionId:=$eProfession.getKey()
		$eNameProfessions.save()
		
	End for each 
	
End while 