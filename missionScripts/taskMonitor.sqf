/*
	Author: |105th| ArcticFox

	Description:
		Centralized looping script to monitor the state of all mission tasks.

	Parameter(s):
		NONE

	Returns:
		NOTHING

	Example:
		Execute on server only. [] execVM "missionScripts\taskMonitor.sqf";
*/

//Initial Tasks\\

//[West,["tsk1"],["Clear <marker name='OBJ'>Objective Alpha</marker> of insurgent forces operating in and garrisoning the area","Clear Area of Insurgents"],[objNull],"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;


//Task Variables\\

//myTaskVariable = false;


//Task Monitor Loop\\

waitUntil {sleep 10; time > 30};

_run = true;

// Assign first task if desired\\

//["tsk1","ASSIGNED",true] call BIS_fnc_taskSetState;


while {_run} 

do {
	
	//systemChat "Task Monitor Loop Starting";
	
		/*
		if (myTaskVariable && ("tsk1" call BIS_fnc_taskState isNotEqualTo "SUCCEEDED"))
		
		then {
				["tsk1","SUCCEEDED",true] call BIS_fnc_taskSetState;
				sleep 1;
				_run = false;
			 };
		*/
	
	
		
	sleep 1;
	
	};