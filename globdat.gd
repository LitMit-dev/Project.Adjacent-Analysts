extends Node

var rat_stage = 0

var rat_stages = ["malic"]



var cur_rat = 1

var has_tape_rec = false

var settings = {
	MUSIC = false,
	HINTS = false
}

func reset():
	rat_stage = 0
	rat_stages = ["malic"]
	cur_rat = 1
	has_tape_rec = false
