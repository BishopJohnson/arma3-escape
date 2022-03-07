/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Side -

	Returns:
	    Array -
*/

#include "..\..\..\define.hpp"

params ["_faction"];

if (!isServer) exitWith {};

private _comp =
[
	[
		["Land_HBarrier_3_F",[-4.14307,-0.933594,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-2.35254,7.56348,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-7.79565,4.38818,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-2.66187,-8.8042,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[8.96362,-2.96045,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[6.29492,7.82373,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[6.10254,-8.60547,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[10.2432,4.1333,0],270,1,0,[0,0],"","",true,false],
		["Land_PortableLight_single_F",[8.78149,6.22412,0.00849152],53.8762,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-9.18408,-6.89648,0],93.4215,1,0,[0,-0],"","",true,false],
		["Land_PortableLight_double_F",[-14.6802,8.84033,0],131.505,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-12.3066,12.2358,0],66.5656,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[17.6116,-1.56299,0],270.657,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-15.4705,9.67578,0],220.47,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[17.3887,-8.03711,-2.38419e-006],270.441,1,0,[0,0],"","",true,false],
		["Land_PortableLight_double_F",[16.2903,-10.7178,0],303.805,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[14.3933,-14.4009,0],238.865,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[17.1853,-11.4399,0],32.7697,1,0,[0,0],"","",true,false],

		// Door
		["Land_NetFence_01_m_gate_F",[-7.73071,-2.14795,0],90,1,0,[0,-0],"",
		 "[this, 1, 0] call BIS_fnc_Door;
		  [this, 2, 0] call BIS_fnc_Door;
		 ",true,false],

		// Trigger positions
		["Sign_Arrow_Blue_F",[-9,0,0],0,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Blue_F",[0,9,0],90,1,0,[0,-0],"","",true,false],
		["Sign_Arrow_Blue_F",[0,-10,0],90,1,0,[0,-0],"","",true,false],
		["Sign_Arrow_Blue_F",[10,0,0],0,1,0,[0,0],"","",true,false],

		// Spawn positions
		["Sign_Arrow_Direction_Yellow_F",[-2.9248,2.74072,0],126.345,1,0,[0,-0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[-0.0605469,4.22949,0],171.397,1,0,[0,-0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[0.343262,-4.99609,0],356.729,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[4.86475,-1.45947,0],280.182,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[-2.35645,-4.73096,0],29.7314,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[5.16406,1.89453,0],256.497,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[3.24829,-4.52246,0],319.39,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[3.4834,4.47656,0],217.979,1,0,[0,0],"","",true,false]
	],
	25, // Radius of prison area
	10, // Radius of spawn area
	true, // IsRect
	["Sign_Arrow_Direction_Yellow_F"], // Spawn object(s) type
	["Sign_Arrow_Blue_F"], // Trigger object(s) type
	[
	    "Land_HBarrier_Big_F",
		"Land_HBarrier_1_F",
		"Land_HBarrier_3_F",
		"Land_HBarrierWall4_F",
		"Land_Razorwire_F",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"Land_NetFence_01_m_gate_F"
	] // Objects to normalize tilt
];

private _veh =
[
    ["Flag_White_F",[-9.83862,1.12061,0],178.998,1,0,[0,-0],"","",true,false]
];

switch (_faction) do
{
    case NATO_KEY:			{ _veh select 0 set [0, "Flag_NATO_F"] };
	case CSAT_KEY;
	case CSAT_P_KEY;
	case SPETSNAZ_KEY:		{ _veh select 0 set [0, "Flag_CSAT_F"] };
	case AAF_KEY:			{ _veh select 0 set [0, "Flag_AAF_F"] };
	case LDF_KEY:			{ _veh select 0 set [0, "Flag_EAF_F"] };
	case US_ARMY_KEY;
	case US_MARINES_KEY:	{ _veh select 0 set [0, "Flag_US_F"] };
	case RU_KEY:			{ _veh select 0 set [0, "rhs_Flag_Russia_F"] };
	case CDF_KEY:			{ _veh select 0 set [0, "FlagCarrierCDF"] };
	case SAF_KEY:			{ _veh select 0 set [0, "rhssaf_flag_serbia"] };
};

(_comp select 0) append _veh;

_comp
