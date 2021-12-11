/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

Escape_Random_Vehicles = createHashMap;
Escape_Random_Vehicles set [str west, createHashMap];
Escape_Random_Vehicles set [str east, createHashMap];
Escape_Random_Vehicles set [str independent, createHashMap];
Escape_Random_Vehicles set [str civilian, createHashMap];

call compile preprocessFile "src\lists\randomVehicles\nato.sqf";
call compile preprocessFile "src\lists\randomVehicles\csat.sqf";
call compile preprocessFile "src\lists\randomVehicles\aaf.sqf";
call compile preprocessFile "src\lists\randomVehicles\csat_p.sqf";
call compile preprocessFile "src\lists\randomVehicles\ldf.sqf";
call compile preprocessFile "src\lists\randomVehicles\civilian.sqf";
