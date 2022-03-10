/// scr_input_facing

// There are 8 directions, 0 is no movement, 1 is 45 degrees

var dir = 0;

var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var left = keyboard_check(vk_left);
var down = keyboard_check(vk_down);

var ver = up - down;
var hor = right - left;

if ((ver == 0) and (hor == 1)) dir = 1;
if ((ver == 1) and (hor == 1)) dir = 2;
if ((ver == 1) and (hor == 0)) dir = 3;
if ((ver == 1) and (hor == -1)) dir = 4;
if ((ver == 0) and (hor == -1)) dir = 5;
if ((ver == -1) and (hor == -1)) dir = 6;
if ((ver == -1) and (hor == 0)) dir = 7;
if ((ver == -1) and (hor == 1)) dir = 8;

return dir;
