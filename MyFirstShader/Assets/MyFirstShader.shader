Shader "Holistic/HelloShader"{

	Properties{
		_EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
		_AlbedoColor("Albido Color", Color) = (1,1,1,1)
		_NormalColor("Normal", Color) = (1,1,1,1)
	}
		SubShader {

		CGPROGRAM
			#pragma surface surf Lambert
			struct Input {
			float2 uvMainTex;
			};
			fixed4 _EmissiveColor;
			fixed4 _AlbedoColor;
			fixed4 _NormalColor;

	void surf(Input IN, inout SurfaceOutput o) {
		o.Emission = _EmissiveColor.rgb;
		o.Albedo = _AlbedoColor.rgb;
		o.Normal = _NormalColor.rgb;
	}
		ENDCG
	}
	FallBack "Diffuse"
}