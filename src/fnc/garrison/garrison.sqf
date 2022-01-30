/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Array -
		Number -
		Number -
		Side -
		String (Optional) -
		Bool (Optional) -
		Number (Optional) -
*/

#include "..\..\..\define.hpp"

params
[
	"_position",
	"_maxRadius",
	"_minRadius",
	"_side",
	["_faction", "", [""]],
	["_vehBool", false, [true]],
	["_patrolSize", -1, [0]]
];

if (!isServer) exitWith {};

if (_patrolSize < 0) then
{
	_patrolSize = floor random [4, 7, 9];
};

switch (_side) do
{
	case "WEST": { _side = west };
	case "EAST": { _side = east };
	case "GUER": { _side = independent };
};

private _buildings =
[
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_House_V2_F",
	"Land_Cargo_House_V3_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_i_Barracks_V1_F",
	"Land_i_Barracks_V2_F",
	"Land_u_Barracks_V2_F",
	"Land_BagBunker_Tower_F",
	"Land_BagBunker_Larger_F",
	"Land_BagBunker_Small_F"
];

private _whitelistedTurrentTypes = [RAND_VEH_TURRET_L_KEY, RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY];
private _whitelistedVehicleTypes = [RAND_VEH_CAR_ARMED_KEY, RAND_VEH_MRAP_ARMED_KEY];
private _turrents = [];
private _cars = [];
{
	if (_x == str civilian) then { continue };

	private _sideDict = _y;
	{
		private _factionDict = _y;
		{
			private _type = _x;
			private _typeDict = _y;

			if (_type in _whitelistedTurrentTypes) then
			{
				{
					private _vehEntry = _y;
					{
						_turrents pushBackUnique _x;
					} forEach (_vehEntry select 0);
				} forEach _typeDict;

				continue;
			};

			if (_vehBool && _type in _whitelistedVehicleTypes) then
			{
				{
					private _vehEntry = _y;
					{
						_cars pushBackUnique _x;
					} forEach (_vehEntry select 0);
				} forEach _typeDict;

				continue;
			};
		} forEach _factionDict;
	} forEach _sideDict;
} forEach Escape_Random_Vehicles;

private _objects = nearestObjects [_position, ["house", "car", "staticweapon"], _maxRadius]; // Finds all nearby objects
private _vehicles = +_objects;

// Removes elements from the list that are not whitelisted buildings
for [{ private _i = 0 }, { _i < count _objects }, { _i = _i + 1 }] do
{
    private _object = _objects select _i;
	if (typeOf _object in _buildings) then { continue };

	_objects deleteAt _i;
	_i = _i - 1;
};

// Garrisons buildings
{
    [_x, _side] execVM "src\fnc\garrison\occupyBuilding.sqf";
} forEach _objects;

// Removes elements from the list that are not whitelisted turrents (or MRAPS if _vehBool is true)
for [{ private _i = 0 }, { _i < count _vehicles }, { _i = _i + 1 }] do
{
    private _object = _vehicles select _i;
	if (typeOf _object in _turrents || _vehBool && typeOf _object in _cars) then { continue };

	_vehicles deleteAt _i;
	_i = _i - 1;
};

[_position, _maxRadius, _minRadius, _patrolSize, _side, _faction] execVM "src\fnc\garrison\perimeterPatrol.sqf";
[_vehicles, _faction] execVM "src\fnc\garrison\populateCrew.sqf";
