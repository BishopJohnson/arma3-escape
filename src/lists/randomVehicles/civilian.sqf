/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _dict = call DICT_fnc_create;

private _map = worldName;
private _usingApex = "IncludeApex" call BIS_fnc_getParamValue == 1;
private _usingContact = "IncludeContact" call BIS_fnc_getParamValue == 1;
private _usingOrange = "IncludeOrange" call BIS_fnc_getParamValue == 1;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = call DICT_fnc_create;

// Hatchback
[_vehicles, "hatchback", [
    ["C_Hatchback_01_F"],
    ["Beige", "Beigecustom", "Black", "Blue", "Bluecustom", "Dark", "Green", "Grey", "Yellow"],
    true
]] call DICT_fnc_set;

// Hatchback
[_vehicles, "hatchbackSport", [
    ["C_Hatchback_01_sport_F"],
    ["Beige", "Blue", "Green", "Grey", "Orange", "Red", "White"],
    true
]] call DICT_fnc_set;

// MB 4WD
if (_usingApex) then
{
    [_vehicles, "4wd", [
        ["C_Offroad_02_unarmed_F"],
        ["Black", "Blue", "Brown", "Green", "Olive", "Orange", "Red", "White"],
        true
    ]] call DICT_fnc_set;
};

// Offroad
[_vehicles, "offroad", [
    ["C_Offroad_01_F"],
    ["Beige", "Blue", "Bluecustom", "Darkred", "Green", "Red", "White"],
    true
]] call DICT_fnc_set;

// Offroad Covered
if (_usingContact) then
{
    [_vehicles, "offroadCovered", [["C_Offroad_01_covered_F"], ["Black", "Green"], true]] call DICT_fnc_set;
};

// Quadbike
[_vehicles, "quadbike", [["C_Quadbike_01_F"], ["Black", "Blue", "Red", "White"], true]] call DICT_fnc_set;

// SUV
[_vehicles, "suv", [["C_SUV_01_F"], ["Black", "Grey", "Orange", "Red"], true]] call DICT_fnc_set;

// Tractor
if (_usingContact) then
{
    [_vehicles, "tractor", [["C_Tractor_01_F"], ["Blue", "Green", "Red"], true]] call DICT_fnc_set;
};

// Truck
[_vehicles, "truck", [["C_Van_01_transport_F", "C_Van_01_box_F"], ["Black", "Red", "White"], true]] call DICT_fnc_set;

// Van
if (_usingOrange) then
{
    _variants = ["BattleBus", "Black", "Blue", "Green", "Masked", "Orange", "Red", "Swifd", "Vrana", "White"];
    if (_map == TANOA_KEY) then { _variants append ["BluePearl", "Daltgreen"] };

    [_vehicles, "van", [["C_Van_02_vehicle_F", "C_Van_02_transport_F"], _variants, true]] call DICT_fnc_set;
};

// Zamak
[_vehicles, "zamak", [["C_Truck_02_transport_F"], ["Blue", "Orange"], true]] call DICT_fnc_set;

// Zamak Covered
[_vehicles, "zamakCovered", [
    ["C_Truck_02_covered_F"],
    ["BlueBlue", "BlueOlive", "OrangeBlue", "OrangeOlive"],
    true
]] call DICT_fnc_set;

[_dict, RAND_VEH_CAR_UNARMED_KEY, _vehicles] call DICT_fnc_set;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = call DICT_fnc_create;

// Fuel Truck
[_vehicles, "fuelTruck", [
    ["C_Van_01_fuel_F"],
    ["Black", "Black_v2", "Red", "Red_v2", "White", "White_v2"],
    true
]] call DICT_fnc_set;

// Offroad
[_vehicles, "offroad", [["C_Offroad_01_repair_F"], true, true]] call DICT_fnc_set;

// Van
if (_usingOrange) then
{
    [_vehicles, "van", [["C_Van_02_medevac_F", "C_Van_02_service_F"], true, true]] call DICT_fnc_set;
};

// Zamak Fuel
[_vehicles, "zamakFuel", [["C_Truck_02_fuel_F"], ["Blue", "Orange"], true]] call DICT_fnc_set;

// Zamak Repair
[_vehicles, "zamakRepair", [
    ["C_Truck_02_box_F"],
    ["BlueGreen", "BlueOrange", "OrangeGreen", "OrangeOrange"],
    true
]] call DICT_fnc_set;

[_dict, RAND_VEH_UTIL_KEY, _vehicles] call DICT_fnc_set;

private _sideDict = [Escape_Random_Vehicles, str civilian] call DICT_fnc_get;
[_sideDict, CIVILIAN_KEY, _dict] call DICT_fnc_set;
[Escape_Random_Vehicles, str civilian, _sideDict] call DICT_fnc_set;
