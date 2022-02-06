/*
    author: Bishop
    description: none
    returns: nothing
*/

if (!isServer) exitWith {};

Escape_Roadblocks = createHashMap;

if (Escape_Use_Rhs) then
{
    call compile preprocessFile "src\comps\roadblocks\usArmy\usArmy.sqf";
    call compile preprocessFile "src\comps\roadblocks\ru\ru.sqf";
    call compile preprocessFile "src\comps\roadblocks\cdf\cdf.sqf";
}
else
{
    call compile preprocessFile "src\comps\roadblocks\nato\nato.sqf";
    call compile preprocessFile "src\comps\roadblocks\csat\csat.sqf";
    call compile preprocessFile "src\comps\roadblocks\aaf\aaf.sqf";
};
