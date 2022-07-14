function scr_get_main_directory(){
	/* 
	This is the temporary directory for working on the project.
	
	The "Userpath" variable is C:\Users\{username}
	
	*/
	
	var Userpath = environment_get_variable("userprofile");

	if true {
		var dir = Userpath + @"\Desktop\METALAUNCHER\"
		if directory_exists(dir)
			return dir
		
		// Sage
		return @"D:\GameDev\Projects\METALGEARLAUNCHER\"
	}
	
	return program_directory
}