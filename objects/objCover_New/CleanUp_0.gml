for (var i = 0; i < array_length(games_array); i++) {
	var item = games_array[i]
	
	if !is_undefined(item[$ "cover_sprite"]) and sprite_exists(item.cover_sprite) {
		sprite_flush(item.cover_sprite)
		sprite_delete(item.cover_sprite)
	}
	
	if !is_undefined(item[$ "item_logo"]) and sprite_exists(item.item_logo) {
		sprite_flush(item.item_logo)
		sprite_delete(item.item_logo)
	}
	
	if !is_undefined(item[$ "music"]) and audio_exists(item.music)
		audio_destroy_stream(item.music)
	
}