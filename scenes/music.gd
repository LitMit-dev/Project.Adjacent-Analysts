extends AudioStreamPlayer

const paths = {
	
	#misc
	"main": "res://assets/priest_case/music/Divine - A0.wav",
	
	###Rat
	"sewers": "res://assets/rat_case/music/Investigation! Sewers Ver. - B1.wav",
	"balcony": "res://assets/rat_case/music/Investigation! Balcony Ver. - B2.wav",
	"cafe": "res://assets/priest_case/music/Caffeinated Warmth - A2.wav",
	"bakery": "res://assets/rat_case/music/Investigation! Bakery!.wav",
	
	##Priest
	"confession": "res://assets/priest_case/music/The Sinners Grace - A1+4.wav",
	"cafetalk": "res://assets/priest_case/music/Caffeinated Warmth - A2.wav",
	"interviews": "res://assets/priest_case/music/Thoughts of the Holy Man - A3.wav",
	"cafe_run": "res://assets/rat_case/music/Investigation! Cafe Ver. - B3.wav",
	"bakeryofsin": "res://assets/priest_case/music/The Unjust.wav",
	"the end": "res://assets/priest_case/music/A Solemn Man - A5.wav",
}

func fade_in():
	if !globdat.settings.MUSIC:
		return
	volume_db = -80
	for i in range(80):
		volume_db += 1
		await get_tree().create_timer(0.01).timeout
	stop()

func fade_out():
	if !globdat.settings.MUSIC:
		return
	if !playing:
		play()
	volume_db = 0
	for i in range(80):
		volume_db -= 1
		await get_tree().create_timer(0.01).timeout

func music(stringname):
	if !globdat.settings.MUSIC:
		volume_db = -120
	stream = load(paths[stringname])
	play()
	await finished

func set_music_db():
	volume_db = [-80, 0][int(globdat.settings.MUSIC == true)]

func set_file(stringN):
	stream = load(stringN)
