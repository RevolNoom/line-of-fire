extends Node
# An Unit-wrapper that provides additional
# responsibilities to Player-controlled Unit

# TODO: 
# Reference-count commandables and seeable units to 
# reduce searching work



# It's assumed that when the commander is set,
# the scene is set,
# and the group "units" is set
func SetCommander(unit):
	_commander = unit
	_commander.connect("VisionChanged", self, "UpdateVision")
	_commander.connect("RadioChanged", self, "UpdateRadio")
	
	var units = get_tree().get_nodes_in_group("units")
	for u in units:
		u.set_visible(false)


func UpdateVision(_object):
	
	RemoveAllPreviouslyFreedInstances()
	
	var objectsCanBeSeen = {}
	
	LightUp(objectsCanBeSeen)
	
	LightDownObjectsNotIn(objectsCanBeSeen)
			
	_seenUnits = objectsCanBeSeen	
			
	
func RemoveAllPreviouslyFreedInstances():
	for i in _seenUnits.keys():
		if not is_instance_valid(i):
			_seenUnits.erase(i)
	

func LightUp(objectsCanBeSeen):
	for unit in _commandableUnits:
		for obj in unit.GetObjectsInSight():
			objectsCanBeSeen[obj] = EXIST
			obj.set_visible(true)
	
	
func LightDownObjectsNotIn(objectsCanBeSeen):
	for obj in _seenUnits.keys():
		if objectsCanBeSeen.get(obj) != EXIST:
			obj.set_visible(false)
			
	
func UpdateRadio(unit):
	_commandableUnits.clear()
	for unit in _commander.GetRadioableUnits():
		_commandableUnits[unit] = EXIST 
		
	UpdateVision(unit)
	

var _commander

# Dictionaries to provide fast unit lookup
enum{
	EXIST = 1,
} 

var _seenUnits = {}
var _commandableUnits = {}
