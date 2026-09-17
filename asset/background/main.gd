extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$hint/Label.visible = false
	$hint/Label2.visible = false
	$hint/Label6.visible = false
	$comment/Label2.visible = false
	$comment/Label3.visible = true
	$comment/Label4.visible = false
	$comment/Label5.visible = false
	$comment/Label6.visible = true
	$comment/Label7.visible = false
	$comment/Label8.visible = false
	$comment/Label9.visible = false
	$comment/Label10.visible = false
	$comment/Label11.visible = false
	$comment/Label12.visible = false
	$comment/Label13.visible = false
	
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalScript.death == 0:
		$hint/Label.visible = true
	
	if GlobalScript.death == 1:
		$hint/Label.visible = false
		$hint/Label2.visible = true
		$comment/Label2.visible = true
		
	if GlobalScript.area1 == 1:
		$comment/Label4.visible = true
		$comment/Label5.visible = true
		
	if GlobalScript.finished == 1:
		$hint/Label2.visible = false
		$comment/Label2.visible = false
		$comment/Label5.visible = false
		$comment/Label4.visible = false
		$comment/Label7.visible = true
		$comment/Label8.visible = true
		$comment/Label3.visible = false
		$comment/Label11.visible = true
	
	if GlobalScript.area1 == 2 and GlobalScript.finished == 1:
		$comment/Label9.visible = true
		$comment/Label10.visible = true
	
	if GlobalScript.finished == 2:
		$comment/Label12.visible = true
		$comment/Label3.visible = false
		


func death_zone(body:CharacterBody2D) -> void:
	GlobalScript.death +=1
	print(GlobalScript.death)
	get_tree().change_scene_to_file("res://asset/background/main.tscn")
	


func checkpoint1(body: CharacterBody2D) -> void:
	GlobalScript.area1 += 1


func end_point(body: CharacterBody2D) -> void:
	GlobalScript.finished +=1
	GlobalScript.area1 = GlobalScript.finished
	print(GlobalScript.finished)



func ending(body: CharacterBody2D) -> void:
	if GlobalScript.finished == 2:
		GlobalScript.check = false
		print(GlobalScript.check)
		$comment/Label13.visible = true
		$comment/Label14.visible = true
