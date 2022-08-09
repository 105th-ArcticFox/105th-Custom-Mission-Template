/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the groups leader allowing him to move the respawn position marker to their position a set number of times throughout the mission. 

	Parameter(s):
		0: GROUP - Group assigned to the rally-point
		1: NUMBER - number of rally-points available in the mission
		2: MARKER (Optional, default "respawn_west") rally-point marker

	Returns:
		NOTHING

	Example:
		Call on server only. [playerGroup, 5] spawn SOC_fnc_rallyPointRespawn;
*/

params [
		"_rallyPointGroup", 
		"_availableRallyPoints",
		["_rallyPointMarker","respawn_west"]
		];
		
titleText [Str _availableRallyPoints + " New Rally-Points Available.","PLAIN",1];
		
while {_availableRallyPoints > 0} 

do {
	
	//systemChat "get rallypoint group leader";
	_rallyPointGroupLeader = leader _rallyPointGroup;
	
	if (!alive _rallyPointGroupLeader) then {waitUntil {sleep 1; isNull _rallyPointGroupLeader}; _rallyPointGroupLeader = leader _rallyPointGroup;};

	//systemChat str _rallyPointGroupLeader;

	_rallyPointGroupLeaderClientID = owner _rallyPointGroupLeader;
	
	availableRallyPoints = _availableRallyPoints;
	rallyPointMarker = _rallyPointMarker;
	
	//systemChat "push available RPs to group leader";
	_rallyPointGroupLeaderClientID publicVariableClient "availableRallyPoints";
	_rallyPointGroupLeaderClientID publicVariableClient "rallyPointMarker";
	
		//systemChat "add RP action to group leader";
		
		[_rallyPointGroupLeader, 
		
			{	
			
				rallyPointActionID = [_this,            
				"<t color='#0000FF'>ESTABLISH RALLY-POINT</t>",  
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
				"_this == _target",  
				"true",  
				{
					"infoText" cutText ["Establishing New Rally-Point!","PLAIN",1];
				},  
				{},  
				{
					rallyPointMarker setMarkerPos getpos player;
					
					availableRallyPoints = availableRallyPoints - 1; 
					
					publicVariableServer "availableRallyPoints";
					
					"infoText" cutFadeOut 0;
					
					[[Str availableRallyPoints + " Rally-Points Remaining","PLAIN",1]] remoteExec ["titleText",0,false];
				},
				{
					"infoText" cutFadeOut 0;
				},  
				[],  
				5,  
				0,  
				false,  
				false] call BIS_fnc_holdActionAdd;
				
				_this setVariable ["actionID", rallyPointActionID, true];
				
			}
		] remoteExec ["call", _rallyPointGroupLeader];
				
	waitUntil {sleep 1; 
	
				//systemChat "Check if available RPs is less then 1 or new leader or leader not alive";
				
				availableRallyPoints < 1 || _rallyPointGroupLeader isNotEqualTo leader _rallyPointGroup || !alive _rallyPointGroupLeader
			   };
	
	_availableRallyPoints = availableRallyPoints;
	
	//systemChat "remove RP action from leader if available RPs is 0 or new leader assigned";
	[_rallyPointGroupLeader, _rallyPointGroupLeader getVariable "actionID"] remoteExec ["BIS_fnc_holdActionRemove", _rallyPointGroupLeader];
	
	};