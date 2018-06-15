// You can write your code in this editor

if( !global.effects ) exit;

// Create our lightmap when required
if( !surface_exists(lighting_surf) ){
	// surface should be smaller the size of the actual room
	lighting_surf = surface_create(room_width>>light_scale_shift,room_height>>light_scale_shift);
}



// remember the old filter as lights are always rendered filtered (helps to blur them)
var old_filter = gpu_get_texfilter();
gpu_set_texfilter(true);


// set and clear the lightmap (its a small surface, and the sprites aren't large, so not a big cost)
surface_set_target(lighting_surf);
draw_clear_alpha(c_black,0);

// render lights in an additive way, so when they overlap,  it gets brighter
var old_blend =gpu_get_blendmode();
gpu_set_blendmode(bm_add);

var scaler=0;
var count = ds_list_size(light_list);
for(var i=0;i<count;i++)
{
	
	// get light position and rescale back into "lightmap" scale
	var pos = ds_list_find_value(light_list, i);
	var xx = (((pos&$ffff)*64)+32-8)>>light_scale_shift;
	var yy = ((((pos>>16)&$ffff)*64)+32-8)>>light_scale_shift;
	
	// make it "flicker" a little, and remember its size for layer
	var size= (random(1)*0.05)-0.1;
	scaler[i]=size;
	draw_sprite_ext(sLightGlow1stPass,0, xx,yy, 1.6+size,1.6+size,0,c_white,1+size);
}
surface_reset_target();


// render the shadows..... we use a shader so we can easily invert the alpha value stored in the surface
// We also set a faint "blue" ambient colour, so the level feels a little colder where the lights don't touch
gpu_set_blendmode(bm_normal);
shader_set(sh_light_shader);
shader_set_uniform_f(u_ambient, 0,0,($50/255.0),0.25);
draw_surface_stretched_ext(lighting_surf,0,0, room_width,room_height,c_black,0.5);
shader_reset();
gpu_set_blendmode(bm_normal);



// Render a little coloured "glow" to give the lighting a more realistic tone
// Again, do this in an "additive" way so that overlapping lights get brighter
gpu_set_blendmode(bm_add);
var count = ds_list_size(light_list);
for(var i=0;i<count;i++)
{
	var pos = ds_list_find_value(light_list, i);
	
	// get light position in the world, and add an offset to a scaled center
	var pos = ds_list_find_value(light_list, i);
	var xx = (((pos&$ffff)*64)+32)-8;
	var yy = ((((pos>>16)&$ffff)*64)+32)-8;
	
	// get the random size/alpha form before and use that again to draw the overlay
	var size = scaler[i];	
	draw_sprite_ext(sLightGlow2ndPass,0, xx,yy, (0.8+size)*8, (0.8+size)*8,0,$0060FF,0.25+size); //$00AAFF,1);	
}

// reset everything back
gpu_set_blendmode(old_blend);
gpu_set_texfilter(old_filter);



