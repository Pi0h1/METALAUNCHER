image_speed = 0;

borderless = false;

window_command_hook(window_command_minimize);
window_command_hook(window_command_maximize);
window_command_hook(window_command_restore);
window_command_hook(window_command_close);

function winMinimize(){
	window_command_run(window_command_minimize);
}

function winMaximize(){
	window_command_run(window_command_maximize);
}

function winRestore(){
	window_command_run(window_command_restore);
}

function winClose(){
	window_command_run(window_command_close);
}

function setFullscreen(){
	window_set_size(display_get_width(),display_get_height());
}


function setWindowed(){
	window_set_size(1600,900);
}