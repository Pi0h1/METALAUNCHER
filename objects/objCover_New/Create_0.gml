#region Init Variables
logo_size = 512;
directory_main = scr_get_main_directory()
logo_height = 0;
logoDistance = 90;
yearY = (room_height / 2) - 64;
incidentY = (room_height / 2) + 26 // -64+80+6=26;
descriptionY = (room_height / 2) + 80;
canOpen = true;
enableTimer = 0;
showManual = 0;
manualPage = 0;
manualZoom = 0;
zoomValue = 0.25
#endregion

#region Functions

function ResetManual(){
	showManual = 0;
	pressinfo  = 0;
	manualPage = 0;
	manualZoom = 0;
}


getGameInfo = function(directory) {
	var file = file_text_open_read(directory + @"game.txt")


	if !(file < 0) {
		var text = "{ "
		var text_line = ""
		while (!file_text_eof(file)) {
			text_line = file_text_read_string(file)
			text += text_line + ","
			file_text_readln(file)
		}
		text += " }"
		file_text_close(file)
		var struct = json_parse(text)
		
		if file_exists(directory + @"description.txt") {
			file = file_text_open_read(directory + @"description.txt")
			text = ""
			text_line = ""
			while (!file_text_eof(file)) {
				text_line = file_text_read_string(file)
				text += text_line + "\n"
				file_text_readln(file)
			}
			file_text_close(file)
			struct.description_text = text
		}
		
		if file_exists(directory + @"quote.txt") {
			file = file_text_open_read(directory + @"quote.txt")
			text = ""
			text_line = ""
			while (!file_text_eof(file)) {
				text_line = file_text_read_string(file)
				text += text_line + "\n"
				file_text_readln(file)
			}
			file_text_close(file)
			struct.quote_text = text
		}
		
		if file_exists(directory + @"cover.png") {
			struct.cover_sprite = sprite_add(directory + @"cover.png", 0, false, false, 0, 0)
			sprite_set_offset(struct.cover_sprite, floor(sprite_get_width(struct.cover_sprite) / 2), floor(sprite_get_height(struct.cover_sprite) / 2))
		}
		
		if file_exists(directory + @"logo.png") {
			struct.item_logo = sprite_add(directory + @"logo.png", 0, false, false, 0, 0)
			//sprite_set_offset(struct.item_logo, floor(sprite_get_width(struct.item_logo) / 2), floor(sprite_get_height(struct.item_logo) / 2))
		}
		
		if file_exists(directory + @"music.ogg") {
			struct.music = audio_create_stream(directory + @"music.ogg")
		}
		
		var manual_dir = directory + @"manual\";
		if directory_exists( manual_dir )
		{
			struct.manual_pages = [];
			for ( var i = 0; true; i++ )
			{
				var fullpath = manual_dir + string( i ) + ".png";
				if file_exists( fullpath )
				{
					var sprite = sprite_add( fullpath, 1, false, false, 0, 0 );
					sprite_set_offset( sprite, sprite_get_width( sprite ) / 2, sprite_get_height( sprite ) / 2 )
					struct.manual_pages[i] = sprite;
					//sprite_set_offset(struct.manual_pages, floor(sprite_get_width(struct.manual_pages) / 2), floor(sprite_get_height(struct.manual_pages) / 2))
				}
				else
				{
					break;
				}
			}
		}
		return struct
	}
}

sortBy_ReleaseDate = function(item1, item2) {
	var date1 = item1[$ "release_ymd"]
	var date2 = item2[$ "release_ymd"]
	
	if is_undefined(date1)
		return -1
	if is_undefined(date2)
		return 1
	
	if array_equals(date1, date2)
		return 0
	else if (date1[0] < date2[0])
		return -1
	else if (date1[0] = date2[0]) and (date1[1] < date2[1])
		return -1
	else if (date1[0] = date2[0]) and (date1[1] = date2[1]) and (date1[2] < date2[2])
		return -1
	else
		return 1
}

sortBy_IncidentYear = function(item1, item2) {
	var date1 = item1[$ "incident_year"]
	var date2 = item2[$ "incident_year"]
	if is_undefined(date1)
		return -1
	if is_undefined(date2)
		return 1
	
	if !is_array(date1)
		date1 = [date1]
	if !is_array(date2)
		date2 = [date2]
	
	if (date1[0] < date2[0])
		return -1
	else if (date1[0] > date2[0])
		return 1
	else
		return 0
}

setCover = function(item) {
	if (game_selection_current = item)
		exit
	if (blur = 0)
		exit
	text_alpha = 0
	bg_alpha = 1
	bg_alpha1 = 1
	cover_sprite=-1;
	item_logo =-1;
	game_selection_current = item
	game_selection_current_id = item.id
	item_manual = undefined;
	audio_play_sound(sndNext, 0, false)
	
	if is_struct(item) {
		item_name = item[$ "name"]
		
		var _get = item[$ "title_text"]
		item_title_text = string(_get)
		
		_get = item[$ "title_rgb"]
		if is_array(_get) and (array_length(_get) = 3)
			item_title_color = make_color_rgb(_get[0], _get[1], _get[2])
		else
			item_title_color = c_black
	
		_get = item[$ "title_number_text"]
		item_title_number_text = string(_get)
	
		_get = item[$ "title_number_rgb"]
		if is_array(_get) and (array_length(_get) = 3)
			item_title_number_color = make_color_rgb(_get[0], _get[1], _get[2])
		else	
			item_title_number_color = c_black
	
		_get = item[$ "subtitle_text"]
		item_subtitle_text = string(_get)
		item_subtitle_text_spaced = string_char_at(item_subtitle_text, 1)
		for (var i = 2; i <= string_length(item_subtitle_text); i++) {
			item_subtitle_text_spaced += (" " + string_char_at(item_subtitle_text, i))
		}
		
		_get = item[$ "subtitle_rgb"]
		if is_array(_get) and (array_length(_get) = 3)
			item_subtitle_color = make_color_rgb(_get[0], _get[1], _get[2])
		else
			item_subtitle_color = c_white
		
		_get = item[$ "subtitle_background_rgb"]
		item_subtitle_background_color = make_color_rgb(_get[0], _get[1], _get[2])
	
		_get = item[$ "incident_text"]
		item_incident_text = string(_get)
	
		_get = item[$ "incident_year"]
		if is_real(_get)
			item_incident_year = [_get]
		else if is_array(_get)
				item_incident_year = _get
		else
			item_incident_year = [0]
		item_incident_year_text = string(item_incident_year[0]) + ((array_length(item_incident_year) > 1) ? ("-" + string(item_incident_year[1])) : "")
		
		_get = item[$ "description_text"]
		if is_undefined(_get)
			item_description_text = ""
		else
			item_description_text = string(_get)
		
		_get = item[$ "description_color"]
		if is_array(_get) and (array_length(_get) = 3)
			item_description_color = make_color_rgb(_get[0], _get[1], _get[2])
		else
			item_description_color = c_white
		
		_get = item[$ "release_ymd"]
		if is_array(_get) and (array_length(_get) = 3)
			item_release_ymd = _get
		else
			item_release_ymd = [0, 0, 0]
	
		_get = item[$ "steam_gameid"]
		if is_undefined(_get) or (_get = "")
			item_steam_gameid = -1
		else
			item_steam_gameid = _get
	
		if (is_real(item_steam_gameid) and !(item_steam_gameid < 0))
			item_launch = "\"" + @"steam://rungameid/" + string(item_steam_gameid) + "\""
		else if file_exists(directory_games + item.name + @"\game.lnk" )
			item_launch = directory_games + item.name + @"\game.lnk" 
		else if file_exists(directory_games + item.name + @"\game.url" )
			item_launch = directory_games + item.name + @"\game.url"
		else
			item_launch = ""
		
		_get = item[$ "manual_pages"];
		if is_array( _get )
			item_manual = _get;
	}
	
	if !is_undefined(item[$ "cover_sprite"])
		sprite_index = item[$ "cover_sprite"]
		
	if !is_undefined(item[$ "item_logo"])
		item_logo = item[$ "item_logo"]
	
	//window_set_caption(+string(item_title_text) + ((item_title_number_text != "") ? (" " + string(item_title_number_text)) : "") + ": " + string(item_subtitle_text))
	//window_set_caption(string_upper(item_name))
}

launchGame = function() {
	if (item_launch = "") {
		var store_url = game_selection_current[$ "store_url"]
		
		// Open store page
		if !is_undefined(store_url) and string_length(store_url) > 1
		{
			url_open(store_url)
		} else // Content is not available
			{
				audio_play_sound(snd_launch_failed, false, false)
				if instance_exists(objContentUnavailable){
					objContentUnavailable.activate=1;
				}
			}
	}
	else {
		if canOpen {
			ExecuteShell(item_launch, false);
			audio_pause_sound(music_game);
			canOpen = false;
			enableTimer=60;
		}
		//game_end()
	}
}

drawLogo = function(x, y) {
	draw_set_alpha(text_alpha)
	
	// Logo
	var title_width = 0
	if (item_title_text != "") {
		draw_set_font(fntHelveticaCompressed)
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		title_width = string_width(item_title_text)
		draw_text_colour(x, y, item_title_text, item_title_color, item_title_color, item_title_color, item_title_color, text_alpha)
	}
	
	// Number
	var title_number_width = 0
	if (item_title_number_text != "") {
		draw_set_font(fntHelveticaCompressed)
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		title_number_width = string_width(" " + item_title_number_text)
		draw_text_colour(x + title_width + string_width(" "), y, item_title_number_text, item_title_number_color, item_title_number_color, item_title_number_color, item_title_number_color, text_alpha)
	}
	
	// Subtitle
	var subtitle_width = 0
	if (item_subtitle_text_spaced != "") {
		draw_set_font(fntHelveticaSubtitle)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		subtitle_width = string_width(item_subtitle_text_spaced)
		var _x1 = x
		var _y1 = y + 80 + 4
		var _x2 = x + title_width + title_number_width
		var _y2 = y + 80 + 32 + 6
		draw_rectangle_colour(_x1, _y1, _x2 - 1, _y2 - 1, item_subtitle_background_color, item_subtitle_background_color, item_subtitle_background_color, item_subtitle_background_color, 0)
		draw_text_colour(lerp(_x1, _x2, 0.5), lerp(_y1, _y2, 0.55), item_subtitle_text_spaced, item_subtitle_color, item_subtitle_color, item_subtitle_color, item_subtitle_color, text_alpha)
	}
	
	draw_set_alpha(1)
}

#endregion

#region Game Loading
directory_games = directory_main + @"games\"

// Find games
games = {}
games_array = []
game_count = 0
game_directories = []
var file_find = file_find_first(directory_games + @"*", fa_directory)
while (file_find != "") {
	if file_exists(directory_games + file_find + @"\game.txt") {
		game_directories[game_count++] = file_find
	}
	file_find = file_find_next()
}
file_find_close()

for (var i = 0; i < array_length(game_directories); i++) {
	var directory = game_directories[i]
	var dir = directory_games + game_directories[i] + @"\"
	var struct = getGameInfo(dir)
	struct.id = i
	struct.name = directory
	variable_struct_set(games, directory, struct)
	games_array[i] = struct
}
#endregion

#region Current Item
game_selection_current = noone
game_selection_current_id = -1
cover_array_id = 0

item_name = "ITEMNAME"

item_title_text = "TITLE"
item_title_color = c_black
item_title_number_text = "NUMBER"
item_title_number_color = c_black

item_logo = -1;

item_subtitle_text = "SUBTITLE"
item_subtitle_color = c_white
item_subtitle_background_color = c_black

item_incident_year = 1995
item_incident_year_typing = ""
item_incident_year_typing_n = 0

item_incident_text = "INCIDENT"
item_incident_text_typing = ""
item_incident_text_typing_n = 0

item_description_text = ""
item_description_color = c_black
item_description_text_typing = ""
item_description_text_typing_n = 0

item_release_ymd = [0, 0, 0]

item_steam_gameid = ""
item_launch = ""

item_manual = [];
#endregion

#region Sorting Games
sort_by = sortBy_ReleaseDate

array_sort(games_array, sort_by)

blur = 1
blur_alpha = 1
text_alpha = 0
xpos = (room_width / 4) - 256

music_idle = audio_play_sound(audio_create_stream(directory_main + @"assets\music\idle.ogg"), 0, true)
music_game = -1

setCover(games_array[0])


typing_speed_incident_year = 0.2
typing_speed_incident_text = 1.5
typing_speed_description = 5

typing_characters = [
	@"!",
	@"$",
	@"%",
	@"&",
	@"/",
	@"(",
	@")",
	@"=",
	@"?",
]
typing_characters_count = array_length(typing_characters)
#endregion

#region Select Game
function selectGame(){
	if (pressconfirm) {
		if (blur = 0) {
			launchGame()
		}
		else {
			audio_play_sound(sndClick, 0, false)
			blur = 0
			bg_alpha = 1
			text_alpha = 0
			item_incident_year_typing_n = 1
			item_incident_text_typing_n = 1
			item_description_text_typing_n = 1
			if (game_selection_current != noone) and !is_undefined(game_selection_current[$ "music"]) and audio_exists(game_selection_current[$ "music"])
				{
				//audio_pause_sound(music_idle)
				audio_sound_gain(music_idle, 0, 1000 * 0.75)
				audio_stop_sound(music_game)
				music_game = audio_play_sound(game_selection_current[$ "music"], 0, true)
				}
			}
		}
}
#endregion

