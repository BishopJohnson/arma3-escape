/*
    Author:
	    Bishop Johnson
*/

fnc_startEscape =
{
	params ["_radioPosition"];
	
	if (!isServer) exitWith {};
	
	[_radioPosition, 3000] execVM "src\fnc\rescue\rescueStart.sqf"; // Initiates rescue
};
