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

#include "..\..\..\define.hpp"

params
[
	"_building",
	"_side",
	["_faction", "", [""]],
	["_coef", 1, [1]]
];

if (!isServer || !isNil { _building getVariable "occupied" }) exitWith {};

_building setVariable ["occupied", TRUE];

private "_groupSide";
if (typeName _side == "Side") then
{
	_groupSide = _side;
	_side = str _side;
}
else
{
	switch (_side) do
	{
		case str west:			{ _groupSide = west };
		case str east:			{ _groupSide = east };
		case str independent:	{ _groupSide = independent };
	};
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

private _typeWeights =
[
    UNIT_CLASS_RIFLEMEN,		0.45,
	UNIT_CLASS_AUTORIFLEMEN,	0.2,
	UNIT_CLASS_AT,				0.2,
	UNIT_CLASS_AA,				0.05,
	UNIT_CLASS_LEADER,			0.1
];

if (!(typeOf _building in _buildings)) exitWith
{
	hint format ["occupyBuilding.sqf:\n\nWARNING:\n\nBuilding type\n%1\nnot supported.", typeOf _building]
};

private _paramsArray = _building buildingPos -1;
private _finalCnt = round (count _paramsArray * _coef);
while {count _paramsArray > _finalCnt} do
{
	_paramsArray = ([_paramsArray, floor random count _paramsArray] call BIS_fnc_removeIndex)
};

if (_finalCnt > 0) then
{
	private _group = createGroup [_groupSide, true];
	if (isNull _group) exitWith {};

	{
		private _pos = _x;
		private _unit =
		[
			_pos,
			_side,
			_faction,
			_group,
			_typeWeights
		] call compile preprocessFile "src\fnc\units\spawnUnit.sqf";

		doStop _unit;
		commandStop _unit;
		_unit setPosATL _pos;
		_unit setUnitPos "UP";

		private _dir = (_unit getRelDir _building) - 180;
		private _watchPos = _unit getRelPos [1000, _dir];
		_unit doWatch _watchPos;
		_unit setDir _dir;
	} forEach _paramsArray;

	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation true;
	removeFromRemainsCollector units _group;

	{ _x triggerDynamicSimulation false; } forEach units _group;
};
