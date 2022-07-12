function scr_get_main_directory(){
	if true {	// temp dir
		var dir = @"C:\Users\Administrador\Desktop\METALGEARSOLID\"
		if directory_exists(dir)
			return dir
		
		return @"D:\GameDev\Projects\METALGEARLAUNCHER\"
	}
	
	return program_directory
}