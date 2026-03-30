extends AudioStreamPlayer

const sfxs = {
	"": ""
}

func sfx(stringname):
	stream = load(sfxs[stringname])
	play()
	await finished
