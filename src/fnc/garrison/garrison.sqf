/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
		Number - 
		Number - 
		Side - 
		Bool (Optional) - 
		Number (Optional) - 
*/

params ["_position", "_maxRadius", "_minRadius", "_side"];

private ["_vehBool", "_patrolSize", "_buildings", "_vehicles", "_turrent", "_car", "_objects", "_object", "_length", "_i"];

if (!isServer) exitWith {};

_vehBool = false;
_patrolSize = floor random [4, 7, 9];

if (count _this > 4) then {_vehBool = _this select 4;};
if (count _this > 5) then {_patrolSize = _this select 5;};

switch (_side) do
{
	case "WEST": {_side = west;};
	case "EAST": {_side = east;};
	case "GUER": {_side = independent;};
};

_buildings =
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

// Whitelisted turrents
_turrent =
[
	"B_HMG_01_high_F",
	"B_GMG_01_high_F",
	"B_HMG_01_F",
	"B_GMG_01_F",
	"B_static_AT_F",
	"B_static_AA_F",
	"B_Mortar_01_F",
	"O_HMG_01_high_F",
	"O_GMG_01_high_F",
	"O_HMG_01_F",
	"O_GMG_01_F",
	"O_static_AT_F",
	"O_static_AA_F",
	"O_Mortar_01_F",
	"I_HMG_01_high_F",
	"I_GMG_01_high_F",
	"I_HMG_01_F",
	"I_GMG_01_F",
	"I_static_AT_F",
	"I_static_AA_F",
	"I_Mortar_01_F"
];

// Whitelisted cars
_car =
[
    "B_MRAP_01_hmg_F",
	"B_MRAP_01_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"I_MRAP_03_hmg_F",
	"I_MRAP_03_gmg_F"
];

_objects = nearestObjects [_position, ["house", "tank", "car", "staticweapon"], _maxRadius]; // Finds all nearby objects
_vehicles = +_objects;

// Removes elements from the list that are not whitelisted buildings
_length = count _objects;
for [{_i = 0}, {_i < _length}, {_i = _i + 1}] do
{
    _object = _objects select _i;
    if (!(typeOf _object in _buildings)) then
	{
	    _objects deleteAt _i;
		_i = _i - 1;
		_length = _length - 1;
	};
};

// Garrisons buildings
{
    [_x, _side /*, 0.2*/] execVM "src\fnc\garrison\occupyBuilding.sqf";
} forEach _objects;

// Removes elements from the list that are not whitelisted turrents (or MRAPS if _vehBool is true)
_length = count _vehicles;
for [{_i = 0}, {_i < _length}, {_i = _i + 1}] do
{
    _object = _vehicles select _i;
    if (!(typeOf _object in _turrent)) then
	{
	    if (!_vehBool || !(typeOf _object in _car)) then
		{
	        _vehicles deleteAt _i;
	        _i = _i - 1;
	        _length = _length - 1;
		};
	};
};

[
    _side,
    _patrolSize,
	nil,
	nil,
	_position,
	_maxRadius,
	_minRadius,
	0,
	false,
	""
] execVM "src\fnc\garrison\perimeterPatrol.sqf"; // Spawns perimeter patrol

[_vehicles] execVM "src\fnc\garrison\populateCrew.sqf"; // Garrisons vehicles
