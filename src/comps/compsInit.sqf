/*
    author: Bishop
    description: none
    returns: nothing
*/

if (!isServer) exitWith {};

private _basesHandler = [] execVM "src\comps\bases\initBases.sqf";
private _roadblocksHandler = [] execVM "src\comps\roadblocks\initRoadblocks.sqf";
waitUntil { scriptDone _basesHandler };
waitUntil { scriptDone _roadblocksHandler };
