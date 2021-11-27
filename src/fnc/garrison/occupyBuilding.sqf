/*
    Author:
	    Bohemia Interactive Studios
	
	Modified by:
	    Bishop Johnson
	
	Parameter(s):
	    Object - 
		Side - 
		Number (Optional) - Coefficent for how full the building is.
*/

params ["_building", "_side"];

private ["_coef", "_relDir", "_dist", "_elev", "_dir", "_units", "_buildings", "_paramsArray", "_finalCnt", "_newGrp", "_currentDude", "_pos", "_watchPos"];

if (!isServer) exitWith {};

_coef = 1;

if (count _this > 2) then {_coef = _this select 2};

if (!isNil {_building getVariable "occupied"}) exitWith {};

_building setVariable ["occupied", TRUE];

switch (_side) do
{
	case west: {_side = "BLU_F"};
	case east: {_side = "OPF_F"};
	case independent: {_side = "IND_F"};
};

_units =
[
    "rifleman",
	"autorifleman",
	"at",
	"leader"
];

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

if (!(typeOf _building in _buildings)) exitWith {
	hint format ["occupyBuilding.sqf:\n\nWARNING:\n\nBuilding type\n%1\nnot supported.", typeOf _building]
};

_paramsArray = _building buildingPos -1;
_finalCnt = round (count _paramsArray * _coef);

while {count _paramsArray > _finalCnt} do {
	_paramsArray = ([_paramsArray, floor random count _paramsArray] call BIS_fnc_removeIndex)
};

if (_finalCnt > 0) then {
	_newGrp = createGroup [([east, west, independent] select (getNumber (configFile >> "CfgFactionClasses" >> _side >> "side"))), true];
	if (isNull _newGrp) exitWith {};
    
	_currentDude = nil;
	
	{
		_pos = _x;
		([_side, _units select floor random (count _units)] call compile preprocessFile "src\fnc\randomUnits\pickUnit.sqf") createUnit [_pos, _newGrp, "_currentDude = this"];
		doStop _currentDude;
		commandStop _currentDude;
		_currentDude setPosATL _pos;
		_currentDude setUnitPos "UP";
		_dir = (_currentDude getRelDir _building) - 180;
		_watchPos = _currentDude getRelPos [1000, _dir];
		_currentDude doWatch _watchPos;
		_currentDude setDir _dir;
	} forEach _paramsArray;
    
	_newGrp selectLeader _currentDude;
	_newGrp deleteGroupWhenEmpty true;
	_newGrp enableDynamicSimulation true;
	
	{ _x triggerDynamicSimulation false; } forEach units _newGrp;
};
