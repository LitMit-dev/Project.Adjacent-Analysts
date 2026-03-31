extends Node

var rat_stage = 0
var path = "Priest"

var dialstagisma = [false, false, 0]
var rat_stages = ["malic"]

var complete = [false, false]

var cur_rat = 1

var has_tape_rec = false

var settings = {
	MUSIC = true,
	HINTS = true
}

func reset():
	rat_stage = 0
	rat_stages = ["malic"]
	cur_rat = 1
	has_tape_rec = false
	dialstagisma[2] = 0
