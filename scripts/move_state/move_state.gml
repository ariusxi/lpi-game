script_execute(get_input);

#region Movimentação

// Caso o jogador aperte para ambos os lados deve ser anulado a direção
	var move = key_right - key_left;

	
	hspd = move * spd;
	vspd = vspd + grv;
	
	// Caso o jogador vire para algum dos lados o sprite deve alternar
	// apontando para o lado que o jogador andou a ultima vez
	if(hspd != 0) image_xscale = sign(hspd);
	
	// Colisão horizontal
	if place_meeting(x+hspd, y, obj_wall){
		while(!place_meeting(x+sign(hspd), y, obj_wall)){
			x += sign(hspd);
		}
		hspd = 0;
	}
	
	x += hspd;
	
	// Colisão vertical
	if place_meeting(x, y+vspd, obj_wall){
		while(!place_meeting(x, y+sign(vspd), obj_wall)){
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	y += vspd;

#endregion