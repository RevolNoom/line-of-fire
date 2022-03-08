extends Action
class_name Shoot

func DoneByInfantry(unit):
	_shooter = unit
	var d = PromptDirection()
	Shoot(d)
	
	
# TODO
func PromptDirection():
	return Vector2(100, 0)
	
func Shoot(direction):
	var b = bullet.instance()
	$"/root/ForgottenRealm".add_child(b)
	b.add_collision_exception_with(_shooter)
	b.set_position(_shooter.get_global_position())
	b.apply_central_impulse(direction.normalized()*1000)
	
	
var _shooter
var bullet = preload("res://Item/Bullet.tscn")
