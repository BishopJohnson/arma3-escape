/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Side -

	Returns:
	    Array -
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

private _comp =
[
	[
        ["CraterLong",[-9.67334,3.77588,0],0,1,0,[0,0],"","",true,false],
        ["CraterLong_small",[-9.79297,-2.54883,0],0,1,0,[0,0],"","",true,false],
        ["CraterLong_small",[-9.82031,-7.55078,0],0,1,0,[0,0],"","",true,false],

		// Spawn positions
        ["Sign_Arrow_Direction_Yellow_F",[6.39355,0.0839844,0],272.124,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[6.06519,-3.62939,0],282.297,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[6.11621,3.65576,0],266.735,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[5.77954,7.58398,0],251.185,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[5.51221,-7.80615,0],298.982,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[11.0491,-0.153809,0],273.306,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[10.8555,-4.20117,0],279.203,1,0,[0,0],"","",true,false],
    	["Sign_Arrow_Direction_Yellow_F",[11.0496,4.54102,0],258.599,1,0,[0,0],"","",true,false]
	],
	25, // Radius of spawn area
	["Sign_Arrow_Direction_Yellow_F"] // Spawn object(s) type
];

private _veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_Heli_Transport_01_F",[-7.36182,-1.48096,0.774214],0,1,1,[0.370795,15.9475],"","",true,false]
];

switch (PLAYER_FACTION) do
{
	case CSAT_KEY;
	case CSAT_P_KEY;
	case SPETSNAZ_KEY:     { _veh select 0 set [0, "O_Heli_Light_02_unarmed_F"] };
	case AAF_KEY:          { _veh select 0 set [0, "I_Heli_light_03_unarmed_F"] };
	case LDF_KEY:          { _veh select 0 set [0, "I_E_Heli_light_03_unarmed_F"] };
	case US_ARMY_KEY:      { _veh select 0 set [0, "RHS_UH60M_d"] };
	case US_MARINES_KEY:   { _veh select 0 set [0, "RHS_UH1Y_FFAR_d"] };
	case RU_KEY:           { _veh select 0 set [0, "rhs_ka60_c"] };
	case CDF_KEY:          { _veh select 0 set [0, "rhsgref_cdf_reg_Mi8amt"] };
    case SAF_KEY:          { _veh select 0 set [0, "rhssaf_airforce_ht40"] };
};

(_comp select 0) append _veh;

_comp
