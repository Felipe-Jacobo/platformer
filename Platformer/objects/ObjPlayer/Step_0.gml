
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);

moveDir = right - left;
//xSpd = moveDir * maxSpeed;

if (jump)
{
	jumpBufferTimer = bufferTime;
}
if (jumpBufferTimer > 0)
{
	jumpBuffered = 1;
	jumpBufferTimer--;
}
else 
{
	jumpBuffered = 0;
}

if (KeysPressed())
{
	xSpd = lerp(xSpd, maxSpeed*moveDir, accel);
}
else 
{
	xSpd = lerp(xSpd, 0, deccel);
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
}

y += ySpd;

