if (objCover.blur = 0) {
	if (objCover.item_name = "mgspw") {
		if image_alpha < 1 {
			image_alpha += min(image_alpha + 0.1, 1)
		}
		image_angle -= 1
    
	}
}
else {
	if (image_alpha > 0)
		image_alpha = max(0, image_alpha - 0.2)
}

/*
if objCover.blur=0{
    if objCover.sprite_index=coverMGSPW {
    sprite_index=effectPeaceWalker
    if image_alpha<1 {image_alpha+=0.1}
    image_angle-=1
    }


}else{
if image_alpha>0 image_alpha-=0.2
}



