/*
    author: Bishop
    description: none
    returns: nothing
*/

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

if (!local this) exitWith {};

private _map = worldName;
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MXC_khk_F";
            _optic = "optic_Holosight_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXC_Black_F";
            _optic = "optic_Holosight_blk_F";
            _mag = "30Rnd_65x39_caseless_black_mag";
        };
        default
        {
            _weaponP = "arifle_MXC_F";
            _optic = "optic_Holosight";
            _mag = "30Rnd_65x39_caseless_mag";
        };
    };
}
else
{
    _weaponP = "arifle_MXC_F";
    _optic = "optic_Holosight";
    _mag = "30Rnd_65x39_caseless_mag";
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
this addWeapon _weaponP;
this addPrimaryWeaponItem _optic;
this addPrimaryWeaponItem _mag;

comment "Add containers";
this forceAddUniform "U_B_HeliPilotCoveralls";
this addVest "V_TacVest_blk";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
this addItemToVest _mag;
this addItemToVest "SmokeShellGreen";
this addItemToVest "SmokeShellBlue";
this addItemToVest "SmokeShellOrange";
this addItemToVest "Chemlight_green";
this addHeadgear "H_CrewHelmetHeli_B";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "NVGoggles";
