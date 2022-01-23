/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_box", "_type", "_faction"];

if (!isServer) exitWith {};

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;

if (!(_type in Escape_Static_Cargo)) exitWith {};

private _dict = Escape_Static_Cargo get _type;
if (!(_faction in _dict)) exitWith {};

private _cargo = _dict get _faction;
private _weapons = _cargo select 0;
private _mags = _cargo select 1;
private _items = _cargo select 2;
{ _box addWeaponCargoGlobal [_x select 0, _x select 1] } forEach _weapons;
{ _box addMagazineCargoGlobal [_x select 0, _x select 1] } forEach _mags;
{ _box addItemCargoGlobal [_x select 0, _x select 1] } forEach _items;
