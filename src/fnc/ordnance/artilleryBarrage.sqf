/*
	Author:
	    Bishop Johnson
	
	Parameter(s):
		Array - 
		Number - 
		Number - 
		Number - 
*/

params ["_position", "_radius", "_count", "_frequency"];

private ["_type", "_types", "_shell", "_logic", "_sound"];

if (!isServer) exitWith {};

_types = [] call compile preprocessFile "src\fnc\ordnance\artilleryTypes.sqf";
_type = selectRandom _types;

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	// Creates mortar shell
	_shell = _type createVehicle
	[
		(random [-_radius, 0, _radius]) + (_position select 0), // Randomize x-position
		(random [-_radius, 0, _radius]) + (_position select 1), // Randomize y-position
		1000                                                    // 1000 meters up
	];
	
	_shell setVelocity [0, 0, -100]; // Travel downward at 100 m/s
	
	switch (_type) do
	{
		case "Sh_82mm_AMOS":
		{
			_sound = ["mortar1", "mortar2"] call BIS_fnc_selectRandom;
		};
		case "Sh_155mm_AMOS":
		{
			_sound = ["shell1", "shell2", "shell3", "shell4"] call BIS_fnc_selectRandom;
		};
		default
		{
			_sound = nil;
		};
	};
	
	if (!isNil "_sound") then
	{
		/* TODO: Figure out how to spawn logic object to provide audio for artillery.
		 */
		//_logic setPos [getPos _shell select 0, getPos _shell select 1, 0]; // Move logic to impact area
		//[[_logic, _sound, "say3D"], "bis_fnc_sayMessage"] call bis_fnc_mp; // Play sound on logic
	};
	
	sleep _frequency;
};
