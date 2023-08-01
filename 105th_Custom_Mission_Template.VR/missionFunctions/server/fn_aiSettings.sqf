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
		[EAST] call SOC_fnc_AISettings;
*/
		
params [["_opforSide", EAST, [sideUnknown]]]; 

if (!isServer || hasInterface) exitWith {};

if (!isDedicated || !hasInterface) exitWith {};

////////////////////////////////////////////////// 

_groupsOPFOR = allGroups select {side _x isEqualTo _opforSide};

_unitsOPFOR = _groupsOPFOR apply {units group _x};

////////////////////////////////////////////////// 
 
	_editUnits = _unitsOPFOR select {isNil {_x getVariable "manualSkill"}}; 
 
	{ 
	 
		_x setSkill ["general",        1.000]; 
		_x setSkill ["aimingAccuracy", 0.500]; 
		_x setSkill ["aimingSpeed",    0.300]; 
		_x setSkill ["aimingShake",    0.500]; 
		_x setSkill ["commanding",     1.000]; 
		_x setSkill ["courage",        0.500]; 
		_x setSkill ["spotDistance",   0.500]; 
		_x setSkill ["spotTime",       0.500]; 
		_x setSkill ["reloadSpeed",    1.000];
		
		_x allowFleeing 0;
	 
	} forEach _editUnits;
	
////////////////////////////////////////////////// 	

	_editUnits = _groupsOPFOR apply {units group _x && _x getVariable "grp_staticDefence_FP"};

	{ 
		_x disableAI "PATH";
		
		_x dowatch (_x getRelPos [100,360]);
 
	} forEach _editUnits; 

//////////////////////////////////////////////////

systemChat format ["AI settings initialization complete. Total OPFOR AI: %1",  str (count _unitsOPFOR)];
   
    
  
