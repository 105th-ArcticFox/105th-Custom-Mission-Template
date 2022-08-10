//---------- 105th Standard Template Options ----------

_enableAssetMarkers = true;

_enableDynamicGroups = true;

//---------- 105th Standard Template Code ----------

// AI Settings
[East] execVM "missionScripts\aiSettings.sqf";

// Task Monitor
[] execVM "missionScripts\taskMonitor.sqf";

// Asset Markers
if (_enableAssetMarkers) then {
	[] call SOC_fnc_assetMarkers;
};

// Remove Players Body on Disconnect
addMissionEventHandler ['HandleDisconnect',{deleteVehicle (_this select 0);}];

// Dynamic Groups Init
if (_enableDynamicGroups) then {
["Initialize", [true]] call BIS_fnc_dynamicGroups;

["InitializePlayer", [player, true]] remoteExecCall ["BIS_fnc_dynamicGroups" , 0, true];

[player, ""] remoteExecCall ["BIS_fnc_setUnitInsignia", 0, true];
};