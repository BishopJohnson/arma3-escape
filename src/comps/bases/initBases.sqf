/*
    author: Bishop
    description: none
    returns: nothing
*/

if (!isServer) exitWith {};

Escape_Bases = createHashMap;

if (Escape_Use_Rhs) then
{
    call compile preprocessFile "src\comps\bases\usArmy\usArmy.sqf";
    call compile preprocessFile "src\comps\bases\ru\ru.sqf";
    call compile preprocessFile "src\comps\bases\cdf\cdf.sqf";
}
else
{
    call compile preprocessFile "src\comps\bases\nato\nato.sqf";
    call compile preprocessFile "src\comps\bases\csat\csat.sqf";
    call compile preprocessFile "src\comps\bases\aaf\aaf.sqf";
};
