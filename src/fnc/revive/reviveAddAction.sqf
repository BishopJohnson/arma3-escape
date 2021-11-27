/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object - 
*/

params ["_target"];

private ["_actionId"];

if (!hasInterface) exitWith {};

_actionId = [_target] call compile preprocessFile "src\fnc\revive\reviveReviveAction.sqf";
[_target, "revive", _actionId] call fnc_reviveRegisterAction;
