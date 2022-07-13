if enableTimer > 0 enableTimer-=1;
if enableTimer < 0 enableTimer=0;

if enableTimer=0{
canOpen=true;
}

if (text_alpha < 1)
	text_alpha = min(text_alpha + 0.1, 1)

if (bg_alpha > 0)
	bg_alpha = max(0, bg_alpha - 0.2)
	
if (bg_alpha1 > 0)
	bg_alpha1 = max(0, bg_alpha1 - 0.2)

if (blur = 0) {
	x = lerp(xstart, xstart + 16, blur_alpha)
	if (blur_alpha > 0)
		blur_alpha = max(0, blur_alpha - 0.2)
}
else {
	x = xstart + 16
	if (blur_alpha < 1)
		blur_alpha = min(1, blur_alpha + 0.2)
}

pressleft = keyboard_check_released(ord("A")) or keyboard_check_released(vk_left)
pressright = keyboard_check_released(ord("D")) or keyboard_check_released(vk_right)

pressconfirm = keyboard_check_released(vk_enter) or keyboard_check_released(vk_space) or mouse_check_button_released(mb_left)
pressback = mouse_check_button_released(mb_right) or keyboard_check_released(vk_escape)

presssort = keyboard_check_released(ord("Q"))

if (pressleft) {
	//Left
	cover_array_id --
	if (cover_array_id < 0)
		cover_array_id += game_count
	setCover(games_array[cover_array_id])
}

if (pressright) {
	//Right
	cover_array_id ++
	if (cover_array_id >= game_count)
		cover_array_id -= game_count
	setCover(games_array[cover_array_id])
}

if instance_exists(objCursor)
{
with objCursor {
	if !place_meeting(x,y,objButton) 
		{
			with objCover_New {selectGame();}
		}
	}
} else 
	{
		with objCover_New {selectGame();}
	}


if (pressback) {
	if (blur = 0) {
		blur = 1
		audio_stop_sound(music_game)
		audio_sound_gain(music_idle, 1, 1000 * 0.5)
		audio_resume_sound(music_idle)
		audio_play_sound(sndCancel, 0, false)
	}
	else {
		
	}
	
}

if (presssort) {
	if (sort_by = sortBy_ReleaseDate)
		sort_by = sortBy_IncidentYear
	else
		sort_by = sortBy_ReleaseDate
	
	array_sort(games_array, sort_by)
}


if (game_selection_current != noone) and (blur = 0) {
	// Incident Year
	var dest_length = string_length(item_incident_year_text)
	if (item_incident_year_typing_n <= dest_length) {
		item_incident_year_typing = string_copy(item_incident_year_text, 1, floor(max(0, item_incident_year_typing_n - 1))) + typing_characters[string_length(item_incident_year_typing) % (typing_characters_count - 1)]
		item_incident_year_typing_n = min(item_incident_year_typing_n + typing_speed_incident_year, dest_length + 1)
	}
	else
		item_incident_year_typing = item_incident_year_text
		
	// Incident Text
	var dest_length = string_length(item_incident_text)
	if (item_incident_text_typing_n <= dest_length) {
		item_incident_text_typing = string_copy(item_incident_text, 1, floor(max(0, item_incident_text_typing_n - 1))) + typing_characters[string_length(item_incident_text_typing) % (typing_characters_count - 1)]
		item_incident_text_typing_n = min(item_incident_text_typing_n + typing_speed_incident_text, dest_length + 1)
	}
	else
		item_incident_text_typing = item_incident_text
	
	// Description
	var dest_length = string_length(item_description_text)
	if (item_description_text_typing_n <= dest_length) {
		item_description_text_typing = string_copy(item_description_text, 1, floor(max(0, item_description_text_typing_n - 1))) + typing_characters[string_length(item_description_text_typing) % (typing_characters_count - 1)]
		item_description_text_typing_n = min(item_description_text_typing_n + typing_speed_description, dest_length + 1)
	}
	else
		item_description_text_typing = item_description_text
	
	
}