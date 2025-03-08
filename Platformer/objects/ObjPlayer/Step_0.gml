
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);

moveDir = right - left;
//xSpd = moveDir * maxSpeed;



if (jump)
{
	grounded = 0;
	jumpBufferTimer = bufferTime;
}
if (jumpBufferTimer > 0)
{
	jumpBuffered = 1;
	jumpBufferTimer--;
}
else 
{
	grounded = 1;
	jumpBuffered = 0;
}


if (KeysPressed())
{
	image_xscale = moveDir;
	sprite_index = PlayerRunspr;
	xSpd = lerp(xSpd, maxSpeed*moveDir, accel);
}
else 
{
	xSpd = lerp(xSpd, 0, deccel);
}

if (!KeysPressed())
{
	if (grounded = 1) {sprite_index = PlayerIdlespr;}
}

var pixel = .5;
if (place_meeting(x +xSpd, y, ObjCollidable))
{
	var pixelCheck = pixel * sign(xSpd);
	while (!place_meeting(x + pixelCheck, y, ObjCollidable))
	{
		x += pixelCheck;
	}
	xSpd = 0;
}


x += xSpd

ySpd += grav;
if (ySpd > termVel)
{
	ySpd = termVel;
}

if (jumpBuffered && place_meeting(x, y + 1, ObjCollidable))
{
	jumpBuffered = false;
	jumpBufferTimer = 0;
	ySpd = jumpSpeed
}


var subPixel = .5;
if (place_meeting(x, y + ySpd, ObjCollidable))
{
	var _pixelCheck = subPixel * sign(ySpd);
	while (!place_meeting(x, y + _pixelCheck, ObjCollidable))
	{
		y += _pixelCheck
	}
	ySpd = 0;
	grounded = 1;
}
else {grounded = 0}



if (grounded = 0)
{
	sprite_index = PlayerJumpspr;
}



y += ySpd;

