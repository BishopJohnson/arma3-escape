/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

if (!hasInterface) exitWith { hint "Does not have an interface in 'crashedHelicopterLoadout.sqf'" };

private _type = selectRandomWeighted
[
    UNIT_CLASS_RIFLEMEN, 0.7,
    UNIT_CLASS_AT, 0.1,
    UNIT_CLASS_AUTORIFLEMEN, 0.1,
    UNIT_CLASS_MARKSMEN, 0.1
];

private "_fncArray";
switch (PLAYER_FACTION) do
{
    case NATO_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\nato\rifleman.sqf",
                    "src\lists\units\nato\grenadier.sqf",
                    "src\lists\units\nato\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\nato\riflemanAt.sqf",
                    "src\lists\units\nato\missileSpcAt.sqf"
                ];

                if (Escape_Using_Tanks) then { _fncArray append ["src\lists\units\nato\riflemanAtLight.sqf"] };
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\nato\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\nato\marksman.sqf"];

                if (Escape_Using_Marksmen) then { _fncArray append ["src\lists\units\nato\sharpshooter.sqf"] };
            };
        };
    };
    case US_ARMY_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\usArmy\rifleman.sqf",
                    "src\lists\units\usArmy\grenadier.sqf",
                    "src\lists\units\usArmy\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\usArmy\riflemanAt.sqf",
                    "src\lists\units\usArmy\riflemanAtHeavy.sqf",
                    "src\lists\units\usArmy\missileSpcAt.sqf"
                ];
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\usArmy\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray =
                [
                    "src\lists\units\usArmy\marksman.sqf",
                    "src\lists\units\usArmy\sniper.sqf"
                ];
            };
        };
    };
    case CSAT_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\csat\rifleman.sqf",
                    "src\lists\units\csat\grenadier.sqf",
                    "src\lists\units\csat\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\csat\riflemanAt.sqf",
                    "src\lists\units\csat\missileSpcAt.sqf"
                ];

                if (Escape_Using_Tanks) then { "src\lists\units\csat\riflemanAtHeavy.sqf" };
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\csat\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\csat\marksman.sqf"];

                if (Escape_Using_Marksmen) then { _fncArray append ["src\lists\units\csat\sharpshooter.sqf"] };
            };
        };
    };
    case CSAT_P_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\csatP\rifleman.sqf",
                    "src\lists\units\csatP\grenadier.sqf",
                    "src\lists\units\csatP\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\csatP\riflemanAt.sqf",
                    "src\lists\units\csatP\missileSpcAt.sqf"
                ];

                if (Escape_Using_Tanks) then { _fncArray append ["src\lists\units\csatP\riflemanAtHeavy.sqf"] };
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\csatP\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\csatP\marksman.sqf"];

                if (Escape_Using_Marksmen) then { _fncArray append ["src\lists\units\csatP\sharpshooter.sqf"] };
            };
        };
    };
    case SPETSNAZ_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\spetsnaz\jtac.sqf",
                    "src\lists\units\spetsnaz\grenadier.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray = ["src\lists\units\spetsnaz\riflemanAt.sqf"];
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\spetsnaz\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\spetsnaz\marksman.sqf"];

                if (Escape_Using_Marksmen) then { _fncArray append ["src\lists\units\spetsnaz\sharpshooter.sqf"] };
            };
        };
    };
    case RU_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\ru\rifleman.sqf",
                    "src\lists\units\ru\grenadier.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\ru\riflemanAt.sqf",
                    "src\lists\units\ru\riflemanAtLight.sqf",
                    "src\lists\units\ru\riflemanAtGrenadier.sqf",
                    "src\lists\units\ru\missileSpcAt.sqf"
                ];
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\ru\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\ru\marksman.sqf"];
            };
        };
    };
    case AAF_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\aaf\rifleman.sqf",
                    "src\lists\units\aaf\grenadier.sqf",
                    "src\lists\units\aaf\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\aaf\riflemanAt.sqf",
                    "src\lists\units\aaf\missileSpcAt.sqf"
                ];

                if (Escape_Using_Tanks) then { _fncArray append ["src\lists\units\aaf\riflemanAtLight.sqf"] };
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\aaf\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\aaf\marksman.sqf"];
            };
        };
    };
    case LDF_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\ldf\rifleman.sqf",
                    "src\lists\units\ldf\grenadier.sqf",
                    "src\lists\units\ldf\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\ldf\riflemanAt.sqf",
                    "src\lists\units\ldf\missileSpcAt.sqf"
                ];

                if (Escape_Using_Tanks) then { _fncArray append ["src\lists\units\ldf\riflemanAtLight.sqf"] };
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\ldf\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\ldf\marksman.sqf"];
            };
        };
    };
    case CDF_KEY:
    {
        switch (_type) do
        {
            case UNIT_CLASS_RIFLEMEN:
            {
                _fncArray =
                [
                    "src\lists\units\cdf\rifleman.sqf",
                    "src\lists\units\cdf\grenadier.sqf",
                    "src\lists\units\cdf\riflemanLight.sqf"
                ];
            };
            case UNIT_CLASS_AT:
            {
                _fncArray =
                [
                    "src\lists\units\cdf\riflemanAt.sqf",
                    "src\lists\units\cdf\missileScpAt.sqf"
                ];
            };
            case UNIT_CLASS_AUTORIFLEMEN:
            {
                _fncArray = ["src\lists\units\cdf\autorifleman.sqf"];
            };
            case UNIT_CLASS_MARKSMEN:
            {
                _fncArray = ["src\lists\units\cdf\marksman.sqf"];
            };
        };
    };
};

if (isNil "_fncArray") exitWith
{
    hint format ["No type selected for faction '%1' in crashed helicopter loadout.", _faction];
};

private _fnc = selectRandom _fncArray;
[player] call compile preprocessFile _fnc;

removeGoggles player;
player unlinkItem "ItemMap";
