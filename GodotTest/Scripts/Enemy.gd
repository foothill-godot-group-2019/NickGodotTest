extends KinematicBody2D
#enemy runSpeed
export (float) var runSpeed = 80
var velocity = Vector2()
export(float) var jumpHeight = 40
export(float) var jumpTime = 0.3
var spriteFacingRight = true
#pulls random integer that decides how skeleton acts
var skeletonMode = 1

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	var move = 0.0
	var gravity = 2*jumpHeight/(jumpTime*jumpTime)

	velocity.y += gravity*delta
#select an enemy mode
	if(skeletonMode == 1):
		#print("skeleton is aggresive ", skeletonMode)
	#movement
		if(position.x < player.position.x - 15):
			if(velocity.x > 0):
				$Sprite.flip_h = false
			move += 1
			$AnimationPlayer.play("enemySkeletonWalk")
			
		if(position.x > player.position.x - 20):
			if(velocity.x < 0):
				spriteFacingRight = false
			else:
				spriteFacingRight = true
			if(!spriteFacingRight):
				$Sprite.flip_h = true
			move -= 1
			$AnimationPlayer.play("enemySkeletonWalk")
	else:
		#print("skeleton is defensive ", skeletonMode)
		pass
		
	velocity.x = move * runSpeed
	# -y is up, +y is down
	velocity = move_and_slide(velocity, Vector2(0, -1))


