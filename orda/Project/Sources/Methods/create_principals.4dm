//%attributes = {"invisible":true}
TRUNCATE TABLE:C1051([TitlePrincipals:18])
TRUNCATE TABLE:C1051([Category:21])
TRUNCATE TABLE:C1051([Job:22])
SET DATABASE PARAMETER:C642([TitlePrincipals:18]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Category:21]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Job:22]; Table sequence number:K37:31; 0)

var $f : 4D:C1709.File

$f:=File:C1566("/DATA/IMDb/title.principals.tsv")

USE CHARACTER SET:C205("utf-8"; 1)

$docref:=Open document:C264($f.platformPath)

var $headers : Boolean
$headers:=True:C214

While (True:C214)
	
	RECEIVE PACKET:C104($docref; $line; "\n")
	
	If (OK=0)
		break
	End if 
	
	$values:=Split string:C1554($line; "\t")
	
	If ($headers)
		$headers:=False:C215
		continue
	End if 
	
	For ($i; 0; 5)
		$values[$i]:=$values[$i]#"\\N" ? $values[$i] : Null:C1517
	End for 
	
	If ($values[5]#Null:C1517)
		$values[5]:={characters: JSON Parse:C1218($values[5]; Is collection:K8:32)}
	End if 
	
	var $eTitlePrincipals : cs:C1710.TitlePrincipalsEntity
	$eTitlePrincipals:=ds:C1482.TitlePrincipals.new()
	
	$eTitlePrincipals.ordering:=$values[1]#Null:C1517 ? Num:C11($values[1]) : Null:C1517
	
	If ($values[3]#Null:C1517)
		var $eCategory : cs:C1710.CategoryEntity
		$eCategory:=ds:C1482.Category.query("value == :1"; $values[3]).first()
		If ($eCategory=Null:C1517)
			$eCategory:=ds:C1482.Category.new()
			$eCategory.value:=$values[3]
			$eCategory.save()
		End if 
		$eTitlePrincipals.categoryId:=$eCategory.getKey()
	End if 
	
	If ($values[4]#Null:C1517)
		var $eJob : cs:C1710.JobEntity
		$eJob:=ds:C1482.Job.query("value == :1"; $values[4]).first()
		If ($eJob=Null:C1517)
			$eJob:=ds:C1482.Job.new()
			$eJob.value:=$values[4]
			$eJob.save()
		End if 
		$eTitlePrincipals.jobId:=$eJob.getKey()
	End if 
	
	$eTitlePrincipals.value:=$values[5]
	$eTitlePrincipals.save()
	
	var $eTitleBasics : cs:C1710.TitleBasicsEntity
	$eTitleBasics:=ds:C1482.TitleBasics.query("tconst == :1"; $values[0]).first()
	If ($eTitleBasics#Null:C1517)
		$eTitlePrincipals.titleBasicsId:=$eTitleBasics.getKey()
	End if 
	
	var $eNameBasics : cs:C1710.NameBasicsEntity
	$eNameBasics:=ds:C1482.NameBasics.query("nconst == :1"; $values[2]).first()
	If ($eNameBasics#Null:C1517)
		$eTitlePrincipals.nameBasicsId:=$eNameBasics.getKey()
	End if 
	
	$eTitlePrincipals.save()
	
End while 

CLOSE DOCUMENT:C267($docref)
