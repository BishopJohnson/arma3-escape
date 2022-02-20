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
		["CraterLong",[-14.9006,4.17627,0],0,1,0,[0,0],"","",true,false],
		["CraterLong_small",[-15.0203,-2.14844,0],0,1,0,[0,0],"","",true,false],
		["CraterLong_small",[-15.0476,-7.15039,0],0,1,0,[0,0],"","",true,false],

		// Spawn positions
		["Sign_Arrow_Direction_Yellow_F",[14.5649,-4.17676,0],279.203,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[14.759,4.56543,0],258.599,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[10.103,0.108398,0],272.124,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[9.77466,-3.60498,0],282.297,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[9.82568,3.68018,0],266.735,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[9.22168,-7.78174,0],298.982,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[9.48901,7.6084,0],251.185,1,0,[0,0],"","",true,false],
		["Sign_Arrow_Direction_Yellow_F",[14.7585,-0.129395,0],273.306,1,0,[0,0],"","",true,false]
	],
	25, // Radius of spawn area
	["Sign_Arrow_Direction_Yellow_F"] // Spawn object(s) type
];

private _veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_Heli_Transport_01_F",[-14.9929,3.27002,0.547379],8.19366,0.94658,1,[-4.12218,7.049],"","",true,false]
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
