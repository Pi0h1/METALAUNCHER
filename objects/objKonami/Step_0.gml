if state=0{if image_alpha<1 image_alpha+=0.01}

if state=1{if darkalpha<1 darkalpha+=0.05}

if darkalpha>1 or darkalpha=1
{
state=3
}

if state=3{room_goto_next();}

