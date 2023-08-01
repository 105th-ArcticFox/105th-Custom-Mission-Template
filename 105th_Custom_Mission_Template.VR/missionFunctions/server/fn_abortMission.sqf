/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the current group leader when near the respawn point or on object at base allowing the group leader to abort the mission.

	Parameter(s):
		0: MARKER or OBJECT - (default "respawn_west" marker) Note: Group param required if marker is used or object not defined.
		1: GROUP - Group which will have the abort action available. Note: only group leader will have action.
		2: STRING - End class name from CfgDebriefing.
		3: CODE - (Optional) Custom code executed during the abort action.

	Returns:
		NOTHING

	Example:
		["respawn_west", playerGroup_1, "end3", {}] spawn SOC_fnc_abortMission;
*/

if (!isServer) exitWith {};

params [
		["_abortLocation", "respawn_west", ["", objNull]],
		["_abortGroup", nil, [grpNull]],
		["_endName","end1", [""]],
		["_customCode",{},[{}]]
		];

switch (true) 

	do {
			case (_abortLocation in allMapMarkers): {
														_missionIncomplete = true;

														while {_missionIncomplete} 

														do {
																_abortGroupLeader = leader _abortGroup;
																
																systemChat str _abortGroupLeader;
											
																//if (!alive _abortGroupLeader) then {waitUntil {sleep 1; isNull _abortGroupLeader}; _abortGroupLeader = leader _abortGroup;};
																
																waitUntil {sleep 1; leader _abortGroup distance getMarkerPos _abortLocation < 25};
																
																systemChat "ADD ABORT ACTION";
																
																[[_abortGroupLeader, _endName, _customCode], 
												
																	{	
													
																		params ["_abortGroupLeader", "_endName", "_customCode"];
																		
																		abortActionID = [_abortGroupLeader,
																		"<t color='#FF0000'>ABORT MISSION</t>", 
																		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
																		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa", 
																		"_this isEqualTo _target",  
																		"true",  
																		{
																			"abortText" cutText ["Aborting Mission.","PLAIN",1]
																		},  
																		{},  
																		{
																			
																			[["The mission is ending.","PLAIN DOWN",1]] remoteExec ["titleText",0,false];
																			
																			sleep 0.5;
																			
																			[] spawn _a1;

																			sleep 5;

																			[_a0] remoteExec ["BIS_fnc_endMission", 0, true];
																		},
																		{
																			"abortText" cutFadeOut 0;
																		},  
																		[_endName, _customCode],  
																		5,  
																		0,  
																		true,  
																		false] call BIS_fnc_holdActionAdd;
														
																		_abortGroupLeader setVariable ["abortActID", abortActionID, true];
														
																	}
																] remoteExec ["call", _abortGroupLeader];
														
																waitUntil {sleep 1; _abortGroupLeader distance getMarkerPos _abortLocation > 25 || _abortGroupLeader isNotEqualTo leader _abortGroup || !alive _abortGroupLeader || !_missionIncomplete};
																
																systemChat "RESTART ABORT LOOP";
																
																[_abortGroupLeader, _abortGroupLeader getVariable "abortActID"] remoteExec ["BIS_fnc_holdActionRemove", _abortGroupLeader];
													
															};
													};
																	
			case (typeName _abortLocation isEqualTo "OBJECT"): 	{
				
																	[_abortLocation,            
																	"<t color='#FF0000'>ABORT MISSION</t>",             
																	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
																	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",            
																	"leader group _this isEqualTo _this && _this distance _target < 5",  
																	"leader group _caller isEqualTo _caller && _caller distance _target < 5",             
																	{
																		"abortText" cutText ["Aborting Mission.","PLAIN",1]
																	},            
																	{},            
																	{    
																		
																		[["The mission is ending.","PLAIN DOWN",1]] remoteExec ["titleText",0,false];
																		
																		sleep 0.5;
																						
																		[] spawn _a1;

																		sleep 5;

																		[_a0] remoteExec ["BIS_fnc_endMission", 0, true];
																	},            
																	{
																		"abortText" cutFadeOut 0;
																	},            
																	[_endName, _customCode],            
																	3,           
																	0,            
																	true,            
																	false] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
																};
			
			default {systemChat "ABORT LOCATION INVALID. END FUNCTION."};
		};