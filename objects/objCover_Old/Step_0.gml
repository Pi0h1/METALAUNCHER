if text_alpha < 1 {text_alpha+=0.1}
if bg_alpha > 0 {bg_alpha-=0.2}
if bg_alpha1 > 0 {bg_alpha1-=0.2}

if blur=0{
x-=(blur_alpha)*4
if blur_alpha > 0 blur_alpha-=0.2
}else{
x=initial_x
if blur_alpha < 1 {blur_alpha+=0.2}
}

//scrInfo();

if spd<0 spd+=0.5


pressleft = keyboard_check_released(ord("A")) or keyboard_check_released(vk_left)
pressright = keyboard_check_released(ord("D")) or keyboard_check_released(vk_right)
pressinfo = keyboard_check_released( ord( "I" ) );

if (pressleft) {
	setCover(cover - 1)

}
if (pressright) {
	setCover(cover + 1)
}

if ( pressinfo )
{
	
}