//%attributes = {"invisible":true}
TRUNCATE TABLE:C1051([TitleBasics:6])
TRUNCATE TABLE:C1051([TitleGenres:7])
TRUNCATE TABLE:C1051([Genre:11])
SET DATABASE PARAMETER:C642([TitleBasics:6]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([TitleGenres:7]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Genre:11]; Table sequence number:K37:31; 0)

var $f : 4D:C1709.File

$f:=File:C1566("/DATA/IMDb/title.basics.tsv")

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
	
	For ($i; 0; 8)
		$values[$i]:=$values[$i]#"\\N" ? $values[$i] : Null:C1517
	End for 
	
	var $eTitleBasics : cs:C1710.TitleBasicsEntity
	$eTitleBasics:=ds:C1482.TitleBasics.new()
	$eTitleBasics.tconst:=$values[0]
	$eTitleBasics.titleType:=$values[1]
	$eTitleBasics.primaryTitle:=$values[2]
	$eTitleBasics.originalTitle:=$values[3]
	$eTitleBasics.isAdult:=$values[4]#Null:C1517 ? Bool:C1537($values[4]) : Null:C1517
	$eTitleBasics.startYear:=$values[5]#Null:C1517 ? Num:C11($values[5]) : Null:C1517
	$eTitleBasics.endYear:=$values[6]#Null:C1517 ? Num:C11($values[6]) : Null:C1517
	$eTitleBasics.runtimeMinutes:=$values[7]#Null:C1517 ? Num:C11($values[7]) : Null:C1517
	$eTitleBasics.save()
	
	var $genres : Collection
	$genres:=$values[8]#Null:C1517 ? Split string:C1554($values[8]; ","; ck ignore null or empty:K85:5) : []
	
	var $eTitleGenres : cs:C1710.TitleGenresEntity
	var $eGenre : cs:C1710.GenreEntity
	For each ($genre; $genres)
		
		$eGenre:=ds:C1482.Genre.query("value == :1"; $genre).first()
		If ($eGenre=Null:C1517)
			$eGenre:=ds:C1482.Genre.new()
			$eGenre.value:=$genre
			$eGenre.save()
		End if 
		
		$eTitleGenres:=ds:C1482.TitleGenres.new()
		$eTitleGenres.titleBasicsId:=$eTitleBasics.getKey()
		$eTitleGenres.genreId:=$eGenre.getKey()
		$eTitleGenres.save()
		
	End for each 
	
End while 
