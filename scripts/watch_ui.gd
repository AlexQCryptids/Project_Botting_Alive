extends HBoxContainer

#Set Start Time variables
var hour = Global.time_hr
var minute = Global.time_min

@onready var time = $Time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_time()
	
func set_time():
	#Set Start Time variables
	hour = Global.time_hr
	minute = Global.time_min

	var time_str = ""
	if hour < 10: #Adds 0 infront of single digit number
		time_str += "0" + str(hour)
	else:
		time_str += str(hour)
	
	time_str += ":"
	
	if minute < 10:#Adds 0 infront of single digit number
		time_str += "0" + str(minute)
	else:
		time_str += str(minute)
		
	time.text = time_str #Sets time label to current time
