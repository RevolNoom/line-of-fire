extends Action
class_name Move


func DoneByInfantry(unit):
	var _testDistance = Vector2(100, 0)
	unit.move_and_collide(_testDistance)
	
