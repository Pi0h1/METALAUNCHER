if (window_command_check(window_command_restore)) {
    //trace("Restore clicked.");
    if (window_get_height() == 0) {
        // Restoring from minimized state
        window_command_run(window_command_restore);
    }
}