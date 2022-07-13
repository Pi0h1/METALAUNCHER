draw_set_valign(fa_top)
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,blur_alpha)




if blur=1{
scrLogo(title,number,subtitle,xpos,480)
}
else{


scrLogo(title,number,subtitle,xpos,345)
draw_set_halign(fa_left)
draw_set_font(fntHelvetica)
draw_text_colour(((room_width/2)/2)-256,room_height/2-64,string_hash_to_newline(year),textcolor,textcolor,textcolor,textcolor,text_alpha)
draw_set_font(fntHelveticaSubtitle)
draw_text_colour(((room_width/2)/2)-256,room_height/2+80+3.5-64,string_hash_to_newline(incident),textcolor,textcolor,textcolor,textcolor,text_alpha)

draw_set_font(fntHelveticaDescription)
draw_text_colour(((room_width/2)/2)-256+2,room_height/2+80+64-64,string_hash_to_newline(description),textcolor,textcolor,textcolor,textcolor,text_alpha)
}


//draw_sprite_ext(psCross,0,245,1017,1,1,0,image_blend,1)
/*
scrDebugText("y="+string(pos))
*/

draw_set_alpha(bg_alpha1)
draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,0)



draw_set_alpha(1)



/* */
/*  */
