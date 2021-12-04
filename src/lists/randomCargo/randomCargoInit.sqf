/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

Escape_Random_Cargo_Basic = createHashMap;
Escape_Random_Cargo_Basic set [RAND_CARGO_COMMON_KEY, createHashMap];
Escape_Random_Cargo_Basic set [RAND_CARGO_UNCOMMON_KEY, createHashMap];
Escape_Random_Cargo_Basic set [RAND_CARGO_RARE_KEY, createHashMap];

Escape_Random_Cargo_Launcher = createHashMap;
Escape_Random_Cargo_Launcher set [RAND_CARGO_COMMON_KEY, createHashMap];
Escape_Random_Cargo_Launcher set [RAND_CARGO_UNCOMMON_KEY, createHashMap];
Escape_Random_Cargo_Launcher set [RAND_CARGO_RARE_KEY, createHashMap];

Escape_Random_Cargo_Special = createHashMap;
Escape_Random_Cargo_Special set [RAND_CARGO_COMMON_KEY, createHashMap];
Escape_Random_Cargo_Special set [RAND_CARGO_UNCOMMON_KEY, createHashMap];
Escape_Random_Cargo_Special set [RAND_CARGO_RARE_KEY, createHashMap];

Escape_Random_Cargo_Prison = createHashMap;
Escape_Random_Cargo_Prison set [RAND_CARGO_COMMON_KEY, createHashMap];
Escape_Random_Cargo_Prison set [RAND_CARGO_UNCOMMON_KEY, createHashMap];
Escape_Random_Cargo_Prison set [RAND_CARGO_RARE_KEY, createHashMap];

call compile preprocessFile "src\lists\randomCargo\nato.sqf";
call compile preprocessFile "src\lists\randomCargo\csat.sqf";
call compile preprocessFile "src\lists\randomCargo\aaf.sqf";
call compile preprocessFile "src\lists\randomCargo\csat_p.sqf";
call compile preprocessFile "src\lists\randomCargo\spetsnaz.sqf";
call compile preprocessFile "src\lists\randomCargo\ldf.sqf";
call compile preprocessFile "src\lists\randomCargo\misc.sqf";

publicVariable "Escape_Random_Cargo_Prison";
