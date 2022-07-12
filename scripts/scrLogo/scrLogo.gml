function scrLogo(argument0, argument1, argument2, argument3, argument4) {
	draw_set_alpha(text_alpha)
	draw_set_font(fntHelveticaCompressed)

	//Draws the text in color so that the number is aligned
	draw_text_colour(argument3,argument4,string_hash_to_newline(argument0+" "+string(argument1)),numbercolor,numbercolor,numbercolor,numbercolor,text_alpha)

	//White border around it to remove anti-aliasing
	draw_text_colour(argument3-0.2,argument4+0.2,string_hash_to_newline(argument0),c_white,c_white,c_white,c_white,1)
	draw_text_colour(argument3+0.2,argument4-0.2,string_hash_to_newline(argument0),c_white,c_white,c_white,c_white,1)
	draw_text_colour(argument3-0.2,argument4-0.2,string_hash_to_newline(argument0),c_white,c_white,c_white,c_white,1)
	draw_text_colour(argument3+0.2,argument4+0.2,string_hash_to_newline(argument0),c_white,c_white,c_white,c_white,1)

	//Draws the logo
	draw_text_colour(argument3,argument4,string_hash_to_newline(argument0),textcolor,textcolor,textcolor,textcolor,text_alpha)

	// Draws subtitle
	draw_set_font(fntHelveticaSubtitle)
	//draw_rectangle_colour(ext,room_height/2+80-160,227,room_height/2+80+32-160,textcolor,textcolor,textcolor,textcolor,0)

	draw_rectangle_colour(argument3+ext-224,argument4+80+4,argument3+1,argument4+80+32,textcolor,textcolor,textcolor,textcolor,0)

	/*
	        y1
	x1              x2
	        y2
	*/
	
	draw_text_colour(argument3+8+centertext-0.5,argument4+80+6.5+0.5,string_hash_to_newline(argument2),textcolor,textcolor,textcolor,textcolor,1)
	draw_text_colour(argument3+8+centertext+0.5,argument4+80+6.5+0.5,string_hash_to_newline(argument2),textcolor,textcolor,textcolor,textcolor,1)
	draw_text_colour(argument3+8+centertext-0.5,argument4+80+6.5-0.5,string_hash_to_newline(argument2),textcolor,textcolor,textcolor,textcolor,1)
	draw_text_colour(argument3+8+centertext+0.5,argument4+80+6.5+0.5,string_hash_to_newline(argument2),textcolor,textcolor,textcolor,textcolor,1)

	draw_text_colour(argument3+8+centertext,argument4+80+6.5,string_hash_to_newline(argument2),subcolor,subcolor,subcolor,subcolor,1)



}
