/*
	Author:
	    Bishop Johnson
*/

params [];

if (!isServer || prisonEscapeStared) exitWith {};

prisonEscapeStared = true;

// TODO: Find cleaner way to resolve issue of clients no longer being set to non-captive.

{
	player setCaptive false;
} remoteExec ["call"];

{
	_x removeAllEventHandlers "Fired";
} forEach (call BIS_fnc_listPlayers);
