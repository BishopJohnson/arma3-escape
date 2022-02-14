/*
    Author:
	    Bishop Johnson
*/

if (!isServer) exitWith {};

// Waits until mission starts
waitUntil { time > 0 };

private _startType = "StartType" call BIS_fnc_getParamValue;
private _start = switch (_startType) do
{
    case 1: { "src\fnc\starts\prisonStart.sqf" };
    case 2: { "src\fnc\starts\crashedHelicopterStart.sqf" };
    default
    {
        selectRandom
        [
            "src\fnc\starts\prisonStart.sqf",
            "src\fnc\starts\crashedHelicopterStart.sqf"
        ]
    };
};

call compile preprocessFile _start;
