/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    String - 
		String (Optional) - 
		String (Optional) - 
	
	Returns:
	    String - 
*/

params
[
	"_side",
	["_class", nil, [""]],
	["_type", nil, [""]]
];

private ["_classes", "_ret", "_options"];

if (!isServer) exitWith {};

if (isNil "_class") then {_class = "None"};
if (isNil "_type") then {_type = "None"};

_classes = ["rifleman", "at", "autorifleman", "leader", "marksman", "support", "heavygunner"];

if (!(_class in _classes)) then
{
    _class = selectRandom _classes;
};

_ret = "";
switch (_side) do
{
    case "BLU_F":
	{
	    switch (_class) do
		{
		    case "leader":
			{
			    switch (_type) do
				{
			        case "teamleader": { _ret = "B_Soldier_TL_F"; };
					case "squadleader": { _ret = "B_Soldier_SL_F"; };
					case "officer": { _ret = "B_officer_F"; };
					default
					{
					    _options = ["B_Soldier_TL_F", "B_Soldier_SL_F", "B_officer_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "rifleman":
			{
			    switch (_type) do
				{
			        case "soldier": { _ret = "B_Soldier_F"; };
					case "grenadier": { _ret = "B_Soldier_GL_F"; };
					case "light": { _ret = "B_Soldier_lite_F"; };
					default
					{
					    _options = ["B_Soldier_F", "B_Soldier_GL_F", "B_Soldier_lite_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "at":
			{
			    switch (_type) do
				{
			        case "heavyat": { _ret = "B_soldier_LAT_F"; };
					case "lightat": { _ret = "B_soldier_LAT2_F"; };
					case "titanat": { _ret = "B_soldier_AT_F"; };
					case "titanaa": { _ret = "B_soldier_AA_F"; };
					default
					{
					    _options = ["B_soldier_LAT_F", "B_soldier_LAT2_F", "B_soldier_AT_F", "B_soldier_AA_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "autorifleman":
			{
			    switch (_type) do
				{
			        case "autorifleman": { _ret = "B_Soldier_AR_F"; };
					default
					{
					    _options = ["B_Soldier_AR_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "marksman":
			{
			    switch (_type) do
				{
			        case "marksman": { _ret = "B_soldier_M_F"; };
					case "sharpshooter": { _ret = "B_Sharpshooter_F"; };
					default
					{
					    _options = ["B_soldier_M_F", "B_Sharpshooter_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "heavygunner":
			{
			    switch (_type) do
				{
			        case "heavygunner": { _ret = "B_HeavyGunner_F"; };
					default
					{
					    _options = ["B_HeavyGunner_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "support":
			{
			    switch (_type) do
				{
			        case "ammo": { _ret = "B_Soldier_A_F"; };
					case "asstautorifleman": { _ret = "B_soldier_AAR_F"; };
					case "asstmg": { _ret = "B_support_AMG_F"; };
					case "asstmortar": { _ret = "B_support_AMort_F"; };
					case "asstaa": { _ret = "B_soldier_AAA_F"; };
					case "asstat": { _ret = "B_soldier_AAT_F"; };
					case "medic": { _ret = "B_medic_F"; };
					case "engineer": { _ret = "B_engineer_F"; };
					case "exp": { _ret = "B_soldier_exp_F"; };
					case "gmg": { _ret = "B_support_GMG_F"; };
					case "hmg": { _ret = "B_support_MG_F"; };
					case "mortar": { _ret = "B_support_Mort_F"; };
					case "mine": { _ret = "B_soldier_mine_F"; };
					case "repair": { _ret = "B_soldier_repair_F"; };
					case "uav": { _ret = "B_soldier_UAV_F"; };
					case "uavpackage": { _ret = "B_soldier_UAV_06_F"; };
					case "uavmedical": { _ret = "B_soldier_UAV_06_medical_F"; };
					default
					{
					    _options = ["B_Soldier_A_F", "B_soldier_AAR_F", "B_support_AMG_F", "B_support_AMort_F", "B_soldier_AAA_F", "B_soldier_AAT_F", "B_medic_F", "B_engineer_F", "B_soldier_exp_F", "B_support_GMG_F", "B_support_MG_F", "B_support_Mort_F", "B_soldier_mine_F", "B_soldier_repair_F", "B_soldier_UAV_F", "B_soldier_UAV_06_F", "B_soldier_UAV_06_medical_F"];
						_ret = selectRandom _options;
					};
				};
			};
		};
	};
	case "OPF_F":
	{
	    switch (_class) do
		{
		    case "leader":
			{
			    switch (_type) do
				{
			        case "teamleader": { _ret = "O_Soldier_TL_F"; };
					case "squadleader": { _ret = "O_Soldier_SL_F"; };
					case "officer": { _ret = "O_officer_F"; };
					default
					{
					    _options =
						[
							"O_Soldier_TL_F", "O_Soldier_SL_F", "O_officer_F", // Iranian
							"O_T_Soldier_TL_F", "O_T_Soldier_SL_F", "O_T_Officer_F", // Chinese
							"O_R_Soldier_TL_F", "O_R_Patrol_Soldier_TL_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "rifleman":
			{
			    switch (_type) do
				{
			        case "soldier": { _ret = "O_Soldier_F"; };
					case "grenadier": {_ret = "O_Soldier_GL_F"; };
					case "light": { _ret = "O_Soldier_lite_F"; };
					default
					{
					    _options =
						[
							"O_Soldier_F", "O_Soldier_GL_F", "O_Soldier_lite_F", // Iranian
							"O_T_Soldier_F", "O_T_Soldier_GL_F", // Chinese
							"O_R_JTAC_F", "O_R_Soldier_GL_F", "O_R_Patrol_Soldier_GL_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "at":
			{
			    switch (_type) do
				{
			        case "heavyat": { _ret = "O_Soldier_HAT_F"; };
					case "lightat": { _ret = "O_Soldier_LAT_F"; };
					case "titanat": { _ret = "O_Soldier_AT_F"; };
					case "titanaa": { _ret = "O_Soldier_AA_F"; };
					default
					{
					    _options =
						[
							"O_Soldier_LAT_F", "O_Soldier_HAT_F", "O_Soldier_AT_F", "O_Soldier_AA_F", // Iranian
							"O_T_Soldier_LAT_F", "O_T_Soldier_HAT_F", "O_T_Soldier_AT_F", "O_T_Soldier_AA_F", // Chinese
							"O_R_Soldier_LAT_F", "O_R_Patrol_Soldier_LAT_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "autorifleman":
			{
			    switch (_type) do
				{
			        case "autorifleman": { _ret = "O_Soldier_AR_F"; };
					default
					{
					    _options =
						[
							"O_Soldier_AR_F", // Iranian
							"O_T_Soldier_AR_F", // Chinese
							"O_R_Soldier_AR_F", "O_R_Patrol_Soldier_AR_F", "O_R_Patrol_Soldier_AR2_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "marksman":
			{
			    switch (_type) do
				{
			        case "marksman": { _ret = "O_soldier_M_F"; };
					case "sharpshooter": { _ret = "O_Sharpshooter_F"; };
					default
					{
					    _options =
						[
							"O_soldier_M_F", "O_Sharpshooter_F", // Iranian
							"O_T_Soldier_M_F", // Chinese
							"O_R_soldier_M_F", "O_R_Patrol_Soldier_M_F", "O_R_Patrol_Soldier_M2_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "heavygunner":
			{
			    switch (_type) do
				{
			        case "heavygunner": { _ret = "O_HeavyGunner_F"; };
					default
					{
					    _options = ["O_HeavyGunner_F"];
						_ret = selectRandom _options;
					};
				};
			};
			case "support":
			{
			    switch (_type) do
				{
			        case "ammo": { _ret = "O_Soldier_A_F"; };
					case "asstautorifleman": { _ret = "O_Soldier_AAR_F"; };
					case "asstmg": { _ret = "O_support_AMG_F"; };
					case "asstmortar": { _ret = "O_support_AMort_F"; };
					case "assthat": { _ret = "O_Soldier_AHAT_F"; };
					case "asstaa": { _ret = "O_Soldier_AAA_F"; };
					case "asstat": { _ret = "O_Soldier_AAT_F"; };
					case "medic": { _ret = "O_medic_F"; };
					case "engineer": { _ret = "O_engineer_F"; };
					case "exp": { _ret = "O_soldier_exp_F"; };
					case "gmg": { _ret = "O_support_GMG_F"; };
					case "hmg": { _ret = "O_support_MG_F"; };
					case "mortar": { _ret = "O_support_Mort_F"; };
					case "mine": { _ret = "O_soldier_mine_F"; };
					case "repair": { _ret = "O_soldier_repair_F"; };
					case "uav": { _ret = "O_soldier_UAV_F"; };
					case "uavpackage": { _ret = "O_soldier_UAV_06_F"; };
					case "uavmedical": { _ret = "O_soldier_UAV_06_medical_F"; };
					default
					{
					    _options =
						[
							"O_Soldier_A_F", "O_Soldier_AAR_F", "O_support_AMG_F", "O_support_AMort_F", "O_Soldier_AHAT_F", "O_Soldier_AAA_F", "O_Soldier_AAT_F", "O_medic_F", "O_engineer_F", "O_soldier_exp_F", "O_support_GMG_F", "O_support_MG_F", "O_support_Mort_F", "O_soldier_mine_F", "O_soldier_repair_F", "O_soldier_UAV_F", "O_soldier_UAV_06_F", "O_soldier_UAV_06_medical_F", // Iranian
							"O_T_Soldier_A_F", "O_T_Soldier_AAR_F", "O_T_Support_AMG_F", "O_T_Support_AMort_F", "O_T_Soldier_AHAT_F", "O_T_Soldier_AAA_F", "O_T_Soldier_AAT_F", "O_T_Medic_F", "O_T_Engineer_F", "O_T_Soldier_Exp_F", "O_T_Support_GMG_F", "O_T_Support_MG_F", "O_T_Support_Mort_F", "O_T_soldier_mine_F", "O_T_Soldier_Repair_F", "O_T_Soldier_UAV_F", "O_T_soldier_UAV_06_F", "O_T_soldier_UAV_06_medical_F", // Chinese
							"O_R_Patrol_Soldier_A_F", "O_R_medic_F", "O_R_Patrol_Soldier_Medic", "O_R_Patrol_Soldier_Engineer_F", "O_R_soldier_exp_F" // Spetsnaz
						];
						_ret = selectRandom _options;
					};
				};
			};
		};
	};
	case "IND_F":
	{
	    switch (_class) do
		{
		    case "leader":
			{
			    switch (_type) do
				{
			        case "teamleader": { _ret = "I_Soldier_TL_F"; };
					case "squadleader": { _ret = "I_Soldier_SL_F"; };
					case "officer": { _ret = "I_officer_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_TL_F", "I_Soldier_SL_F", "I_officer_F", // AAF
							"I_E_Soldier_TL_F", "I_E_Soldier_SL_F", "I_E_Officer_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "rifleman":
			{
			    switch (_type) do
				{
			        case "soldier": { _ret = "I_Soldier_F"; };
					case "grenadier": { _ret = "I_Soldier_GL_F"; };
					case "light": { _ret = "I_Soldier_lite_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_F", "I_Soldier_GL_F", "I_Soldier_lite_F", // AAF
							"I_E_Soldier_F", "I_E_Soldier_GL_F", "I_E_Soldier_lite_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "at":
			{
			    switch (_type) do
				{
			        case "heavyat": { _ret = "I_Soldier_LAT_F"; };
					case "lightat": { _ret = "I_Soldier_LAT2_F"; };
					case "titanat": { _ret = "I_Soldier_AT_F"; };
					case "titanaa": { _ret = "I_Soldier_AA_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_LAT_F", "I_Soldier_LAT2_F", "I_Soldier_AT_F", "I_Soldier_AA_F", // AAF
							"I_E_Soldier_LAT_F", "I_E_Soldier_LAT2_F", "I_E_Soldier_AT_F", "I_E_Soldier_AA_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "autorifleman":
			{
			    switch (_type) do
				{
			        case "autorifleman": { _ret = "I_Soldier_AR_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_AR_F", // AAF
							"I_E_Soldier_AR_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "marksman":
			{
			    switch (_type) do
				{
			        case "marksman": { _ret = "I_Soldier_M_F"; };
					case "sharpshooter": { _ret = "I_G_Sharpshooter_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_M_F", "I_G_Sharpshooter_F", // AAF
							"I_soldier_M_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
			case "support":
			{
			    switch (_type) do
				{
			        case "ammo": { _ret = "I_Soldier_A_F"; };
					case "asstautorifleman": { _ret = "I_Soldier_AAR_F"; };
					case "asstmg": { _ret = "I_support_AMG_F"; };
					case "asstmortar": { _ret = "I_support_AMort_F"; };
					case "asstaa": { _ret = "I_Soldier_AAA_F"; };
					case "asstat": { _ret = "I_Soldier_AAT_F"; };
					case "medic": { _ret = "I_medic_F"; };
					case "engineer": { _ret = "I_engineer_F"; };
					case "exp": { _ret = "I_Soldier_exp_F"; };
					case "gmg": { _ret = "I_support_GMG_F"; };
					case "hmg": { _ret = "I_support_MG_F"; };
					case "mortar": { _ret = "I_support_Mort_F"; };
					case "mine": { _ret = "I_soldier_mine_F"; };
					case "repair": { _ret = "I_Soldier_repair_F"; };
					case "uav": { _ret = "I_soldier_UAV_F"; };
					case "uavpackage": { _ret = "I_soldier_UAV_06_F"; };
					case "uavmedical": { _ret = "I_soldier_UAV_06_medical_F"; };
					default
					{
					    _options =
						[
							"I_Soldier_A_F", "I_Soldier_AAR_F", "I_support_AMG_F", "I_support_AMort_F", "I_Soldier_AAA_F", "I_Soldier_AAT_F", "I_medic_F", "I_engineer_F", "I_Soldier_exp_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F", "I_soldier_mine_F", "I_Soldier_repair_F", "I_soldier_UAV_F", "I_soldier_UAV_06_F", "I_soldier_UAV_06_medical_F", // AAF
							"I_E_Soldier_A_F", "I_E_Soldier_AAR_F", "I_E_Support_AMG_F", "I_E_Support_AMort_F", "I_E_Soldier_AAA_F", "I_E_Soldier_AAT_F", "I_E_Medic_F", "I_E_Engineer_F", "I_E_Soldier_Exp_F", "I_E_Support_GMG_F", "I_E_Support_MG_F", "I_E_Support_Mort_F", "I_E_soldier_Mine_F", "I_E_Soldier_Repair_F", "I_E_Soldier_UAV_F", "I_E_soldier_UAV_06_F", "I_E_soldier_UAV_06_medical_F", "I_E_soldier_UGV_02_Demining_F" // LDF
						];
						_ret = selectRandom _options;
					};
				};
			};
		};
	};
};

_ret
