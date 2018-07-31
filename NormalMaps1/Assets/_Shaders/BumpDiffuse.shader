Shader "Holistic/BumpDiffuse" {

	Properties{
		_Dif ("Diffuse Texture", 2D) = "white" {}
		_Bump ("Normal Texture", 2D) = "bump" {}
		_Slider("Normal Depth", Range(0,10)) = 1
		_Brightness("Normal Brightness", Range(0,10)) = 1
	}
	SubShader{
		
		CGPROGRAM
		#pragma surface surf Lambert
		sampler2D _Dif;
		sampler2D _Bump;
		half _Slider;
		half _Brightness;
		
	struct Input {
		float2 uv_Dif;
		float2 uv_Bump;
		};

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = tex2D(_Dif, IN.uv_Dif).rgb;
		o.Normal = UnpackNormal(tex2D(_Bump, IN.uv_Bump)) * _Brightness;
		o.Normal *= float3(_Slider, _Slider, 1);
		//o.Albedo *= float3(_Brightness, _Brightness, _Brightness);
		//o.Normal *= float3(1, 1, _Brightness);
	}
		ENDCG
	}

	FallBack "Diffuse"
}