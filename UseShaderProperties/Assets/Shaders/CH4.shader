Shader "Custom/CH4" {
	Properties{
		_myTex("Defuse Texture", 2D) = "white" {}


	_myEmissive("Emissive Texture", 2D) = "black" {}
	}

		SubShader{

		CGPROGRAM
#pragma surface surf Lambert

		
		sampler2D _myTex;
		sampler2D _myEmissive;

	struct Input {
		float2 uv_myTex;
		float2 uv_myEmissive;

	};


	void surf(Input IN, inout SurfaceOutput o) {

		o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;

		o.Emission = (tex2D(_myEmissive, IN.uv_myEmissive)).rgb;

	}
	ENDCG
	}

		FallBack "Defuse"
}
