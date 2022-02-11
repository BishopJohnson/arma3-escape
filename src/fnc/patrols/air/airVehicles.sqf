/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Side -
	    String (Optional) -
		Bool (Optional) -

	Returns:
	    String -
*/

params
[
	"_side",
	["_faction", "", [""]],
	["_type", "None", [""]],
	["_useWeights", false, [false]]
];

private ["_types", "_randomTypes", "_veh", "_vehicles"];

if (!isServer) exitWith {};

_types = ["Plane", "Heli", "HeliHeavy", "HeliLight", "UAV"];
_randomTypes = ["Plane", "HeliHeavy", "HeliLight", "UAV"];

if (!(_type in _types)) then
{
	if (_useWeights) then
	{
		_type = _randomTypes selectRandomWeighted
		[
			0.1,  // Plane
			0.15, // HeliHeavy
			0.6, // HeliLight
			0.15 // UAV
		];
	}
	else
	{
		_type = selectRandom _types;
	};
};

_veh = "";
switch (_side) do
{
    case west:
	{
	    switch (_type) do
		{
		    case "Plane":
			{
			    _vehicles =
				[
					"B_Plane_CAS_01_dynamicLoadout_F",
					"B_Plane_Fighter_01_F",
					"B_Plane_Fighter_01_Stealth_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "UAV":
			{
				_vehicles =
				[
					"B_UAV_02_dynamicLoadout_F",
					"B_UAV_05_F",
					"B_T_UAV_03_dynamicLoadout_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "Heli":
			{
			    _vehicles =
				[
					"B_Heli_Light_01_dynamicLoadout_F",
					"B_Heli_Attack_01_dynamicLoadout_F",
					"B_Heli_Transport_01_F",
					"B_Heli_Transport_03_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "HeliHeavy":
			{
			    _veh = "B_Heli_Attack_01_dynamicLoadout_F";
			};
			case "HeliLight":
			{
			    _vehicles =
				[
					"B_Heli_Light_01_dynamicLoadout_F",
					"B_Heli_Transport_01_F",
					"B_Heli_Transport_03_F"
				];
				_veh = selectRandom _vehicles;
			};
		};
	};
	case east:
	{
	    switch (_type) do
		{
		    case "Plane":
			{
			    _vehicles =
				[
					"O_Plane_CAS_02_dynamicLoadout_F",
					"O_Plane_Fighter_02_F",
					"O_Plane_Fighter_02_Stealth_F",
					"O_T_VTOL_02_infantry_dynamicLoadout_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "UAV":
			{
				_vehicles =
				[
					"O_UAV_02_dynamicLoadout_F",
					"O_T_UAV_04_CAS_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "Heli":
			{
			    _vehicles =
				[
					"O_Heli_Light_02_dynamicLoadout_F",
					"O_Heli_Light_02_v2_F",
					"O_Heli_Attack_02_dynamicLoadout_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "HeliHeavy":
			{
			    _veh = "O_Heli_Attack_02_dynamicLoadout_F";
			};
			case "HeliLight":
			{
			    _vehicles =
				[
					"O_Heli_Light_02_dynamicLoadout_F",
					"O_Heli_Light_02_v2_F"
				];
				_veh = selectRandom _vehicles;
			};
		};
	};
	case independent:
	{
	    switch (_type) do
		{
		    case "Plane":
			{
			    _vehicles =
				[
					"I_Plane_Fighter_03_dynamicLoadout_F",
					"I_Plane_Fighter_04_F"
				];
				_veh = selectRandom _vehicles;
			};
			case "UAV":
			{
				_veh = "I_UAV_02_dynamicLoadout_F";
			};
			case "HeliHeavy";
			case "HeliLight";
			case "Heli":
			{
			    _veh = "I_Heli_light_03_dynamicLoadout_F";
			};
		};
	};
};

_veh
