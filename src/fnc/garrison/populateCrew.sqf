/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object -
*/

params ["_veh"];

private ["_group"];

if (!isServer) exitWith {};

{
    _group = createVehicleCrew _x;
	
	_group enableDynamicSimulation true;
	
	{ _x triggerDynamicSimulation false; } forEach units _group;
} forEach _veh;
