//How to use: Just put a marker with the same name as the vehicle you placed on the editor

/*/Put in the initServer.sqf

//assetMarkers
[] call SOC_fnc_assetMarkers;

/*/


//systemChat "Assets are being marked.";

if !(isServer) exitWith {};//Exit if not the server

_AllAsset = (vehicles select {(_x isKindOf "LandVehicle" or _x isKindOf "Air" or _x isKindOf "Ship")}); //get all assets in the map

_AssetsWithMarker = (_AllAsset select {(str _x) in (allMapMarkers)}); //Chose vehicles that have their markers with the same name

_VariablesToSave = [];

_VariablesToSave = (_AssetsWithMarker + _VariablesToSave); //asemble the array

AssetMarkerForVehicle = str _VariablesToSave; //saving as string
publicVariable "AssetMarkerForVehicle"; //its a server side only script, this is to help debug

["assetMarker", "onEachFrame", { // onEachFrame is better for performace than a while loop
_untsringed = call compile AssetMarkerForVehicle; //remove the string I saved before it will look from this "[Object]" to this [Object]
{
	_object = _x;//Set the object
	_marker = str _x;//set the marker, remember that markers can be in the same name as the object because the editor makes they as strings so they dont have a "variable" that we are used to
	if (alive _object) then //check if is alive
	{
		_marker setMarkerPos (getPos _object); //if is true places the marker on the object
	} else {
		_marker setMarkerPos [0,0,0]; //if is false place it at edge of map if the object is dead
	};
} forEach _untsringed; //repeat the same command for each untsringed objects
}] call BIS_fnc_addStackedEventHandler;
