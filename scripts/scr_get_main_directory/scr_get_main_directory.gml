function scr_get_main_directory(){
	// Temporary directory for development
	
	if true {
		// Home
		var dir = @"C:\Users\Administrador\Desktop\METALGEARSOLID\"
		if directory_exists(dir)
			return dir
		
		
		// Sage
		return @"D:\GameDev\Projects\METALGEARLAUNCHER\"
	}
	
	return program_directory
}