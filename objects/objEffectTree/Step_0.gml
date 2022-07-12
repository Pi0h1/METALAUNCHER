if (objCover.blur = 0) {
	if (objCover.item_name = "mgs3") {
		if image_alpha < 1 {
			image_alpha += min(image_alpha + 0.1, 1)
		}
		image_angle = lengthdir_x(2, dir)
		dir += amount
    
	}
}
else {
	if (image_alpha > 0)
		image_alpha = max(0, image_alpha - 0.2)
}
