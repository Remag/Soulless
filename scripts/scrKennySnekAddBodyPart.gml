/// scrKennySnekAddBodyPart(obj)
part_gap = 30; // СЂР°СЃСЃС‚РѕСЏРЅРёРµ РјРµР¶РґСѓ С‡Р°СЃС‚СЏРјРё С‚РµР»Р°
parts_count = ds_list_size(snek_parts); // РєРѕР»РёС‡РµСЃС‚РІРѕ СѓР¶Рµ СЃСѓС‰РµСЃС‚РІСѓСЋС‰РёС… С‡Р°СЃС‚РµР№ С‚РµР»Р°, РёСЃРєР»СЋС‡Р°СЏ РіРѕР»РѕРІСѓ

px = x - part_gap * (parts_count + 1) * dcos(direction);
py = y + part_gap * (parts_count + 1) * dsin(direction);

px = x;
py = y;

spart = instance_create(px, py, argument0);
with (spart)
{
    image_xscale = argument1;
    image_yscale = image_xscale;
}
spart.image_index = image_index;
spart.image_alpha = image_alpha;
//spart.direction = direction;
//spart.target_direction = direction;
//spart.speed = speed;

//spart.frequency = frequency;
//spart.amplitude = amplitude*1.4;
//spart.headangle_coefficient = headangle_coefficient;
//spart.t = t + (parts_count)*2;

ds_list_add(snek_parts, spart);
