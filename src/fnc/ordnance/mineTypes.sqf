/*
	Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\define.hpp"

params
[
	["_faction", nil, [""]]
];

if (!isServer) exitWith {};

if (isNil "_faction") then
{
	_faction = call Escape_fnc_GetRandomEnemyFaction;
};

private _types = [];
if (Escape_Use_Rhs) then
{
	switch (_faction) do
	{
		case US_ARMY_KEY;
		case US_MARINES_KEY:
		{
			_types append ["rhsusf_mine_m14", "rhsusf_mine_m19"];
		};
		case RU_KEY:
		{
			_types append ["rhs_mine_pmn2", "rhs_mine_tm62m"];
		};
		case CDF_KEY:
		{
			_types append ["rhs_mine_mk2_pressure", "rhs_mine_m2a3b_press", "rhs_mine_TM43"];
		};
		case SAF_KEY:
		{
			_types append ["rhssaf_mine_pma3", "rhssaf_mine_tma4"];
		};
	};
}
else
{
	_types append ["APERSMine", "APERSBoundingMine", "APERSMineDispenser_Mine_F"];
};

_types
