/*
	author: Bishop
	description: none
	returns: nothing
*/

if (!isServer) exitWith {};

call compile preprocessFile "src\lists\randomCargo\randomCargoInit.sqf";
call compile preprocessFile "src\lists\randomVehicles\randomVehiclesInit.sqf";
call compile preprocessFile "src\lists\staticCargo\staticCargoInit.sqf";
call compile preprocessFile "src\lists\units\unitsInit.sqf";
