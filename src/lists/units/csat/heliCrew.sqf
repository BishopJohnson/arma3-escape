/*
    author: Bishop
    description: none
    returns: nothing
*/

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

if (!local this) exitWith {};

private _map = worldName;
if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _vest = "V_TacVest_oli";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _vest = "V_TacVest_khk";
            _nvg = "NVGoggles_OPFOR";
        };
    };
}
else
{
    _vest = "V_TacVest_khk";
    _nvg = "NVGoggles_OPFOR";
};

// Remove existing items
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;

comment "Add weapons";
this addWeapon "arifle_Katiba_C_F";
this addPrimaryWeaponItem "30Rnd_65x39_caseless_green";

comment "Add containers";
this forceAddUniform "U_O_PilotCoveralls";
this addVest _vest;

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_65x39_caseless_green";};
this addItemToUniform "SmokeShellRed";
this addItemToUniform "SmokeShellOrange";
this addItemToUniform "SmokeShellYellow";
for "_i" from 1 to 2 do {this addItemToVest "Chemlight_red";};
this addHeadgear "H_CrewHelmetHeli_O";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;

comment "Set identity";
[
    this,
    selectRandom ["PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"],
    selectRandom ["male01per", "male02per", "male03per"]
] call BIS_fnc_setIdentity;
