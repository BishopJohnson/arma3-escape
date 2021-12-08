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
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
        };
        default
        {
        };
    };
}
else
{
    _weaponP = "";
    _weaponS = "";
    _weaponL = "";
    _optic = "";
    _bipod = "";
    _mag = "";
    _tracerMag = "";
    _uniform = "";
    _vest = "";
    _helmet = "";
    _backpack = "";
    _nvg = "";
};

// Remove existing items
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
