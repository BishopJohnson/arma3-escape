/*
	Author:
	    Bishop Johnson
	
	Parameter(s):
		Group - 
*/

#define THRESHOLD 0

params ["_group"];

private ["_unitsAlive"];

// Adds the "killed" event to each unit in the group
{
	_x addEventHandler ["killed",
	{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
		_unitsAlive = {alive _x} count units group _unit;
		
		// Determines if the group is below the threshold of active units
		if (_unitsAlive <= THRESHOLD) then
		{
			["Escape_GroupEliminated", group _unit] call CBA_fnc_serverEvent;
			
			// Removes the killed event handlers from each group member
			{
				_x removeAllEventHandlers "killed";
			} forEach units group _unit;
		};
	}];
} forEach units _group;
