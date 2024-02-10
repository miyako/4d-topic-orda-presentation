//%attributes = {"invisible":true}
TRUNCATE TABLE:C1051([TitleAkas:13])
TRUNCATE TABLE:C1051([Region:14])
TRUNCATE TABLE:C1051([Language:15])
TRUNCATE TABLE:C1051([AkaTypes:16])
TRUNCATE TABLE:C1051([AkaAttribute:17])

SET DATABASE PARAMETER:C642([TitleAkas:13]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Region:14]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Language:15]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([AkaTypes:16]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([AkaAttribute:17]; Table sequence number:K37:31; 0)

var $f : 4D:C1709.File

$f:=File:C1566("/DATA/IMDb/title.akas.tsv")

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
	
	For ($i; 0; 7)
		$values[$i]:=$values[$i]#"\\N" ? $values[$i] : Null:C1517
	End for 
	
	var $eTitleBasics : cs:C1710.TitleBasicsEntity
	$eTitleBasics:=ds:C1482.TitleBasics.query("tconst == :1"; $values[0]).first()
	If ($eTitleBasics#Null:C1517)
		var $eTitleAkas : cs:C1710.TitleAkasEntity
		$eTitleAkas:=ds:C1482.TitleAkas.new()
		$eTitleAkas.titleBasicsId:=$eTitleBasics.getKey()
		$eTitleAkas.ordering:=$values[1]#Null:C1517 ? Num:C11($values[1]) : Null:C1517
		$eTitleAkas.title:=$values[2]
		
		If ($values[3]#Null:C1517)
			var $eRegion : cs:C1710.RegionEntity
			$eRegion:=ds:C1482.Region.query("value == :1"; $values[3]).first()
			If ($eRegion=Null:C1517)
				$eRegion:=ds:C1482.Region.new()
				$eRegion.value:=$values[3]
				$eRegion.save()
			End if 
			$eTitleAkas.regionId:=$eRegion.getKey()
		End if 
		
		If ($values[4]#Null:C1517)
			var $eLanguage : cs:C1710.LanguageEntity
			$eLanguage:=ds:C1482.Language.query("value == :1"; $values[4]).first()
			If ($eLanguage=Null:C1517)
				$eLanguage:=ds:C1482.Language.new()
				$eLanguage.value:=$values[4]
				$eLanguage.save()
			End if 
			$eTitleAkas.languageId:=$eLanguage.getKey()
		End if 
		
		$eTitleAkas.isOriginalTitle:=$values[7]#Null:C1517 ? Bool:C1537($values[7]) : Null:C1517
		$eTitleAkas.save()
		
		var $attributes : Collection
		$attributes:=$values[5]#Null:C1517 ? Split string:C1554($values[5]; ","; ck ignore null or empty:K85:5) : []
		$attributes.combine($values[6]#Null:C1517 ? Split string:C1554($values[6]; ","; ck ignore null or empty:K85:5) : [])
		
		var $eAkaTypes : cs:C1710.AkaTypesEntity
		var $eAkaAttribute : cs:C1710.AkaAttributeEntity
		
		For each ($attribute; $attributes)
			
			$eAkaAttribute:=ds:C1482.AkaAttribute.query("value == :1"; $attribute).first()
			If ($eAkaAttribute=Null:C1517)
				$eAkaAttribute:=ds:C1482.AkaAttribute.new()
				$eAkaAttribute.value:=$attribute
				$eAkaAttribute.save()
			End if 
			
			$eAkaTypes:=ds:C1482.AkaTypes.new()
			$eAkaTypes.titleAkasId:=$eTitleAkas.getKey()
			$eAkaTypes.akaAttributeId:=$eAkaAttribute.getKey()
			$eAkaTypes.save()
			
		End for each 
		
	End if 
	
End while 