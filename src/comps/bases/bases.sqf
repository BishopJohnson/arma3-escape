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
		    case "COMMS":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\nato\comms.sqf";
			};
			case "HVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\nato\hvehicle.sqf";
			};
			case "LVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\nato\lvehicle.sqf";
			};
			case "AMMO":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\nato\ammo.sqf";
			};
			case "MORTAR":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\nato\mortar.sqf";
			};
			case "UAV":
			{
				_comp = [] call compile preprocessFile "src\comps\bases\nato\uav.sqf";
			};
		};
	};
	case east:
	{
	    switch (_type) do
		{
		    case "COMMS":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\csat\comms.sqf";
			};
			case "HVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\csat\hvehicle.sqf";
			};
			case "LVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\csat\lvehicle.sqf";
			};
			case "AMMO":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\csat\ammo.sqf";
			};
			case "MORTAR":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\csat\mortar.sqf";
			};
			case "UAV":
			{
				_comp = [] call compile preprocessFile "src\comps\bases\csat\uav.sqf";
			};
		};
	};
	case independent:
	{
	    switch (_type) do
		{
		    case "COMMS":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\aaf\comms.sqf";
			};
			case "HVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\aaf\hvehicle.sqf";
			};
			case "LVEHICLE":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\aaf\lvehicle.sqf";
			};
			case "AMMO":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\aaf\ammo.sqf";
			};
			case "MORTAR":
			{
			    _comp = [] call compile preprocessFile "src\comps\bases\aaf\mortar.sqf";
			};
			case "UAV":
			{
				_comp = [] call compile preprocessFile "src\comps\bases\aaf\uav.sqf";
			};
		};
	};
};

_comp
