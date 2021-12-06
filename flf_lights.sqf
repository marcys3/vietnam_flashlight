_statement_on = {
	_light = "Reflector_Cone_01_narrow_red_F" createVehicle [0,0,0];
	_light attachTo [player, [-0.16, 0.16, 0.17], "spine3", true];
	// rotate 15 degrees up
	_light setVectorUp [0,-0.258819,0.965926];
	player setVariable ["flf_flashlight", _light, false];
	player setVariable ["flf_flashlight_Is_On", true, false];
};
// 
_statement_off = {
	private _light = player getVariable "flf_flashlight";
	deleteVehicle _light;
	player setVariable ["flf_flashlight_Is_On", false, false];
};

_condition_on = {
_vest_array = ["uns_simc_56_alt","uns_Simc_garlan_M56_zusp","uns_v_simc_SF_BAR_1","uns_v_simc_SF_2","uns_v_simc_SF_mk56_2","uns_simc_56_frag","uns_simc_56_frag_ligt_b","uns_simc_56_M43_ligt","uns_simc_56_M43","uns_simc_56_M43_bandoleer","uns_v_simc_67_45_ass","uns_Simc_56_claymore","uns_Simc_56_claymore_45"];
!(player getVariable ["flf_flashlight_Is_On", false]) && (vehicle player == player) && ((_vest_array findIf {vest player == _x})!=-1)
};

_condition_off = {
_vest_array = ["uns_simc_56_alt","uns_Simc_garlan_M56_zusp","uns_v_simc_SF_BAR_1","uns_v_simc_SF_2","uns_v_simc_SF_mk56_2","uns_simc_56_frag","uns_simc_56_frag_ligt_b","uns_simc_56_M43_ligt","uns_simc_56_M43","uns_simc_56_M43_bandoleer","uns_v_simc_67_45_ass","uns_Simc_56_claymore","uns_Simc_56_claymore_45"];
((_vest_array findIf {vest player == _x})!=-1) && (player getVariable ["flf_flashlight_Is_On", false]) && (vehicle player == player)
};

// add ace actions
_action_on = ["flf_light_on","Vest Light On","\z\ace\addons\zeus\ui\icon_module_zeus_flashlight_ca.paa",_statement_on,_condition_on,{}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action_on] call ace_interact_menu_fnc_addActionToObject;

_action_off = ["flf_light_off","Vest Light Off","\z\ace\addons\zeus\ui\icon_module_zeus_flashlight_ca.paa",_statement_off,_condition_off,{}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action_off] call ace_interact_menu_fnc_addActionToObject;


// when player enters vehicle turn off light
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	private _light = _unit getVariable "flf_flashlight";
	deleteVehicle _light;
	_unit setVariable ["flf_flashlight_Is_On", false, false];
}];
