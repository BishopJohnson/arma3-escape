/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

Escape_Random_Vehicles = call DICT_fnc_create;
[Escape_Random_Vehicles, str west, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Vehicles, str east, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Vehicles, str independent, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Vehicles, str civilian, call DICT_fnc_create] call DICT_fnc_set;

call compile preprocessFile "src\lists\randomVehicles\nato.sqf";
call compile preprocessFile "src\lists\randomVehicles\csat.sqf";
call compile preprocessFile "src\lists\randomVehicles\aaf.sqf";
call compile preprocessFile "src\lists\randomVehicles\csat_p.sqf";
call compile preprocessFile "src\lists\randomVehicles\ldf.sqf";
