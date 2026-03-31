extends AudioStreamPlayer

const sfxs = {
	"say": "res://assets/rat_case/sfx/Say.wav"
}

func sfx(stringname):
	stream = load(sfxs[stringname])
	play()
