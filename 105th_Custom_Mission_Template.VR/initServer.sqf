//---------- 105th Standard Template Options ----------

_enableAISettings = true; //OPFOR default side: EAST

_enableAssetMarkers = true;

//---------- 105th Standard Template Code ----------

// AI Settings
if(_enableAISettings) then {_null = [EAST] call SOC_fnc_AISettings};

// Asset Markers
if (_enableAssetMarkers) then {_null = [] call SOC_fnc_assetMarkers;};

// Dynamic Groups Init
["Initialize", [true]] call BIS_fnc_dynamicGroups;

// Remove Players Body on Disconnect
addMissionEventHandler ['HandleDisconnect',{deleteVehicle (_this select 0);}];