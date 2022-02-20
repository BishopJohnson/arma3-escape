/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _comp =
[
	[
		["Land_CncBarrier_F",[-2.00769,-6.99805,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[0.0673828,9.93213,0],90,1,0,[0,-0],"","",true,false],
		["Land_CncBarrier_F",[-2.00769,8.20508,0],90,1,0,[0,-0],"","",true,false],
		["Land_CncBarrier_F",[-1.00677,-10.0039,0],45,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[3.61548,-11.2803,0],198,1,0,[0,0],"","",true,false],
		["Land_CncBarrier_F",[1.29608,12.6963,0],15,1,0,[0,0],"","",true,false],
		["Land_CncBarrier_F",[-1.29987,12.6953,0],345,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[9.37561,-11.1655,0],58.0549,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[15.2177,-11.1436,0],280.139,1,0,[0,0],"","",true,false]
	],
	20, // Radius of composition area
	US_ARMY_KEY
];

_comp
