class SOC
{
	tag = "SOC";	
	class client
	{
		file = "missionFunctions\client";				
		class getShortRadio {};
		class teleportToSL {};
	};
	
	class server
	{
		file = "missionFunctions\server";
		class assetMarkers {};
		//class rallyPointRespawn {};
		//class abortMission {};
		//class sleepingBagRespawn {};
	};
};

class FRED_VehicleRespawn 
{
	tag = "FRED";
	class VehicleRespawn {
		file = "missionFunctions\server\vehicleRespawn";
		class vehicleLoadout {};
		class vehicleMonitor {};
		class vehicleRespawn {};
	};
};