/// @description  Run external files, games, or applications ...

/* 
    ExecuteShell(fname, wait, hidden);
    fname: file, program, or command to execute.
    wait: wait for file to close before resume?
    hidden: hide all files opened from command?
    "hidden" is both optional and Windows-only.
    "hidden" only works on files, not programs.
    "hidden" can hide batch files' cmd windows.
*/

// Run Microsoft Notepad and Calculator ...

if (os_type == os_windows)
{
    // Not all commmands will be recognized - i.e. the Windows-specific "start" command will not work
    ExecuteShell("\"C:\\Windows\\System32\\notepad.exe\" \"" + working_directory + "\\example.txt\"", false); // Open file
    
    // Open a batch file if you need to use more commands 
    ExecuteShell("\"C:\\Windows\\System32\\calc.exe\"", true); // Run program
}

// The Mac OS X equivalent ...

if (os_type == os_macosx)
{
    // The Mac-specific "open" command allows for opening non-executable files but ignores wait param
    ExecuteShell("open \"/Applications/TextEdit.app\" \"" + working_directory + "/example.txt\"", false); // Open file
    
    // Under "[App-Name-Here].app/Contents/MacOS/" is the app's run-able executable
    ExecuteShell("\"/Applications/Calculator.app/Contents/MacOS/Calculator\"", true); // Run program 
}

// The Ubuntu equivalent ...

if (os_type == os_linux)
{
    // This example is for Ubuntu - i.e. Xubuntu and others will not have these apps
    ExecuteShell("\"/usr/bin/gedit\" \"" + working_directory + "/example.txt\"", false); // Open file
    
    // Try running apps that you know exist on your OS
    ExecuteShell("\"/usr/bin/gnome-calculator\"", true); // Run program
}

game_end();

/* */
/*  */
