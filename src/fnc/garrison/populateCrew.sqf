/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Object -
        String (Optional) -
*/

params
[
    "_veh",
    ["_faction", nil, [""]]
];

if (!isServer) exitWith {};

{
    private _group = createVehicleCrew _x;
	_group enableDynamicSimulation true;
	removeFromRemainsCollector units _group;

	{ _x triggerDynamicSimulation false; } forEach units _group;

    if (!isNil "_faction") then
    {
        [units _group, side _group, _faction] execVM "src\fnc\loadouts\setCrewLoadout.sqf";
    };
} forEach _veh;
