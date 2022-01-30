/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Side -
		String -

	Returns:
	    Array -
*/

params ["_side", "_type"];

private ["_comp"];

if (!isServer) exitWith {};

_comp = [];
switch (_side) do
{
    case west:
	{
	    switch (_type) do
		{
		    case "HEAVY":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\nato\heavy.sqf";
			};
			case "MEDIUM":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\nato\medium.sqf";
			};
			case "LIGHT":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\nato\light.sqf";
			};
		};
	};
	case east:
	{
	    switch (_type) do
		{
		    case "HEAVY":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\csat\heavy.sqf";
			};
			case "MEDIUM":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\csat\medium.sqf";
			};
			case "LIGHT":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\csat\light.sqf";
			};
		};
	};
	case independent:
	{
	    switch (_type) do
		{
		    case "HEAVY":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\aaf\heavy.sqf";
			};
			case "MEDIUM":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\aaf\medium.sqf";
			};
			case "LIGHT":
			{
			    _comp = [] call compile preprocessFile "src\comps\roadblocks\aaf\light.sqf";
			};
		};
	};
};

_comp
