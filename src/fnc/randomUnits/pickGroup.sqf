/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
		Number - 
		Array (Optional) - 
		Array (Optional) - 
	
	Returns:
	    Array - 
*/

params ["_side", "_size", "_classes", "_types"];

private ["_group", "_class", "_type", "_unit", "_i"];

if (!isServer) exitWith {};

switch (_side) do
{
    case west: {_side = "BLU_F";};
	case east: {_side = "OPF_F";};
	case independent: {_side = "IND_F";};
};

_group = [];

// Adds units to the group
for [{_i = 0}, {_i < _size}, {_i = _i + 1}] do
{
    // Checks if unit types were given
	/*
    if (isNil "_types") then
	{
	    //checks if unit classes were given
	    if (isNil "_classes") then
		{
		    _class = "None";
		}
		else
		{
		    _class = _classes select floor random (count _classes);
		};
		
		_type = "None";
	};
	else
	{
	    
	};
	*/
	
	if (isNil "_classes") then {_classes = ["None"];};      // Temp
	_class = _classes select floor random (count _classes); //
	
    _unit =
	[
	    _side,
		_class,
		nil
	] call compile preprocessFile "src\fnc\randomUnits\pickUnit.sqf";
	
	// Checks if a unit was returned
	if (!(_unit isEqualTo "")) then
	{
	    _group append [_unit];
	};
};

_group
