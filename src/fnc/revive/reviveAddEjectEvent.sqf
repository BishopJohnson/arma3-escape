/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
*/

params ["_veh"];

if (!isServer) exitWith {};

/* Add event handler to vehicle to force eject
 * players upon the vehicle's destruction.
 */
_veh addMPEventHandler
[
	"MPKilled",
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
		if (!hasInterface) exitWith {};
		
		if (vehicle player == _unit) then
		{
			player action ["Eject", vehicle player];
			[player] call BIS_fnc_setHeight;
		};
	}
];
