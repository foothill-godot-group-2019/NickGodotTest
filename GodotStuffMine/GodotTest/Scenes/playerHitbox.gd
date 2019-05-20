extends Area2D
onready var enemy = get_node("../../Enemy")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_playerHitbox_body_entered():
	print("enemy hit") # Replace with function body.
	if(enemy != null):
		enemy.queue_free()
