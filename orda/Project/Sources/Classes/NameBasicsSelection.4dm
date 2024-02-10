Class extends EntitySelection

exposed Function getTitles() : 4D:C1709.EntitySelection
	
	return This:C1470.titles.or(This:C1470.principalTitles)