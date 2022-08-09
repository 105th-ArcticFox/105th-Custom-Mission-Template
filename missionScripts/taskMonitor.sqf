/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the specified group leader when near the respawn point or on object at base allowing the group leader to abort the mission.

	Parameter(s):
		NONE

	Returns:
		NOTHING

	Example:
		Execute on server only. [] execVM "missionScripts\taskMonitor.sqf";
*/

//Initial Tasks

//[West,["tsk1"],["Clear <marker name='OBJ'>Objective Alpha</marker> of insurgent forces operating in and garrisoning the area","Clear Area of Insurgents"],[objNull],"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;

//Task Variables

//Task Monitor Loop

waitUntil {sleep 10; time > 30};

_run = true;

// Assign first task if desired
//["tsk1","ASSIGNED",true] call BIS_fnc_taskSetState;

while {_run} 

do {
	
	//systemChat "Task Monitor Loop Starting";
	
		
	sleep 1;
	
	};