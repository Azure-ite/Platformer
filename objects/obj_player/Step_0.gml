key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);


var _move = key_right - key_left;
hsp = _move * walksp;
vsp = vsp + grv;

//check for airjump
if (airjump > 0){
	if (key_jump)
	{
		vsp = -jumpsp;
		airjump = airjump - 1;
	}
}

//check for ground
if (place_meeting(x,y+1,obj_invisiblewall)) 
{
	vsp= 0;
	airjump = 1;
}


//Jumping
if (place_meeting(x,y+1,obj_invisiblewall)) and (key_jump)
{
	vsp = -jumpsp;
}


if (place_meeting(x+hsp,y,obj_invisiblewall))
{
	while (!place_meeting(x+sign(hsp),y,obj_invisiblewall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;


if (place_meeting(x,y+vsp,obj_invisiblewall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisiblewall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	
}
y = y + vsp;

//sprite animation
if (!place_meeting(x,y+1,obj_invisiblewall))
{
sprite_index = spr_playera;
image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_playerr
	}	
}
	if (hsp !=0) image_xscale = sign(hsp);
	
	
	//check for room exiting
	repeat (3)
	{if (x>room_width){
	
    room_goto_next();
	
	}
}
