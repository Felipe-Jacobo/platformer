if (place_meeting(x, y + 1, ObjCollidable)) {
    grounded = 1;
    ySpd = 0;
} else {
    grounded = 0;
    ySpd += grav;
    if (ySpd > termVel) {
        ySpd = termVel;
    }
}

var direction_to_player = point_direction(x, y, ObjPlayer.x, ObjPlayer.y);
var new_x = x + lengthdir_x(2, direction_to_player);
var new_y = y + ySpd;

if (!place_meeting(new_x, new_y, ObjCollidable)) {
    x = new_x;
    y = new_y;
} else {
    ySpd = 0;
}

if (grounded) {
    sprite_index = Enemy1Walkspr;
}

if (ObjPlayer.x > x) {
    image_xscale = 1;
} else {
    image_xscale = -1;
}
