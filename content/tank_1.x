xof 0303txt 0032

template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}


Frame Frame_SCENE_ROOT {

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Frame Frame1_tank_b {

  FrameTransformMatrix {
   1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
  }

  Mesh Mesh_tank_b {
   72;
   1.491553;3.987463;1.491553;,
   1.331957;4.071838;1.331957;,
   0.000000;4.071838;1.883672;,
   0.000000;3.987463;2.109375;,
   0.000000;3.987463;-2.109375;,
   0.000000;4.071838;-1.883672;,
   1.331957;4.071838;-1.331957;,
   1.491553;3.987463;-1.491553;,
   1.491553;3.987463;-1.491553;,
   1.331957;4.071838;-1.331957;,
   1.883672;4.071838;0.000000;,
   2.109375;3.987463;0.000000;,
   2.109375;3.987463;0.000000;,
   1.883672;4.071838;0.000000;,
   1.331957;4.071838;1.331957;,
   1.491553;3.987463;1.491553;,
   -1.491553;3.987463;1.491553;,
   0.000000;3.987463;2.109375;,
   0.000000;4.071838;1.883672;,
   -1.331957;4.071838;1.331957;,
   0.000000;3.987463;-2.109375;,
   -1.491553;3.987463;-1.491553;,
   -1.331957;4.071838;-1.331957;,
   0.000000;4.071838;-1.883672;,
   -1.491553;3.987463;-1.491553;,
   -2.109375;3.987463;0.000000;,
   -1.883672;4.071838;0.000000;,
   -1.331957;4.071838;-1.331957;,
   -2.109375;3.987463;0.000000;,
   -1.491553;3.987463;1.491553;,
   -1.331957;4.071838;1.331957;,
   -1.883672;4.071838;0.000000;,
   1.883672;4.071838;0.000000;,
   1.331957;4.071838;-1.331957;,
   0.000000;4.071838;-1.883672;,
   -1.331957;4.071838;-1.331957;,
   -1.883672;4.071838;0.000000;,
   -1.331957;4.071838;1.331957;,
   0.000000;4.071838;1.883672;,
   1.331957;4.071838;1.331957;,
   0.000000;3.987462;-2.109375;,
   0.000000;0.000000;-2.109375;,
   1.491553;0.000000;-1.491553;,
   1.491553;3.987462;-1.491553;,
   1.491553;3.987462;1.491553;,
   1.491553;0.000000;1.491553;,
   0.000000;0.000000;2.109375;,
   0.000000;3.987462;2.109375;,
   1.491553;3.987462;-1.491553;,
   1.491553;0.000000;-1.491553;,
   2.109375;0.000000;0.000000;,
   2.109375;3.987462;0.000000;,
   2.109375;3.987462;0.000000;,
   2.109375;0.000000;0.000000;,
   1.491553;0.000000;1.491553;,
   1.491553;3.987462;1.491553;,
   0.000000;3.987462;-2.109375;,
   -1.491553;3.987462;-1.491553;,
   -1.491553;0.000000;-1.491553;,
   0.000000;0.000000;-2.109375;,
   -1.491553;3.987462;1.491553;,
   0.000000;3.987462;2.109375;,
   0.000000;0.000000;2.109375;,
   -1.491553;0.000000;1.491553;,
   -1.491553;3.987462;-1.491553;,
   -2.109375;3.987462;0.000000;,
   -2.109375;0.000000;0.000000;,
   -1.491553;0.000000;-1.491553;,
   -2.109375;3.987462;0.000000;,
   -1.491553;3.987462;1.491553;,
   -1.491553;0.000000;1.491553;,
   -2.109375;0.000000;0.000000;;
   38;
   3;34,35,38;,
   3;3,1,2;,
   3;4,5,6;,
   3;4,6,7;,
   3;8,9,11;,
   3;11,9,10;,
   3;12,13,14;,
   3;12,14,15;,
   3;16,17,19;,
   3;17,18,19;,
   3;20,21,22;,
   3;20,22,23;,
   3;24,25,27;,
   3;25,26,27;,
   3;28,29,30;,
   3;28,30,31;,
   3;34,32,33;,
   3;34,39,32;,
   3;34,38,39;,
   3;0,1,3;,
   3;35,36,38;,
   3;36,37,38;,
   3;41,40,43;,
   3;41,43,42;,
   3;45,44,47;,
   3;45,47,46;,
   3;49,48,51;,
   3;49,51,50;,
   3;53,52,55;,
   3;53,55,54;,
   3;59,57,56;,
   3;59,58,57;,
   3;63,61,60;,
   3;63,62,61;,
   3;67,65,64;,
   3;67,66,65;,
   3;71,69,68;,
   3;71,70,69;;

   MeshNormals {
    72;
    0.143541;0.926989;0.346537;,
    0.143540;0.926989;0.346537;,
    0.143540;0.926989;0.346537;,
    0.143540;0.926989;0.346537;,
    0.143540;0.926989;-0.346537;,
    0.143540;0.926989;-0.346537;,
    0.143540;0.926989;-0.346537;,
    0.143541;0.926989;-0.346537;,
    0.346537;0.926989;-0.143541;,
    0.346537;0.926989;-0.143541;,
    0.346537;0.926989;-0.143540;,
    0.346537;0.926989;-0.143541;,
    0.346537;0.926989;0.143540;,
    0.346537;0.926989;0.143540;,
    0.346537;0.926989;0.143540;,
    0.346537;0.926989;0.143541;,
    -0.143541;0.926989;0.346537;,
    -0.143541;0.926989;0.346537;,
    -0.143540;0.926989;0.346537;,
    -0.143541;0.926989;0.346537;,
    -0.143541;0.926989;-0.346537;,
    -0.143541;0.926989;-0.346537;,
    -0.143541;0.926989;-0.346537;,
    -0.143540;0.926989;-0.346537;,
    -0.346537;0.926989;-0.143541;,
    -0.346537;0.926989;-0.143541;,
    -0.346537;0.926989;-0.143540;,
    -0.346537;0.926989;-0.143541;,
    -0.346537;0.926989;0.143541;,
    -0.346537;0.926989;0.143541;,
    -0.346537;0.926989;0.143541;,
    -0.346537;0.926989;0.143540;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.000000;1.000000;0.000000;,
    0.382683;0.000000;-0.923880;,
    0.382683;0.000000;-0.923880;,
    0.382683;0.000000;-0.923880;,
    0.382683;0.000000;-0.923880;,
    0.382683;0.000000;0.923880;,
    0.382683;0.000000;0.923880;,
    0.382683;0.000000;0.923880;,
    0.382683;0.000000;0.923880;,
    0.923880;0.000000;-0.382683;,
    0.923880;0.000000;-0.382683;,
    0.923880;0.000000;-0.382683;,
    0.923880;0.000000;-0.382683;,
    0.923880;0.000000;0.382683;,
    0.923880;0.000000;0.382683;,
    0.923880;0.000000;0.382683;,
    0.923880;0.000000;0.382683;,
    -0.382683;0.000000;-0.923880;,
    -0.382683;0.000000;-0.923880;,
    -0.382683;0.000000;-0.923880;,
    -0.382683;0.000000;-0.923880;,
    -0.382683;0.000000;0.923880;,
    -0.382683;0.000000;0.923880;,
    -0.382683;0.000000;0.923880;,
    -0.382683;0.000000;0.923880;,
    -0.923880;0.000000;-0.382683;,
    -0.923880;0.000000;-0.382683;,
    -0.923880;0.000000;-0.382683;,
    -0.923880;0.000000;-0.382683;,
    -0.923880;0.000000;0.382683;,
    -0.923880;0.000000;0.382683;,
    -0.923880;0.000000;0.382683;,
    -0.923880;0.000000;0.382683;;
    38;
    3;34,35,38;,
    3;3,1,2;,
    3;4,5,6;,
    3;4,6,7;,
    3;8,9,11;,
    3;11,9,10;,
    3;12,13,14;,
    3;12,14,15;,
    3;16,17,19;,
    3;17,18,19;,
    3;20,21,22;,
    3;20,22,23;,
    3;24,25,27;,
    3;25,26,27;,
    3;28,29,30;,
    3;28,30,31;,
    3;34,32,33;,
    3;34,39,32;,
    3;34,38,39;,
    3;0,1,3;,
    3;35,36,38;,
    3;36,37,38;,
    3;41,40,43;,
    3;41,43,42;,
    3;45,44,47;,
    3;45,47,46;,
    3;49,48,51;,
    3;49,51,50;,
    3;53,52,55;,
    3;53,55,54;,
    3;59,57,56;,
    3;59,58,57;,
    3;63,61,60;,
    3;63,62,61;,
    3;67,65,64;,
    3;67,66,65;,
    3;71,69,68;,
    3;71,70,69;;
   }

   MeshTextureCoords {
    72;
    0.001000;0.000000;,
    0.002000;0.040000;,
    0.426000;0.040400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.002000;0.040000;,
    0.426000;0.040400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.002000;0.040000;,
    0.426000;0.040400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.002000;0.040000;,
    0.426000;0.040400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.426000;0.040400;,
    0.002000;0.040000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.426000;0.040400;,
    0.002000;0.040000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.426000;0.040400;,
    0.002000;0.040000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.426000;0.040400;,
    0.002000;0.040000;,
    0.997645;0.318134;,
    0.915063;0.517504;,
    0.715692;0.600086;,
    0.516322;0.517504;,
    0.433741;0.318134;,
    0.516322;0.118764;,
    0.715692;0.036182;,
    0.915063;0.118764;,
    0.425000;0.000400;,
    0.425000;1.000400;,
    0.001000;1.000000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.425000;1.000400;,
    0.001000;1.000000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.425000;1.000400;,
    0.001000;1.000000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.425000;1.000400;,
    0.001000;1.000000;,
    0.001000;0.000000;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.001000;1.000000;,
    0.425000;1.000400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.001000;1.000000;,
    0.425000;1.000400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.001000;1.000000;,
    0.425000;1.000400;,
    0.425000;0.000400;,
    0.001000;0.000000;,
    0.001000;1.000000;,
    0.425000;1.000400;;
   }

   MeshMaterialList {
    1;
    38;
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0;

    Material {
     1.000000;1.000000;1.000000;1.000000;;
     51.200001;
     0.000000;0.000000;0.000000;;
     0.000000;0.000000;0.000000;;
     TextureFilename {
      "tank_b.png";
     }
    }
   }
  }
 }
}
