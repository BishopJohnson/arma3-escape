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
    ["_faction", "", [""]]
];

if (!isServer) exitWith {};

{
    private _group = createVehicleCrew _x;
	_group enableDynamicSimulation true;
	removeFromRemainsCollector units _group;

	{ _x triggerDynamicSimulation false; } forEach units _group;

    if (count _faction > 0) then
    {
        [units _group, side _group, _faction] execVM "src\fnc\loadouts\setCrewLoadout.sqf";
    };
} forEach _veh;
