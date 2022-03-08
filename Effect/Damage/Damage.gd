extends Effect
class_name Damage

export var _amount = 0

func _init(amount).():
	_amount = amount
	

func AffectOnInfantry(unit):
	print(unit.get_name() + " taking damage")
	var hp = unit.GetAttribute("Health")
	print("Hp before: " + str(hp.GetValue()))
	hp.Decrease(_amount)
	print("Hp after: " + str(unit.GetAttribute("Health").GetValue()))
	queue_free()
