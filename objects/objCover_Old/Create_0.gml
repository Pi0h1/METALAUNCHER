idlesong=muIdle
//bgm(idlesong)
blur=1
blur_alpha=1
cover=0
cover_count = e_gamelist.length
initial_x=x
textcolor=c_black
year=1991
title="METAL GEAR"
subtitle="OUTER HEAVEN"
number=0
incident="Outer Heaven Uprising"
numbercolor=c_aqua
pos=0
subcolor=c_white
ext=492
centertext=0
c_mgs2=make_colour_rgb(0,186,255)
text_alpha=0
bg_alpha=1
bg_alpha1=1
xpos=((room_width/2)/2)-256
ypos=0
description=""
currentsong=""
scrInfo();
spd=0
manual = [];


setCover = function(cover) {
	if (blur = 0)
		exit
	cover = clamp(cover, 0, self.cover_count - 1)
	if self.cover = cover
		exit
	self.cover = cover
	text_alpha=0
	bg_alpha=1
	sfx(sndNext)
	scrInfo()
}
