extends CanvasLayer

var midanim = false
var instanced = false 

func instance(maincolor: Color, node: String, issue: String, contents: String):
	get_tree().paused = true
	instanced = true
	$Base.modulate = maincolor
	get_node(node).modulate = maincolor
	get_node(node).get_node("Issue").text = "\n" + issue
	get_node(node).get_node("Contents").text = contents
	show()
	midanim = true
	$AnimationPlayer.play("begin")
	await get_tree().create_timer(0.5).timeout
	get_node(node).show()
	await get_tree().create_timer(0.5).timeout
	midanim = false

func destroy(node):
	midanim = true
	$AnimationPlayer.play("end")
	get_node(node).hide()
	await get_tree().create_timer(1).timeout
	hide()
	midanim = false
	instanced = false
	get_tree().paused = false
