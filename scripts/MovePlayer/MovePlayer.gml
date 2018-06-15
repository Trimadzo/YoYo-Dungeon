/// @description Move the player based on the various different controllers 

// Process keys....
if(left){
	if( dir != DIR_LEFT) {
		dir = DIR_LEFT;
		last_LR_dir = DIR_LEFT;
		sprite_index = sprites[dir];
		image_xscale =1.0;
		image_index=0;
		image_speed = 1.0;
		dx = -player_speed;
		dy = 0;
	}
}else if( right ){
	if( dir != DIR_RIGHT) {
		dir = DIR_RIGHT;
		last_LR_dir = DIR_RIGHT;
		sprite_index = sprites[dir];
		image_xscale =1.0;
		image_index=0;
		image_speed = 1.0;
		dx = player_speed;
		dy = 0;		
	}
}else if( up ){
	if( dir != DIR_UP) {
		dir = DIR_UP;
		sprite_index = sprites[dir];
		image_xscale =1.0;
		image_index=0;
		image_speed = 1.0;
		dy = -player_speed;
		dx = 0;		
	}
}else if( down ){
	if( dir != DIR_DOWN) {
		dir = DIR_DOWN;
		sprite_index = sprites[dir];
		image_xscale =1.0;
		image_index=0;
		image_speed = 1.0;
		dy = player_speed;
		dx = 0;		
	}
}else{
	if( dir != DIR_STOP) {
		image_xscale =1.0;
		if( last_LR_dir == DIR_LEFT ){
			image_xscale = -1.0;
		}
		dir = DIR_STOP;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dy = 0;
		dx = 0;
	}
}

// process player collision
ProcessCollision(id, dx,dy, 16,16,16,2 );


