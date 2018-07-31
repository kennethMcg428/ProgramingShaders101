Shader "Hollistic/GreenTestCH3" {
	Properties{
		_myTex("Example Texture", 2D) = "white" {}
	}

		SubShader{

		CGPROGRAM
#pragma surface surf Lambert

		sampler2D _myTex;

	struct Input {
		float2 uv_myTex;
	};

	void surf(Input IN, inout SurfaceOutput o) {

		
		if ((tex2D(_myTex, IN.uv_myTex)).r < 1) {

			o.Albedo.rgb = (tex2D(_myTex, IN.uv_myTex)).rgb;
		}
		else {

			o.Albedo.g = 1;
		}
		
		
	}
	ENDCG
	}
		FallBack "Defuse"
}
