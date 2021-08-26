GDPC                                                                                  res://examples.tscn       �       J�H�L)���E"�R   res://project.binary�      �       e��~�Y{L�+�|   res://stranger-things.tscn  �      �      �yH4��׎#����5        [gd_scene load_steps=2 format=2]

[ext_resource path="res://stranger-things.tscn" type="PackedScene" id=1]

[node name="Examples" type="Node2D"]

[node name="StrangerThings" parent="." instance=ExtResource( 1 )]
            [gd_scene load_steps=5 format=2]

[ext_resource path="res://smoke-3.png" type="Texture" id=1]
[ext_resource path="res://assets/color-3.png" type="Texture" id=2]

[sub_resource type="Shader" id=1]
code = "shader_type canvas_item;

uniform sampler2D noise_img; // Use Inspector
uniform float speed = 1.0; // Use Inspector
uniform vec4 smokeColor : hint_color; // Use Inspector

void fragment(){
	vec2 uv1 = vec2(UV.x + TIME * speed, UV.y);
	vec2 uv2 = vec2(UV.x - TIME * speed, UV.y);
	vec2 uv3 = vec2(UV.x, UV.y + TIME * speed);
	
	float noise_r = texture(noise_img, uv1).r;
	float noise_g = texture(noise_img, uv2).g;
	float noise_b = texture(noise_img, uv3).b;
	
	float newAlpha = noise_r * noise_g * noise_b;
	COLOR.rgb = smokeColor.rgb * texture(TEXTURE, UV).rgb;
	COLOR.a = clamp(newAlpha * 4.0 * texture(TEXTURE, UV).a, 0.0, 1.0);
}"

[sub_resource type="ShaderMaterial" id=2]
shader = SubResource( 1 )
shader_param/speed = 0.05
shader_param/smokeColor = Color( 1, 1, 1, 1 )
shader_param/noise_img = ExtResource( 2 )

[node name="StrangerThings" type="Node2D"]

[node name="icon" type="Sprite" parent="."]
material = SubResource( 2 )
position = Vector2( 228, 228 )
scale = Vector2( 3, 3 )
texture = ExtResource( 1 )
           ECFG      _global_script_classes             _global_script_class_icons             application/config/name      
   gc-shaders     application/run/main_scene         res://examples.tscn        