/*
	author: Bishop
	description: none
	returns: nothing
*/

params ["_side"];

if (!isServer) exitWith {};

private _veh = nil;
switch (_side) do
{
    case west:
    {
        _veh = "B_MRAP_01_F";
    };
    case east:
    {
        _veh = "O_MRAP_02_F";
    };
    case independent:
    {
        _veh = "I_MRAP_03_F";
    };
};

_veh
