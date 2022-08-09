//---------- 105th Standard Template Options ----------

_enableAssetMarkers = true;

_enableDynamicGroups = true;

//---------- 105th Standard Template Code ----------

// AI Settings
[] execVM "missionScripts\aiSettings.sqf";

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
};