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
		Call on server only. [] spawn SOC_fnc_sleepingBagRespawn;
*/






























/*
//---------- Sleeping Bag Spawn Event Handlers ----------
if (!isNil "SleepingBagTeleportMap") 

then {

player addEventHandler ["WeaponAssembled", {if ((_this select 1) isKindOf "Camping_base_F") then { 
    
_name = [_this select 1] call BIS_fnc_objectVar;
  
createMarker [_name, _this select 1];    
              
_name setMarkerType "respawn_inf"; 
 
_name setMarkerColor "colorBLUFOR";

_VarNameSB  = call compile _name;

_GridPos = mapGridPosition _VarNameSB;

_name setMarkerText _GridPos;
 
DeplyedSB pushBack _name; 
 
publicVariable "DeplyedSB"; 
  
}}];  
 
 
 
player addEventHandler ["WeaponDisassembled", {if (TypeOf (_this select 1) in ["B_Respawn_Sleeping_bag_F"]) then {


_SortedSBMarkerArr = [DeplyedSB, [], {player distanceSqr getMarkerPos _x}, "ASCEND"] call BIS_fnc_sortBy;

_SortedSBMarkerArr params ["_nearestSBMarker"];

//systemChat Str (_SortedSBMarkerArr);

//systemChat Str (_nearestSBMarker);

deleteMarker _nearestSBMarker;

DeplyedSB = DeplyedSB - [_SortedSBMarkerArr Select 0]; 

publicVariable "DeplyedSB";
 
}}];
};
*/