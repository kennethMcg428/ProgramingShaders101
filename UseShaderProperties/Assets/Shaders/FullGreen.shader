Shader "Hollistic/FullGreen"{

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

	void surf(Input IN, inout SurfaceOutput o){
		
		o.Albedo.r = (tex2D(_myTex, IN.uv_myTex)).r;
		o.Albedo.b = (tex2D(_myTex, IN.uv_myTex)).b;
		o.Albedo.g = (tex2D(_myTex, IN.uv_myTex)).g/ (tex2D(_myTex, IN.uv_myTex)).g;
	}
		ENDCG
	}
		FallBack "Defuse"
}

