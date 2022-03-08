extends Unit
class_name Infantry


func Do(action):
	action.DoneByInfantry(self)


func __TakeEffectForThisType(effect):
	effect.AffectOnInfantry(self)
