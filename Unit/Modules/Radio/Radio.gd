extends Area2D


func NotifyCommander(unit):
	var ru = GetRadioableUnits()
	for u in ru:
		u.NotifyCommanderAboutRadio()
	
