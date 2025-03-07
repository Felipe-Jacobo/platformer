keyJump = keyboard_check(ord("w")) || keyboard_check(vk_space);
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));

var xMove = keyRight - keyLeft;

if (xMove != 0)
{
	if (lastH != xMove)
	{
		lastH = xMove;
		accelFinal = 0;
	}
	if (accelFinal <= accelMax)
	{
		accelFinal += accel;
	}
}
else
{
	if (accelFinal > 0)
	{
		accelFinal -= accel;
	}
}

if (accelFinal < accel)
{
	accelFinal = 0;
	lastH = 0;
	
}

xSpd = accelFinal * lastH;

x += xSpd;
y += ySpd;
