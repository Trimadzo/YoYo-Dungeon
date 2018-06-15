/// Init player

InitGlobals();

dir = DIR_STOP;
last_LR_dir = DIR_RIGHT;
sprites = global.Sprites[0];
player_speed = 4;
dx = 0;
dy = 0;

WallMap = global.WallMap;
DebugLayer = global.DebugLayer; 
DebugMap = global.DebugMap; 

silhouette_colour = $3F3FAF;



mActiveControllers = ds_list_create();
mMaxGamePads = gamepad_get_device_count();

// Get initial list of gamepads....
for(var i=0;i<mMaxGamePads;i++){
	if( gamepad_is_connected(i) ){
		AddGamePad(i);
	}
}
