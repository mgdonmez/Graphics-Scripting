Shader "Glitch/PositionAsColor"
{
    Properties
    {
        //_Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        /*_Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0*/
        _Smoothness("Smoothness", Range(0,1)) = 0.5
    }
    SubShader
    {
        /*Tags { "RenderType"="Opaque" }
        LOD 200*/

        CGPROGRAM
        
        #pragma surface ConfigureSurface Standard fullforwardshadows
        #pragma target 3.0

        //sampler2D _MainTex;

        struct Input
        {
            //float2 uv_MainTex;
            float3 worldPos;
        };

        /*half _Glossiness;
        half _Metallic;
        fixed4 _Color;*/
        float _Smoothness;

        //
        //UNITY_INSTANCING_BUFFER_START(Props)
        //    // put more per-instance properties here
        //UNITY_INSTANCING_BUFFER_END(Props)
        void ConfigureSurface(Input input, inout SurfaceOutputStandard surface)
        {
            surface.Albedo/*.rgb*/ = input.worldPos;/*saturate(input.worldPos.xyz * 0.5 + 0.5);*/
            surface.Smoothness = _Smoothness;
        }
        //void surf (Input IN, inout SurfaceOutputStandard o)
        //{
        //    // Albedo comes from a texture tinted by color
        //    fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
        //    o.Albedo = c.rgb;
        //    // Metallic and smoothness come from slider variables
        //    o.Metallic = _Metallic;
        //    o.Smoothness = _Glossiness;
        //    o.Alpha = c.a;
        //}
        ENDCG
    }
    FallBack "Diffuse"
}
