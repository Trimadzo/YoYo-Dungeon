/// @description Do a virtual controller using the mouse or finger

// If mouse/finger down, remember start point for virtual D-Pad
if( Left_mouse_Down == true){
	if( mouse_down==false ){
		mouse_down=true;
		smx = device_mouse_x_to_gui(0);
		smy = device_mouse_y_to_gui(0);
	}
	lmx = device_mouse_x_to_gui(0);
	lmy = device_mouse_y_to_gui(0);
}else{
	mouse_down = false;
}




// If mouse/finger down, then work out simple virtual D-Pad
if( mouse_down ){
	var xx = smx-lmx;
	var yy = smy-lmy;
	
	if( abs(yy) < abs(xx) ){	
		if( abs(xx)>20 ){
			if(xx>0) left=true;	else right=true;	
		}
	}else{
		if( abs(yy)>20 ){
			if(yy>0) up=true; else down=true;	
		}	
	}
}