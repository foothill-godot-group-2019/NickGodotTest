extends KinematicBody2D
#enemy runSpeed
export (float) var runSpeed = 80
var velocity = Vector2()
export(float) var jumpHeight = 40
export(float) var jumpTime = 0.3
var spriteFacingRight = true
var skeletonSpawn = null

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	#should spawn one skeleton at the boss location
	if(skeletonSpawn == null):
		skeletonSpawn = preload("res://Scenes/Enemy.tscn")
		get_tree().get_root().add_child(skeletonSpawn)
		skeletonSpawn.spawn(position)
	
func _physics_process(delta):
	var move = 0.0
	var gravity = 2*jumpHeight/(jumpTime*jumpTime)

	velocity.y += gravity*delta

	if(position.x < player.position.x - 15):
		move += 1
		$AnimationPlayer.play("spiderRun")
			
	if(position.x > player.position.x - 20):
		if(velocity.x < 0):
			spriteFacingRight = false
		else:
			spriteFacingRight = true
		if(!spriteFacingRight):
			$Sprite.flip_h = true
		move -= 1
		$AnimationPlayer.play("spiderRun")
	else:
		#print("skeleton is defensive ", skeletonMode)
		pass
		
	velocity.x = move * runSpeed
	# -y is up, +y is down
	velocity = move_and_slide(velocity, Vector2(0, -1))


