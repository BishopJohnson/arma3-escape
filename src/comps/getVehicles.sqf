/*
    author: Bishop
    description: none
    returns: nothing
*/

params ["_side", "_faction", "_whitelistedTypes"];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
    _side = str _side;
};

private _factionDict = (Escape_Random_Vehicles get _side) get _faction;
private _types = _whitelistedTypes arrayIntersect (keys _factionDict);

private _vehicleEntries = [];
{
    {
        _vehicleEntries pushBack _y;
    } forEach (_factionDict get _x);
} forEach _types;

_vehicleEntries
