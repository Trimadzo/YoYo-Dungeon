/// @description Do keyboard and gamepad input

// Koeyboard first - it's the simplest
if( keyboard_check(vk_left)){
	left = true;
}else if( keyboard_check(vk_right)){
	right=true;
}
if( keyboard_check(vk_up)){
	up=true;
}else if( keyboard_check(vk_down)){
	down=true;
}




// do controllers - loop around all active ones.
// really a player should be allocated a single controller....
var len = ds_list_size(mActiveControllers);
for(var i=0;i<len;i++){
	var pad = ds_list_find_value(mActiveControllers,i);
	
	if( gamepad_button_check(pad,gp_padl) ) left=true;
	else if( gamepad_button_check(pad,gp_padr) ) right=true;

	if( gamepad_button_check(pad,gp_padu) ) up=true;
	else if( gamepad_button_check(pad,gp_padd) ) down=true;
	
	
	
	if( gamepad_axis_value(pad,gp_axislh)<-0.5 ){
		left=true;
	}else if( gamepad_axis_value(pad,gp_axislh)>0.5 ){
		right=true;
	}
	if( gamepad_axis_value(pad,gp_axislv)<-0.5 ){
		up=true;
	}else if( gamepad_axis_value(pad,gp_axislv)>0.5 ){
		down=true;
	}	
	
}