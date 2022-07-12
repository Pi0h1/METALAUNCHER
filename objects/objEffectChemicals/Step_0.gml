if (objCover.blur = 0) {
	if (objCover.item_name = "mgs2") {
		if image_alpha < 0.75 {
			image_alpha += min(image_alpha + 0.1, 0.75)
		}
		x += lengthdir_x(2, dir)
		image_angle += (amount / 2)
		dir += amount
	}
}
else {
	if (image_alpha > 0)
		image_alpha = max(0, image_alpha - 0.2)
}

/*

if objCover.blur=0{
    if objCover.sprite_index=coverMGS2 {
    if image_alpha<0.75 {image_alpha+=0.1}
    x+=lengthdir_x(2,dir)
    image_angle+=(amount)/2
    dir+=amount
    }


}else{
if image_alpha>0 image_alpha-=0.2
}

