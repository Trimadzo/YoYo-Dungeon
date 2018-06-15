/// @description Insert description here
// You can write your code in this editor
/// @description handle gamepad addition and removal
var etype = async_load[? "event_type"];
if( etype =="gamepad discovered" )
{
	AddGamePad( async_load[? "pad_index"] );
	
}else if( etype =="gamepad lost" ){
	RemoveGamePad( async_load[? "pad_index"] );
}