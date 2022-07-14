if (game_selection_current != noone) {
	if sprite_exists(sprite_index) {
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, lerp(1, 0.1, blur_alpha))
		if (blur_alpha > 0) {
			var amount = lerp(0, 2, blur_alpha)
			for (var i = 0; i < 360; i += (360 / 16)) {
				draw_sprite_ext(sprite_index, 0, x + dcos(i) * amount, y - dsin(i) * amount, image_xscale, image_yscale, image_angle, image_blend, lerp(0, 0.033, blur_alpha))
			}
		}
	}
		
	if (blur = 1) {
		
		if item_logo {
			var scale = logo_size / sprite_get_width(item_logo);
			logo_height = (sprite_get_height(item_logo)*scale)-logoDistance;
			draw_sprite_ext(item_logo,0,xpos,480+48,scale,scale,0,c_white,text_alpha);
			}
		else{
		logo_height = 0;
		drawLogo(xpos, 480)
		}
		
	}
	else {
		if item_logo {
			var scale = logo_size / sprite_get_width(item_logo);
			logo_height =  (sprite_get_height(item_logo)*scale)-logoDistance;
			draw_sprite_ext(item_logo,0,xpos,345+48,scale,scale,0,c_white,text_alpha);
			}
		else{
		logo_height = 0;
		drawLogo(xpos, 345)
		}
		// Incident Year
		if (item_incident_year_typing != "") {
			draw_set_font(fntHelvetica)
			draw_set_valign(fa_top)
			draw_set_halign(fa_left)
			var text_x = (room_width / 4) - 256
			var text_y = logo_height + yearY;
			draw_text_color(text_x, text_y, item_incident_year_typing, item_title_color, item_title_color, item_title_color, item_title_color, text_alpha)
		}
		
		// Incident
		if (item_incident_text_typing != "") {
			draw_set_font(fntHelveticaSubtitle)
			draw_set_valign(fa_top)
			draw_set_halign(fa_left)
			var text_x = (room_width / 4) - 256
			var text_y = logo_height + incidentY;
			draw_text_color(text_x, text_y, item_incident_text_typing, item_title_color, item_title_color, item_title_color, item_title_color, text_alpha)
		}
		
		// Description
		if (item_description_text_typing != "") {
			draw_set_font(fntHelveticaDescription)
			draw_set_valign(fa_top)
			draw_set_halign(fa_left)
			var text_x = (room_width / 4) - 256 + 2
			var text_y = logo_height + descriptionY;
			draw_text_color(text_x, text_y, item_description_text_typing, item_description_color, item_description_color, item_description_color, item_description_color, text_alpha)
		}
	}
	
	
	if (showManual){
		// Does a manual exist?
		if item_manual!=undefined{

			// Then make the screen darker
			draw_set_alpha(0.5)
			draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,0)
			draw_set_alpha(1)
			
			// And draw the manual
			draw_sprite_ext(item_manual[manualPage],0,room_width/2,room_height/2,.5+manualZoom,.5+manualZoom,0,c_white,1)
		}
	}
}
