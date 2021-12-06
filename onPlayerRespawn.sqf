params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// delete light if unit dies
if (_oldUnit getVariable "flf_flashlight_Is_On") then {
private _light = _oldUnit getVariable "flf_flashlight";
deleteVehicle _light;
_oldUnit setVariable ["flf_flashlight_Is_On", false, false];
_newUnit setVariable ["flf_flashlight_Is_On", false, false];
};