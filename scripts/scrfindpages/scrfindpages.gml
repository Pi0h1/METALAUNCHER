function scrFindPages(){
	show_debug_message( "FINDING MANUAL PAGES" );
	var directory = scr_get_main_directory() + @"games\mg1\manual\";
	for ( var i = 0; true; i++ )
	{
	    if file_exists( directory + string( i ) + ".png" )
	    {
	        show_debug_message( "got page " + string( i ) );
	    }
	    else
	    {
	        show_message( "found " + string( i ) + " pages" );
	        return;
	    }
	}
}