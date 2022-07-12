function scrDebugText(argument0) {
	draw_set_valign(fa_bottom)
	draw_set_font(fntHelvetica)
	draw_set_colour(c_black)
	draw_text(mouse_x+1,mouse_y-1,string_hash_to_newline(argument0))
	draw_text(mouse_x-1,mouse_y+1,string_hash_to_newline(argument0))
	draw_text(mouse_x-1,mouse_y-1,string_hash_to_newline(argument0))
	draw_text(mouse_x+1,mouse_y+1,string_hash_to_newline(argument0))
	draw_set_colour(c_white)
	draw_text(mouse_x,mouse_y,string_hash_to_newline(argument0))



}
