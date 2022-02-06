/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Array -
		Array (Optional) -
*/

params ["_objects"];

private ["_blacklist"];

if (!isServer) exitWith {};

//default blacklist
_blacklist =
[
    "Land_BagBunker_Tower_F",
	"Land_HBarrierTower_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_House_V2_F",
	"Land_Cargo_House_V3_F",
	"Land_Medevac_house_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Medevac_HQ_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Mil_WiredFence_F",
	"Land_Mil_WiredFenceD_F",
	"Land_Communication_F",
	"Land_TTowerSmall_1_F",
	"Land_TTowerSmall_2_F",
	"Flag_NATO_F",
	"Flag_CSAT_F",
	"Flag_AAF_F",
    "Flag_US_F",
	"rhs_Flag_Russia_F",
	"FlagCarrierCDF",
	"Land_SandbagBarricade_01_F",
	"Land_SandbagBarricade_01_hole_F",
	"Land_SandbagBarricade_01_half_F",
	"Land_DataTerminal_01_F"
];

if (count _this > 1) then {_blacklist = _this select 1;};

{
	if (_x in _blacklist) then
    {
        _x setVectorUp surfaceNormal position _x;
    };
} forEach _objects;
