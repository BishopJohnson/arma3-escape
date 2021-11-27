/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

Escape_Random_Cargo_Basic = call DICT_fnc_create;
[Escape_Random_Cargo_Basic, RAND_CARGO_COMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_UNCOMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Basic, RAND_CARGO_RARE_KEY, call DICT_fnc_create] call DICT_fnc_set;

Escape_Random_Cargo_Launcher = call DICT_fnc_create;
[Escape_Random_Cargo_Launcher, RAND_CARGO_COMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_UNCOMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Launcher, RAND_CARGO_RARE_KEY, call DICT_fnc_create] call DICT_fnc_set;

Escape_Random_Cargo_Special = call DICT_fnc_create;
[Escape_Random_Cargo_Special, RAND_CARGO_COMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_UNCOMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Special, RAND_CARGO_RARE_KEY, call DICT_fnc_create] call DICT_fnc_set;

Escape_Random_Cargo_Prison = call DICT_fnc_create;
[Escape_Random_Cargo_Prison, RAND_CARGO_COMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_UNCOMMON_KEY, call DICT_fnc_create] call DICT_fnc_set;
[Escape_Random_Cargo_Prison, RAND_CARGO_RARE_KEY, call DICT_fnc_create] call DICT_fnc_set;

call compile preprocessFile "src\lists\randomCargo\nato.sqf";
call compile preprocessFile "src\lists\randomCargo\csat.sqf";
call compile preprocessFile "src\lists\randomCargo\aaf.sqf";
call compile preprocessFile "src\lists\randomCargo\csat_p.sqf";
call compile preprocessFile "src\lists\randomCargo\spetsnaz.sqf";
call compile preprocessFile "src\lists\randomCargo\ldf.sqf";
