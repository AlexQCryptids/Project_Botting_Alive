extends Control

#Set Start Time variables
var time_hr = 11
var time_min = 00
# Set Battery variables
var battery_charge = 5

@onready var time = $WatchUIBG/TopUI/Time
@onready var battery = $WatchUIBG/TopUI/Battery

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_time()
	battery.value = battery_charge
	
func set_time():
	var time_str = ""
	if time_hr < 10: #Adds 0 infront of single digit number
		time_str += "0" + str(time_hr)
	else:
		time_str += str(time_hr)
	
	time_str += ":"
	
	if time_min < 10:#Adds 0 infront of single digit number
		time_str += "0" + str(time_min)
	else:
		time_str += str(time_min)
		
	time.text = time_str #Sets time label to current time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
