if activate{
image_alpha=1;
activate=0;
}

if image_alpha > 0 image_alpha-=fadeOutSpeed;
if image_alpha < 0 image_alpha=0;