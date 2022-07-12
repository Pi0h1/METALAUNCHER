persistent = true
gpu_set_texfilter(true)
window_set_color(c_white)


var groups = [
	@"Default",
	@"texturesEffects",
	@"texturesPrompts"
	//@"texturesCovers"
]

for (var i = 0; i < array_length(groups); i++) {
	var textures = texturegroup_get_textures(groups[i])
	for (var n = 0; n < array_length(textures); n++) {
		texture_prefetch(textures[n])
	}
}


window_width = 1600
window_height = 900

window_x = window_get_x()
window_y = window_get_y()
window_x -= (window_width - window_get_width()) / 2
window_y -= (window_height - window_get_height()) / 2

window_set_rectangle(window_x, window_y, window_width, window_height)

