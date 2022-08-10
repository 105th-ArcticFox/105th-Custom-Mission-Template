/*
	Author: |105th| ArcticFox

	Description:
		Applies skill settings or any desired code on all or some OPFOR units. Editor placed units can be given user defined specific variable traits to apply code only on certain units.  
		
		place in unit init: this setVariable ["myUnitVariable", true];

	Parameter(s):
		0: SIDE - OPFOR side in mission.

	Returns:
		NOTHING

	Example:
		execute on server or HC only. [East] execVM "missionScripts\aiSettings.sqf";
*/

params [
		["_opforSide","East"]
		];

_unitsOPFOR = [];

{if ((side _x) == _opforSide) then {_unitsOPFOR pushBack _x}} forEach allUnits;

//////////////////////////////////////////////////
			
{
	//----------Global OPFOR AI Skill Settings----------\\
	
	if (isNil {_x getVariable "ManualSkill"}) 

	then {
			
			_x setSkill ["general",        0.500];
			_x setSkill ["aimingAccuracy", 0.100];
			_x setSkill ["aimingSpeed",    0.200];
			_x setSkill ["aimingShake",    0.050];
			_x setSkill ["commanding",     0.500];
			_x setSkill ["courage",        0.200];
			_x setSkill ["spotDistance",   0.250];
			_x setSkill ["spotTime",       0.500];
			_x setSkill ["reloadSpeed",    0.400];
			_x allowFleeing 0.25;

		}

	//---------- myUnitVariable	----------\\
	/*	
	if (_x getVariable "myUnitVariable" == true) 

	then {
	
			_x setSkill ["spotDistance",   1.00];
			_x disableAI "PATH";
			_x dowatch (_x getRelPos [25,360]);
			
		} 
	*/
	
} forEach _unitsOPFOR;	

//////////////////////////////////////////////////
			
systemChat "AI settings initialization complete";

	

  
	  
	
