if blur=0 {
sfx(sndClick)
if cover=7{
ExecuteShell("\"steam://rungameid/311340", true);
with all game_end();
}

if cover=8{
ExecuteShell("\"steam://rungameid/287700\"", true);
with all game_end();
}

} else
{
sfx(sndClick)
blur=0
text_alpha=0
bgm(currentsong)
pauseBgm(idlesong)
spd=-32
}

