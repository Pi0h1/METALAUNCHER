if (window_command_check(window_command_restore)) {
    //trace("Restore clicked.");
    if (window_get_height() == 0) {
        // Restoring from minimized state
        window_command_run(window_command_restore);
    }
}

if window_get_width()	< 1 
or window_get_height()	< 1 {
	draw_enable_drawevent(false);
} 
else {
	draw_enable_drawevent(true);
}