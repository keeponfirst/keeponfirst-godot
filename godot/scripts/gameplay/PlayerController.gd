extends CharacterBody2D
class_name PlayerController

const SPEED = 200.0

@onready var interaction_ray: RayCast2D = $InteractionRay

func _ready() -> void:
    # Ensure RayCast is set up if not added in scene (fallback or safety)
    pass

func _physics_process(_delta: float) -> void:
    # Get the input direction and handle the movement/deceleration.
    var direction_x := Input.get_axis("move_left", "move_right")
    var direction_y := Input.get_axis("move_up", "move_down")
    
    var direction := Vector2(direction_x, direction_y).normalized()
    
    if direction:
        velocity = direction * SPEED
        
        # Update RayCast direction based on movement
        if interaction_ray:
            interaction_ray.target_position = direction * 40.0
    else:
        velocity = Vector2.ZERO

    move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("interact"):
        if interaction_ray and interaction_ray.is_colliding():
            var collider = interaction_ray.get_collider()
            # Check if collider is an Interactable or has an Interactable child/component
            # For this PoC, we assume the root node or a specific script is Interactable
            
            # Case 1: Collider itself is Interactable (e.g. Area2D script)
            if collider is Interactable:
                collider.interact()
                return
                
            # Case 2: Collider's parent is Interactable (common in Godot structure)
            var parent = collider.get_parent()
            if parent is Interactable:
                parent.interact()
                return

            print("[GAMEPLAY] Ray hit something, but not Interactable: ", collider.name)
        else:
            print("[GAMEPLAY] Interact pressed, nothing in range.")

