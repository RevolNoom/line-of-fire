extends KinematicBody2D
class_name Unit

# Units are entities that can be commanded, 
# seen on radio, seen by eyes
# They reside on collision layer 1

signal VisionChanged(object)
signal RadioChanged(unit)

func _init():
	add_to_group("unit")
	set_visible(false)
	

func Do(_action):
	printerr("OVERRIDE ME: DO(_action) for " + self.get_path())


func TakeEffect(effect):
	# TODO: 
	# Pass this effect on currently undergoing effects to be modified
	
	# DigestEffect(effect)
	
	__TakeEffectForThisType(effect)


func GetAttribute(name):
	return get_node("Attribute/" + name)


# Hook function. Invoked in TakeEffect()
func __TakeEffectForThisType(_effect):
	printerr("OVERRIDE ME: TakeEffectForThisType(effect) for " + self.get_path())


#
# <<RADIO>>
#

# Return an array of units that this unit can radio
func GetUnitsInRadioRange():
	return $Radio.get_overlapping_bodies()


# Return an array of Units that this unit can radio
func GetRadioableUnits():
	var searchQueue = [self]
	var radioableUnits = {}
	var EXIST = 1

	while not searchQueue.empty():
		var nextUnit = searchQueue.pop_back()
		if radioableUnits.get(nextUnit) != EXIST:
			radioableUnits[nextUnit] = EXIST
			searchQueue.append_array(nextUnit.GetUnitsInRadioRange())
	
	return radioableUnits.keys()
	

func UpdateRadio(unit):
	var ru = GetRadioableUnits()
	for u in ru:
		u.NotifyCommanderAboutRadio(unit)
	

func NotifyCommanderAboutRadio(unit):
	emit_signal("RadioChanged", unit)
	
#
# <<VISION>>
#

# Return an array of objects that this unit can see
func GetObjectsInSight():
	return $Vision.get_overlapping_bodies()


func UpdateVision(object):
	var ru = GetRadioableUnits()
	for u in ru:
		u.NotifyCommanderAboutVision(object)


func NotifyCommanderAboutVision(object):
	emit_signal("VisionChanged", object)
	
	
