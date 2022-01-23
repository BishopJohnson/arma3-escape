/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

Escape_Static_Cargo = createHashMap;
Escape_Static_Cargo set [CARGO_AMMO_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_BASIC_WEAPONS_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_SPECIAL_WEAPONS_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_LAUNCHERS_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_GRENADES_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_EXPLOSIVES_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_SUPPORT_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_EQUIPMENT_KEY, createHashMap];
Escape_Static_Cargo set [CARGO_UNIFORMS_KEY, createHashMap];

call compile preprocessFile "src\lists\staticCargo\nato.sqf";
