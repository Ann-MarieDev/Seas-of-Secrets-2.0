///dynamaclly get width/height of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
	{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
	}
width = _new_w + op_boarder*2;
height = op_boarder*2 + sprite_get_height(Spr_Menu_Font) + (op_length-1)*op_space;

///center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

///Draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

///draw options
draw_set_font(global.Menu_Font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < op_length; i++)
	{
	var _c = c_white;
	if pos == i {_c = c_yellow};
	draw_text_color(x+op_boarder, y+op_boarder + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
	}