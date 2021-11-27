/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object -
	
	Returns:
	
*/

params ["_object"];

private ["_blacklist", "_result"];

if (!isServer) exitWith {};

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
	"Land_SandbagBarricade_01_F",
	"Land_SandbagBarricade_01_hole_F",
	"Land_SandbagBarricade_01_half_F",
	"Land_DataTerminal_01_F"
];

_result = true; //assumed object is not on the blacklist

{
    if (_x isEqualTo (typeOf _object)) then
    {
        _result = false;
    };
} forEach _blacklist;

_result 