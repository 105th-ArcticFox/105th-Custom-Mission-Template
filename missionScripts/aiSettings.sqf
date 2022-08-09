/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the groups leader allowing him to move the respawn position marker to their position a set number of times throughout the mission. 

	Parameter(s):
		NONE

	Returns:
		NOTHING

	Example:
		execute on server or HC only. [] execVM "missionScripts\aiSettings.sqf";
*/


_UnitsOPFOR = [];

{if ((side _x) == East) then {_UnitsOPFOR pushBack _x}} forEach allUnits;

//////////////////////////////////////////////////
			
{
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
					
} forEach _UnitsOPFOR;	

//////////////////////////////////////////////////
			
systemChat "AI settings initialization complete";

	

  
	  
	
