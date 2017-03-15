// Surface Geoid Boundary Representation, for project: Amundsen_Sea
// 
// Created by:  Shingle (v1.2)
// 
//    Shingle:  An approach and software library for the generation of
//              boundary representation from arbitrary geophysical fields
//              and initialisation for anisotropic, unstructured meshing.
// 
//              Web: https://www.shingleproject.org
// 
//              Contact: Dr Adam S. Candy, contact@shingleproject.org
//     
// Version: v1.2-446-g14c97ac
// Mesh tool version: 2.11.0
//                    (on the system where the boundry representation has been created)
// 
// Project name: Amundsen_Sea
// Boundary Specification authors: Adam S. Candy (A.S.Candy@tudelft.nl, Technische Universiteit Delft)
// Created at: 2017/03/15 12:25:45 
// Project description:
//   Use the RTopo dataset, 50S version (RTopo105b 50S.nc),
//   selecting the region
//   [-130.0:-85.0,-85.0:-60.0] for the Amundsen Sea,
//   extended up to the 64S parallel.
//   Ice shelf ocean cavities are included.

// == Source Shingle surface geoid boundnary representation =======
// <?xml version='1.0' encoding='utf-8'?>
// <boundary_representation>
//   <model_name>
//     <string_value lines="1">Amundsen_Sea</string_value>
//     <comment>Use the RTopo dataset, 50S version (RTopo105b 50S.nc),
// selecting the region
// [-130.0:-85.0,-85.0:-60.0] for the Amundsen Sea,
// extended up to the 64S parallel.
// Ice shelf ocean cavities are included.</comment>
//   </model_name>
//   <reference>
//     <author name="ASCandy">
//       <string_value lines="1">Adam S. Candy</string_value>
//       <email_address>
//         <string_value lines="1">A.S.Candy@tudelft.nl</string_value>
//       </email_address>
//       <institution>
//         <string_value lines="1">Technische Universiteit Delft</string_value>
//       </institution>
//     </author>
//   </reference>
//   <domain_type>
//     <string_value lines="1">ocean_ice_shelf</string_value>
//   </domain_type>
//   <global_parameters/>
//   <output>
//     <orientation name="SouthPole"/>
//   </output>
//   <dataset name="RTopo">
//     <form name="Raster">
//       <source file_name="../../dataset/RTopo105b_50S.nc" name="Local_file"/>
//     </form>
//     <projection name="Automatic"/>
//   </dataset>
//   <geoid_surface_representation name="Amundsen_Sea">
//     <id>
//       <integer_value rank="0">9</integer_value>
//     </id>
//     <brep_component name="Amundsen_Sea_brep">
//       <form name="Raster">
//         <source name="RTopo"/>
//         <box>-130.0:-85.0,-85.0:-60.0</box>
//         <contourtype name="iceshelfcavity"/>
//       </form>
//       <identification name="Coast"/>
//       <id>
//         <integer_value rank="0">3</integer_value>
//       </id>
//       <representation_type name="BSplines"/>
//     </brep_component>
//     <brep_component name="ExtendTo64S">
//       <form name="ExtendToParallel">
//         <latitude>
//           <real_value rank="0">-64.0</real_value>
//           <comment>-64.0</comment>
//           <comment>-64.0</comment>
//         </latitude>
//       </form>
//       <identification name="OpenOcean"/>
//       <representation_type name="BSplines"/>
//     </brep_component>
//     <closure>
//       <no_open/>
//       <open_id>
//         <integer_value rank="0">4</integer_value>
//       </open_id>
//       <extend_to_latitude>
//         <real_value rank="0">-64.0</real_value>
//       </extend_to_latitude>
//     </closure>
//     <boundary name="Coast">
//       <identification_number>
//         <integer_value rank="0">3</integer_value>
//       </identification_number>
//     </boundary>
//     <boundary name="OpenOcean">
//       <identification_number>
//         <integer_value rank="0">4</integer_value>
//       </identification_number>
//     </boundary>
//   </geoid_surface_representation>
//   <geoid_metric>
//     <form name="Proximity">
//       <boundary name="Coast"/>
//       <edge_length_minimum>
//         <real_value rank="0">1.0E4</real_value>
//       </edge_length_minimum>
//       <edge_length_maximum>
//         <real_value rank="0">5.0E5</real_value>
//       </edge_length_maximum>
//       <proximity_minimum>
//         <real_value rank="0">3.0E4</real_value>
//       </proximity_minimum>
//       <proximity_maximum>
//         <real_value rank="0">1.0E6</real_value>
//       </proximity_maximum>
//     </form>
//   </geoid_metric>
//   <geoid_mesh>
//     <library name="Gmsh"/>
//   </geoid_mesh>
//   <validation>
//     <test file_name="data/Amundsen_Sea_valid.geo" name="BrepDescription"/>
//   </validation>
// </boundary_representation>

// == Boundary Representation Specification Parameters ============
// Output to Amundsen_Sea.geo
// Projection type cartesian
// Extending region to meet parallel on latitude -64.0
//   1. Amundsen_Sea_brep
//       Path:           /geoid_surface_representation::Amundsen_Sea/brep_component::Amundsen_Sea_brep
//       Form:           Raster
//       Identification: Coast
//   2. ExtendTo64S
//       Path:           /geoid_surface_representation::Amundsen_Sea/brep_component::ExtendTo64S
//       Form:           ExtendToParallel
//       Identification: OpenOcean

// == BRep component: Amundsen_Sea_brep ===========================
// Reading boundary representation Amundsen_Sea_brep
// Imposing box region: 
//   -130.0:-85.0,-85.0:-60.0
// Region of interest: ((longitude >= -130.0) and (longitude <= -85.0) and (latitude >= -85.0) and (latitude <= -60.0))
// Region defined by ((longitude >= -130.0) and (longitude <= -85.0) and (latitude >= -85.0) and (latitude <= -60.0))
// Open contours closed with a line formed by points spaced 0.1 degrees apart
// Paths found: 348

// == Boundary Representation description =========================

// == Header ======================================================
Point ( 0 ) = { 0, 0, 0 };
Point ( 1 ) = { 0, 0, 6.37101e+06 };
PolarSphere ( 0 ) = { 0, 1 };

Delete { Point{ 0 }; }
Delete { Point{ 1 }; }

// Merged paths that cross the date line: 

// == Ice-Land mass number 1 ======================================
// Path 1: points 5165 (of 59599) area 3.84218e+06 (required closing in 2 parts of the path)

// == Ice-Land mass number 2 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 3 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 4 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 5 ======================================
// Path 5: points 1274 (of 1275) area 25276.9 (required closing in 2 parts of the path)

// == Ice-Land mass number 6 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 7 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 8 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 9 ======================================
//   Skipped (no points found in region)

// == Ice-Land mass number 10 =====================================
// Path 10: points 680 (of 681) area 58481.4 (required closing in 2 parts of the path)

// == Ice-Land mass number 11 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 12 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 13 =====================================
// Path 13: points 512 (of 513) area 8103.48 (required closing in 2 parts of the path)

// == Ice-Land mass number 14 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 15 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 16 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 17 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 18 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 19 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 20 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 21 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 22 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 23 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 24 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 25 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 26 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 27 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 28 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 29 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 30 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 31 =====================================
// Path 31: points 240 (of 241) area 2238.38 (required closing in 2 parts of the path)

// == Ice-Land mass number 32 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 33 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 34 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 35 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 36 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 37 =====================================
// Path 37: points 212 (of 213) area 1205.91 (required closing in 2 parts of the path)

// == Ice-Land mass number 38 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 39 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 40 =====================================
// Path 40: points 180 (of 181) area 1374.98 (required closing in 2 parts of the path)

// == Ice-Land mass number 41 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 42 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 43 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 44 =====================================
// Path 44: points 172 (of 173) area 1082.44 (required closing in 2 parts of the path)

// == Ice-Land mass number 45 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 46 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 47 =====================================
// Path 47: points 158 (of 159) area 2191.14 (required closing in 2 parts of the path)

// == Ice-Land mass number 48 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 49 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 50 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 51 =====================================
// Path 51: points 130 (of 131) area 913.168 (required closing in 2 parts of the path)

// == Ice-Land mass number 52 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 53 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 54 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 55 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 56 =====================================
// Path 56: points 104 (of 105) area 800.669 (required closing in 2 parts of the path)

// == Ice-Land mass number 57 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 58 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 59 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 60 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 61 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 62 =====================================
// Path 62: points 108 (of 109) area 538.654 (required closing in 2 parts of the path)

// == Ice-Land mass number 63 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 64 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 65 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 66 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 67 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 68 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 69 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 70 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 71 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 72 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 73 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 74 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 75 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 76 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 77 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 78 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 79 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 80 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 81 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 82 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 83 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 84 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 85 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 86 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 87 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 88 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 89 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 90 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 91 =====================================
// Path 91: points 60 (of 61) area 225.112 (required closing in 2 parts of the path)

// == Ice-Land mass number 92 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 93 =====================================
// Path 93: points 60 (of 61) area 65.104 (required closing in 2 parts of the path)

// == Ice-Land mass number 94 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 95 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 96 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 97 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 98 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 99 =====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 100 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 101 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 102 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 103 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 104 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 105 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 106 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 107 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 108 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 109 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 110 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 111 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 112 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 113 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 114 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 115 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 116 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 117 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 118 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 119 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 120 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 121 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 122 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 123 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 124 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 125 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 126 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 127 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 128 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 129 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 130 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 131 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 132 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 133 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 134 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 135 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 136 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 137 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 138 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 139 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 140 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 141 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 142 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 143 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 144 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 145 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 146 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 147 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 148 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 149 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 150 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 151 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 152 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 153 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 154 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 155 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 156 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 157 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 158 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 159 ====================================
// Path 159: points 18 (of 19) area 5.40939 (required closing in 2 parts of the path)

// == Ice-Land mass number 160 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 161 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 162 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 163 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 164 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 165 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 166 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 167 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 168 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 169 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 170 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 171 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 172 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 173 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 174 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 175 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 176 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 177 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 178 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 179 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 180 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 181 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 182 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 183 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 184 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 185 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 186 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 187 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 188 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 189 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 190 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 191 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 192 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 193 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 194 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 195 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 196 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 197 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 198 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 199 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 200 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 201 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 202 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 203 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 204 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 205 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 206 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 207 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 208 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 209 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 210 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 211 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 212 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 213 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 214 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 215 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 216 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 217 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 218 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 219 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 220 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 221 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 222 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 223 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 224 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 225 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 226 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 227 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 228 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 229 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 230 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 231 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 232 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 233 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 234 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 235 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 236 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 237 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 238 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 239 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 240 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 241 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 242 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 243 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 244 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 245 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 246 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 247 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 248 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 249 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 250 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 251 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 252 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 253 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 254 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 255 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 256 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 257 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 258 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 259 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 260 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 261 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 262 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 263 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 264 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 265 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 266 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 267 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 268 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 269 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 270 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 271 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 272 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 273 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 274 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 275 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 276 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 277 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 278 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 279 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 280 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 281 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 282 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 283 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 284 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 285 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 286 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 287 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 288 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 289 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 290 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 291 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 292 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 293 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 294 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 295 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 296 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 297 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 298 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 299 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 300 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 301 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 302 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 303 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 304 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 305 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 306 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 307 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 308 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 309 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 310 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 311 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 312 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 313 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 314 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 315 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 316 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 317 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 318 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 319 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 320 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 321 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 322 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 323 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 324 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 325 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 326 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 327 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 328 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 329 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 330 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 331 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 332 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 333 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 334 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 335 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 336 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 337 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 338 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 339 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 340 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 341 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 342 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 343 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 344 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 345 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 346 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 347 ====================================
//   Skipped (no points found in region)

// == Ice-Land mass number 348 ====================================
//   Skipped (no points found in region)
// Paths found valid (renumbered order): 15, including 1 5 10 13 31 37 40 44 47 51 56 62 91 93 159

// == Ice-Land mass number 5 ======================================
Point ( 2 ) = { 0.95983106, 6.46094589, 0.00000000 };
Point ( 3 ) = { 0.95795207, 6.46122476, 0.00000000 };
Point ( 4 ) = { 0.95607213, 6.46150320, 0.00000000 };
Point ( 5 ) = { 0.95419297, 6.46178097, 0.00000000 };
Point ( 6 ) = { 0.95231287, 6.46205832, 0.00000000 };
Point ( 7 ) = { 0.95043356, 6.46233499, 0.00000000 };
Point ( 8 ) = { 0.94855330, 6.46261125, 0.00000000 };
Point ( 9 ) = { 0.94667382, 6.46288683, 0.00000000 };
Point ( 10 ) = { 0.94479340, 6.46316199, 0.00000000 };
Point ( 11 ) = { 0.94291376, 6.46343648, 0.00000000 };
Point ( 12 ) = { 0.94103318, 6.46371055, 0.00000000 };
Point ( 13 ) = { 0.93915338, 6.46398394, 0.00000000 };
Point ( 14 ) = { 0.93727265, 6.46425692, 0.00000000 };
Point ( 15 ) = { 0.93539183, 6.46452934, 0.00000000 };
Point ( 16 ) = { 0.93351179, 6.46480110, 0.00000000 };
Point ( 17 ) = { 0.93163082, 6.46507243, 0.00000000 };
Point ( 18 ) = { 0.92975062, 6.46534309, 0.00000000 };
Point ( 19 ) = { 0.92786949, 6.46561333, 0.00000000 };
Point ( 20 ) = { 0.92647903, 6.46260716, 0.00000000 };
Point ( 21 ) = { 0.92508968, 6.45960227, 0.00000000 };
Point ( 22 ) = { 0.92321022, 6.45987115, 0.00000000 };
Point ( 23 ) = { 0.92133154, 6.46013936, 0.00000000 };
Point ( 24 ) = { 0.91945192, 6.46040715, 0.00000000 };
Point ( 25 ) = { 0.91757308, 6.46067427, 0.00000000 };
Point ( 26 ) = { 0.91569331, 6.46094097, 0.00000000 };
Point ( 27 ) = { 0.91381432, 6.46120699, 0.00000000 };
Point ( 28 ) = { 0.91193439, 6.46147259, 0.00000000 };
Point ( 29 ) = { 0.91005524, 6.46173753, 0.00000000 };
Point ( 30 ) = { 0.90817516, 6.46200203, 0.00000000 };
Point ( 31 ) = { 0.90629500, 6.46226599, 0.00000000 };
Point ( 32 ) = { 0.90441562, 6.46252929, 0.00000000 };
Point ( 33 ) = { 0.90253531, 6.46279215, 0.00000000 };
Point ( 34 ) = { 0.90065578, 6.46305435, 0.00000000 };
Point ( 35 ) = { 0.89877531, 6.46331612, 0.00000000 };
Point ( 36 ) = { 0.89689563, 6.46357723, 0.00000000 };
Point ( 37 ) = { 0.89501502, 6.46383791, 0.00000000 };
Point ( 38 ) = { 0.89313518, 6.46409792, 0.00000000 };
Point ( 39 ) = { 0.89125441, 6.46435751, 0.00000000 };
Point ( 40 ) = { 0.88937443, 6.46461643, 0.00000000 };
Point ( 41 ) = { 0.88749351, 6.46487492, 0.00000000 };
Point ( 42 ) = { 0.88561337, 6.46513274, 0.00000000 };
Point ( 43 ) = { 0.88373230, 6.46539014, 0.00000000 };
Point ( 44 ) = { 0.88185202, 6.46564687, 0.00000000 };
Point ( 45 ) = { 0.88048368, 6.46263553, 0.00000000 };
Point ( 46 ) = { 0.87911683, 6.45962834, 0.00000000 };
Point ( 47 ) = { 0.87723737, 6.45988384, 0.00000000 };
Point ( 48 ) = { 0.87535868, 6.46013869, 0.00000000 };
Point ( 49 ) = { 0.87347907, 6.46039310, 0.00000000 };
Point ( 50 ) = { 0.87160024, 6.46064685, 0.00000000 };
Point ( 51 ) = { 0.86972047, 6.46090017, 0.00000000 };
Point ( 52 ) = { 0.86784149, 6.46115282, 0.00000000 };
Point ( 53 ) = { 0.86648119, 6.45814596, 0.00000000 };
Point ( 54 ) = { 0.86512199, 6.45514038, 0.00000000 };
Point ( 55 ) = { 0.86324469, 6.45539170, 0.00000000 };
Point ( 56 ) = { 0.86136645, 6.45564259, 0.00000000 };
Point ( 57 ) = { 0.85948900, 6.45589282, 0.00000000 };
Point ( 58 ) = { 0.85761062, 6.45614261, 0.00000000 };
Point ( 59 ) = { 0.85573303, 6.45639175, 0.00000000 };
Point ( 60 ) = { 0.85385450, 6.45664045, 0.00000000 };
Point ( 61 ) = { 0.85197677, 6.45688849, 0.00000000 };
Point ( 62 ) = { 0.85009810, 6.45713610, 0.00000000 };
Point ( 63 ) = { 0.84821935, 6.45738316, 0.00000000 };
Point ( 64 ) = { 0.84634140, 6.45762957, 0.00000000 };
Point ( 65 ) = { 0.84446251, 6.45787554, 0.00000000 };
Point ( 66 ) = { 0.84258442, 6.45812085, 0.00000000 };
Point ( 67 ) = { 0.84070539, 6.45836573, 0.00000000 };
Point ( 68 ) = { 0.83882715, 6.45860994, 0.00000000 };
Point ( 69 ) = { 0.83694798, 6.45885373, 0.00000000 };
Point ( 70 ) = { 0.83506960, 6.45909685, 0.00000000 };
Point ( 71 ) = { 0.83319029, 6.45933954, 0.00000000 };
Point ( 72 ) = { 0.83131176, 6.45958158, 0.00000000 };
Point ( 73 ) = { 0.82943231, 6.45982317, 0.00000000 };
Point ( 74 ) = { 0.82755365, 6.46006411, 0.00000000 };
Point ( 75 ) = { 0.82567406, 6.46030462, 0.00000000 };
Point ( 76 ) = { 0.82379525, 6.46054447, 0.00000000 };
Point ( 77 ) = { 0.82191552, 6.46078388, 0.00000000 };
Point ( 78 ) = { 0.82137391, 6.46403774, 0.00000000 };
Point ( 79 ) = { 0.82083156, 6.46729311, 0.00000000 };
Point ( 80 ) = { 0.81895072, 6.46753155, 0.00000000 };
Point ( 81 ) = { 0.81706896, 6.46776955, 0.00000000 };
Point ( 82 ) = { 0.81518798, 6.46800690, 0.00000000 };
Point ( 83 ) = { 0.81330608, 6.46824380, 0.00000000 };
Point ( 84 ) = { 0.81142497, 6.46848005, 0.00000000 };
Point ( 85 ) = { 0.80954293, 6.46871586, 0.00000000 };
Point ( 86 ) = { 0.80766168, 6.46895102, 0.00000000 };
Point ( 87 ) = { 0.80577950, 6.46918573, 0.00000000 };
Point ( 88 ) = { 0.80389812, 6.46941979, 0.00000000 };
Point ( 89 ) = { 0.80201581, 6.46965342, 0.00000000 };
Point ( 90 ) = { 0.80013428, 6.46988638, 0.00000000 };
Point ( 91 ) = { 0.79825184, 6.47011891, 0.00000000 };
Point ( 92 ) = { 0.79637018, 6.47035078, 0.00000000 };
Point ( 93 ) = { 0.79448760, 6.47058221, 0.00000000 };
Point ( 94 ) = { 0.79260494, 6.47081309, 0.00000000 };
Point ( 95 ) = { 0.79072309, 6.47104332, 0.00000000 };
Point ( 96 ) = { 0.78884030, 6.47127311, 0.00000000 };
Point ( 97 ) = { 0.78695831, 6.47150224, 0.00000000 };
Point ( 98 ) = { 0.78507539, 6.47173093, 0.00000000 };
Point ( 99 ) = { 0.78319327, 6.47195897, 0.00000000 };
Point ( 100 ) = { 0.78131022, 6.47218657, 0.00000000 };
Point ( 101 ) = { 0.77942796, 6.47241352, 0.00000000 };
Point ( 102 ) = { 0.77754478, 6.47264002, 0.00000000 };
Point ( 103 ) = { 0.77566239, 6.47286587, 0.00000000 };
Point ( 104 ) = { 0.77377907, 6.47309127, 0.00000000 };
Point ( 105 ) = { 0.77189655, 6.47331603, 0.00000000 };
Point ( 106 ) = { 0.77001311, 6.47354034, 0.00000000 };
Point ( 107 ) = { 0.76869887, 6.47051319, 0.00000000 };
Point ( 108 ) = { 0.76738572, 6.46748735, 0.00000000 };
Point ( 109 ) = { 0.76550396, 6.46771034, 0.00000000 };
Point ( 110 ) = { 0.76362215, 6.46793279, 0.00000000 };
Point ( 111 ) = { 0.76174113, 6.46815459, 0.00000000 };
Point ( 112 ) = { 0.75985919, 6.46837595, 0.00000000 };
Point ( 113 ) = { 0.75797804, 6.46859666, 0.00000000 };
Point ( 114 ) = { 0.75609597, 6.46881692, 0.00000000 };
Point ( 115 ) = { 0.75552169, 6.47206504, 0.00000000 };
Point ( 116 ) = { 0.75494665, 6.47531468, 0.00000000 };
Point ( 117 ) = { 0.75306263, 6.47553406, 0.00000000 };
Point ( 118 ) = { 0.75117940, 6.47575279, 0.00000000 };
Point ( 119 ) = { 0.74929524, 6.47597107, 0.00000000 };
Point ( 120 ) = { 0.74741189, 6.47618870, 0.00000000 };
Point ( 121 ) = { 0.74552761, 6.47640589, 0.00000000 };
Point ( 122 ) = { 0.74364413, 6.47662243, 0.00000000 };
Point ( 123 ) = { 0.74175972, 6.47683852, 0.00000000 };
Point ( 124 ) = { 0.74117748, 6.48008992, 0.00000000 };
Point ( 125 ) = { 0.74059482, 6.48334572, 0.00000000 };
Point ( 126 ) = { 0.73870846, 6.48356092, 0.00000000 };
Point ( 127 ) = { 0.73682203, 6.48377557, 0.00000000 };
Point ( 128 ) = { 0.73493641, 6.48398958, 0.00000000 };
Point ( 129 ) = { 0.73304986, 6.48420314, 0.00000000 };
Point ( 130 ) = { 0.73116411, 6.48441604, 0.00000000 };
Point ( 131 ) = { 0.72927743, 6.48462850, 0.00000000 };
Point ( 132 ) = { 0.72739156, 6.48484032, 0.00000000 };
Point ( 133 ) = { 0.72550476, 6.48505168, 0.00000000 };
Point ( 134 ) = { 0.72361877, 6.48526239, 0.00000000 };
Point ( 135 ) = { 0.72173185, 6.48547265, 0.00000000 };
Point ( 136 ) = { 0.71984573, 6.48568227, 0.00000000 };
Point ( 137 ) = { 0.71795869, 6.48589144, 0.00000000 };
Point ( 138 ) = { 0.71736407, 6.48914813, 0.00000000 };
Point ( 139 ) = { 0.71676868, 6.49240635, 0.00000000 };
Point ( 140 ) = { 0.71487969, 6.49261462, 0.00000000 };
Point ( 141 ) = { 0.71299149, 6.49282224, 0.00000000 };
Point ( 142 ) = { 0.71110237, 6.49302941, 0.00000000 };
Point ( 143 ) = { 0.70921319, 6.49323603, 0.00000000 };
Point ( 144 ) = { 0.70732482, 6.49344201, 0.00000000 };
Point ( 145 ) = { 0.70543552, 6.49364753, 0.00000000 };
Point ( 146 ) = { 0.70354703, 6.49385241, 0.00000000 };
Point ( 147 ) = { 0.70165761, 6.49405683, 0.00000000 };
Point ( 148 ) = { 0.69976899, 6.49426061, 0.00000000 };
Point ( 149 ) = { 0.69787946, 6.49446393, 0.00000000 };
Point ( 150 ) = { 0.69599073, 6.49466661, 0.00000000 };
Point ( 151 ) = { 0.69470826, 6.49161268, 0.00000000 };
Point ( 152 ) = { 0.69342686, 6.48856006, 0.00000000 };
Point ( 153 ) = { 0.69153984, 6.48876144, 0.00000000 };
Point ( 154 ) = { 0.68965191, 6.48896237, 0.00000000 };
Point ( 155 ) = { 0.68776477, 6.48916266, 0.00000000 };
Point ( 156 ) = { 0.68587672, 6.48936249, 0.00000000 };
Point ( 157 ) = { 0.68460053, 6.48631109, 0.00000000 };
Point ( 158 ) = { 0.68332570, 6.48326389, 0.00000000 };
Point ( 159 ) = { 0.68205165, 6.48021948, 0.00000000 };
Point ( 160 ) = { 0.68139052, 6.47393804, 0.00000000 };
Point ( 161 ) = { 0.68011908, 6.47090079, 0.00000000 };
Point ( 162 ) = { 0.67884884, 6.46786627, 0.00000000 };
Point ( 163 ) = { 0.67819233, 6.46161124, 0.00000000 };
Point ( 164 ) = { 0.67692499, 6.45858669, 0.00000000 };
Point ( 165 ) = { 0.67565927, 6.45556482, 0.00000000 };
Point ( 166 ) = { 0.67439461, 6.45254424, 0.00000000 };
Point ( 167 ) = { 0.67251721, 6.45274018, 0.00000000 };
Point ( 168 ) = { 0.67064061, 6.45293549, 0.00000000 };
Point ( 169 ) = { 0.66937848, 6.44991692, 0.00000000 };
Point ( 170 ) = { 0.66811754, 6.44690106, 0.00000000 };
Point ( 171 ) = { 0.66624264, 6.44709509, 0.00000000 };
Point ( 172 ) = { 0.66436683, 6.44728866, 0.00000000 };
Point ( 173 ) = { 0.66310927, 6.44427473, 0.00000000 };
Point ( 174 ) = { 0.66185304, 6.44126492, 0.00000000 };
Point ( 175 ) = { 0.65997893, 6.44145722, 0.00000000 };
Point ( 176 ) = { 0.65810561, 6.44164888, 0.00000000 };
Point ( 177 ) = { 0.65623138, 6.44184008, 0.00000000 };
Point ( 178 ) = { 0.65435796, 6.44203065, 0.00000000 };
Point ( 179 ) = { 0.65248362, 6.44222077, 0.00000000 };
Point ( 180 ) = { 0.65123296, 6.43921183, 0.00000000 };
Point ( 181 ) = { 0.64998334, 6.43620417, 0.00000000 };
Point ( 182 ) = { 0.64811070, 6.43639301, 0.00000000 };
Point ( 183 ) = { 0.64623800, 6.43658130, 0.00000000 };
Point ( 184 ) = { 0.64436610, 6.43676897, 0.00000000 };
Point ( 185 ) = { 0.64249329, 6.43695617, 0.00000000 };
Point ( 186 ) = { 0.64062129, 6.43714275, 0.00000000 };
Point ( 187 ) = { 0.63874837, 6.43732887, 0.00000000 };
Point ( 188 ) = { 0.63687626, 6.43751435, 0.00000000 };
Point ( 189 ) = { 0.63500324, 6.43769938, 0.00000000 };
Point ( 190 ) = { 0.63313102, 6.43788378, 0.00000000 };
Point ( 191 ) = { 0.63125789, 6.43806771, 0.00000000 };
Point ( 192 ) = { 0.63001820, 6.43505912, 0.00000000 };
Point ( 193 ) = { 0.62877982, 6.43205464, 0.00000000 };
Point ( 194 ) = { 0.62690838, 6.43223731, 0.00000000 };
Point ( 195 ) = { 0.62503775, 6.43241936, 0.00000000 };
Point ( 196 ) = { 0.62316621, 6.43260094, 0.00000000 };
Point ( 197 ) = { 0.62129547, 6.43278189, 0.00000000 };
Point ( 198 ) = { 0.61942383, 6.43296239, 0.00000000 };
Point ( 199 ) = { 0.61755213, 6.43314234, 0.00000000 };
Point ( 200 ) = { 0.61632016, 6.43013838, 0.00000000 };
Point ( 201 ) = { 0.61508922, 6.42713570, 0.00000000 };
Point ( 202 ) = { 0.61321922, 6.42731438, 0.00000000 };
Point ( 203 ) = { 0.61199032, 6.42431402, 0.00000000 };
Point ( 204 ) = { 0.61076272, 6.42131775, 0.00000000 };
Point ( 205 ) = { 0.60953584, 6.41832419, 0.00000000 };
Point ( 206 ) = { 0.60830999, 6.41533188, 0.00000000 };
Point ( 207 ) = { 0.60708573, 6.41234220, 0.00000000 };
Point ( 208 ) = { 0.60772668, 6.40918013, 0.00000000 };
Point ( 209 ) = { 0.60959140, 6.40900304, 0.00000000 };
Point ( 210 ) = { 0.61145523, 6.40882549, 0.00000000 };
Point ( 211 ) = { 0.61209413, 6.40566583, 0.00000000 };
Point ( 212 ) = { 0.61273227, 6.40250758, 0.00000000 };
Point ( 213 ) = { 0.61459420, 6.40232912, 0.00000000 };
Point ( 214 ) = { 0.61645693, 6.40215003, 0.00000000 };
Point ( 215 ) = { 0.61831961, 6.40197040, 0.00000000 };
Point ( 216 ) = { 0.62018139, 6.40179031, 0.00000000 };
Point ( 217 ) = { 0.62081523, 6.39863415, 0.00000000 };
Point ( 218 ) = { 0.62144857, 6.39548220, 0.00000000 };
Point ( 219 ) = { 0.62330846, 6.39530120, 0.00000000 };
Point ( 220 ) = { 0.62516915, 6.39511958, 0.00000000 };
Point ( 221 ) = { 0.62702893, 6.39493750, 0.00000000 };
Point ( 222 ) = { 0.62888952, 6.39475480, 0.00000000 };
Point ( 223 ) = { 0.63074919, 6.39457163, 0.00000000 };
Point ( 224 ) = { 0.63260967, 6.39438785, 0.00000000 };
Point ( 225 ) = { 0.63384274, 6.39735679, 0.00000000 };
Point ( 226 ) = { 0.63507711, 6.40032978, 0.00000000 };
Point ( 227 ) = { 0.63693927, 6.40014473, 0.00000000 };
Point ( 228 ) = { 0.63880051, 6.39995922, 0.00000000 };
Point ( 229 ) = { 0.64066255, 6.39977309, 0.00000000 };
Point ( 230 ) = { 0.64252369, 6.39958651, 0.00000000 };
Point ( 231 ) = { 0.64438563, 6.39939930, 0.00000000 };
Point ( 232 ) = { 0.64624751, 6.39921154, 0.00000000 };
Point ( 233 ) = { 0.64810848, 6.39902333, 0.00000000 };
Point ( 234 ) = { 0.64997025, 6.39883449, 0.00000000 };
Point ( 235 ) = { 0.65183111, 6.39864520, 0.00000000 };
Point ( 236 ) = { 0.65244933, 6.39548594, 0.00000000 };
Point ( 237 ) = { 0.65306708, 6.39233090, 0.00000000 };
Point ( 238 ) = { 0.65492605, 6.39214071, 0.00000000 };
Point ( 239 ) = { 0.65678582, 6.39194988, 0.00000000 };
Point ( 240 ) = { 0.65864468, 6.39175861, 0.00000000 };
Point ( 241 ) = { 0.66050434, 6.39156671, 0.00000000 };
Point ( 242 ) = { 0.66236309, 6.39137435, 0.00000000 };
Point ( 243 ) = { 0.66297564, 6.38822123, 0.00000000 };
Point ( 244 ) = { 0.66358744, 6.38506952, 0.00000000 };
Point ( 245 ) = { 0.66544430, 6.38487627, 0.00000000 };
Point ( 246 ) = { 0.66730196, 6.38468239, 0.00000000 };
Point ( 247 ) = { 0.66915870, 6.38448805, 0.00000000 };
Point ( 248 ) = { 0.67101624, 6.38429309, 0.00000000 };
Point ( 249 ) = { 0.67162377, 6.38114349, 0.00000000 };
Point ( 250 ) = { 0.67223070, 6.37799668, 0.00000000 };
Point ( 251 ) = { 0.67408550, 6.37780092, 0.00000000 };
Point ( 252 ) = { 0.67594110, 6.37760452, 0.00000000 };
Point ( 253 ) = { 0.67654517, 6.37446022, 0.00000000 };
Point ( 254 ) = { 0.67714879, 6.37132010, 0.00000000 };
Point ( 255 ) = { 0.67900250, 6.37112281, 0.00000000 };
Point ( 256 ) = { 0.67960462, 6.36798531, 0.00000000 };
Point ( 257 ) = { 0.67835510, 6.36504815, 0.00000000 };
Point ( 258 ) = { 0.67710632, 6.36211362, 0.00000000 };
Point ( 259 ) = { 0.67585857, 6.35918030, 0.00000000 };
Point ( 260 ) = { 0.67400918, 6.35937658, 0.00000000 };
Point ( 261 ) = { 0.67215889, 6.35957242, 0.00000000 };
Point ( 262 ) = { 0.67030939, 6.35976762, 0.00000000 };
Point ( 263 ) = { 0.66845898, 6.35996238, 0.00000000 };
Point ( 264 ) = { 0.66660852, 6.36015660, 0.00000000 };
Point ( 265 ) = { 0.66475885, 6.36035019, 0.00000000 };
Point ( 266 ) = { 0.66290828, 6.36054334, 0.00000000 };
Point ( 267 ) = { 0.66105849, 6.36073585, 0.00000000 };
Point ( 268 ) = { 0.65920781, 6.36092792, 0.00000000 };
Point ( 269 ) = { 0.65735791, 6.36111936, 0.00000000 };
Point ( 270 ) = { 0.65550711, 6.36131035, 0.00000000 };
Point ( 271 ) = { 0.65489419, 6.36443841, 0.00000000 };
Point ( 272 ) = { 0.65428052, 6.36756787, 0.00000000 };
Point ( 273 ) = { 0.65242785, 6.36775796, 0.00000000 };
Point ( 274 ) = { 0.65057597, 6.36794743, 0.00000000 };
Point ( 275 ) = { 0.64872318, 6.36813644, 0.00000000 };
Point ( 276 ) = { 0.64687119, 6.36832484, 0.00000000 };
Point ( 277 ) = { 0.64501830, 6.36851277, 0.00000000 };
Point ( 278 ) = { 0.64316620, 6.36870009, 0.00000000 };
Point ( 279 ) = { 0.64131319, 6.36888695, 0.00000000 };
Point ( 280 ) = { 0.63946014, 6.36907327, 0.00000000 };
Point ( 281 ) = { 0.63760787, 6.36925896, 0.00000000 };
Point ( 282 ) = { 0.63575471, 6.36944421, 0.00000000 };
Point ( 283 ) = { 0.63390234, 6.36962883, 0.00000000 };
Point ( 284 ) = { 0.63267408, 6.36668565, 0.00000000 };
Point ( 285 ) = { 0.63144684, 6.36374369, 0.00000000 };
Point ( 286 ) = { 0.62959612, 6.36392706, 0.00000000 };
Point ( 287 ) = { 0.62774451, 6.36410997, 0.00000000 };
Point ( 288 ) = { 0.62589369, 6.36429226, 0.00000000 };
Point ( 289 ) = { 0.62467016, 6.36135183, 0.00000000 };
Point ( 290 ) = { 0.62344777, 6.35841400, 0.00000000 };
Point ( 291 ) = { 0.62222695, 6.35547872, 0.00000000 };
Point ( 292 ) = { 0.62163556, 6.34943817, 0.00000000 };
Point ( 293 ) = { 0.62041731, 6.34651100, 0.00000000 };
Point ( 294 ) = { 0.61919977, 6.34358644, 0.00000000 };
Point ( 295 ) = { 0.61861232, 6.33756809, 0.00000000 };
Point ( 296 ) = { 0.61802568, 6.33155813, 0.00000000 };
Point ( 297 ) = { 0.61744040, 6.32556202, 0.00000000 };
Point ( 298 ) = { 0.61806780, 6.32247690, 0.00000000 };
Point ( 299 ) = { 0.61869417, 6.31939454, 0.00000000 };
Point ( 300 ) = { 0.61932005, 6.31631626, 0.00000000 };
Point ( 301 ) = { 0.62115776, 6.31613581, 0.00000000 };
Point ( 302 ) = { 0.62299458, 6.31595490, 0.00000000 };
Point ( 303 ) = { 0.62361848, 6.31287892, 0.00000000 };
Point ( 304 ) = { 0.62424165, 6.30980429, 0.00000000 };
Point ( 305 ) = { 0.62607662, 6.30962248, 0.00000000 };
Point ( 306 ) = { 0.62791238, 6.30944006, 0.00000000 };
Point ( 307 ) = { 0.62974725, 6.30925718, 0.00000000 };
Point ( 308 ) = { 0.63158290, 6.30907369, 0.00000000 };
Point ( 309 ) = { 0.63341766, 6.30888975, 0.00000000 };
Point ( 310 ) = { 0.63525321, 6.30870519, 0.00000000 };
Point ( 311 ) = { 0.63708870, 6.30852010, 0.00000000 };
Point ( 312 ) = { 0.63892330, 6.30833455, 0.00000000 };
Point ( 313 ) = { 0.64075869, 6.30814839, 0.00000000 };
Point ( 314 ) = { 0.64259318, 6.30796178, 0.00000000 };
Point ( 315 ) = { 0.64442845, 6.30777455, 0.00000000 };
Point ( 316 ) = { 0.64565083, 6.31066362, 0.00000000 };
Point ( 317 ) = { 0.64687420, 6.31355385, 0.00000000 };
Point ( 318 ) = { 0.64809913, 6.31644658, 0.00000000 };
Point ( 319 ) = { 0.64871320, 6.32243139, 0.00000000 };
Point ( 320 ) = { 0.64994071, 6.32533209, 0.00000000 };
Point ( 321 ) = { 0.65178020, 6.32514281, 0.00000000 };
Point ( 322 ) = { 0.65362047, 6.32495290, 0.00000000 };
Point ( 323 ) = { 0.65545985, 6.32476255, 0.00000000 };
Point ( 324 ) = { 0.65669103, 6.32766473, 0.00000000 };
Point ( 325 ) = { 0.65792350, 6.33057083, 0.00000000 };
Point ( 326 ) = { 0.65976451, 6.33037923, 0.00000000 };
Point ( 327 ) = { 0.66099898, 6.33328752, 0.00000000 };
Point ( 328 ) = { 0.66223445, 6.33619700, 0.00000000 };
Point ( 329 ) = { 0.66407710, 6.33600415, 0.00000000 };
Point ( 330 ) = { 0.66592053, 6.33581066, 0.00000000 };
Point ( 331 ) = { 0.66776391, 6.33561665, 0.00000000 };
Point ( 332 ) = { 0.66960639, 6.33542218, 0.00000000 };
Point ( 333 ) = { 0.67144966, 6.33522709, 0.00000000 };
Point ( 334 ) = { 0.67269009, 6.33813737, 0.00000000 };
Point ( 335 ) = { 0.67393184, 6.34105160, 0.00000000 };
Point ( 336 ) = { 0.67577674, 6.34085525, 0.00000000 };
Point ( 337 ) = { 0.67762074, 6.34065845, 0.00000000 };
Point ( 338 ) = { 0.67946553, 6.34046103, 0.00000000 };
Point ( 339 ) = { 0.68130941, 6.34026316, 0.00000000 };
Point ( 340 ) = { 0.68255613, 6.34317846, 0.00000000 };
Point ( 341 ) = { 0.68380386, 6.34609495, 0.00000000 };
Point ( 342 ) = { 0.68564939, 6.34589582, 0.00000000 };
Point ( 343 ) = { 0.68749570, 6.34569606, 0.00000000 };
Point ( 344 ) = { 0.68934111, 6.34549586, 0.00000000 };
Point ( 345 ) = { 0.69118730, 6.34529502, 0.00000000 };
Point ( 346 ) = { 0.69178104, 6.34217903, 0.00000000 };
Point ( 347 ) = { 0.69237405, 6.33906442, 0.00000000 };
Point ( 348 ) = { 0.69421837, 6.33886270, 0.00000000 };
Point ( 349 ) = { 0.69606264, 6.33866045, 0.00000000 };
Point ( 350 ) = { 0.69790600, 6.33845775, 0.00000000 };
Point ( 351 ) = { 0.69975015, 6.33825443, 0.00000000 };
Point ( 352 ) = { 0.70159339, 6.33805066, 0.00000000 };
Point ( 353 ) = { 0.70343742, 6.33784627, 0.00000000 };
Point ( 354 ) = { 0.70528054, 6.33764143, 0.00000000 };
Point ( 355 ) = { 0.70712445, 6.33743596, 0.00000000 };
Point ( 356 ) = { 0.70896746, 6.33723004, 0.00000000 };
Point ( 357 ) = { 0.71022688, 6.34013987, 0.00000000 };
Point ( 358 ) = { 0.71148733, 6.34305089, 0.00000000 };
Point ( 359 ) = { 0.71333196, 6.34284371, 0.00000000 };
Point ( 360 ) = { 0.71517739, 6.34263590, 0.00000000 };
Point ( 361 ) = { 0.71702190, 6.34242764, 0.00000000 };
Point ( 362 ) = { 0.71886721, 6.34221876, 0.00000000 };
Point ( 363 ) = { 0.72071160, 6.34200943, 0.00000000 };
Point ( 364 ) = { 0.72255678, 6.34179947, 0.00000000 };
Point ( 365 ) = { 0.72440190, 6.34158897, 0.00000000 };
Point ( 366 ) = { 0.72566903, 6.34450003, 0.00000000 };
Point ( 367 ) = { 0.72693750, 6.34741503, 0.00000000 };
Point ( 368 ) = { 0.72878425, 6.34720326, 0.00000000 };
Point ( 369 ) = { 0.73063009, 6.34699105, 0.00000000 };
Point ( 370 ) = { 0.73190187, 6.34990784, 0.00000000 };
Point ( 371 ) = { 0.73317483, 6.35282721, 0.00000000 };
Point ( 372 ) = { 0.73502231, 6.35261372, 0.00000000 };
Point ( 373 ) = { 0.73687058, 6.35239960, 0.00000000 };
Point ( 374 ) = { 0.73871793, 6.35218504, 0.00000000 };
Point ( 375 ) = { 0.73999464, 6.35510587, 0.00000000 };
Point ( 376 ) = { 0.74127237, 6.35802790, 0.00000000 };
Point ( 377 ) = { 0.74312137, 6.35781206, 0.00000000 };
Point ( 378 ) = { 0.74497114, 6.35759558, 0.00000000 };
Point ( 379 ) = { 0.74682001, 6.35737866, 0.00000000 };
Point ( 380 ) = { 0.74866966, 6.35716110, 0.00000000 };
Point ( 381 ) = { 0.75051840, 6.35694311, 0.00000000 };
Point ( 382 ) = { 0.75236792, 6.35672448, 0.00000000 };
Point ( 383 ) = { 0.75421738, 6.35650530, 0.00000000 };
Point ( 384 ) = { 0.75606593, 6.35628570, 0.00000000 };
Point ( 385 ) = { 0.75791526, 6.35606545, 0.00000000 };
Point ( 386 ) = { 0.75847788, 6.35292641, 0.00000000 };
Point ( 387 ) = { 0.75903976, 6.34978878, 0.00000000 };
Point ( 388 ) = { 0.76088720, 6.34956767, 0.00000000 };
Point ( 389 ) = { 0.76273374, 6.34934612, 0.00000000 };
Point ( 390 ) = { 0.76458105, 6.34912393, 0.00000000 };
Point ( 391 ) = { 0.76513964, 6.34598860, 0.00000000 };
Point ( 392 ) = { 0.76569768, 6.34285604, 0.00000000 };
Point ( 393 ) = { 0.76754310, 6.34263300, 0.00000000 };
Point ( 394 ) = { 0.76809967, 6.33950306, 0.00000000 };
Point ( 395 ) = { 0.76736963, 6.33347769, 0.00000000 };
Point ( 396 ) = { 0.76608444, 6.33057929, 0.00000000 };
Point ( 397 ) = { 0.76424252, 6.33080191, 0.00000000 };
Point ( 398 ) = { 0.76240139, 6.33102390, 0.00000000 };
Point ( 399 ) = { 0.76111866, 6.32812735, 0.00000000 };
Point ( 400 ) = { 0.75983728, 6.32523472, 0.00000000 };
Point ( 401 ) = { 0.75799776, 6.32545542, 0.00000000 };
Point ( 402 ) = { 0.75615734, 6.32567570, 0.00000000 };
Point ( 403 ) = { 0.75487926, 6.32278481, 0.00000000 };
Point ( 404 ) = { 0.75360221, 6.31989510, 0.00000000 };
Point ( 405 ) = { 0.75176340, 6.32011409, 0.00000000 };
Point ( 406 ) = { 0.74992537, 6.32033245, 0.00000000 };
Point ( 407 ) = { 0.74808644, 6.32055038, 0.00000000 };
Point ( 408 ) = { 0.74624744, 6.32076776, 0.00000000 };
Point ( 409 ) = { 0.74497493, 6.31787911, 0.00000000 };
Point ( 410 ) = { 0.74370377, 6.31499435, 0.00000000 };
Point ( 411 ) = { 0.74186639, 6.31521047, 0.00000000 };
Point ( 412 ) = { 0.74002978, 6.31542595, 0.00000000 };
Point ( 413 ) = { 0.73819228, 6.31564099, 0.00000000 };
Point ( 414 ) = { 0.73692481, 6.31275766, 0.00000000 };
Point ( 415 ) = { 0.73565836, 6.30987549, 0.00000000 };
Point ( 416 ) = { 0.73382247, 6.31008926, 0.00000000 };
Point ( 417 ) = { 0.73198736, 6.31030241, 0.00000000 };
Point ( 418 ) = { 0.73072334, 6.30742208, 0.00000000 };
Point ( 419 ) = { 0.72946065, 6.30454563, 0.00000000 };
Point ( 420 ) = { 0.72762715, 6.30475751, 0.00000000 };
Point ( 421 ) = { 0.72579274, 6.30496894, 0.00000000 };
Point ( 422 ) = { 0.72395912, 6.30517975, 0.00000000 };
Point ( 423 ) = { 0.72212460, 6.30539012, 0.00000000 };
Point ( 424 ) = { 0.72086684, 6.30251468, 0.00000000 };
Point ( 425 ) = { 0.71961010, 6.29964040, 0.00000000 };
Point ( 426 ) = { 0.71777718, 6.29984950, 0.00000000 };
Point ( 427 ) = { 0.71594421, 6.30005807, 0.00000000 };
Point ( 428 ) = { 0.71469030, 6.29718557, 0.00000000 };
Point ( 429 ) = { 0.71343771, 6.29431694, 0.00000000 };
Point ( 430 ) = { 0.71160635, 6.29452425, 0.00000000 };
Point ( 431 ) = { 0.70977576, 6.29473093, 0.00000000 };
Point ( 432 ) = { 0.70794428, 6.29493717, 0.00000000 };
Point ( 433 ) = { 0.70611357, 6.29514279, 0.00000000 };
Point ( 434 ) = { 0.70428197, 6.29534797, 0.00000000 };
Point ( 435 ) = { 0.70303470, 6.29248003, 0.00000000 };
Point ( 436 ) = { 0.70178844, 6.28961323, 0.00000000 };
Point ( 437 ) = { 0.69995845, 6.28981715, 0.00000000 };
Point ( 438 ) = { 0.69871417, 6.28695250, 0.00000000 };
Point ( 439 ) = { 0.69747105, 6.28409034, 0.00000000 };
Point ( 440 ) = { 0.69564266, 6.28429301, 0.00000000 };
Point ( 441 ) = { 0.69381505, 6.28449505, 0.00000000 };
Point ( 442 ) = { 0.69198655, 6.28469665, 0.00000000 };
Point ( 443 ) = { 0.69015882, 6.28489762, 0.00000000 };
Point ( 444 ) = { 0.68891975, 6.28203657, 0.00000000 };
Point ( 445 ) = { 0.68768198, 6.27917936, 0.00000000 };
Point ( 446 ) = { 0.68585502, 6.27937917, 0.00000000 };
Point ( 447 ) = { 0.68402884, 6.27957837, 0.00000000 };
Point ( 448 ) = { 0.68220177, 6.27977712, 0.00000000 };
Point ( 449 ) = { 0.68096805, 6.27692128, 0.00000000 };
Point ( 450 ) = { 0.67973547, 6.27406792, 0.00000000 };
Point ( 451 ) = { 0.67791000, 6.27426542, 0.00000000 };
Point ( 452 ) = { 0.67608531, 6.27446230, 0.00000000 };
Point ( 453 ) = { 0.67485510, 6.27161076, 0.00000000 };
Point ( 454 ) = { 0.67362589, 6.26876034, 0.00000000 };
Point ( 455 ) = { 0.67180280, 6.26895598, 0.00000000 };
Point ( 456 ) = { 0.67057555, 6.26610768, 0.00000000 };
Point ( 457 ) = { 0.66934943, 6.26326187, 0.00000000 };
Point ( 458 ) = { 0.66812486, 6.26041847, 0.00000000 };
Point ( 459 ) = { 0.66749834, 6.25454792, 0.00000000 };
Point ( 460 ) = { 0.66687268, 6.24868542, 0.00000000 };
Point ( 461 ) = { 0.66746861, 6.24566253, 0.00000000 };
Point ( 462 ) = { 0.66928576, 6.24546807, 0.00000000 };
Point ( 463 ) = { 0.66988022, 6.24244764, 0.00000000 };
Point ( 464 ) = { 0.67047396, 6.23942850, 0.00000000 };
Point ( 465 ) = { 0.67228930, 6.23923317, 0.00000000 };
Point ( 466 ) = { 0.67288159, 6.23621648, 0.00000000 };
Point ( 467 ) = { 0.67347345, 6.23320375, 0.00000000 };
Point ( 468 ) = { 0.67528697, 6.23300754, 0.00000000 };
Point ( 469 ) = { 0.67709961, 6.23281089, 0.00000000 };
Point ( 470 ) = { 0.67891302, 6.23261363, 0.00000000 };
Point ( 471 ) = { 0.68072554, 6.23241592, 0.00000000 };
Point ( 472 ) = { 0.68131373, 6.22940508, 0.00000000 };
Point ( 473 ) = { 0.68190121, 6.22639552, 0.00000000 };
Point ( 474 ) = { 0.68371275, 6.22619685, 0.00000000 };
Point ( 475 ) = { 0.68552341, 6.22599775, 0.00000000 };
Point ( 476 ) = { 0.68733484, 6.22579804, 0.00000000 };
Point ( 477 ) = { 0.68914538, 6.22559789, 0.00000000 };
Point ( 478 ) = { 0.69095669, 6.22539712, 0.00000000 };
Point ( 479 ) = { 0.69276711, 6.22519591, 0.00000000 };
Point ( 480 ) = { 0.69457831, 6.22499409, 0.00000000 };
Point ( 481 ) = { 0.69638861, 6.22479183, 0.00000000 };
Point ( 482 ) = { 0.69819969, 6.22458895, 0.00000000 };
Point ( 483 ) = { 0.70000988, 6.22438564, 0.00000000 };
Point ( 484 ) = { 0.70182083, 6.22418171, 0.00000000 };
Point ( 485 ) = { 0.70363090, 6.22397734, 0.00000000 };
Point ( 486 ) = { 0.70544174, 6.22377236, 0.00000000 };
Point ( 487 ) = { 0.70725169, 6.22356694, 0.00000000 };
Point ( 488 ) = { 0.70906241, 6.22336090, 0.00000000 };
Point ( 489 ) = { 0.71087307, 6.22315433, 0.00000000 };
Point ( 490 ) = { 0.71268284, 6.22294734, 0.00000000 };
Point ( 491 ) = { 0.71449338, 6.22273972, 0.00000000 };
Point ( 492 ) = { 0.71630303, 6.22253167, 0.00000000 };
Point ( 493 ) = { 0.71811344, 6.22232300, 0.00000000 };
Point ( 494 ) = { 0.71992297, 6.22211389, 0.00000000 };
Point ( 495 ) = { 0.72173327, 6.22190417, 0.00000000 };
Point ( 496 ) = { 0.72354267, 6.22169401, 0.00000000 };
Point ( 497 ) = { 0.72535285, 6.22148323, 0.00000000 };
Point ( 498 ) = { 0.72716213, 6.22127203, 0.00000000 };
Point ( 499 ) = { 0.72897218, 6.22106019, 0.00000000 };
Point ( 500 ) = { 0.73078134, 6.22084793, 0.00000000 };
Point ( 501 ) = { 0.73259127, 6.22063505, 0.00000000 };
Point ( 502 ) = { 0.73440031, 6.22042174, 0.00000000 };
Point ( 503 ) = { 0.73621011, 6.22020780, 0.00000000 };
Point ( 504 ) = { 0.73801985, 6.21999334, 0.00000000 };
Point ( 505 ) = { 0.73982870, 6.21977844, 0.00000000 };
Point ( 506 ) = { 0.74163831, 6.21956293, 0.00000000 };
Point ( 507 ) = { 0.74344704, 6.21934698, 0.00000000 };
Point ( 508 ) = { 0.74525653, 6.21913041, 0.00000000 };
Point ( 509 ) = { 0.74706513, 6.21891342, 0.00000000 };
Point ( 510 ) = { 0.74887449, 6.21869579, 0.00000000 };
Point ( 511 ) = { 0.74942859, 6.21568275, 0.00000000 };
Point ( 512 ) = { 0.74998230, 6.21267365, 0.00000000 };
Point ( 513 ) = { 0.75178985, 6.21245518, 0.00000000 };
Point ( 514 ) = { 0.75359651, 6.21223628, 0.00000000 };
Point ( 515 ) = { 0.75540393, 6.21201676, 0.00000000 };
Point ( 516 ) = { 0.75721046, 6.21179681, 0.00000000 };
Point ( 517 ) = { 0.75901775, 6.21157624, 0.00000000 };
Point ( 518 ) = { 0.76082415, 6.21135524, 0.00000000 };
Point ( 519 ) = { 0.76263131, 6.21113362, 0.00000000 };
Point ( 520 ) = { 0.76443841, 6.21091146, 0.00000000 };
Point ( 521 ) = { 0.76624462, 6.21068889, 0.00000000 };
Point ( 522 ) = { 0.76750622, 6.21347644, 0.00000000 };
Point ( 523 ) = { 0.76876913, 6.21626772, 0.00000000 };
Point ( 524 ) = { 0.77057690, 6.21604389, 0.00000000 };
Point ( 525 ) = { 0.77238542, 6.21581943, 0.00000000 };
Point ( 526 ) = { 0.77365070, 6.21861244, 0.00000000 };
Point ( 527 ) = { 0.77437427, 6.22442850, 0.00000000 };
Point ( 528 ) = { 0.77509950, 6.23025785, 0.00000000 };
Point ( 529 ) = { 0.77636879, 6.23306236, 0.00000000 };
Point ( 530 ) = { 0.77763966, 6.23586924, 0.00000000 };
Point ( 531 ) = { 0.77836924, 6.24171972, 0.00000000 };
Point ( 532 ) = { 0.77964280, 6.24453428, 0.00000000 };
Point ( 533 ) = { 0.78091711, 6.24735134, 0.00000000 };
Point ( 534 ) = { 0.78165107, 6.25322306, 0.00000000 };
Point ( 535 ) = { 0.78238638, 6.25910556, 0.00000000 };
Point ( 536 ) = { 0.78366492, 6.26193563, 0.00000000 };
Point ( 537 ) = { 0.78494506, 6.26476811, 0.00000000 };
Point ( 538 ) = { 0.78568445, 6.27066933, 0.00000000 };
Point ( 539 ) = { 0.78696748, 6.27351094, 0.00000000 };
Point ( 540 ) = { 0.78825127, 6.27635508, 0.00000000 };
Point ( 541 ) = { 0.78899545, 6.28228055, 0.00000000 };
Point ( 542 ) = { 0.78974066, 6.28821421, 0.00000000 };
Point ( 543 ) = { 0.79102874, 6.29107156, 0.00000000 };
Point ( 544 ) = { 0.79231843, 6.29393135, 0.00000000 };
Point ( 545 ) = { 0.79306813, 6.29988673, 0.00000000 };
Point ( 546 ) = { 0.79436057, 6.30275442, 0.00000000 };
Point ( 547 ) = { 0.79565380, 6.30562467, 0.00000000 };
Point ( 548 ) = { 0.79694805, 6.30849608, 0.00000000 };
Point ( 549 ) = { 0.79878347, 6.30826394, 0.00000000 };
Point ( 550 ) = { 0.80061799, 6.30803137, 0.00000000 };
Point ( 551 ) = { 0.80245328, 6.30779817, 0.00000000 };
Point ( 552 ) = { 0.80375166, 6.31067091, 0.00000000 };
Point ( 553 ) = { 0.80505142, 6.31354754, 0.00000000 };
Point ( 554 ) = { 0.80688747, 6.31331315, 0.00000000 };
Point ( 555 ) = { 0.80872430, 6.31307812, 0.00000000 };
Point ( 556 ) = { 0.81002652, 6.31595658, 0.00000000 };
Point ( 557 ) = { 0.81132978, 6.31883620, 0.00000000 };
Point ( 558 ) = { 0.81316821, 6.31859988, 0.00000000 };
Point ( 559 ) = { 0.81500574, 6.31836313, 0.00000000 };
Point ( 560 ) = { 0.81684403, 6.31812573, 0.00000000 };
Point ( 561 ) = { 0.81868142, 6.31788791, 0.00000000 };
Point ( 562 ) = { 0.82051957, 6.31764945, 0.00000000 };
Point ( 563 ) = { 0.82235682, 6.31741056, 0.00000000 };
Point ( 564 ) = { 0.82419484, 6.31717103, 0.00000000 };
Point ( 565 ) = { 0.82603195, 6.31693107, 0.00000000 };
Point ( 566 ) = { 0.82786982, 6.31669047, 0.00000000 };
Point ( 567 ) = { 0.82839516, 6.31357363, 0.00000000 };
Point ( 568 ) = { 0.82891980, 6.31045817, 0.00000000 };
Point ( 569 ) = { 0.83075579, 6.31021673, 0.00000000 };
Point ( 570 ) = { 0.83259172, 6.30997475, 0.00000000 };
Point ( 571 ) = { 0.83311402, 6.30686175, 0.00000000 };
Point ( 572 ) = { 0.83363598, 6.30375285, 0.00000000 };
Point ( 573 ) = { 0.83547002, 6.30351004, 0.00000000 };
Point ( 574 ) = { 0.83599055, 6.30040374, 0.00000000 };
Point ( 575 ) = { 0.83519920, 6.29443978, 0.00000000 };
Point ( 576 ) = { 0.83388942, 6.29158461, 0.00000000 };
Point ( 577 ) = { 0.83205884, 6.29182697, 0.00000000 };
Point ( 578 ) = { 0.83075110, 6.28897392, 0.00000000 };
Point ( 579 ) = { 0.82944438, 6.28612200, 0.00000000 };
Point ( 580 ) = { 0.82761540, 6.28636306, 0.00000000 };
Point ( 581 ) = { 0.82578634, 6.28660359, 0.00000000 };
Point ( 582 ) = { 0.82448249, 6.28375341, 0.00000000 };
Point ( 583 ) = { 0.82318003, 6.28090708, 0.00000000 };
Point ( 584 ) = { 0.82187835, 6.27806329, 0.00000000 };
Point ( 585 ) = { 0.82057769, 6.27522062, 0.00000000 };
Point ( 586 ) = { 0.81927865, 6.27238039, 0.00000000 };
Point ( 587 ) = { 0.81850660, 6.26646956, 0.00000000 };
Point ( 588 ) = { 0.81773631, 6.26057230, 0.00000000 };
Point ( 589 ) = { 0.81696745, 6.25468585, 0.00000000 };
Point ( 590 ) = { 0.81749241, 6.25162653, 0.00000000 };
Point ( 591 ) = { 0.81931129, 6.25138841, 0.00000000 };
Point ( 592 ) = { 0.81983485, 6.24833161, 0.00000000 };
Point ( 593 ) = { 0.82035789, 6.24527748, 0.00000000 };
Point ( 594 ) = { 0.82088083, 6.24222596, 0.00000000 };
Point ( 595 ) = { 0.82140343, 6.23917845, 0.00000000 };
Point ( 596 ) = { 0.82321868, 6.23893920, 0.00000000 };
Point ( 597 ) = { 0.82373946, 6.23589425, 0.00000000 };
Point ( 598 ) = { 0.82425955, 6.23285061, 0.00000000 };
Point ( 599 ) = { 0.82607297, 6.23261053, 0.00000000 };
Point ( 600 ) = { 0.82788548, 6.23237003, 0.00000000 };
Point ( 601 ) = { 0.82840370, 6.22932869, 0.00000000 };
Point ( 602 ) = { 0.82892159, 6.22629134, 0.00000000 };
Point ( 603 ) = { 0.83073227, 6.22605001, 0.00000000 };
Point ( 604 ) = { 0.83254370, 6.22580805, 0.00000000 };
Point ( 605 ) = { 0.83305890, 6.22277309, 0.00000000 };
Point ( 606 ) = { 0.83357341, 6.21973945, 0.00000000 };
Point ( 607 ) = { 0.83538301, 6.21949665, 0.00000000 };
Point ( 608 ) = { 0.83719171, 6.21925345, 0.00000000 };
Point ( 609 ) = { 0.83770436, 6.21622209, 0.00000000 };
Point ( 610 ) = { 0.83821668, 6.21319469, 0.00000000 };
Point ( 611 ) = { 0.84002355, 6.21295066, 0.00000000 };
Point ( 612 ) = { 0.84183117, 6.21270599, 0.00000000 };
Point ( 613 ) = { 0.84363790, 6.21246091, 0.00000000 };
Point ( 614 ) = { 0.84544538, 6.21221519, 0.00000000 };
Point ( 615 ) = { 0.84725279, 6.21196895, 0.00000000 };
Point ( 616 ) = { 0.84905930, 6.21172229, 0.00000000 };
Point ( 617 ) = { 0.85086657, 6.21147499, 0.00000000 };
Point ( 618 ) = { 0.85267294, 6.21122728, 0.00000000 };
Point ( 619 ) = { 0.85448006, 6.21097893, 0.00000000 };
Point ( 620 ) = { 0.85628629, 6.21073017, 0.00000000 };
Point ( 621 ) = { 0.85759063, 6.21350979, 0.00000000 };
Point ( 622 ) = { 0.85889635, 6.21629314, 0.00000000 };
Point ( 623 ) = { 0.86070412, 6.21604310, 0.00000000 };
Point ( 624 ) = { 0.86251264, 6.21579241, 0.00000000 };
Point ( 625 ) = { 0.86432026, 6.21554132, 0.00000000 };
Point ( 626 ) = { 0.86481968, 6.21250775, 0.00000000 };
Point ( 627 ) = { 0.86531879, 6.20947815, 0.00000000 };
Point ( 628 ) = { 0.86712458, 6.20922624, 0.00000000 };
Point ( 629 ) = { 0.86893112, 6.20897368, 0.00000000 };
Point ( 630 ) = { 0.87073676, 6.20872072, 0.00000000 };
Point ( 631 ) = { 0.87123273, 6.20569332, 0.00000000 };
Point ( 632 ) = { 0.87172803, 6.20266722, 0.00000000 };
Point ( 633 ) = { 0.87353266, 6.20241333, 0.00000000 };
Point ( 634 ) = { 0.87533639, 6.20215903, 0.00000000 };
Point ( 635 ) = { 0.87714087, 6.20190408, 0.00000000 };
Point ( 636 ) = { 0.87763263, 6.19888024, 0.00000000 };
Point ( 637 ) = { 0.87812408, 6.19586034, 0.00000000 };
Point ( 638 ) = { 0.87992673, 6.19560459, 0.00000000 };
Point ( 639 ) = { 0.88172848, 6.19534843, 0.00000000 };
Point ( 640 ) = { 0.88353099, 6.19509163, 0.00000000 };
Point ( 641 ) = { 0.88533259, 6.19483442, 0.00000000 };
Point ( 642 ) = { 0.88713494, 6.19457657, 0.00000000 };
Point ( 643 ) = { 0.88762152, 6.19155858, 0.00000000 };
Point ( 644 ) = { 0.88810743, 6.18854189, 0.00000000 };
Point ( 645 ) = { 0.88990795, 6.18828323, 0.00000000 };
Point ( 646 ) = { 0.89170757, 6.18802417, 0.00000000 };
Point ( 647 ) = { 0.89350794, 6.18776447, 0.00000000 };
Point ( 648 ) = { 0.89530741, 6.18750436, 0.00000000 };
Point ( 649 ) = { 0.89710763, 6.18724361, 0.00000000 };
Point ( 650 ) = { 0.89890777, 6.18698233, 0.00000000 };
Point ( 651 ) = { 0.89938793, 6.18396741, 0.00000000 };
Point ( 652 ) = { 0.89986781, 6.18095642, 0.00000000 };
Point ( 653 ) = { 0.90166613, 6.18069434, 0.00000000 };
Point ( 654 ) = { 0.90346354, 6.18043186, 0.00000000 };
Point ( 655 ) = { 0.90526170, 6.18016873, 0.00000000 };
Point ( 656 ) = { 0.90705896, 6.17990521, 0.00000000 };
Point ( 657 ) = { 0.90753528, 6.17689620, 0.00000000 };
Point ( 658 ) = { 0.90801093, 6.17388849, 0.00000000 };
Point ( 659 ) = { 0.90980636, 6.17362416, 0.00000000 };
Point ( 660 ) = { 0.91160254, 6.17335919, 0.00000000 };
Point ( 661 ) = { 0.91339782, 6.17309382, 0.00000000 };
Point ( 662 ) = { 0.91519385, 6.17282781, 0.00000000 };
Point ( 663 ) = { 0.91566512, 6.16982221, 0.00000000 };
Point ( 664 ) = { 0.91613592, 6.16681920, 0.00000000 };
Point ( 665 ) = { 0.91793012, 6.16655239, 0.00000000 };
Point ( 666 ) = { 0.91972342, 6.16628518, 0.00000000 };
Point ( 667 ) = { 0.92151746, 6.16601733, 0.00000000 };
Point ( 668 ) = { 0.92331143, 6.16574895, 0.00000000 };
Point ( 669 ) = { 0.92510450, 6.16548017, 0.00000000 };
Point ( 670 ) = { 0.92689831, 6.16521075, 0.00000000 };
Point ( 671 ) = { 0.92869122, 6.16494093, 0.00000000 };
Point ( 672 ) = { 0.93048487, 6.16467047, 0.00000000 };
Point ( 673 ) = { 0.93094822, 6.16166898, 0.00000000 };
Point ( 674 ) = { 0.93141131, 6.15867138, 0.00000000 };
Point ( 675 ) = { 0.93320314, 6.15840013, 0.00000000 };
Point ( 676 ) = { 0.93499407, 6.15812848, 0.00000000 };
Point ( 677 ) = { 0.93678574, 6.15785618, 0.00000000 };
Point ( 678 ) = { 0.93857651, 6.15758348, 0.00000000 };
Point ( 679 ) = { 0.94036802, 6.15731014, 0.00000000 };
Point ( 680 ) = { 0.94215863, 6.15703641, 0.00000000 };
Point ( 681 ) = { 0.94394998, 6.15676203, 0.00000000 };
Point ( 682 ) = { 0.94574043, 6.15648725, 0.00000000 };
Point ( 683 ) = { 0.94753163, 6.15621183, 0.00000000 };
Point ( 684 ) = { 0.94932274, 6.15593588, 0.00000000 };
Point ( 685 ) = { 0.95111295, 6.15565954, 0.00000000 };
Point ( 686 ) = { 0.95290390, 6.15538255, 0.00000000 };
Point ( 687 ) = { 0.95469395, 6.15510517, 0.00000000 };
Point ( 688 ) = { 0.95648474, 6.15482714, 0.00000000 };
Point ( 689 ) = { 0.95827463, 6.15454872, 0.00000000 };
Point ( 690 ) = { 0.96006526, 6.15426965, 0.00000000 };
Point ( 691 ) = { 0.96185498, 6.15399019, 0.00000000 };
Point ( 692 ) = { 0.96319765, 6.15671011, 0.00000000 };
Point ( 693 ) = { 0.96454174, 6.15943369, 0.00000000 };
Point ( 694 ) = { 0.96633297, 6.15915292, 0.00000000 };
Point ( 695 ) = { 0.96812494, 6.15887150, 0.00000000 };
Point ( 696 ) = { 0.96947142, 6.16159669, 0.00000000 };
Point ( 697 ) = { 0.97037454, 6.16733656, 0.00000000 };
Point ( 698 ) = { 0.97172370, 6.17006786, 0.00000000 };
Point ( 699 ) = { 0.97307449, 6.17280144, 0.00000000 };
Point ( 700 ) = { 0.97398257, 6.17856194, 0.00000000 };
Point ( 701 ) = { 0.97533626, 6.18130298, 0.00000000 };
Point ( 702 ) = { 0.97669077, 6.18404644, 0.00000000 };
Point ( 703 ) = { 0.97804672, 6.18679360, 0.00000000 };
Point ( 704 ) = { 0.97984673, 6.18650877, 0.00000000 };
Point ( 705 ) = { 0.98120513, 6.18925783, 0.00000000 };
Point ( 706 ) = { 0.98256456, 6.19200794, 0.00000000 };
Point ( 707 ) = { 0.98436526, 6.19172194, 0.00000000 };
Point ( 708 ) = { 0.98616670, 6.19143527, 0.00000000 };
Point ( 709 ) = { 0.98752856, 6.19418703, 0.00000000 };
Point ( 710 ) = { 0.98889187, 6.19694249, 0.00000000 };
Point ( 711 ) = { 0.99069483, 6.19665451, 0.00000000 };
Point ( 712 ) = { 0.99206019, 6.19941196, 0.00000000 };
Point ( 713 ) = { 0.99162285, 6.20245911, 0.00000000 };
Point ( 714 ) = { 0.99118464, 6.20550898, 0.00000000 };
Point ( 715 ) = { 0.99074621, 6.20856284, 0.00000000 };
Point ( 716 ) = { 0.99030775, 6.21161930, 0.00000000 };
Point ( 717 ) = { 0.98986864, 6.21467709, 0.00000000 };
Point ( 718 ) = { 0.98806043, 6.21496483, 0.00000000 };
Point ( 719 ) = { 0.98625297, 6.21525192, 0.00000000 };
Point ( 720 ) = { 0.98581122, 6.21831219, 0.00000000 };
Point ( 721 ) = { 0.98536923, 6.22137648, 0.00000000 };
Point ( 722 ) = { 0.98355908, 6.22166291, 0.00000000 };
Point ( 723 ) = { 0.98174967, 6.22194869, 0.00000000 };
Point ( 724 ) = { 0.97993935, 6.22223406, 0.00000000 };
Point ( 725 ) = { 0.97949465, 6.22530058, 0.00000000 };
Point ( 726 ) = { 0.97904951, 6.22836978, 0.00000000 };
Point ( 727 ) = { 0.97723732, 6.22865437, 0.00000000 };
Point ( 728 ) = { 0.97542588, 6.22893831, 0.00000000 };
Point ( 729 ) = { 0.97361353, 6.22922184, 0.00000000 };
Point ( 730 ) = { 0.97316525, 6.23229334, 0.00000000 };
Point ( 731 ) = { 0.97271631, 6.23536619, 0.00000000 };
Point ( 732 ) = { 0.97090208, 6.23564894, 0.00000000 };
Point ( 733 ) = { 0.97045180, 6.23872435, 0.00000000 };
Point ( 734 ) = { 0.97000105, 6.24180245, 0.00000000 };
Point ( 735 ) = { 0.96818496, 6.24208441, 0.00000000 };
Point ( 736 ) = { 0.96636961, 6.24236571, 0.00000000 };
Point ( 737 ) = { 0.96591620, 6.24544632, 0.00000000 };
Point ( 738 ) = { 0.96546255, 6.24853098, 0.00000000 };
Point ( 739 ) = { 0.96500885, 6.25161828, 0.00000000 };
Point ( 740 ) = { 0.96637362, 6.25442752, 0.00000000 };
Point ( 741 ) = { 0.96774007, 6.25723915, 0.00000000 };
Point ( 742 ) = { 0.96910758, 6.26005189, 0.00000000 };
Point ( 743 ) = { 0.97092806, 6.25976979, 0.00000000 };
Point ( 744 ) = { 0.97274931, 6.25948703, 0.00000000 };
Point ( 745 ) = { 0.97456963, 6.25920388, 0.00000000 };
Point ( 746 ) = { 0.97639071, 6.25892006, 0.00000000 };
Point ( 747 ) = { 0.97821087, 6.25863584, 0.00000000 };
Point ( 748 ) = { 0.98003178, 6.25835097, 0.00000000 };
Point ( 749 ) = { 0.98185177, 6.25806569, 0.00000000 };
Point ( 750 ) = { 0.98367252, 6.25777976, 0.00000000 };
Point ( 751 ) = { 0.98549235, 6.25749342, 0.00000000 };
Point ( 752 ) = { 0.98731292, 6.25720643, 0.00000000 };
Point ( 753 ) = { 0.98913259, 6.25691904, 0.00000000 };
Point ( 754 ) = { 0.99095300, 6.25663098, 0.00000000 };
Point ( 755 ) = { 0.99139520, 6.25353486, 0.00000000 };
Point ( 756 ) = { 0.99183673, 6.25044011, 0.00000000 };
Point ( 757 ) = { 0.99365443, 6.25015140, 0.00000000 };
Point ( 758 ) = { 0.99547287, 6.24986203, 0.00000000 };
Point ( 759 ) = { 0.99729039, 6.24957227, 0.00000000 };
Point ( 760 ) = { 0.99910866, 6.24928184, 0.00000000 };
Point ( 761 ) = { 0.99954574, 6.24618936, 0.00000000 };
Point ( 762 ) = { 0.99998237, 6.24309960, 0.00000000 };
Point ( 763 ) = { 1.00179876, 6.24280839, 0.00000000 };
Point ( 764 ) = { 1.00361423, 6.24251678, 0.00000000 };
Point ( 765 ) = { 1.00543045, 6.24222452, 0.00000000 };
Point ( 766 ) = { 1.00586394, 6.23913709, 0.00000000 };
Point ( 767 ) = { 1.00629721, 6.23605371, 0.00000000 };
Point ( 768 ) = { 1.00811155, 6.23576066, 0.00000000 };
Point ( 769 ) = { 1.00992498, 6.23546722, 0.00000000 };
Point ( 770 ) = { 1.01173914, 6.23517312, 0.00000000 };
Point ( 771 ) = { 1.01355240, 6.23487862, 0.00000000 };
Point ( 772 ) = { 1.01398206, 6.23179738, 0.00000000 };
Point ( 773 ) = { 1.01441128, 6.22871883, 0.00000000 };
Point ( 774 ) = { 1.01622348, 6.22842343, 0.00000000 };
Point ( 775 ) = { 1.01803477, 6.22812763, 0.00000000 };
Point ( 776 ) = { 1.01984681, 6.22783117, 0.00000000 };
Point ( 777 ) = { 1.02027249, 6.22475501, 0.00000000 };
Point ( 778 ) = { 1.02069753, 6.22168021, 0.00000000 };
Point ( 779 ) = { 1.02250768, 6.22138297, 0.00000000 };
Point ( 780 ) = { 1.02431693, 6.22108535, 0.00000000 };
Point ( 781 ) = { 1.02612691, 6.22078706, 0.00000000 };
Point ( 782 ) = { 1.02793598, 6.22048838, 0.00000000 };
Point ( 783 ) = { 1.02835742, 6.21741571, 0.00000000 };
Point ( 784 ) = { 1.02877843, 6.21434573, 0.00000000 };
Point ( 785 ) = { 1.03058563, 6.21404628, 0.00000000 };
Point ( 786 ) = { 1.03239356, 6.21374616, 0.00000000 };
Point ( 787 ) = { 1.03420058, 6.21344566, 0.00000000 };
Point ( 788 ) = { 1.03600834, 6.21314450, 0.00000000 };
Point ( 789 ) = { 1.03781519, 6.21284295, 0.00000000 };
Point ( 790 ) = { 1.03962278, 6.21254073, 0.00000000 };
Point ( 791 ) = { 1.04143027, 6.21223799, 0.00000000 };
Point ( 792 ) = { 1.04323685, 6.21193486, 0.00000000 };
Point ( 793 ) = { 1.04504417, 6.21163107, 0.00000000 };
Point ( 794 ) = { 1.04685058, 6.21132689, 0.00000000 };
Point ( 795 ) = { 1.04865772, 6.21102204, 0.00000000 };
Point ( 796 ) = { 1.05046395, 6.21071681, 0.00000000 };
Point ( 797 ) = { 1.05186151, 6.21348247, 0.00000000 };
Point ( 798 ) = { 1.05326036, 6.21625053, 0.00000000 };
Point ( 799 ) = { 1.05466007, 6.21902107, 0.00000000 };
Point ( 800 ) = { 1.05606084, 6.22179267, 0.00000000 };
Point ( 801 ) = { 1.05746331, 6.22456661, 0.00000000 };
Point ( 802 ) = { 1.05886707, 6.22734297, 0.00000000 };
Point ( 803 ) = { 1.06067804, 6.22703477, 0.00000000 };
Point ( 804 ) = { 1.06248975, 6.22672590, 0.00000000 };
Point ( 805 ) = { 1.06389600, 6.22950392, 0.00000000 };
Point ( 806 ) = { 1.06530376, 6.23228571, 0.00000000 };
Point ( 807 ) = { 1.06711700, 6.23197550, 0.00000000 };
Point ( 808 ) = { 1.06892933, 6.23166490, 0.00000000 };
Point ( 809 ) = { 1.07074239, 6.23135363, 0.00000000 };
Point ( 810 ) = { 1.07255535, 6.23104183, 0.00000000 };
Point ( 811 ) = { 1.07396765, 6.23382440, 0.00000000 };
Point ( 812 ) = { 1.07538125, 6.23660940, 0.00000000 };
Point ( 813 ) = { 1.07719575, 6.23629625, 0.00000000 };
Point ( 814 ) = { 1.07900933, 6.23598272, 0.00000000 };
Point ( 815 ) = { 1.07940720, 6.23288483, 0.00000000 };
Point ( 816 ) = { 1.07980466, 6.22978966, 0.00000000 };
Point ( 817 ) = { 1.08161635, 6.22947537, 0.00000000 };
Point ( 818 ) = { 1.08342877, 6.22916041, 0.00000000 };
Point ( 819 ) = { 1.08524027, 6.22884507, 0.00000000 };
Point ( 820 ) = { 1.08705251, 6.22852905, 0.00000000 };
Point ( 821 ) = { 1.08744555, 6.22543621, 0.00000000 };
Point ( 822 ) = { 1.08783842, 6.22234743, 0.00000000 };
Point ( 823 ) = { 1.08964877, 6.22203066, 0.00000000 };
Point ( 824 ) = { 1.09145820, 6.22171350, 0.00000000 };
Point ( 825 ) = { 1.09184928, 6.21862713, 0.00000000 };
Point ( 826 ) = { 1.09223997, 6.21554345, 0.00000000 };
Point ( 827 ) = { 1.09404751, 6.21522555, 0.00000000 };
Point ( 828 ) = { 1.09585578, 6.21490697, 0.00000000 };
Point ( 829 ) = { 1.09624427, 6.21182577, 0.00000000 };
Point ( 830 ) = { 1.09663212, 6.20874593, 0.00000000 };
Point ( 831 ) = { 1.09843768, 6.20842675, 0.00000000 };
Point ( 832 ) = { 1.09882424, 6.20534950, 0.00000000 };
Point ( 833 ) = { 1.09921040, 6.20227493, 0.00000000 };
Point ( 834 ) = { 1.10101408, 6.20195500, 0.00000000 };
Point ( 835 ) = { 1.10139895, 6.19888302, 0.00000000 };
Point ( 836 ) = { 1.10178366, 6.19581505, 0.00000000 };
Point ( 837 ) = { 1.10216756, 6.19274983, 0.00000000 };
Point ( 838 ) = { 1.10113448, 6.18694525, 0.00000000 };
Point ( 839 ) = { 1.09971965, 6.18420824, 0.00000000 };
Point ( 840 ) = { 1.09792031, 6.18452794, 0.00000000 };
Point ( 841 ) = { 1.09612170, 6.18484697, 0.00000000 };
Point ( 842 ) = { 1.09470934, 6.18211158, 0.00000000 };
Point ( 843 ) = { 1.09329804, 6.17937722, 0.00000000 };
Point ( 844 ) = { 1.09188844, 6.17664515, 0.00000000 };
Point ( 845 ) = { 1.09086818, 6.17087373, 0.00000000 };
Point ( 846 ) = { 1.09125539, 6.16783204, 0.00000000 };
Point ( 847 ) = { 1.09304987, 6.16751428, 0.00000000 };
Point ( 848 ) = { 1.09484345, 6.16719614, 0.00000000 };
Point ( 849 ) = { 1.09522890, 6.16415679, 0.00000000 };
Point ( 850 ) = { 1.09561419, 6.16112140, 0.00000000 };
Point ( 851 ) = { 1.09740590, 6.16080251, 0.00000000 };
Point ( 852 ) = { 1.09919834, 6.16048296, 0.00000000 };
Point ( 853 ) = { 1.10098987, 6.16016303, 0.00000000 };
Point ( 854 ) = { 1.10137212, 6.15712994, 0.00000000 };
Point ( 855 ) = { 1.10175374, 6.15409817, 0.00000000 };
Point ( 856 ) = { 1.10354341, 6.15377750, 0.00000000 };
Point ( 857 ) = { 1.10533381, 6.15345616, 0.00000000 };
Point ( 858 ) = { 1.10712329, 6.15313445, 0.00000000 };
Point ( 859 ) = { 1.10891350, 6.15281207, 0.00000000 };
Point ( 860 ) = { 1.11070280, 6.15248932, 0.00000000 };
Point ( 861 ) = { 1.11211649, 6.15519834, 0.00000000 };
Point ( 862 ) = { 1.11353123, 6.15790837, 0.00000000 };
Point ( 863 ) = { 1.11532283, 6.15758413, 0.00000000 };
Point ( 864 ) = { 1.11711351, 6.15725951, 0.00000000 };
Point ( 865 ) = { 1.11890492, 6.15693423, 0.00000000 };
Point ( 866 ) = { 1.12069542, 6.15660857, 0.00000000 };
Point ( 867 ) = { 1.12248664, 6.15628224, 0.00000000 };
Point ( 868 ) = { 1.12390619, 6.15899262, 0.00000000 };
Point ( 869 ) = { 1.12532728, 6.16170665, 0.00000000 };
Point ( 870 ) = { 1.12711998, 6.16137898, 0.00000000 };
Point ( 871 ) = { 1.12891177, 6.16105093, 0.00000000 };
Point ( 872 ) = { 1.13033614, 6.16376640, 0.00000000 };
Point ( 873 ) = { 1.13176157, 6.16648289, 0.00000000 };
Point ( 874 ) = { 1.13355484, 6.16615350, 0.00000000 };
Point ( 875 ) = { 1.13534883, 6.16582343, 0.00000000 };
Point ( 876 ) = { 1.13714191, 6.16549299, 0.00000000 };
Point ( 877 ) = { 1.13893572, 6.16516187, 0.00000000 };
Point ( 878 ) = { 1.14072860, 6.16483039, 0.00000000 };
Point ( 879 ) = { 1.14252222, 6.16449824, 0.00000000 };
Point ( 880 ) = { 1.14431573, 6.16416556, 0.00000000 };
Point ( 881 ) = { 1.14574757, 6.16688156, 0.00000000 };
Point ( 882 ) = { 1.14718097, 6.16960122, 0.00000000 };
Point ( 883 ) = { 1.14897597, 6.16926719, 0.00000000 };
Point ( 884 ) = { 1.15077005, 6.16893278, 0.00000000 };
Point ( 885 ) = { 1.15256485, 6.16859771, 0.00000000 };
Point ( 886 ) = { 1.15435874, 6.16826226, 0.00000000 };
Point ( 887 ) = { 1.15615334, 6.16792614, 0.00000000 };
Point ( 888 ) = { 1.15794703, 6.16758965, 0.00000000 };
Point ( 889 ) = { 1.15974145, 6.16725248, 0.00000000 };
Point ( 890 ) = { 1.16153494, 6.16691495, 0.00000000 };
Point ( 891 ) = { 1.16188824, 6.16386091, 0.00000000 };
Point ( 892 ) = { 1.16224142, 6.16081085, 0.00000000 };
Point ( 893 ) = { 1.16403304, 6.16047259, 0.00000000 };
Point ( 894 ) = { 1.16582538, 6.16013366, 0.00000000 };
Point ( 895 ) = { 1.16761681, 6.15979435, 0.00000000 };
Point ( 896 ) = { 1.16940895, 6.15945438, 0.00000000 };
Point ( 897 ) = { 1.17120100, 6.15911387, 0.00000000 };
Point ( 898 ) = { 1.17299212, 6.15877301, 0.00000000 };
Point ( 899 ) = { 1.17478397, 6.15843147, 0.00000000 };
Point ( 900 ) = { 1.17657490, 6.15808956, 0.00000000 };
Point ( 901 ) = { 1.17802135, 6.16079795, 0.00000000 };
Point ( 902 ) = { 1.17946938, 6.16350999, 0.00000000 };
Point ( 903 ) = { 1.18126178, 6.16316672, 0.00000000 };
Point ( 904 ) = { 1.18305491, 6.16282277, 0.00000000 };
Point ( 905 ) = { 1.18484711, 6.16247846, 0.00000000 };
Point ( 906 ) = { 1.18664004, 6.16213346, 0.00000000 };
Point ( 907 ) = { 1.18843204, 6.16178811, 0.00000000 };
Point ( 908 ) = { 1.19022477, 6.16144207, 0.00000000 };
Point ( 909 ) = { 1.19201657, 6.16109567, 0.00000000 };
Point ( 910 ) = { 1.19380909, 6.16074860, 0.00000000 };
Point ( 911 ) = { 1.19560069, 6.16040115, 0.00000000 };
Point ( 912 ) = { 1.19739301, 6.16005303, 0.00000000 };
Point ( 913 ) = { 1.19918523, 6.15970439, 0.00000000 };
Point ( 914 ) = { 1.20097653, 6.15935539, 0.00000000 };
Point ( 915 ) = { 1.20276854, 6.15900570, 0.00000000 };
Point ( 916 ) = { 1.20310099, 6.15594945, 0.00000000 };
Point ( 917 ) = { 1.20343335, 6.15289718, 0.00000000 };
Point ( 918 ) = { 1.20522349, 6.15254678, 0.00000000 };
Point ( 919 ) = { 1.20701270, 6.15219602, 0.00000000 };
Point ( 920 ) = { 1.20880263, 6.15184458, 0.00000000 };
Point ( 921 ) = { 1.21059164, 6.15149278, 0.00000000 };
Point ( 922 ) = { 1.21238137, 6.15114029, 0.00000000 };
Point ( 923 ) = { 1.21417018, 6.15078745, 0.00000000 };
Point ( 924 ) = { 1.21595970, 6.15043393, 0.00000000 };
Point ( 925 ) = { 1.21774830, 6.15008005, 0.00000000 };
Point ( 926 ) = { 1.21953762, 6.14972548, 0.00000000 };
Point ( 927 ) = { 1.22100254, 6.15242379, 0.00000000 };
Point ( 928 ) = { 1.22246905, 6.15512574, 0.00000000 };
Point ( 929 ) = { 1.22425983, 6.15476980, 0.00000000 };
Point ( 930 ) = { 1.22605051, 6.15441334, 0.00000000 };
Point ( 931 ) = { 1.22784027, 6.15405652, 0.00000000 };
Point ( 932 ) = { 1.22963074, 6.15369902, 0.00000000 };
Point ( 933 ) = { 1.23142029, 6.15334116, 0.00000000 };
Point ( 934 ) = { 1.23321056, 6.15298262, 0.00000000 };
Point ( 935 ) = { 1.23499990, 6.15262372, 0.00000000 };
Point ( 936 ) = { 1.23678995, 6.15226414, 0.00000000 };
Point ( 937 ) = { 1.23857908, 6.15190420, 0.00000000 };
Point ( 938 ) = { 1.24036893, 6.15154357, 0.00000000 };
Point ( 939 ) = { 1.24215785, 6.15118259, 0.00000000 };
Point ( 940 ) = { 1.24394749, 6.15082092, 0.00000000 };
Point ( 941 ) = { 1.24573620, 6.15045890, 0.00000000 };
Point ( 942 ) = { 1.24752563, 6.15009620, 0.00000000 };
Point ( 943 ) = { 1.24900447, 6.15279448, 0.00000000 };
Point ( 944 ) = { 1.25048440, 6.15549377, 0.00000000 };
Point ( 945 ) = { 1.25227529, 6.15512969, 0.00000000 };
Point ( 946 ) = { 1.25406607, 6.15476507, 0.00000000 };
Point ( 947 ) = { 1.25585593, 6.15440011, 0.00000000 };
Point ( 948 ) = { 1.25764650, 6.15403446, 0.00000000 };
Point ( 949 ) = { 1.25943615, 6.15366845, 0.00000000 };
Point ( 950 ) = { 1.26122651, 6.15330176, 0.00000000 };
Point ( 951 ) = { 1.26301594, 6.15293471, 0.00000000 };
Point ( 952 ) = { 1.26480608, 6.15256698, 0.00000000 };
Point ( 953 ) = { 1.26659530, 6.15219889, 0.00000000 };
Point ( 954 ) = { 1.26838523, 6.15183011, 0.00000000 };
Point ( 955 ) = { 1.27017424, 6.15146098, 0.00000000 };
Point ( 956 ) = { 1.27196395, 6.15109117, 0.00000000 };
Point ( 957 ) = { 1.27345465, 6.15378761, 0.00000000 };
Point ( 958 ) = { 1.27494697, 6.15648770, 0.00000000 };
Point ( 959 ) = { 1.27673815, 6.15611649, 0.00000000 };
Point ( 960 ) = { 1.27852840, 6.15574493, 0.00000000 };
Point ( 961 ) = { 1.28031936, 6.15537268, 0.00000000 };
Point ( 962 ) = { 1.28211021, 6.15499992, 0.00000000 };
Point ( 963 ) = { 1.28390014, 6.15462680, 0.00000000 };
Point ( 964 ) = { 1.28569078, 6.15425298, 0.00000000 };
Point ( 965 ) = { 1.28748048, 6.15387882, 0.00000000 };
Point ( 966 ) = { 1.28927090, 6.15350397, 0.00000000 };
Point ( 967 ) = { 1.29077087, 6.15620291, 0.00000000 };
Point ( 968 ) = { 1.29227193, 6.15890287, 0.00000000 };
Point ( 969 ) = { 1.29406381, 6.15852662, 0.00000000 };
Point ( 970 ) = { 1.29585476, 6.15815003, 0.00000000 };
Point ( 971 ) = { 1.29764642, 6.15777274, 0.00000000 };
Point ( 972 ) = { 1.29915120, 6.16047372, 0.00000000 };
Point ( 973 ) = { 1.30065763, 6.16317837, 0.00000000 };
Point ( 974 ) = { 1.30245075, 6.16279968, 0.00000000 };
Point ( 975 ) = { 1.30424295, 6.16242064, 0.00000000 };
Point ( 976 ) = { 1.30603585, 6.16204091, 0.00000000 };
Point ( 977 ) = { 1.30782782, 6.16166083, 0.00000000 };
Point ( 978 ) = { 1.30962051, 6.16128006, 0.00000000 };
Point ( 979 ) = { 1.31113266, 6.16398477, 0.00000000 };
Point ( 980 ) = { 1.31264619, 6.16669182, 0.00000000 };
Point ( 981 ) = { 1.31443952, 6.16630982, 0.00000000 };
Point ( 982 ) = { 1.31623355, 6.16592713, 0.00000000 };
Point ( 983 ) = { 1.31802665, 6.16554408, 0.00000000 };
Point ( 984 ) = { 1.31954393, 6.16825216, 0.00000000 };
Point ( 985 ) = { 1.32106231, 6.17096126, 0.00000000 };
Point ( 986 ) = { 1.32285687, 6.17057682, 0.00000000 };
Point ( 987 ) = { 1.32465215, 6.17019167, 0.00000000 };
Point ( 988 ) = { 1.32644649, 6.16980618, 0.00000000 };
Point ( 989 ) = { 1.32824154, 6.16941999, 0.00000000 };
Point ( 990 ) = { 1.33003566, 6.16903345, 0.00000000 };
Point ( 991 ) = { 1.33155937, 6.17174269, 0.00000000 };
Point ( 992 ) = { 1.33308447, 6.17445429, 0.00000000 };
Point ( 993 ) = { 1.33488005, 6.17406634, 0.00000000 };
Point ( 994 ) = { 1.33667634, 6.17367770, 0.00000000 };
Point ( 995 ) = { 1.33847169, 6.17328871, 0.00000000 };
Point ( 996 ) = { 1.34000055, 6.17600132, 0.00000000 };
Point ( 997 ) = { 1.34153110, 6.17871763, 0.00000000 };
Point ( 998 ) = { 1.34332875, 6.17832705, 0.00000000 };
Point ( 999 ) = { 1.34512545, 6.17793613, 0.00000000 };
Point ( 1000 ) = { 1.34692287, 6.17754450, 0.00000000 };
Point ( 1001 ) = { 1.34845678, 6.18026193, 0.00000000 };
Point ( 1002 ) = { 1.34999209, 6.18298172, 0.00000000 };
Point ( 1003 ) = { 1.35152923, 6.18570379, 0.00000000 };
Point ( 1004 ) = { 1.35280576, 6.19154625, 0.00000000 };
Point ( 1005 ) = { 1.35254404, 6.19466968, 0.00000000 };
Point ( 1006 ) = { 1.35228245, 6.19779578, 0.00000000 };
Point ( 1007 ) = { 1.35202027, 6.20092329, 0.00000000 };
Point ( 1008 ) = { 1.35175739, 6.20405366, 0.00000000 };
Point ( 1009 ) = { 1.35149451, 6.20718813, 0.00000000 };
Point ( 1010 ) = { 1.34968929, 6.20758091, 0.00000000 };
Point ( 1011 ) = { 1.34942521, 6.21071808, 0.00000000 };
Point ( 1012 ) = { 1.34916054, 6.21385668, 0.00000000 };
Point ( 1013 ) = { 1.34735256, 6.21424895, 0.00000000 };
Point ( 1014 ) = { 1.34554529, 6.21464052, 0.00000000 };
Point ( 1015 ) = { 1.34527850, 6.21778174, 0.00000000 };
Point ( 1016 ) = { 1.34501170, 6.22092709, 0.00000000 };
Point ( 1017 ) = { 1.34320249, 6.22131798, 0.00000000 };
Point ( 1018 ) = { 1.34139234, 6.22170852, 0.00000000 };
Point ( 1019 ) = { 1.34112383, 6.22485642, 0.00000000 };
Point ( 1020 ) = { 1.34085473, 6.22800574, 0.00000000 };
Point ( 1021 ) = { 1.33904263, 6.22839560, 0.00000000 };
Point ( 1022 ) = { 1.33723125, 6.22878475, 0.00000000 };
Point ( 1023 ) = { 1.33541893, 6.22917356, 0.00000000 };
Point ( 1024 ) = { 1.33514678, 6.23232544, 0.00000000 };
Point ( 1025 ) = { 1.33487462, 6.23548148, 0.00000000 };
Point ( 1026 ) = { 1.33306034, 6.23586959, 0.00000000 };
Point ( 1027 ) = { 1.33124679, 6.23625701, 0.00000000 };
Point ( 1028 ) = { 1.32943229, 6.23664407, 0.00000000 };
Point ( 1029 ) = { 1.32761851, 6.23703043, 0.00000000 };
Point ( 1030 ) = { 1.32734196, 6.24018903, 0.00000000 };
Point ( 1031 ) = { 1.32706481, 6.24334908, 0.00000000 };
Point ( 1032 ) = { 1.32524825, 6.24373493, 0.00000000 };
Point ( 1033 ) = { 1.32343241, 6.24412007, 0.00000000 };
Point ( 1034 ) = { 1.32161563, 6.24450486, 0.00000000 };
Point ( 1035 ) = { 1.31979956, 6.24488894, 0.00000000 };
Point ( 1036 ) = { 1.31798255, 6.24527268, 0.00000000 };
Point ( 1037 ) = { 1.31616627, 6.24565570, 0.00000000 };
Point ( 1038 ) = { 1.31434903, 6.24603838, 0.00000000 };
Point ( 1039 ) = { 1.31253252, 6.24642035, 0.00000000 };
Point ( 1040 ) = { 1.31071507, 6.24680197, 0.00000000 };
Point ( 1041 ) = { 1.30889834, 6.24718288, 0.00000000 };
Point ( 1042 ) = { 1.30708066, 6.24756344, 0.00000000 };
Point ( 1043 ) = { 1.30526371, 6.24794330, 0.00000000 };
Point ( 1044 ) = { 1.30344581, 6.24832280, 0.00000000 };
Point ( 1045 ) = { 1.30162864, 6.24870160, 0.00000000 };
Point ( 1046 ) = { 1.29981052, 6.24908005, 0.00000000 };
Point ( 1047 ) = { 1.29799229, 6.24945796, 0.00000000 };
Point ( 1048 ) = { 1.29617479, 6.24983518, 0.00000000 };
Point ( 1049 ) = { 1.29435634, 6.25021203, 0.00000000 };
Point ( 1050 ) = { 1.29253862, 6.25058819, 0.00000000 };
Point ( 1051 ) = { 1.29071995, 6.25096399, 0.00000000 };
Point ( 1052 ) = { 1.28890201, 6.25133909, 0.00000000 };
Point ( 1053 ) = { 1.28708313, 6.25171383, 0.00000000 };
Point ( 1054 ) = { 1.28526496, 6.25208787, 0.00000000 };
Point ( 1055 ) = { 1.28344586, 6.25246156, 0.00000000 };
Point ( 1056 ) = { 1.28162749, 6.25283454, 0.00000000 };
Point ( 1057 ) = { 1.27980817, 6.25320717, 0.00000000 };
Point ( 1058 ) = { 1.27798957, 6.25357909, 0.00000000 };
Point ( 1059 ) = { 1.27617004, 6.25395066, 0.00000000 };
Point ( 1060 ) = { 1.27435123, 6.25432153, 0.00000000 };
Point ( 1061 ) = { 1.27253148, 6.25469203, 0.00000000 };
Point ( 1062 ) = { 1.27222643, 6.25785235, 0.00000000 };
Point ( 1063 ) = { 1.27192134, 6.26101684, 0.00000000 };
Point ( 1064 ) = { 1.27010047, 6.26138647, 0.00000000 };
Point ( 1065 ) = { 1.26827867, 6.26175574, 0.00000000 };
Point ( 1066 ) = { 1.26645759, 6.26212431, 0.00000000 };
Point ( 1067 ) = { 1.26463556, 6.26249253, 0.00000000 };
Point ( 1068 ) = { 1.26281427, 6.26286004, 0.00000000 };
Point ( 1069 ) = { 1.26099204, 6.26322719, 0.00000000 };
Point ( 1070 ) = { 1.25917053, 6.26359364, 0.00000000 };
Point ( 1071 ) = { 1.25734808, 6.26395973, 0.00000000 };
Point ( 1072 ) = { 1.25552636, 6.26432513, 0.00000000 };
Point ( 1073 ) = { 1.25370370, 6.26469016, 0.00000000 };
Point ( 1074 ) = { 1.25188177, 6.26505449, 0.00000000 };
Point ( 1075 ) = { 1.25005889, 6.26541846, 0.00000000 };
Point ( 1076 ) = { 1.24823675, 6.26578174, 0.00000000 };
Point ( 1077 ) = { 1.24641367, 6.26614465, 0.00000000 };
Point ( 1078 ) = { 1.24459048, 6.26650702, 0.00000000 };
Point ( 1079 ) = { 1.24427165, 6.26967288, 0.00000000 };
Point ( 1080 ) = { 1.24395248, 6.27284155, 0.00000000 };
Point ( 1081 ) = { 1.24212734, 6.27320322, 0.00000000 };
Point ( 1082 ) = { 1.24030293, 6.27356418, 0.00000000 };
Point ( 1083 ) = { 1.23847758, 6.27392478, 0.00000000 };
Point ( 1084 ) = { 1.23665296, 6.27428469, 0.00000000 };
Point ( 1085 ) = { 1.23482741, 6.27464423, 0.00000000 };
Point ( 1086 ) = { 1.23300258, 6.27500307, 0.00000000 };
Point ( 1087 ) = { 1.23117681, 6.27536155, 0.00000000 };
Point ( 1088 ) = { 1.22935178, 6.27571933, 0.00000000 };
Point ( 1089 ) = { 1.22752580, 6.27607675, 0.00000000 };
Point ( 1090 ) = { 1.22570056, 6.27643347, 0.00000000 };
Point ( 1091 ) = { 1.22387438, 6.27678982, 0.00000000 };
Point ( 1092 ) = { 1.22204893, 6.27714548, 0.00000000 };
Point ( 1093 ) = { 1.22022254, 6.27750077, 0.00000000 };
Point ( 1094 ) = { 1.21839605, 6.27785552, 0.00000000 };
Point ( 1095 ) = { 1.21657029, 6.27820959, 0.00000000 };
Point ( 1096 ) = { 1.21623652, 6.28137974, 0.00000000 };
Point ( 1097 ) = { 1.21590213, 6.28455134, 0.00000000 };
Point ( 1098 ) = { 1.21407442, 6.28490468, 0.00000000 };
Point ( 1099 ) = { 1.21224577, 6.28525765, 0.00000000 };
Point ( 1100 ) = { 1.21041786, 6.28560993, 0.00000000 };
Point ( 1101 ) = { 1.20858901, 6.28596183, 0.00000000 };
Point ( 1102 ) = { 1.20676089, 6.28631304, 0.00000000 };
Point ( 1103 ) = { 1.20493184, 6.28666389, 0.00000000 };
Point ( 1104 ) = { 1.20310351, 6.28701403, 0.00000000 };
Point ( 1105 ) = { 1.20127426, 6.28736381, 0.00000000 };
Point ( 1106 ) = { 1.19944573, 6.28771290, 0.00000000 };
Point ( 1107 ) = { 1.19761627, 6.28806161, 0.00000000 };
Point ( 1108 ) = { 1.19578754, 6.28840963, 0.00000000 };
Point ( 1109 ) = { 1.19395788, 6.28875728, 0.00000000 };
Point ( 1110 ) = { 1.19212811, 6.28910440, 0.00000000 };
Point ( 1111 ) = { 1.19029908, 6.28945082, 0.00000000 };
Point ( 1112 ) = { 1.18846911, 6.28979687, 0.00000000 };
Point ( 1113 ) = { 1.18663988, 6.29014224, 0.00000000 };
Point ( 1114 ) = { 1.18480971, 6.29048722, 0.00000000 };
Point ( 1115 ) = { 1.18445969, 6.29365988, 0.00000000 };
Point ( 1116 ) = { 1.18410929, 6.29683535, 0.00000000 };
Point ( 1117 ) = { 1.18227717, 6.29717960, 0.00000000 };
Point ( 1118 ) = { 1.18044579, 6.29752317, 0.00000000 };
Point ( 1119 ) = { 1.17861348, 6.29786635, 0.00000000 };
Point ( 1120 ) = { 1.17678190, 6.29820884, 0.00000000 };
Point ( 1121 ) = { 1.17494938, 6.29855096, 0.00000000 };
Point ( 1122 ) = { 1.17311761, 6.29889239, 0.00000000 };
Point ( 1123 ) = { 1.17128489, 6.29923344, 0.00000000 };
Point ( 1124 ) = { 1.16945292, 6.29957381, 0.00000000 };
Point ( 1125 ) = { 1.16909433, 6.30275137, 0.00000000 };
Point ( 1126 ) = { 1.16873563, 6.30593315, 0.00000000 };
Point ( 1127 ) = { 1.16690086, 6.30627292, 0.00000000 };
Point ( 1128 ) = { 1.16506684, 6.30661201, 0.00000000 };
Point ( 1129 ) = { 1.16323188, 6.30695072, 0.00000000 };
Point ( 1130 ) = { 1.16139766, 6.30728874, 0.00000000 };
Point ( 1131 ) = { 1.15956251, 6.30762638, 0.00000000 };
Point ( 1132 ) = { 1.15919921, 6.31081040, 0.00000000 };
Point ( 1133 ) = { 1.15883552, 6.31399725, 0.00000000 };
Point ( 1134 ) = { 1.15699841, 6.31433415, 0.00000000 };
Point ( 1135 ) = { 1.15516205, 6.31467036, 0.00000000 };
Point ( 1136 ) = { 1.15332474, 6.31500619, 0.00000000 };
Point ( 1137 ) = { 1.15148818, 6.31534133, 0.00000000 };
Point ( 1138 ) = { 1.14965068, 6.31567608, 0.00000000 };
Point ( 1139 ) = { 1.14781393, 6.31601016, 0.00000000 };
Point ( 1140 ) = { 1.14597623, 6.31634384, 0.00000000 };
Point ( 1141 ) = { 1.14413928, 6.31667685, 0.00000000 };
Point ( 1142 ) = { 1.14230139, 6.31700947, 0.00000000 };
Point ( 1143 ) = { 1.14046341, 6.31734155, 0.00000000 };
Point ( 1144 ) = { 1.13862617, 6.31767295, 0.00000000 };
Point ( 1145 ) = { 1.13678799, 6.31800397, 0.00000000 };
Point ( 1146 ) = { 1.13495056, 6.31833430, 0.00000000 };
Point ( 1147 ) = { 1.13457401, 6.32152268, 0.00000000 };
Point ( 1148 ) = { 1.13419682, 6.32471252, 0.00000000 };
Point ( 1149 ) = { 1.13235743, 6.32504210, 0.00000000 };
Point ( 1150 ) = { 1.13051711, 6.32537129, 0.00000000 };
Point ( 1151 ) = { 1.12867754, 6.32569980, 0.00000000 };
Point ( 1152 ) = { 1.12683703, 6.32602792, 0.00000000 };
Point ( 1153 ) = { 1.12499726, 6.32635536, 0.00000000 };
Point ( 1154 ) = { 1.12315656, 6.32668241, 0.00000000 };
Point ( 1155 ) = { 1.12277381, 6.32987437, 0.00000000 };
Point ( 1156 ) = { 1.12239091, 6.33307057, 0.00000000 };
Point ( 1157 ) = { 1.12054826, 6.33339686, 0.00000000 };
Point ( 1158 ) = { 1.11870635, 6.33372247, 0.00000000 };
Point ( 1159 ) = { 1.11686350, 6.33404769, 0.00000000 };
Point ( 1160 ) = { 1.11502056, 6.33437237, 0.00000000 };
Point ( 1161 ) = { 1.11317837, 6.33469637, 0.00000000 };
Point ( 1162 ) = { 1.11133524, 6.33501998, 0.00000000 };
Point ( 1163 ) = { 1.11094636, 6.33821837, 0.00000000 };
Point ( 1164 ) = { 1.11055682, 6.34141823, 0.00000000 };
Point ( 1165 ) = { 1.10871173, 6.34174108, 0.00000000 };
Point ( 1166 ) = { 1.10686740, 6.34206325, 0.00000000 };
Point ( 1167 ) = { 1.10502213, 6.34238502, 0.00000000 };
Point ( 1168 ) = { 1.10317761, 6.34270611, 0.00000000 };
Point ( 1169 ) = { 1.10133215, 6.34302681, 0.00000000 };
Point ( 1170 ) = { 1.09948744, 6.34334683, 0.00000000 };
Point ( 1171 ) = { 1.09764179, 6.34366646, 0.00000000 };
Point ( 1172 ) = { 1.09579690, 6.34398540, 0.00000000 };
Point ( 1173 ) = { 1.09395107, 6.34430396, 0.00000000 };
Point ( 1174 ) = { 1.09210599, 6.34462183, 0.00000000 };
Point ( 1175 ) = { 1.09025997, 6.34493931, 0.00000000 };
Point ( 1176 ) = { 1.08841387, 6.34525625, 0.00000000 };
Point ( 1177 ) = { 1.08656851, 6.34557251, 0.00000000 };
Point ( 1178 ) = { 1.08472222, 6.34588838, 0.00000000 };
Point ( 1179 ) = { 1.08287668, 6.34620357, 0.00000000 };
Point ( 1180 ) = { 1.08247234, 6.34940464, 0.00000000 };
Point ( 1181 ) = { 1.08206781, 6.35260997, 0.00000000 };
Point ( 1182 ) = { 1.08022032, 6.35292439, 0.00000000 };
Point ( 1183 ) = { 1.07837189, 6.35323841, 0.00000000 };
Point ( 1184 ) = { 1.07652421, 6.35355175, 0.00000000 };
Point ( 1185 ) = { 1.07467560, 6.35386470, 0.00000000 };
Point ( 1186 ) = { 1.07282774, 6.35417696, 0.00000000 };
Point ( 1187 ) = { 1.07097894, 6.35448883, 0.00000000 };
Point ( 1188 ) = { 1.06913090, 6.35480002, 0.00000000 };
Point ( 1189 ) = { 1.06728193, 6.35511082, 0.00000000 };
Point ( 1190 ) = { 1.06543371, 6.35542093, 0.00000000 };
Point ( 1191 ) = { 1.06358455, 6.35573065, 0.00000000 };
Point ( 1192 ) = { 1.06173530, 6.35603983, 0.00000000 };
Point ( 1193 ) = { 1.05988681, 6.35634833, 0.00000000 };
Point ( 1194 ) = { 1.05947067, 6.35955511, 0.00000000 };
Point ( 1195 ) = { 1.05905386, 6.36276337, 0.00000000 };
Point ( 1196 ) = { 1.05720341, 6.36307109, 0.00000000 };
Point ( 1197 ) = { 1.05535203, 6.36337841, 0.00000000 };
Point ( 1198 ) = { 1.05350140, 6.36368506, 0.00000000 };
Point ( 1199 ) = { 1.05308136, 6.36689583, 0.00000000 };
Point ( 1200 ) = { 1.05266110, 6.37011088, 0.00000000 };
Point ( 1201 ) = { 1.05080852, 6.37041674, 0.00000000 };
Point ( 1202 ) = { 1.05038689, 6.37363456, 0.00000000 };
Point ( 1203 ) = { 1.04996460, 6.37685387, 0.00000000 };
Point ( 1204 ) = { 1.04954228, 6.38007601, 0.00000000 };
Point ( 1205 ) = { 1.05097609, 6.38299708, 0.00000000 };
Point ( 1206 ) = { 1.05241167, 6.38592069, 0.00000000 };
Point ( 1207 ) = { 1.05384837, 6.38884550, 0.00000000 };
Point ( 1208 ) = { 1.05570631, 6.38853876, 0.00000000 };
Point ( 1209 ) = { 1.05714521, 6.39146577, 0.00000000 };
Point ( 1210 ) = { 1.05672521, 6.39470454, 0.00000000 };
Point ( 1211 ) = { 1.05486547, 6.39501159, 0.00000000 };
Point ( 1212 ) = { 1.05300480, 6.39531823, 0.00000000 };
Point ( 1213 ) = { 1.05258289, 6.39855961, 0.00000000 };
Point ( 1214 ) = { 1.05216055, 6.40180392, 0.00000000 };
Point ( 1215 ) = { 1.05029789, 6.40210977, 0.00000000 };
Point ( 1216 ) = { 1.04843601, 6.40241495, 0.00000000 };
Point ( 1217 ) = { 1.04657318, 6.40271972, 0.00000000 };
Point ( 1218 ) = { 1.04471111, 6.40302381, 0.00000000 };
Point ( 1219 ) = { 1.04284811, 6.40332750, 0.00000000 };
Point ( 1220 ) = { 1.04098501, 6.40363064, 0.00000000 };
Point ( 1221 ) = { 1.03912268, 6.40393311, 0.00000000 };
Point ( 1222 ) = { 1.03768973, 6.40099179, 0.00000000 };
Point ( 1223 ) = { 1.03625813, 6.39805310, 0.00000000 };
Point ( 1224 ) = { 1.03439743, 6.39835419, 0.00000000 };
Point ( 1225 ) = { 1.03253578, 6.39865488, 0.00000000 };
Point ( 1226 ) = { 1.03067490, 6.39895489, 0.00000000 };
Point ( 1227 ) = { 1.02881307, 6.39925449, 0.00000000 };
Point ( 1228 ) = { 1.02837891, 6.40249425, 0.00000000 };
Point ( 1229 ) = { 1.02794430, 6.40573694, 0.00000000 };
Point ( 1230 ) = { 1.02608051, 6.40603575, 0.00000000 };
Point ( 1231 ) = { 1.02421748, 6.40633388, 0.00000000 };
Point ( 1232 ) = { 1.02235351, 6.40663161, 0.00000000 };
Point ( 1233 ) = { 1.02049031, 6.40692865, 0.00000000 };
Point ( 1234 ) = { 1.01862617, 6.40722529, 0.00000000 };
Point ( 1235 ) = { 1.01676279, 6.40752126, 0.00000000 };
Point ( 1236 ) = { 1.01489848, 6.40781681, 0.00000000 };
Point ( 1237 ) = { 1.01303408, 6.40811183, 0.00000000 };
Point ( 1238 ) = { 1.01117045, 6.40840616, 0.00000000 };
Point ( 1239 ) = { 1.00930588, 6.40870009, 0.00000000 };
Point ( 1240 ) = { 1.00744207, 6.40899334, 0.00000000 };
Point ( 1241 ) = { 1.00557733, 6.40928619, 0.00000000 };
Point ( 1242 ) = { 1.00371336, 6.40957836, 0.00000000 };
Point ( 1243 ) = { 1.00184845, 6.40987012, 0.00000000 };
Point ( 1244 ) = { 1.00140017, 6.41311393, 0.00000000 };
Point ( 1245 ) = { 1.00095120, 6.41635927, 0.00000000 };
Point ( 1246 ) = { 0.99908432, 6.41665022, 0.00000000 };
Point ( 1247 ) = { 0.99721820, 6.41694050, 0.00000000 };
Point ( 1248 ) = { 0.99535115, 6.41723037, 0.00000000 };
Point ( 1249 ) = { 0.99348487, 6.41751956, 0.00000000 };
Point ( 1250 ) = { 0.99161765, 6.41780835, 0.00000000 };
Point ( 1251 ) = { 0.99116349, 6.42105595, 0.00000000 };
Point ( 1252 ) = { 0.99070886, 6.42430650, 0.00000000 };
Point ( 1253 ) = { 0.98883967, 6.42459447, 0.00000000 };
Point ( 1254 ) = { 0.98697039, 6.42488190, 0.00000000 };
Point ( 1255 ) = { 0.98510188, 6.42516866, 0.00000000 };
Point ( 1256 ) = { 0.98464351, 6.42842181, 0.00000000 };
Point ( 1257 ) = { 0.98418489, 6.43167933, 0.00000000 };
Point ( 1258 ) = { 0.98231440, 6.43196528, 0.00000000 };
Point ( 1259 ) = { 0.98044298, 6.43225081, 0.00000000 };
Point ( 1260 ) = { 0.97998241, 6.43551096, 0.00000000 };
Point ( 1261 ) = { 0.97952136, 6.43877405, 0.00000000 };
Point ( 1262 ) = { 0.97764796, 6.43905877, 0.00000000 };
Point ( 1263 ) = { 0.97577533, 6.43934282, 0.00000000 };
Point ( 1264 ) = { 0.97531148, 6.44260867, 0.00000000 };
Point ( 1265 ) = { 0.97484692, 6.44587606, 0.00000000 };
Point ( 1266 ) = { 0.97297231, 6.44615929, 0.00000000 };
Point ( 1267 ) = { 0.97109676, 6.44644210, 0.00000000 };
Point ( 1268 ) = { 0.96922198, 6.44672424, 0.00000000 };
Point ( 1269 ) = { 0.96875409, 6.44999418, 0.00000000 };
Point ( 1270 ) = { 0.96828594, 6.45326853, 0.00000000 };
Point ( 1271 ) = { 0.96640917, 6.45354985, 0.00000000 };
Point ( 1272 ) = { 0.96453147, 6.45383076, 0.00000000 };
Point ( 1273 ) = { 0.96265368, 6.45411111, 0.00000000 };
Point ( 1274 ) = { 0.96077668, 6.45439080, 0.00000000 };
Point ( 1275 ) = { 0.96030422, 6.45766758, 0.00000000 };
BSpline ( 0 ) = { 2 : 1275, 2 };
Line Loop( 0 ) = { 0 };


// == Ice-Land mass number 10 =====================================
Point ( 1276 ) = { 4.05895397, 5.98754404, 0.00000000 };
Point ( 1277 ) = { 4.05721252, 5.98872420, 0.00000000 };
Point ( 1278 ) = { 4.05546993, 5.98990440, 0.00000000 };
Point ( 1279 ) = { 4.05372699, 5.99108408, 0.00000000 };
Point ( 1280 ) = { 4.05198451, 5.99226272, 0.00000000 };
Point ( 1281 ) = { 4.05024169, 5.99344086, 0.00000000 };
Point ( 1282 ) = { 4.04849772, 5.99461902, 0.00000000 };
Point ( 1283 ) = { 4.04675341, 5.99579668, 0.00000000 };
Point ( 1284 ) = { 4.04500956, 5.99697329, 0.00000000 };
Point ( 1285 ) = { 4.04326537, 5.99814940, 0.00000000 };
Point ( 1286 ) = { 4.04152003, 5.99932553, 0.00000000 };
Point ( 1287 ) = { 4.03977436, 6.00050116, 0.00000000 };
Point ( 1288 ) = { 4.03802914, 6.00167574, 0.00000000 };
Point ( 1289 ) = { 4.03628357, 6.00284982, 0.00000000 };
Point ( 1290 ) = { 4.03324855, 6.00022097, 0.00000000 };
Point ( 1291 ) = { 4.03021664, 5.99759474, 0.00000000 };
Point ( 1292 ) = { 4.02847147, 5.99876708, 0.00000000 };
Point ( 1293 ) = { 4.02672676, 5.99993838, 0.00000000 };
Point ( 1294 ) = { 4.02369950, 5.99731301, 0.00000000 };
Point ( 1295 ) = { 4.01939556, 5.99089800, 0.00000000 };
Point ( 1296 ) = { 4.01510064, 5.98449644, 0.00000000 };
Point ( 1297 ) = { 4.01081668, 5.97811121, 0.00000000 };
Point ( 1298 ) = { 4.00780784, 5.97550525, 0.00000000 };
Point ( 1299 ) = { 4.00480207, 5.97290187, 0.00000000 };
Point ( 1300 ) = { 4.00053786, 5.96654207, 0.00000000 };
Point ( 1301 ) = { 3.99754055, 5.96394730, 0.00000000 };
Point ( 1302 ) = { 3.99580597, 5.96510960, 0.00000000 };
Point ( 1303 ) = { 3.99281287, 5.96251627, 0.00000000 };
Point ( 1304 ) = { 3.98857011, 5.95618051, 0.00000000 };
Point ( 1305 ) = { 3.98433426, 5.94985505, 0.00000000 };
Point ( 1306 ) = { 3.98010915, 5.94354565, 0.00000000 };
Point ( 1307 ) = { 3.97886266, 5.93981592, 0.00000000 };
Point ( 1308 ) = { 3.97761738, 5.93608996, 0.00000000 };
Point ( 1309 ) = { 3.97637424, 5.93236920, 0.00000000 };
Point ( 1310 ) = { 3.97513269, 5.92865192, 0.00000000 };
Point ( 1311 ) = { 3.97389137, 5.92493694, 0.00000000 };
Point ( 1312 ) = { 3.97561506, 5.92378049, 0.00000000 };
Point ( 1313 ) = { 3.97437345, 5.92006988, 0.00000000 };
Point ( 1314 ) = { 3.97313302, 5.91636301, 0.00000000 };
Point ( 1315 ) = { 3.97485422, 5.91520677, 0.00000000 };
Point ( 1316 ) = { 3.97657508, 5.91405003, 0.00000000 };
Point ( 1317 ) = { 3.97533369, 5.91034761, 0.00000000 };
Point ( 1318 ) = { 3.97409443, 5.90665033, 0.00000000 };
Point ( 1319 ) = { 3.97581202, 5.90549435, 0.00000000 };
Point ( 1320 ) = { 3.97753006, 5.90433734, 0.00000000 };
Point ( 1321 ) = { 3.97924776, 5.90317982, 0.00000000 };
Point ( 1322 ) = { 3.98096433, 5.90202234, 0.00000000 };
Point ( 1323 ) = { 3.98268058, 5.90086436, 0.00000000 };
Point ( 1324 ) = { 3.98143752, 5.89717233, 0.00000000 };
Point ( 1325 ) = { 3.98019566, 5.89348401, 0.00000000 };
Point ( 1326 ) = { 3.98191020, 5.89232573, 0.00000000 };
Point ( 1327 ) = { 3.98362362, 5.89116747, 0.00000000 };
Point ( 1328 ) = { 3.98533671, 5.89000871, 0.00000000 };
Point ( 1329 ) = { 3.98409280, 5.88632518, 0.00000000 };
Point ( 1330 ) = { 3.98284913, 5.88264392, 0.00000000 };
Point ( 1331 ) = { 3.98160663, 5.87896634, 0.00000000 };
Point ( 1332 ) = { 3.98036532, 5.87529246, 0.00000000 };
Point ( 1333 ) = { 3.97912479, 5.87162251, 0.00000000 };
Point ( 1334 ) = { 3.97617973, 5.86911424, 0.00000000 };
Point ( 1335 ) = { 3.97323725, 5.86660869, 0.00000000 };
Point ( 1336 ) = { 3.97029677, 5.86410416, 0.00000000 };
Point ( 1337 ) = { 3.96859044, 5.86525907, 0.00000000 };
Point ( 1338 ) = { 3.96688455, 5.86641296, 0.00000000 };
Point ( 1339 ) = { 3.96394889, 5.86390891, 0.00000000 };
Point ( 1340 ) = { 3.96101713, 5.86140871, 0.00000000 };
Point ( 1341 ) = { 3.95931158, 5.86256092, 0.00000000 };
Point ( 1342 ) = { 3.95638310, 5.86006256, 0.00000000 };
Point ( 1343 ) = { 3.95345662, 5.85756523, 0.00000000 };
Point ( 1344 ) = { 3.95175297, 5.85871472, 0.00000000 };
Point ( 1345 ) = { 3.94883055, 5.85621870, 0.00000000 };
Point ( 1346 ) = { 3.94469786, 5.85008982, 0.00000000 };
Point ( 1347 ) = { 3.94348392, 5.84645534, 0.00000000 };
Point ( 1348 ) = { 3.94227112, 5.84282447, 0.00000000 };
Point ( 1349 ) = { 3.94106041, 5.83919861, 0.00000000 };
Point ( 1350 ) = { 3.94275916, 5.83805171, 0.00000000 };
Point ( 1351 ) = { 3.94154892, 5.83442954, 0.00000000 };
Point ( 1352 ) = { 3.94033887, 5.83080957, 0.00000000 };
Point ( 1353 ) = { 3.94203441, 5.82966341, 0.00000000 };
Point ( 1354 ) = { 3.94372960, 5.82851675, 0.00000000 };
Point ( 1355 ) = { 3.94542525, 5.82736907, 0.00000000 };
Point ( 1356 ) = { 3.94712055, 5.82622090, 0.00000000 };
Point ( 1357 ) = { 3.94590705, 5.82260620, 0.00000000 };
Point ( 1358 ) = { 3.94469563, 5.81899647, 0.00000000 };
Point ( 1359 ) = { 3.94638851, 5.81784851, 0.00000000 };
Point ( 1360 ) = { 3.94808104, 5.81670006, 0.00000000 };
Point ( 1361 ) = { 3.94977247, 5.81555165, 0.00000000 };
Point ( 1362 ) = { 3.95146357, 5.81440274, 0.00000000 };
Point ( 1363 ) = { 3.95024948, 5.81079773, 0.00000000 };
Point ( 1364 ) = { 3.94903558, 5.80719491, 0.00000000 };
Point ( 1365 ) = { 3.95072502, 5.80604570, 0.00000000 };
Point ( 1366 ) = { 3.95241335, 5.80489651, 0.00000000 };
Point ( 1367 ) = { 3.95410135, 5.80374684, 0.00000000 };
Point ( 1368 ) = { 3.95578978, 5.80259614, 0.00000000 };
Point ( 1369 ) = { 3.95457284, 5.79899830, 0.00000000 };
Point ( 1370 ) = { 3.95335704, 5.79540403, 0.00000000 };
Point ( 1371 ) = { 3.95504227, 5.79425408, 0.00000000 };
Point ( 1372 ) = { 3.95672718, 5.79310364, 0.00000000 };
Point ( 1373 ) = { 3.95841251, 5.79195218, 0.00000000 };
Point ( 1374 ) = { 3.96009752, 5.79080024, 0.00000000 };
Point ( 1375 ) = { 3.96178141, 5.78964833, 0.00000000 };
Point ( 1376 ) = { 3.96056153, 5.78605938, 0.00000000 };
Point ( 1377 ) = { 3.95934373, 5.78247535, 0.00000000 };
Point ( 1378 ) = { 3.96102598, 5.78132313, 0.00000000 };
Point ( 1379 ) = { 3.96270712, 5.78017095, 0.00000000 };
Point ( 1380 ) = { 3.96438792, 5.77901829, 0.00000000 };
Point ( 1381 ) = { 3.96606916, 5.77786460, 0.00000000 };
Point ( 1382 ) = { 3.96775007, 5.77671043, 0.00000000 };
Point ( 1383 ) = { 3.96942987, 5.77555629, 0.00000000 };
Point ( 1384 ) = { 3.97110933, 5.77440167, 0.00000000 };
Point ( 1385 ) = { 3.97278922, 5.77324603, 0.00000000 };
Point ( 1386 ) = { 3.97446878, 5.77208990, 0.00000000 };
Point ( 1387 ) = { 3.97614724, 5.77093381, 0.00000000 };
Point ( 1388 ) = { 3.97782536, 5.76977724, 0.00000000 };
Point ( 1389 ) = { 3.97950391, 5.76861964, 0.00000000 };
Point ( 1390 ) = { 3.98118212, 5.76746156, 0.00000000 };
Point ( 1391 ) = { 3.98285923, 5.76630352, 0.00000000 };
Point ( 1392 ) = { 3.98453677, 5.76514446, 0.00000000 };
Point ( 1393 ) = { 3.98621397, 5.76398492, 0.00000000 };
Point ( 1394 ) = { 3.98912596, 5.76640311, 0.00000000 };
Point ( 1395 ) = { 3.99204180, 5.76882501, 0.00000000 };
Point ( 1396 ) = { 3.99371931, 5.76766381, 0.00000000 };
Point ( 1397 ) = { 3.99539724, 5.76650159, 0.00000000 };
Point ( 1398 ) = { 3.99707484, 5.76533888, 0.00000000 };
Point ( 1399 ) = { 3.99875133, 5.76417622, 0.00000000 };
Point ( 1400 ) = { 4.00042748, 5.76301307, 0.00000000 };
Point ( 1401 ) = { 4.00335014, 5.76543280, 0.00000000 };
Point ( 1402 ) = { 4.00627572, 5.76785486, 0.00000000 };
Point ( 1403 ) = { 4.00795371, 5.76668899, 0.00000000 };
Point ( 1404 ) = { 4.00963059, 5.76552316, 0.00000000 };
Point ( 1405 ) = { 4.01130714, 5.76435685, 0.00000000 };
Point ( 1406 ) = { 4.01298411, 5.76318951, 0.00000000 };
Point ( 1407 ) = { 4.01591543, 5.76561051, 0.00000000 };
Point ( 1408 ) = { 4.01884872, 5.76803246, 0.00000000 };
Point ( 1409 ) = { 4.02052599, 5.76686347, 0.00000000 };
Point ( 1410 ) = { 4.02220369, 5.76569345, 0.00000000 };
Point ( 1411 ) = { 4.02514133, 5.76811605, 0.00000000 };
Point ( 1412 ) = { 4.02808286, 5.77054236, 0.00000000 };
Point ( 1413 ) = { 4.02976086, 5.76937068, 0.00000000 };
Point ( 1414 ) = { 4.03270566, 5.77179876, 0.00000000 };
Point ( 1415 ) = { 4.03565245, 5.77422781, 0.00000000 };
Point ( 1416 ) = { 4.03733229, 5.77305340, 0.00000000 };
Point ( 1417 ) = { 4.03901179, 5.77187849, 0.00000000 };
Point ( 1418 ) = { 4.04069018, 5.77070363, 0.00000000 };
Point ( 1419 ) = { 4.04236823, 5.76952828, 0.00000000 };
Point ( 1420 ) = { 4.04404671, 5.76835191, 0.00000000 };
Point ( 1421 ) = { 4.04572484, 5.76717505, 0.00000000 };
Point ( 1422 ) = { 4.04740186, 5.76599824, 0.00000000 };
Point ( 1423 ) = { 4.04907854, 5.76482094, 0.00000000 };
Point ( 1424 ) = { 4.05075565, 5.76364262, 0.00000000 };
Point ( 1425 ) = { 4.05243241, 5.76246380, 0.00000000 };
Point ( 1426 ) = { 4.05410806, 5.76128504, 0.00000000 };
Point ( 1427 ) = { 4.05578414, 5.76010526, 0.00000000 };
Point ( 1428 ) = { 4.05745987, 5.75892498, 0.00000000 };
Point ( 1429 ) = { 4.05617784, 5.75532773, 0.00000000 };
Point ( 1430 ) = { 4.05489605, 5.75173267, 0.00000000 };
Point ( 1431 ) = { 4.05656858, 5.75055319, 0.00000000 };
Point ( 1432 ) = { 4.05824154, 5.74937269, 0.00000000 };
Point ( 1433 ) = { 4.05991415, 5.74819170, 0.00000000 };
Point ( 1434 ) = { 4.06158565, 5.74701076, 0.00000000 };
Point ( 1435 ) = { 4.06030089, 5.74342077, 0.00000000 };
Point ( 1436 ) = { 4.05901831, 5.73983571, 0.00000000 };
Point ( 1437 ) = { 4.06068814, 5.73865449, 0.00000000 };
Point ( 1438 ) = { 4.06235763, 5.73747279, 0.00000000 };
Point ( 1439 ) = { 4.06402602, 5.73629114, 0.00000000 };
Point ( 1440 ) = { 4.06569406, 5.73510901, 0.00000000 };
Point ( 1441 ) = { 4.06736252, 5.73392585, 0.00000000 };
Point ( 1442 ) = { 4.06607632, 5.73034594, 0.00000000 };
Point ( 1443 ) = { 4.06479036, 5.72676821, 0.00000000 };
Point ( 1444 ) = { 4.06645563, 5.72558586, 0.00000000 };
Point ( 1445 ) = { 4.06812132, 5.72440248, 0.00000000 };
Point ( 1446 ) = { 4.06978667, 5.72321861, 0.00000000 };
Point ( 1447 ) = { 4.07145090, 5.72203481, 0.00000000 };
Point ( 1448 ) = { 4.07311480, 5.72085052, 0.00000000 };
Point ( 1449 ) = { 4.07477911, 5.71966520, 0.00000000 };
Point ( 1450 ) = { 4.07644307, 5.71847940, 0.00000000 };
Point ( 1451 ) = { 4.07810593, 5.71729366, 0.00000000 };
Point ( 1452 ) = { 4.07976845, 5.71610743, 0.00000000 };
Point ( 1453 ) = { 4.08143138, 5.71492018, 0.00000000 };
Point ( 1454 ) = { 4.08309397, 5.71373245, 0.00000000 };
Point ( 1455 ) = { 4.08475544, 5.71254477, 0.00000000 };
Point ( 1456 ) = { 4.08641658, 5.71135661, 0.00000000 };
Point ( 1457 ) = { 4.08807813, 5.71016743, 0.00000000 };
Point ( 1458 ) = { 4.08973933, 5.70897776, 0.00000000 };
Point ( 1459 ) = { 4.09139942, 5.70778815, 0.00000000 };
Point ( 1460 ) = { 4.09305993, 5.70659751, 0.00000000 };
Point ( 1461 ) = { 4.09472010, 5.70540639, 0.00000000 };
Point ( 1462 ) = { 4.09637915, 5.70421534, 0.00000000 };
Point ( 1463 ) = { 4.09507429, 5.70064858, 0.00000000 };
Point ( 1464 ) = { 4.09377066, 5.69708535, 0.00000000 };
Point ( 1465 ) = { 4.09542805, 5.69589403, 0.00000000 };
Point ( 1466 ) = { 4.09708510, 5.69470222, 0.00000000 };
Point ( 1467 ) = { 4.09578062, 5.69114328, 0.00000000 };
Point ( 1468 ) = { 4.09447834, 5.68758921, 0.00000000 };
Point ( 1469 ) = { 4.09317729, 5.68403865, 0.00000000 };
Point ( 1470 ) = { 4.08892771, 5.67813743, 0.00000000 };
Point ( 1471 ) = { 4.08597993, 5.67578416, 0.00000000 };
Point ( 1472 ) = { 4.08432914, 5.67697220, 0.00000000 };
Point ( 1473 ) = { 4.08267725, 5.67816029, 0.00000000 };
Point ( 1474 ) = { 4.07973339, 5.67580785, 0.00000000 };
Point ( 1475 ) = { 4.07679244, 5.67345766, 0.00000000 };
Point ( 1476 ) = { 4.07514233, 5.67464303, 0.00000000 };
Point ( 1477 ) = { 4.07349188, 5.67582791, 0.00000000 };
Point ( 1478 ) = { 4.07184032, 5.67701285, 0.00000000 };
Point ( 1479 ) = { 4.07018842, 5.67819731, 0.00000000 };
Point ( 1480 ) = { 4.06853693, 5.67938075, 0.00000000 };
Point ( 1481 ) = { 4.06688434, 5.68056426, 0.00000000 };
Point ( 1482 ) = { 4.06523140, 5.68174728, 0.00000000 };
Point ( 1483 ) = { 4.06357888, 5.68292928, 0.00000000 };
Point ( 1484 ) = { 4.06192602, 5.68411079, 0.00000000 };
Point ( 1485 ) = { 4.06027205, 5.68529237, 0.00000000 };
Point ( 1486 ) = { 4.05861774, 5.68647347, 0.00000000 };
Point ( 1487 ) = { 4.05696385, 5.68765355, 0.00000000 };
Point ( 1488 ) = { 4.05530961, 5.68883314, 0.00000000 };
Point ( 1489 ) = { 4.05365427, 5.69001279, 0.00000000 };
Point ( 1490 ) = { 4.05199859, 5.69119196, 0.00000000 };
Point ( 1491 ) = { 4.05034332, 5.69237011, 0.00000000 };
Point ( 1492 ) = { 4.04868771, 5.69354778, 0.00000000 };
Point ( 1493 ) = { 4.04703100, 5.69472551, 0.00000000 };
Point ( 1494 ) = { 4.04537394, 5.69590275, 0.00000000 };
Point ( 1495 ) = { 4.04371730, 5.69707898, 0.00000000 };
Point ( 1496 ) = { 4.04205957, 5.69825526, 0.00000000 };
Point ( 1497 ) = { 4.04040149, 5.69943105, 0.00000000 };
Point ( 1498 ) = { 4.03874382, 5.70060583, 0.00000000 };
Point ( 1499 ) = { 4.03582195, 5.69823803, 0.00000000 };
Point ( 1500 ) = { 4.03290394, 5.69587385, 0.00000000 };
Point ( 1501 ) = { 4.03124655, 5.69704698, 0.00000000 };
Point ( 1502 ) = { 4.02958882, 5.69821963, 0.00000000 };
Point ( 1503 ) = { 4.02667507, 5.69585602, 0.00000000 };
Point ( 1504 ) = { 4.02376326, 5.69349332, 0.00000000 };
Point ( 1505 ) = { 4.02210732, 5.69466326, 0.00000000 };
Point ( 1506 ) = { 4.02045029, 5.69583325, 0.00000000 };
Point ( 1507 ) = { 4.01754235, 5.69347139, 0.00000000 };
Point ( 1508 ) = { 4.01463824, 5.69111314, 0.00000000 };
Point ( 1509 ) = { 4.01173739, 5.68875688, 0.00000000 };
Point ( 1510 ) = { 4.00883845, 5.68640152, 0.00000000 };
Point ( 1511 ) = { 4.00594238, 5.68404841, 0.00000000 };
Point ( 1512 ) = { 4.00470228, 5.68053450, 0.00000000 };
Point ( 1513 ) = { 4.00346333, 5.67702403, 0.00000000 };
Point ( 1514 ) = { 4.00222458, 5.67351565, 0.00000000 };
Point ( 1515 ) = { 4.00387512, 5.67235096, 0.00000000 };
Point ( 1516 ) = { 4.00552533, 5.67118579, 0.00000000 };
Point ( 1517 ) = { 4.00428569, 5.66768157, 0.00000000 };
Point ( 1518 ) = { 4.00304815, 5.66418212, 0.00000000 };
Point ( 1519 ) = { 4.00469522, 5.66301772, 0.00000000 };
Point ( 1520 ) = { 4.00634271, 5.66185232, 0.00000000 };
Point ( 1521 ) = { 4.00798986, 5.66068643, 0.00000000 };
Point ( 1522 ) = { 4.00963591, 5.65952060, 0.00000000 };
Point ( 1523 ) = { 4.00839545, 5.65602600, 0.00000000 };
Point ( 1524 ) = { 4.00715519, 5.65253349, 0.00000000 };
Point ( 1525 ) = { 4.00879962, 5.65136737, 0.00000000 };
Point ( 1526 ) = { 4.01044372, 5.65020077, 0.00000000 };
Point ( 1527 ) = { 4.01208673, 5.64903422, 0.00000000 };
Point ( 1528 ) = { 4.01373015, 5.64786666, 0.00000000 };
Point ( 1529 ) = { 4.01248735, 5.64437874, 0.00000000 };
Point ( 1530 ) = { 4.01124665, 5.64089555, 0.00000000 };
Point ( 1531 ) = { 4.01288695, 5.63972877, 0.00000000 };
Point ( 1532 ) = { 4.01452691, 5.63856151, 0.00000000 };
Point ( 1533 ) = { 4.01616728, 5.63739325, 0.00000000 };
Point ( 1534 ) = { 4.01780731, 5.63622450, 0.00000000 };
Point ( 1535 ) = { 4.01656333, 5.63274642, 0.00000000 };
Point ( 1536 ) = { 4.01531956, 5.62927040, 0.00000000 };
Point ( 1537 ) = { 4.01695647, 5.62810244, 0.00000000 };
Point ( 1538 ) = { 4.01859380, 5.62693347, 0.00000000 };
Point ( 1539 ) = { 4.01734953, 5.62346130, 0.00000000 };
Point ( 1540 ) = { 4.01610641, 5.61999251, 0.00000000 };
Point ( 1541 ) = { 4.01486406, 5.61652736, 0.00000000 };
Point ( 1542 ) = { 4.01362379, 5.61306691, 0.00000000 };
Point ( 1543 ) = { 4.01525600, 5.61189944, 0.00000000 };
Point ( 1544 ) = { 4.01401624, 5.60844244, 0.00000000 };
Point ( 1545 ) = { 4.01277763, 5.60498880, 0.00000000 };
Point ( 1546 ) = { 4.01154015, 5.60153851, 0.00000000 };
Point ( 1547 ) = { 4.00743880, 5.59581156, 0.00000000 };
Point ( 1548 ) = { 4.00334565, 5.59009607, 0.00000000 };
Point ( 1549 ) = { 4.00211585, 5.58666177, 0.00000000 };
Point ( 1550 ) = { 4.00374038, 5.58549765, 0.00000000 };
Point ( 1551 ) = { 4.00251070, 5.58206703, 0.00000000 };
Point ( 1552 ) = { 4.00128121, 5.57863842, 0.00000000 };
Point ( 1553 ) = { 4.00290415, 5.57747401, 0.00000000 };
Point ( 1554 ) = { 4.00452601, 5.57630966, 0.00000000 };
Point ( 1555 ) = { 4.00614752, 5.57514484, 0.00000000 };
Point ( 1556 ) = { 4.00776944, 5.57397902, 0.00000000 };
Point ( 1557 ) = { 4.00939102, 5.57281272, 0.00000000 };
Point ( 1558 ) = { 4.00815731, 5.56938949, 0.00000000 };
Point ( 1559 ) = { 4.00692566, 5.56597086, 0.00000000 };
Point ( 1560 ) = { 4.00854417, 5.56480535, 0.00000000 };
Point ( 1561 ) = { 4.01016309, 5.56363882, 0.00000000 };
Point ( 1562 ) = { 4.01178166, 5.56247183, 0.00000000 };
Point ( 1563 ) = { 4.01339915, 5.56130490, 0.00000000 };
Point ( 1564 ) = { 4.01501631, 5.56013750, 0.00000000 };
Point ( 1565 ) = { 4.01663386, 5.55896909, 0.00000000 };
Point ( 1566 ) = { 4.01825107, 5.55780022, 0.00000000 };
Point ( 1567 ) = { 4.01986721, 5.55663141, 0.00000000 };
Point ( 1568 ) = { 4.02148374, 5.55546159, 0.00000000 };
Point ( 1569 ) = { 4.02309993, 5.55429130, 0.00000000 };
Point ( 1570 ) = { 4.02471505, 5.55312108, 0.00000000 };
Point ( 1571 ) = { 4.02347360, 5.54970971, 0.00000000 };
Point ( 1572 ) = { 4.02223236, 5.54630035, 0.00000000 };
Point ( 1573 ) = { 4.02384588, 5.54512984, 0.00000000 };
Point ( 1574 ) = { 4.02260515, 5.54172387, 0.00000000 };
Point ( 1575 ) = { 4.02136648, 5.53832246, 0.00000000 };
Point ( 1576 ) = { 4.02012858, 5.53492460, 0.00000000 };
Point ( 1577 ) = { 4.01889087, 5.53152873, 0.00000000 };
Point ( 1578 ) = { 4.02049936, 5.53035974, 0.00000000 };
Point ( 1579 ) = { 4.01926216, 5.52696723, 0.00000000 };
Point ( 1580 ) = { 4.01802702, 5.52357927, 0.00000000 };
Point ( 1581 ) = { 4.01679301, 5.52019457, 0.00000000 };
Point ( 1582 ) = { 4.01555918, 5.51681185, 0.00000000 };
Point ( 1583 ) = { 4.01716340, 5.51564382, 0.00000000 };
Point ( 1584 ) = { 4.01876727, 5.51447533, 0.00000000 };
Point ( 1585 ) = { 4.01753260, 5.51109658, 0.00000000 };
Point ( 1586 ) = { 4.01629999, 5.50772234, 0.00000000 };
Point ( 1587 ) = { 4.01790229, 5.50655357, 0.00000000 };
Point ( 1588 ) = { 4.01950352, 5.50538486, 0.00000000 };
Point ( 1589 ) = { 4.02110515, 5.50421515, 0.00000000 };
Point ( 1590 ) = { 4.01987071, 5.50084523, 0.00000000 };
Point ( 1591 ) = { 4.01863646, 5.49747728, 0.00000000 };
Point ( 1592 ) = { 4.02023505, 5.49630836, 0.00000000 };
Point ( 1593 ) = { 4.02183330, 5.49513897, 0.00000000 };
Point ( 1594 ) = { 4.02343194, 5.49396858, 0.00000000 };
Point ( 1595 ) = { 4.02503025, 5.49279773, 0.00000000 };
Point ( 1596 ) = { 4.02379284, 5.48943471, 0.00000000 };
Point ( 1597 ) = { 4.02255655, 5.48607491, 0.00000000 };
Point ( 1598 ) = { 4.02415183, 5.48490485, 0.00000000 };
Point ( 1599 ) = { 4.02574749, 5.48373379, 0.00000000 };
Point ( 1600 ) = { 4.02734282, 5.48256227, 0.00000000 };
Point ( 1601 ) = { 4.02893707, 5.48139082, 0.00000000 };
Point ( 1602 ) = { 4.02769800, 5.47803568, 0.00000000 };
Point ( 1603 ) = { 4.02646099, 5.47468502, 0.00000000 };
Point ( 1604 ) = { 4.02805368, 5.47351329, 0.00000000 };
Point ( 1605 ) = { 4.02964603, 5.47234109, 0.00000000 };
Point ( 1606 ) = { 4.03123731, 5.47116897, 0.00000000 };
Point ( 1607 ) = { 4.03282898, 5.46999585, 0.00000000 };
Point ( 1608 ) = { 4.03442030, 5.46882227, 0.00000000 };
Point ( 1609 ) = { 4.03601056, 5.46764876, 0.00000000 };
Point ( 1610 ) = { 4.03760048, 5.46647478, 0.00000000 };
Point ( 1611 ) = { 4.03919078, 5.46529981, 0.00000000 };
Point ( 1612 ) = { 4.04078074, 5.46412438, 0.00000000 };
Point ( 1613 ) = { 4.04236963, 5.46294902, 0.00000000 };
Point ( 1614 ) = { 4.04395818, 5.46177320, 0.00000000 };
Point ( 1615 ) = { 4.04679545, 5.46394296, 0.00000000 };
Point ( 1616 ) = { 4.04963640, 5.46611601, 0.00000000 };
Point ( 1617 ) = { 4.05122660, 5.46493754, 0.00000000 };
Point ( 1618 ) = { 4.05281572, 5.46375914, 0.00000000 };
Point ( 1619 ) = { 4.05440451, 5.46258028, 0.00000000 };
Point ( 1620 ) = { 4.05599367, 5.46140042, 0.00000000 };
Point ( 1621 ) = { 4.05758250, 5.46022009, 0.00000000 };
Point ( 1622 ) = { 4.06042899, 5.46239130, 0.00000000 };
Point ( 1623 ) = { 4.06327823, 5.46456453, 0.00000000 };
Point ( 1624 ) = { 4.06486797, 5.46338208, 0.00000000 };
Point ( 1625 ) = { 4.06645737, 5.46219918, 0.00000000 };
Point ( 1626 ) = { 4.06804570, 5.46101635, 0.00000000 };
Point ( 1627 ) = { 4.06963369, 5.45983306, 0.00000000 };
Point ( 1628 ) = { 4.07122206, 5.45864877, 0.00000000 };
Point ( 1629 ) = { 4.07281008, 5.45746401, 0.00000000 };
Point ( 1630 ) = { 4.07439703, 5.45627934, 0.00000000 };
Point ( 1631 ) = { 4.07312935, 5.45292761, 0.00000000 };
Point ( 1632 ) = { 4.07186282, 5.44957910, 0.00000000 };
Point ( 1633 ) = { 4.07344820, 5.44839416, 0.00000000 };
Point ( 1634 ) = { 4.07503324, 5.44720876, 0.00000000 };
Point ( 1635 ) = { 4.07661721, 5.44602344, 0.00000000 };
Point ( 1636 ) = { 4.07820084, 5.44483766, 0.00000000 };
Point ( 1637 ) = { 4.07978484, 5.44365087, 0.00000000 };
Point ( 1638 ) = { 4.08136850, 5.44246363, 0.00000000 };
Point ( 1639 ) = { 4.08295109, 5.44127647, 0.00000000 };
Point ( 1640 ) = { 4.08453406, 5.44008830, 0.00000000 };
Point ( 1641 ) = { 4.08611668, 5.43889967, 0.00000000 };
Point ( 1642 ) = { 4.08769824, 5.43771113, 0.00000000 };
Point ( 1643 ) = { 4.08927944, 5.43652213, 0.00000000 };
Point ( 1644 ) = { 4.09086103, 5.43533212, 0.00000000 };
Point ( 1645 ) = { 4.09244227, 5.43414165, 0.00000000 };
Point ( 1646 ) = { 4.09402243, 5.43295127, 0.00000000 };
Point ( 1647 ) = { 4.09560226, 5.43176043, 0.00000000 };
Point ( 1648 ) = { 4.09718246, 5.43056858, 0.00000000 };
Point ( 1649 ) = { 4.09876231, 5.42937628, 0.00000000 };
Point ( 1650 ) = { 4.10034109, 5.42818406, 0.00000000 };
Point ( 1651 ) = { 4.10191953, 5.42699138, 0.00000000 };
Point ( 1652 ) = { 4.10349834, 5.42579769, 0.00000000 };
Point ( 1653 ) = { 4.10507680, 5.42460355, 0.00000000 };
Point ( 1654 ) = { 4.10794213, 5.42674983, 0.00000000 };
Point ( 1655 ) = { 4.11081023, 5.42889811, 0.00000000 };
Point ( 1656 ) = { 4.11238959, 5.42770184, 0.00000000 };
Point ( 1657 ) = { 4.11396861, 5.42650511, 0.00000000 };
Point ( 1658 ) = { 4.11554656, 5.42530847, 0.00000000 };
Point ( 1659 ) = { 4.11712416, 5.42411136, 0.00000000 };
Point ( 1660 ) = { 4.11999789, 5.42625803, 0.00000000 };
Point ( 1661 ) = { 4.12287344, 5.42840544, 0.00000000 };
Point ( 1662 ) = { 4.12445266, 5.42720566, 0.00000000 };
Point ( 1663 ) = { 4.12603081, 5.42600597, 0.00000000 };
Point ( 1664 ) = { 4.12891004, 5.42815398, 0.00000000 };
Point ( 1665 ) = { 4.13179301, 5.43030525, 0.00000000 };
Point ( 1666 ) = { 4.13337278, 5.42910287, 0.00000000 };
Point ( 1667 ) = { 4.13495220, 5.42790004, 0.00000000 };
Point ( 1668 ) = { 4.13783922, 5.43005164, 0.00000000 };
Point ( 1669 ) = { 4.14072807, 5.43220399, 0.00000000 };
Point ( 1670 ) = { 4.14230767, 5.43099957, 0.00000000 };
Point ( 1671 ) = { 4.14520031, 5.43315281, 0.00000000 };
Point ( 1672 ) = { 4.14809672, 5.43530933, 0.00000000 };
Point ( 1673 ) = { 4.14967795, 5.43410221, 0.00000000 };
Point ( 1674 ) = { 4.15125810, 5.43289519, 0.00000000 };
Point ( 1675 ) = { 4.15415858, 5.43505204, 0.00000000 };
Point ( 1676 ) = { 4.15706090, 5.43720965, 0.00000000 };
Point ( 1677 ) = { 4.15864268, 5.43599992, 0.00000000 };
Point ( 1678 ) = { 4.16022339, 5.43479028, 0.00000000 };
Point ( 1679 ) = { 4.16312942, 5.43694850, 0.00000000 };
Point ( 1680 ) = { 4.16603926, 5.43911000, 0.00000000 };
Point ( 1681 ) = { 4.16762159, 5.43789766, 0.00000000 };
Point ( 1682 ) = { 4.17053524, 5.44006007, 0.00000000 };
Point ( 1683 ) = { 4.17345076, 5.44222323, 0.00000000 };
Point ( 1684 ) = { 4.17503327, 5.44100929, 0.00000000 };
Point ( 1685 ) = { 4.17661543, 5.43979489, 0.00000000 };
Point ( 1686 ) = { 4.17953505, 5.44195839, 0.00000000 };
Point ( 1687 ) = { 4.18379998, 5.44751154, 0.00000000 };
Point ( 1688 ) = { 4.18514173, 5.45089989, 0.00000000 };
Point ( 1689 ) = { 4.18648509, 5.45429126, 0.00000000 };
Point ( 1690 ) = { 4.18783067, 5.45768718, 0.00000000 };
Point ( 1691 ) = { 4.18624330, 5.45890485, 0.00000000 };
Point ( 1692 ) = { 4.18758877, 5.46230474, 0.00000000 };
Point ( 1693 ) = { 4.18893548, 5.46570794, 0.00000000 };
Point ( 1694 ) = { 4.18734505, 5.46692648, 0.00000000 };
Point ( 1695 ) = { 4.18869237, 5.47033311, 0.00000000 };
Point ( 1696 ) = { 4.19003996, 5.47374176, 0.00000000 };
Point ( 1697 ) = { 4.18844793, 5.47496006, 0.00000000 };
Point ( 1698 ) = { 4.18979541, 5.47837270, 0.00000000 };
Point ( 1699 ) = { 4.19114413, 5.48178866, 0.00000000 };
Point ( 1700 ) = { 4.19249410, 5.48520794, 0.00000000 };
Point ( 1701 ) = { 4.19384631, 5.48863185, 0.00000000 };
Point ( 1702 ) = { 4.19520014, 5.49205881, 0.00000000 };
Point ( 1703 ) = { 4.19655522, 5.49548912, 0.00000000 };
Point ( 1704 ) = { 4.19495613, 5.49670988, 0.00000000 };
Point ( 1705 ) = { 4.19631111, 5.50014421, 0.00000000 };
Point ( 1706 ) = { 4.19766635, 5.50358060, 0.00000000 };
Point ( 1707 ) = { 4.19606564, 5.50480112, 0.00000000 };
Point ( 1708 ) = { 4.19742151, 5.50824098, 0.00000000 };
Point ( 1709 ) = { 4.19877964, 5.51168551, 0.00000000 };
Point ( 1710 ) = { 4.19717583, 5.51290691, 0.00000000 };
Point ( 1711 ) = { 4.19853385, 5.51635548, 0.00000000 };
Point ( 1712 ) = { 4.19989214, 5.51980612, 0.00000000 };
Point ( 1713 ) = { 4.19828670, 5.52102729, 0.00000000 };
Point ( 1714 ) = { 4.19964562, 5.52448142, 0.00000000 };
Point ( 1715 ) = { 4.20100680, 5.52794024, 0.00000000 };
Point ( 1716 ) = { 4.20236888, 5.53140274, 0.00000000 };
Point ( 1717 ) = { 4.20670606, 5.53711159, 0.00000000 };
Point ( 1718 ) = { 4.21105402, 5.54283463, 0.00000000 };
Point ( 1719 ) = { 4.21540880, 5.54856664, 0.00000000 };
Point ( 1720 ) = { 4.21839805, 5.55082470, 0.00000000 };
Point ( 1721 ) = { 4.22138989, 5.55308521, 0.00000000 };
Point ( 1722 ) = { 4.22438369, 5.55534657, 0.00000000 };
Point ( 1723 ) = { 4.22738046, 5.55761009, 0.00000000 };
Point ( 1724 ) = { 4.22876412, 5.56110713, 0.00000000 };
Point ( 1725 ) = { 4.23014909, 5.56460762, 0.00000000 };
Point ( 1726 ) = { 4.23153535, 5.56811157, 0.00000000 };
Point ( 1727 ) = { 4.22991513, 5.56934250, 0.00000000 };
Point ( 1728 ) = { 4.22829455, 5.57057296, 0.00000000 };
Point ( 1729 ) = { 4.22667435, 5.57180238, 0.00000000 };
Point ( 1730 ) = { 4.22505379, 5.57303134, 0.00000000 };
Point ( 1731 ) = { 4.22343214, 5.57426038, 0.00000000 };
Point ( 1732 ) = { 4.22181013, 5.57548896, 0.00000000 };
Point ( 1733 ) = { 4.22018850, 5.57671650, 0.00000000 };
Point ( 1734 ) = { 4.21856578, 5.57794412, 0.00000000 };
Point ( 1735 ) = { 4.21694269, 5.57917128, 0.00000000 };
Point ( 1736 ) = { 4.21531999, 5.58039741, 0.00000000 };
Point ( 1737 ) = { 4.21369694, 5.58162306, 0.00000000 };
Point ( 1738 ) = { 4.21207279, 5.58284880, 0.00000000 };
Point ( 1739 ) = { 4.21044828, 5.58407406, 0.00000000 };
Point ( 1740 ) = { 4.20882415, 5.58529830, 0.00000000 };
Point ( 1741 ) = { 4.20719968, 5.58652206, 0.00000000 };
Point ( 1742 ) = { 4.20420453, 5.58423527, 0.00000000 };
Point ( 1743 ) = { 4.20121235, 5.58195067, 0.00000000 };
Point ( 1744 ) = { 4.19958810, 5.58317278, 0.00000000 };
Point ( 1745 ) = { 4.19796424, 5.58439385, 0.00000000 };
Point ( 1746 ) = { 4.19634003, 5.58561446, 0.00000000 };
Point ( 1747 ) = { 4.19471471, 5.58683515, 0.00000000 };
Point ( 1748 ) = { 4.19308905, 5.58805536, 0.00000000 };
Point ( 1749 ) = { 4.19010353, 5.58576833, 0.00000000 };
Point ( 1750 ) = { 4.18712197, 5.58348481, 0.00000000 };
Point ( 1751 ) = { 4.18549728, 5.58470282, 0.00000000 };
Point ( 1752 ) = { 4.18387223, 5.58592036, 0.00000000 };
Point ( 1753 ) = { 4.18224757, 5.58713686, 0.00000000 };
Point ( 1754 ) = { 4.18062256, 5.58835289, 0.00000000 };
Point ( 1755 ) = { 4.17899645, 5.58956901, 0.00000000 };
Point ( 1756 ) = { 4.17736998, 5.59078465, 0.00000000 };
Point ( 1757 ) = { 4.17574391, 5.59199927, 0.00000000 };
Point ( 1758 ) = { 4.17411748, 5.59321341, 0.00000000 };
Point ( 1759 ) = { 4.17114382, 5.59092543, 0.00000000 };
Point ( 1760 ) = { 4.16817211, 5.58863831, 0.00000000 };
Point ( 1761 ) = { 4.16654592, 5.58985081, 0.00000000 };
Point ( 1762 ) = { 4.16492012, 5.59106228, 0.00000000 };
Point ( 1763 ) = { 4.16329397, 5.59227327, 0.00000000 };
Point ( 1764 ) = { 4.16166672, 5.59348434, 0.00000000 };
Point ( 1765 ) = { 4.16003911, 5.59469495, 0.00000000 };
Point ( 1766 ) = { 4.15841190, 5.59590452, 0.00000000 };
Point ( 1767 ) = { 4.15975064, 5.59940734, 0.00000000 };
Point ( 1768 ) = { 4.16108965, 5.60291228, 0.00000000 };
Point ( 1769 ) = { 4.15945930, 5.60412271, 0.00000000 };
Point ( 1770 ) = { 4.15782935, 5.60533211, 0.00000000 };
Point ( 1771 ) = { 4.15619905, 5.60654105, 0.00000000 };
Point ( 1772 ) = { 4.15456765, 5.60775006, 0.00000000 };
Point ( 1773 ) = { 4.15590383, 5.61126001, 0.00000000 };
Point ( 1774 ) = { 4.15724224, 5.61477475, 0.00000000 };
Point ( 1775 ) = { 4.15560919, 5.61598351, 0.00000000 };
Point ( 1776 ) = { 4.15694822, 5.61950183, 0.00000000 };
Point ( 1777 ) = { 4.15828850, 5.62302362, 0.00000000 };
Point ( 1778 ) = { 4.15962966, 5.62654917, 0.00000000 };
Point ( 1779 ) = { 4.16260899, 5.62886599, 0.00000000 };
Point ( 1780 ) = { 4.16559091, 5.63118532, 0.00000000 };
Point ( 1781 ) = { 4.16693731, 5.63471893, 0.00000000 };
Point ( 1782 ) = { 4.16828459, 5.63825632, 0.00000000 };
Point ( 1783 ) = { 4.16963414, 5.64179855, 0.00000000 };
Point ( 1784 ) = { 4.16799248, 5.64301147, 0.00000000 };
Point ( 1785 ) = { 4.16934264, 5.64655732, 0.00000000 };
Point ( 1786 ) = { 4.17369080, 5.65244605, 0.00000000 };
Point ( 1787 ) = { 4.17668951, 5.65478631, 0.00000000 };
Point ( 1788 ) = { 4.17969160, 5.65712856, 0.00000000 };
Point ( 1789 ) = { 4.18105088, 5.66069114, 0.00000000 };
Point ( 1790 ) = { 4.17940448, 5.66190682, 0.00000000 };
Point ( 1791 ) = { 4.18076439, 5.66547306, 0.00000000 };
Point ( 1792 ) = { 4.18212459, 5.66904149, 0.00000000 };
Point ( 1793 ) = { 4.18348570, 5.67261375, 0.00000000 };
Point ( 1794 ) = { 4.18484910, 5.67619092, 0.00000000 };
Point ( 1795 ) = { 4.18319744, 5.67740827, 0.00000000 };
Point ( 1796 ) = { 4.18456147, 5.68098912, 0.00000000 };
Point ( 1797 ) = { 4.18592579, 5.68457219, 0.00000000 };
Point ( 1798 ) = { 4.18427169, 5.68578984, 0.00000000 };
Point ( 1799 ) = { 4.18261723, 5.68700702, 0.00000000 };
Point ( 1800 ) = { 4.18096317, 5.68822315, 0.00000000 };
Point ( 1801 ) = { 4.17930876, 5.68943881, 0.00000000 };
Point ( 1802 ) = { 4.17765324, 5.69065454, 0.00000000 };
Point ( 1803 ) = { 4.17599737, 5.69186979, 0.00000000 };
Point ( 1804 ) = { 4.17735672, 5.69545880, 0.00000000 };
Point ( 1805 ) = { 4.17871838, 5.69905276, 0.00000000 };
Point ( 1806 ) = { 4.17706082, 5.70026777, 0.00000000 };
Point ( 1807 ) = { 4.17540214, 5.70148284, 0.00000000 };
Point ( 1808 ) = { 4.17374312, 5.70269744, 0.00000000 };
Point ( 1809 ) = { 4.17208450, 5.70391099, 0.00000000 };
Point ( 1810 ) = { 4.17042553, 5.70512406, 0.00000000 };
Point ( 1811 ) = { 4.16876544, 5.70633721, 0.00000000 };
Point ( 1812 ) = { 4.16710501, 5.70754987, 0.00000000 };
Point ( 1813 ) = { 4.16544498, 5.70876150, 0.00000000 };
Point ( 1814 ) = { 4.16378383, 5.70997319, 0.00000000 };
Point ( 1815 ) = { 4.16513698, 5.71357458, 0.00000000 };
Point ( 1816 ) = { 4.16649041, 5.71717818, 0.00000000 };
Point ( 1817 ) = { 4.16482758, 5.71838963, 0.00000000 };
Point ( 1818 ) = { 4.16316440, 5.71960059, 0.00000000 };
Point ( 1819 ) = { 4.16451701, 5.72320858, 0.00000000 };
Point ( 1820 ) = { 4.16587192, 5.72682156, 0.00000000 };
Point ( 1821 ) = { 4.16420552, 5.72803338, 0.00000000 };
Point ( 1822 ) = { 4.16556105, 5.73165009, 0.00000000 };
Point ( 1823 ) = { 4.16691687, 5.73526905, 0.00000000 };
Point ( 1824 ) = { 4.16524878, 5.73648061, 0.00000000 };
Point ( 1825 ) = { 4.16660446, 5.74010386, 0.00000000 };
Point ( 1826 ) = { 4.16796243, 5.74373212, 0.00000000 };
Point ( 1827 ) = { 4.16629111, 5.74494455, 0.00000000 };
Point ( 1828 ) = { 4.16462021, 5.74615594, 0.00000000 };
Point ( 1829 ) = { 4.16294895, 5.74736684, 0.00000000 };
Point ( 1830 ) = { 4.16430505, 5.75099992, 0.00000000 };
Point ( 1831 ) = { 4.16566245, 5.75463665, 0.00000000 };
Point ( 1832 ) = { 4.16398796, 5.75584841, 0.00000000 };
Point ( 1833 ) = { 4.16231388, 5.75705912, 0.00000000 };
Point ( 1834 ) = { 4.16063869, 5.75826991, 0.00000000 };
Point ( 1835 ) = { 4.15896314, 5.75948020, 0.00000000 };
Point ( 1836 ) = { 4.16031798, 5.76312188, 0.00000000 };
Point ( 1837 ) = { 4.16167312, 5.76676583, 0.00000000 };
Point ( 1838 ) = { 4.15999587, 5.76797587, 0.00000000 };
Point ( 1839 ) = { 4.15831750, 5.76918598, 0.00000000 };
Point ( 1840 ) = { 4.15967142, 5.77283466, 0.00000000 };
Point ( 1841 ) = { 4.16102664, 5.77648700, 0.00000000 };
Point ( 1842 ) = { 4.16238354, 5.78014273, 0.00000000 };
Point ( 1843 ) = { 4.16374276, 5.78380355, 0.00000000 };
Point ( 1844 ) = { 4.16206055, 5.78501419, 0.00000000 };
Point ( 1845 ) = { 4.16037722, 5.78622490, 0.00000000 };
Point ( 1846 ) = { 4.16173522, 5.78989047, 0.00000000 };
Point ( 1847 ) = { 4.16309452, 5.79355973, 0.00000000 };
Point ( 1848 ) = { 4.16140948, 5.79477019, 0.00000000 };
Point ( 1849 ) = { 4.15972409, 5.79598015, 0.00000000 };
Point ( 1850 ) = { 4.15803757, 5.79719018, 0.00000000 };
Point ( 1851 ) = { 4.15635070, 5.79839972, 0.00000000 };
Point ( 1852 ) = { 4.15770742, 5.80207398, 0.00000000 };
Point ( 1853 ) = { 4.15906443, 5.80575055, 0.00000000 };
Point ( 1854 ) = { 4.15737507, 5.80696038, 0.00000000 };
Point ( 1855 ) = { 4.15568536, 5.80816973, 0.00000000 };
Point ( 1856 ) = { 4.15399607, 5.80937803, 0.00000000 };
Point ( 1857 ) = { 4.15230643, 5.81058584, 0.00000000 };
Point ( 1858 ) = { 4.15061566, 5.81179370, 0.00000000 };
Point ( 1859 ) = { 4.14892454, 5.81300108, 0.00000000 };
Point ( 1860 ) = { 4.14723384, 5.81420741, 0.00000000 };
Point ( 1861 ) = { 4.14554280, 5.81541326, 0.00000000 };
Point ( 1862 ) = { 4.14385063, 5.81661916, 0.00000000 };
Point ( 1863 ) = { 4.14215810, 5.81782456, 0.00000000 };
Point ( 1864 ) = { 4.14046600, 5.81902893, 0.00000000 };
Point ( 1865 ) = { 4.13877356, 5.82023280, 0.00000000 };
Point ( 1866 ) = { 4.14011863, 5.82391807, 0.00000000 };
Point ( 1867 ) = { 4.14146601, 5.82760848, 0.00000000 };
Point ( 1868 ) = { 4.13977029, 5.82881319, 0.00000000 };
Point ( 1869 ) = { 4.13807500, 5.83001686, 0.00000000 };
Point ( 1870 ) = { 4.13637858, 5.83122059, 0.00000000 };
Point ( 1871 ) = { 4.13468181, 5.83242382, 0.00000000 };
Point ( 1872 ) = { 4.13298546, 5.83362601, 0.00000000 };
Point ( 1873 ) = { 4.13432915, 5.83732183, 0.00000000 };
Point ( 1874 ) = { 4.13567313, 5.84101996, 0.00000000 };
Point ( 1875 ) = { 4.13397351, 5.84222299, 0.00000000 };
Point ( 1876 ) = { 4.13227354, 5.84342553, 0.00000000 };
Point ( 1877 ) = { 4.13361665, 5.84712818, 0.00000000 };
Point ( 1878 ) = { 4.13496207, 5.85083601, 0.00000000 };
Point ( 1879 ) = { 4.13326038, 5.85203828, 0.00000000 };
Point ( 1880 ) = { 4.13460562, 5.85575052, 0.00000000 };
Point ( 1881 ) = { 4.13595116, 5.85946510, 0.00000000 };
Point ( 1882 ) = { 4.13729800, 5.86318345, 0.00000000 };
Point ( 1883 ) = { 4.13864715, 5.86690699, 0.00000000 };
Point ( 1884 ) = { 4.13694078, 5.86811033, 0.00000000 };
Point ( 1885 ) = { 4.13829054, 5.87183778, 0.00000000 };
Point ( 1886 ) = { 4.13964059, 5.87556757, 0.00000000 };
Point ( 1887 ) = { 4.13793092, 5.87677175, 0.00000000 };
Point ( 1888 ) = { 4.13928081, 5.88050600, 0.00000000 };
Point ( 1889 ) = { 4.14063301, 5.88424548, 0.00000000 };
Point ( 1890 ) = { 4.13892160, 5.88544940, 0.00000000 };
Point ( 1891 ) = { 4.13720905, 5.88665337, 0.00000000 };
Point ( 1892 ) = { 4.13549615, 5.88785684, 0.00000000 };
Point ( 1893 ) = { 4.13684679, 5.89160103, 0.00000000 };
Point ( 1894 ) = { 4.13819773, 5.89534759, 0.00000000 };
Point ( 1895 ) = { 4.13648308, 5.89655080, 0.00000000 };
Point ( 1896 ) = { 4.13476731, 5.89775406, 0.00000000 };
Point ( 1897 ) = { 4.13305118, 5.89895682, 0.00000000 };
Point ( 1898 ) = { 4.13133548, 5.90015854, 0.00000000 };
Point ( 1899 ) = { 4.13268337, 5.90391048, 0.00000000 };
Point ( 1900 ) = { 4.13403357, 5.90766769, 0.00000000 };
Point ( 1901 ) = { 4.13231456, 5.90887024, 0.00000000 };
Point ( 1902 ) = { 4.13059520, 5.91007229, 0.00000000 };
Point ( 1903 ) = { 4.12887627, 5.91127328, 0.00000000 };
Point ( 1904 ) = { 4.12715700, 5.91247378, 0.00000000 };
Point ( 1905 ) = { 4.12850375, 5.91623667, 0.00000000 };
Point ( 1906 ) = { 4.12985180, 5.92000339, 0.00000000 };
Point ( 1907 ) = { 4.12812920, 5.92120472, 0.00000000 };
Point ( 1908 ) = { 4.12640704, 5.92240500, 0.00000000 };
Point ( 1909 ) = { 4.12468374, 5.92360533, 0.00000000 };
Point ( 1910 ) = { 4.12296009, 5.92480516, 0.00000000 };
Point ( 1911 ) = { 4.12123688, 5.92600394, 0.00000000 };
Point ( 1912 ) = { 4.11951332, 5.92720221, 0.00000000 };
Point ( 1913 ) = { 4.11778862, 5.92840053, 0.00000000 };
Point ( 1914 ) = { 4.11913031, 5.93217384, 0.00000000 };
Point ( 1915 ) = { 4.12047229, 5.93594954, 0.00000000 };
Point ( 1916 ) = { 4.11874584, 5.93714760, 0.00000000 };
Point ( 1917 ) = { 4.11701904, 5.93834515, 0.00000000 };
Point ( 1918 ) = { 4.11529111, 5.93954275, 0.00000000 };
Point ( 1919 ) = { 4.11356282, 5.94073984, 0.00000000 };
Point ( 1920 ) = { 4.11183498, 5.94193588, 0.00000000 };
Point ( 1921 ) = { 4.11010679, 5.94313142, 0.00000000 };
Point ( 1922 ) = { 4.10837746, 5.94432701, 0.00000000 };
Point ( 1923 ) = { 4.10664778, 5.94552209, 0.00000000 };
Point ( 1924 ) = { 4.10491854, 5.94671612, 0.00000000 };
Point ( 1925 ) = { 4.10185718, 5.94413061, 0.00000000 };
Point ( 1926 ) = { 4.09879795, 5.94154621, 0.00000000 };
Point ( 1927 ) = { 4.09706908, 5.94273851, 0.00000000 };
Point ( 1928 ) = { 4.09534066, 5.94392975, 0.00000000 };
Point ( 1929 ) = { 4.09361189, 5.94512050, 0.00000000 };
Point ( 1930 ) = { 4.09188198, 5.94631129, 0.00000000 };
Point ( 1931 ) = { 4.09015173, 5.94750157, 0.00000000 };
Point ( 1932 ) = { 4.08842192, 5.94869080, 0.00000000 };
Point ( 1933 ) = { 4.08669176, 5.94987953, 0.00000000 };
Point ( 1934 ) = { 4.08496047, 5.95106831, 0.00000000 };
Point ( 1935 ) = { 4.08322883, 5.95225658, 0.00000000 };
Point ( 1936 ) = { 4.08149764, 5.95344380, 0.00000000 };
Point ( 1937 ) = { 4.07976610, 5.95463052, 0.00000000 };
Point ( 1938 ) = { 4.07803343, 5.95581727, 0.00000000 };
Point ( 1939 ) = { 4.07630041, 5.95700353, 0.00000000 };
Point ( 1940 ) = { 4.07456784, 5.95818873, 0.00000000 };
Point ( 1941 ) = { 4.07283413, 5.95937398, 0.00000000 };
Point ( 1942 ) = { 4.07110008, 5.96055872, 0.00000000 };
Point ( 1943 ) = { 4.06936647, 5.96174241, 0.00000000 };
Point ( 1944 ) = { 4.06763252, 5.96292560, 0.00000000 };
Point ( 1945 ) = { 4.06589743, 5.96410883, 0.00000000 };
Point ( 1946 ) = { 4.06416200, 5.96529155, 0.00000000 };
Point ( 1947 ) = { 4.06242702, 5.96647322, 0.00000000 };
Point ( 1948 ) = { 4.06373392, 5.97025859, 0.00000000 };
Point ( 1949 ) = { 4.06504110, 5.97404635, 0.00000000 };
Point ( 1950 ) = { 4.06330278, 5.97522882, 0.00000000 };
Point ( 1951 ) = { 4.06156411, 5.97641079, 0.00000000 };
Point ( 1952 ) = { 4.05982590, 5.97759171, 0.00000000 };
Point ( 1953 ) = { 4.05808734, 5.97877212, 0.00000000 };
Point ( 1954 ) = { 4.05634764, 5.97995257, 0.00000000 };
Point ( 1955 ) = { 4.05765017, 5.98374637, 0.00000000 };
BSpline ( 1 ) = { 1276 : 1955, 1276 };
Line Loop( 1 ) = { 1 };


// == Ice-Land mass number 13 =====================================
Point ( 1956 ) = { 3.89703542, 6.19637771, 0.00000000 };
Point ( 1957 ) = { 3.89523242, 6.19751129, 0.00000000 };
Point ( 1958 ) = { 3.89342909, 6.19864435, 0.00000000 };
Point ( 1959 ) = { 3.89162625, 6.19977636, 0.00000000 };
Point ( 1960 ) = { 3.88982226, 6.20090837, 0.00000000 };
Point ( 1961 ) = { 3.88801794, 6.20203985, 0.00000000 };
Point ( 1962 ) = { 3.88621411, 6.20317029, 0.00000000 };
Point ( 1963 ) = { 3.88440996, 6.20430021, 0.00000000 };
Point ( 1964 ) = { 3.88260465, 6.20543012, 0.00000000 };
Point ( 1965 ) = { 3.88079902, 6.20655950, 0.00000000 };
Point ( 1966 ) = { 3.87899388, 6.20768784, 0.00000000 };
Point ( 1967 ) = { 3.87718841, 6.20881566, 0.00000000 };
Point ( 1968 ) = { 3.87538179, 6.20994346, 0.00000000 };
Point ( 1969 ) = { 3.87237902, 6.20714208, 0.00000000 };
Point ( 1970 ) = { 3.86937842, 6.20434200, 0.00000000 };
Point ( 1971 ) = { 3.86757392, 6.20546702, 0.00000000 };
Point ( 1972 ) = { 3.86576910, 6.20659152, 0.00000000 };
Point ( 1973 ) = { 3.86396313, 6.20771600, 0.00000000 };
Point ( 1974 ) = { 3.86096810, 6.20491614, 0.00000000 };
Point ( 1975 ) = { 3.85797714, 6.20212065, 0.00000000 };
Point ( 1976 ) = { 3.85617329, 6.20324235, 0.00000000 };
Point ( 1977 ) = { 3.85436829, 6.20436404, 0.00000000 };
Point ( 1978 ) = { 3.85256297, 6.20548521, 0.00000000 };
Point ( 1979 ) = { 3.85075814, 6.20660534, 0.00000000 };
Point ( 1980 ) = { 3.84895299, 6.20772494, 0.00000000 };
Point ( 1981 ) = { 3.84714669, 6.20884454, 0.00000000 };
Point ( 1982 ) = { 3.84416372, 6.20604666, 0.00000000 };
Point ( 1983 ) = { 3.84118290, 6.20325007, 0.00000000 };
Point ( 1984 ) = { 3.83937873, 6.20436689, 0.00000000 };
Point ( 1985 ) = { 3.83757423, 6.20548319, 0.00000000 };
Point ( 1986 ) = { 3.83576858, 6.20659947, 0.00000000 };
Point ( 1987 ) = { 3.83396261, 6.20771522, 0.00000000 };
Point ( 1988 ) = { 3.83215713, 6.20882994, 0.00000000 };
Point ( 1989 ) = { 3.83035134, 6.20994414, 0.00000000 };
Point ( 1990 ) = { 3.82854439, 6.21105832, 0.00000000 };
Point ( 1991 ) = { 3.82673712, 6.21217197, 0.00000000 };
Point ( 1992 ) = { 3.82493035, 6.21328459, 0.00000000 };
Point ( 1993 ) = { 3.82312243, 6.21439719, 0.00000000 };
Point ( 1994 ) = { 3.82131419, 6.21550927, 0.00000000 };
Point ( 1995 ) = { 3.81950645, 6.21662031, 0.00000000 };
Point ( 1996 ) = { 3.81769839, 6.21773082, 0.00000000 };
Point ( 1997 ) = { 3.81588918, 6.21884132, 0.00000000 };
Point ( 1998 ) = { 3.81292286, 6.21603545, 0.00000000 };
Point ( 1999 ) = { 3.80996057, 6.21323396, 0.00000000 };
Point ( 2000 ) = { 3.80815349, 6.21434170, 0.00000000 };
Point ( 2001 ) = { 3.80634609, 6.21544891, 0.00000000 };
Point ( 2002 ) = { 3.80453754, 6.21655611, 0.00000000 };
Point ( 2003 ) = { 3.80272867, 6.21766277, 0.00000000 };
Point ( 2004 ) = { 3.80092031, 6.21876841, 0.00000000 };
Point ( 2005 ) = { 3.79911162, 6.21987352, 0.00000000 };
Point ( 2006 ) = { 3.79730179, 6.22097861, 0.00000000 };
Point ( 2007 ) = { 3.79434828, 6.21817392, 0.00000000 };
Point ( 2008 ) = { 3.79139689, 6.21537052, 0.00000000 };
Point ( 2009 ) = { 3.78958919, 6.21647286, 0.00000000 };
Point ( 2010 ) = { 3.78778035, 6.21757518, 0.00000000 };
Point ( 2011 ) = { 3.78483366, 6.21477289, 0.00000000 };
Point ( 2012 ) = { 3.78189095, 6.21197495, 0.00000000 };
Point ( 2013 ) = { 3.78008424, 6.21307453, 0.00000000 };
Point ( 2014 ) = { 3.77827721, 6.21417358, 0.00000000 };
Point ( 2015 ) = { 3.77646904, 6.21527261, 0.00000000 };
Point ( 2016 ) = { 3.77466054, 6.21637111, 0.00000000 };
Point ( 2017 ) = { 3.77285255, 6.21746859, 0.00000000 };
Point ( 2018 ) = { 3.76991738, 6.21466894, 0.00000000 };
Point ( 2019 ) = { 3.76698432, 6.21187058, 0.00000000 };
Point ( 2020 ) = { 3.76517681, 6.21296633, 0.00000000 };
Point ( 2021 ) = { 3.76336899, 6.21406154, 0.00000000 };
Point ( 2022 ) = { 3.76156167, 6.21515573, 0.00000000 };
Point ( 2023 ) = { 3.75975404, 6.21624940, 0.00000000 };
Point ( 2024 ) = { 3.75794526, 6.21734304, 0.00000000 };
Point ( 2025 ) = { 3.75613616, 6.21843615, 0.00000000 };
Point ( 2026 ) = { 3.75432758, 6.21952823, 0.00000000 };
Point ( 2027 ) = { 3.75251784, 6.22062029, 0.00000000 };
Point ( 2028 ) = { 3.74959392, 6.21781819, 0.00000000 };
Point ( 2029 ) = { 3.74667394, 6.21502043, 0.00000000 };
Point ( 2030 ) = { 3.74486634, 6.21610976, 0.00000000 };
Point ( 2031 ) = { 3.74305844, 6.21719857, 0.00000000 };
Point ( 2032 ) = { 3.74014310, 6.21440192, 0.00000000 };
Point ( 2033 ) = { 3.73722986, 6.21160655, 0.00000000 };
Point ( 2034 ) = { 3.73542243, 6.21269364, 0.00000000 };
Point ( 2035 ) = { 3.73251343, 6.20989997, 0.00000000 };
Point ( 2036 ) = { 3.72960742, 6.20710911, 0.00000000 };
Point ( 2037 ) = { 3.72780213, 6.20819349, 0.00000000 };
Point ( 2038 ) = { 3.72489953, 6.20540483, 0.00000000 };
Point ( 2039 ) = { 3.72200083, 6.20262048, 0.00000000 };
Point ( 2040 ) = { 3.72019602, 6.20370314, 0.00000000 };
Point ( 2041 ) = { 3.71839172, 6.20478477, 0.00000000 };
Point ( 2042 ) = { 3.71549804, 6.20200128, 0.00000000 };
Point ( 2043 ) = { 3.71260734, 6.19922057, 0.00000000 };
Point ( 2044 ) = { 3.71080352, 6.20030049, 0.00000000 };
Point ( 2045 ) = { 3.70791619, 6.19752197, 0.00000000 };
Point ( 2046 ) = { 3.70503092, 6.19474470, 0.00000000 };
Point ( 2047 ) = { 3.70322923, 6.19582192, 0.00000000 };
Point ( 2048 ) = { 3.70034774, 6.19304659, 0.00000000 };
Point ( 2049 ) = { 3.69746921, 6.19027403, 0.00000000 };
Point ( 2050 ) = { 3.69566799, 6.19134955, 0.00000000 };
Point ( 2051 ) = { 3.69279364, 6.18857867, 0.00000000 };
Point ( 2052 ) = { 3.68992314, 6.18581206, 0.00000000 };
Point ( 2053 ) = { 3.68812404, 6.18688489, 0.00000000 };
Point ( 2054 ) = { 3.68525688, 6.18412045, 0.00000000 };
Point ( 2055 ) = { 3.68239176, 6.18135725, 0.00000000 };
Point ( 2056 ) = { 3.68059314, 6.18242839, 0.00000000 };
Point ( 2057 ) = { 3.67879503, 6.18349850, 0.00000000 };
Point ( 2058 ) = { 3.67593486, 6.18073614, 0.00000000 };
Point ( 2059 ) = { 3.67307852, 6.17797804, 0.00000000 };
Point ( 2060 ) = { 3.67128088, 6.17904646, 0.00000000 };
Point ( 2061 ) = { 3.66842786, 6.17629051, 0.00000000 };
Point ( 2062 ) = { 3.66557686, 6.17353579, 0.00000000 };
Point ( 2063 ) = { 3.66378134, 6.17460154, 0.00000000 };
Point ( 2064 ) = { 3.66093447, 6.17184848, 0.00000000 };
Point ( 2065 ) = { 3.65809140, 6.16909966, 0.00000000 };
Point ( 2066 ) = { 3.65629635, 6.17016372, 0.00000000 };
Point ( 2067 ) = { 3.65345657, 6.16741704, 0.00000000 };
Point ( 2068 ) = { 3.65061881, 6.16467157, 0.00000000 };
Point ( 2069 ) = { 3.64882586, 6.16573298, 0.00000000 };
Point ( 2070 ) = { 3.64599179, 6.16298941, 0.00000000 };
Point ( 2071 ) = { 3.64316150, 6.16025005, 0.00000000 };
Point ( 2072 ) = { 3.64136902, 6.16130977, 0.00000000 };
Point ( 2073 ) = { 3.63854282, 6.15857206, 0.00000000 };
Point ( 2074 ) = { 3.63571862, 6.15583556, 0.00000000 };
Point ( 2075 ) = { 3.63392824, 6.15689263, 0.00000000 };
Point ( 2076 ) = { 3.63213674, 6.15794966, 0.00000000 };
Point ( 2077 ) = { 3.62931660, 6.15521446, 0.00000000 };
Point ( 2078 ) = { 3.62650020, 6.15248346, 0.00000000 };
Point ( 2079 ) = { 3.62471080, 6.15353785, 0.00000000 };
Point ( 2080 ) = { 3.62189848, 6.15080848, 0.00000000 };
Point ( 2081 ) = { 3.61908813, 6.14808031, 0.00000000 };
Point ( 2082 ) = { 3.61729919, 6.14913302, 0.00000000 };
Point ( 2083 ) = { 3.61449209, 6.14640697, 0.00000000 };
Point ( 2084 ) = { 3.61168784, 6.14368360, 0.00000000 };
Point ( 2085 ) = { 3.60990100, 6.14473368, 0.00000000 };
Point ( 2086 ) = { 3.60811385, 6.14578324, 0.00000000 };
Point ( 2087 ) = { 3.60531403, 6.14306092, 0.00000000 };
Point ( 2088 ) = { 3.60251793, 6.14034277, 0.00000000 };
Point ( 2089 ) = { 3.60073124, 6.14139066, 0.00000000 };
Point ( 2090 ) = { 3.59894506, 6.14243756, 0.00000000 };
Point ( 2091 ) = { 3.59715777, 6.14348441, 0.00000000 };
Point ( 2092 ) = { 3.59537017, 6.14453075, 0.00000000 };
Point ( 2093 ) = { 3.59358308, 6.14557608, 0.00000000 };
Point ( 2094 ) = { 3.59079417, 6.14285630, 0.00000000 };
Point ( 2095 ) = { 3.58800808, 6.14013919, 0.00000000 };
Point ( 2096 ) = { 3.58622146, 6.14118286, 0.00000000 };
Point ( 2097 ) = { 3.58443452, 6.14222602, 0.00000000 };
Point ( 2098 ) = { 3.58264811, 6.14326817, 0.00000000 };
Point ( 2099 ) = { 3.57986722, 6.14055130, 0.00000000 };
Point ( 2100 ) = { 3.57708828, 6.13783562, 0.00000000 };
Point ( 2101 ) = { 3.57431174, 6.13512284, 0.00000000 };
Point ( 2102 ) = { 3.57332209, 6.13137332, 0.00000000 };
Point ( 2103 ) = { 3.57233296, 6.12762778, 0.00000000 };
Point ( 2104 ) = { 3.57134562, 6.12388747, 0.00000000 };
Point ( 2105 ) = { 3.57035920, 6.12015089, 0.00000000 };
Point ( 2106 ) = { 3.56937284, 6.11641657, 0.00000000 };
Point ( 2107 ) = { 3.57115226, 6.11537780, 0.00000000 };
Point ( 2108 ) = { 3.57016615, 6.11164725, 0.00000000 };
Point ( 2109 ) = { 3.56918181, 6.10792189, 0.00000000 };
Point ( 2110 ) = { 3.57095795, 6.10688366, 0.00000000 };
Point ( 2111 ) = { 3.56997305, 6.10316253, 0.00000000 };
Point ( 2112 ) = { 3.56898820, 6.09944365, 0.00000000 };
Point ( 2113 ) = { 3.57076269, 6.09840500, 0.00000000 };
Point ( 2114 ) = { 3.57253687, 6.09736582, 0.00000000 };
Point ( 2115 ) = { 3.57155078, 6.09365122, 0.00000000 };
Point ( 2116 ) = { 3.57056647, 6.08994177, 0.00000000 };
Point ( 2117 ) = { 3.57233819, 6.08890266, 0.00000000 };
Point ( 2118 ) = { 3.57135412, 6.08519695, 0.00000000 };
Point ( 2119 ) = { 3.56761853, 6.07883191, 0.00000000 };
Point ( 2120 ) = { 3.56389230, 6.07248282, 0.00000000 };
Point ( 2121 ) = { 3.56017199, 6.06614382, 0.00000000 };
Point ( 2122 ) = { 3.55646098, 6.05982067, 0.00000000 };
Point ( 2123 ) = { 3.55548853, 6.05614532, 0.00000000 };
Point ( 2124 ) = { 3.55451657, 6.05247384, 0.00000000 };
Point ( 2125 ) = { 3.55354552, 6.04880600, 0.00000000 };
Point ( 2126 ) = { 3.55530446, 6.04777231, 0.00000000 };
Point ( 2127 ) = { 3.55706391, 6.04673764, 0.00000000 };
Point ( 2128 ) = { 3.55882306, 6.04570245, 0.00000000 };
Point ( 2129 ) = { 3.55784970, 6.04203908, 0.00000000 };
Point ( 2130 ) = { 3.55687809, 6.03838076, 0.00000000 };
Point ( 2131 ) = { 3.55863401, 6.03734610, 0.00000000 };
Point ( 2132 ) = { 3.56039042, 6.03631046, 0.00000000 };
Point ( 2133 ) = { 3.56214654, 6.03527431, 0.00000000 };
Point ( 2134 ) = { 3.56390155, 6.03423812, 0.00000000 };
Point ( 2135 ) = { 3.56565626, 6.03320142, 0.00000000 };
Point ( 2136 ) = { 3.56741147, 6.03216374, 0.00000000 };
Point ( 2137 ) = { 3.56916638, 6.03112554, 0.00000000 };
Point ( 2138 ) = { 3.57092018, 6.03008731, 0.00000000 };
Point ( 2139 ) = { 3.57267449, 6.02904810, 0.00000000 };
Point ( 2140 ) = { 3.57442849, 6.02800837, 0.00000000 };
Point ( 2141 ) = { 3.57618139, 6.02696861, 0.00000000 };
Point ( 2142 ) = { 3.57891836, 6.02958324, 0.00000000 };
Point ( 2143 ) = { 3.58165892, 6.03220185, 0.00000000 };
Point ( 2144 ) = { 3.58341384, 6.03115950, 0.00000000 };
Point ( 2145 ) = { 3.58516846, 6.03011665, 0.00000000 };
Point ( 2146 ) = { 3.58692196, 6.02907377, 0.00000000 };
Point ( 2147 ) = { 3.58867517, 6.02803038, 0.00000000 };
Point ( 2148 ) = { 3.59042888, 6.02698600, 0.00000000 };
Point ( 2149 ) = { 3.58943675, 6.02332753, 0.00000000 };
Point ( 2150 ) = { 3.58844640, 6.01967411, 0.00000000 };
Point ( 2151 ) = { 3.59019687, 6.01863027, 0.00000000 };
Point ( 2152 ) = { 3.59194704, 6.01758593, 0.00000000 };
Point ( 2153 ) = { 3.59369771, 6.01654059, 0.00000000 };
Point ( 2154 ) = { 3.59544807, 6.01549475, 0.00000000 };
Point ( 2155 ) = { 3.59719733, 6.01444888, 0.00000000 };
Point ( 2156 ) = { 3.59894708, 6.01340202, 0.00000000 };
Point ( 2157 ) = { 3.60069653, 6.01235465, 0.00000000 };
Point ( 2158 ) = { 3.60244487, 6.01130725, 0.00000000 };
Point ( 2159 ) = { 3.60419291, 6.01025934, 0.00000000 };
Point ( 2160 ) = { 3.60594145, 6.00921045, 0.00000000 };
Point ( 2161 ) = { 3.60768968, 6.00816104, 0.00000000 };
Point ( 2162 ) = { 3.60943680, 6.00711161, 0.00000000 };
Point ( 2163 ) = { 3.61118362, 6.00606167, 0.00000000 };
Point ( 2164 ) = { 3.61293093, 6.00501074, 0.00000000 };
Point ( 2165 ) = { 3.61467794, 6.00395930, 0.00000000 };
Point ( 2166 ) = { 3.61642384, 6.00290784, 0.00000000 };
Point ( 2167 ) = { 3.61816944, 6.00185587, 0.00000000 };
Point ( 2168 ) = { 3.61991553, 6.00080291, 0.00000000 };
Point ( 2169 ) = { 3.62166131, 5.99974944, 0.00000000 };
Point ( 2170 ) = { 3.62340599, 5.99869594, 0.00000000 };
Point ( 2171 ) = { 3.62515116, 5.99764146, 0.00000000 };
Point ( 2172 ) = { 3.62689602, 5.99658646, 0.00000000 };
Point ( 2173 ) = { 3.62863977, 5.99553145, 0.00000000 };
Point ( 2174 ) = { 3.63038323, 5.99447592, 0.00000000 };
Point ( 2175 ) = { 3.62936833, 5.99083310, 0.00000000 };
Point ( 2176 ) = { 3.62835438, 5.98719388, 0.00000000 };
Point ( 2177 ) = { 3.63009620, 5.98613795, 0.00000000 };
Point ( 2178 ) = { 3.63183692, 5.98508200, 0.00000000 };
Point ( 2179 ) = { 3.63357733, 5.98402555, 0.00000000 };
Point ( 2180 ) = { 3.63531823, 5.98296811, 0.00000000 };
Point ( 2181 ) = { 3.63705882, 5.98191016, 0.00000000 };
Point ( 2182 ) = { 3.63879831, 5.98085218, 0.00000000 };
Point ( 2183 ) = { 3.64053749, 5.97979371, 0.00000000 };
Point ( 2184 ) = { 3.64227716, 5.97873424, 0.00000000 };
Point ( 2185 ) = { 3.64401652, 5.97767426, 0.00000000 };
Point ( 2186 ) = { 3.64575478, 5.97661427, 0.00000000 };
Point ( 2187 ) = { 3.64851911, 5.97918924, 0.00000000 };
Point ( 2188 ) = { 3.65128621, 5.98176671, 0.00000000 };
Point ( 2189 ) = { 3.65302645, 5.98070411, 0.00000000 };
Point ( 2190 ) = { 3.65476559, 5.97964150, 0.00000000 };
Point ( 2191 ) = { 3.65650442, 5.97857837, 0.00000000 };
Point ( 2192 ) = { 3.65824373, 5.97751426, 0.00000000 };
Point ( 2193 ) = { 3.65998274, 5.97644964, 0.00000000 };
Point ( 2194 ) = { 3.66172064, 5.97538500, 0.00000000 };
Point ( 2195 ) = { 3.66068629, 5.97174779, 0.00000000 };
Point ( 2196 ) = { 3.65965289, 5.96811417, 0.00000000 };
Point ( 2197 ) = { 3.66138916, 5.96704914, 0.00000000 };
Point ( 2198 ) = { 3.66312512, 5.96598360, 0.00000000 };
Point ( 2199 ) = { 3.66485998, 5.96491805, 0.00000000 };
Point ( 2200 ) = { 3.66659452, 5.96385199, 0.00000000 };
Point ( 2201 ) = { 3.66832955, 5.96278494, 0.00000000 };
Point ( 2202 ) = { 3.66729223, 5.95915616, 0.00000000 };
Point ( 2203 ) = { 3.66625500, 5.95552954, 0.00000000 };
Point ( 2204 ) = { 3.66798682, 5.95446308, 0.00000000 };
Point ( 2205 ) = { 3.66971911, 5.95339563, 0.00000000 };
Point ( 2206 ) = { 3.67145110, 5.95232767, 0.00000000 };
Point ( 2207 ) = { 3.67318199, 5.95125970, 0.00000000 };
Point ( 2208 ) = { 3.67491256, 5.95019122, 0.00000000 };
Point ( 2209 ) = { 3.67387102, 5.94656968, 0.00000000 };
Point ( 2210 ) = { 3.67283044, 5.94295171, 0.00000000 };
Point ( 2211 ) = { 3.67455939, 5.94188285, 0.00000000 };
Point ( 2212 ) = { 3.67628724, 5.94081397, 0.00000000 };
Point ( 2213 ) = { 3.67801477, 5.93974459, 0.00000000 };
Point ( 2214 ) = { 3.67974279, 5.93867422, 0.00000000 };
Point ( 2215 ) = { 3.68147049, 5.93760335, 0.00000000 };
Point ( 2216 ) = { 3.68319709, 5.93653246, 0.00000000 };
Point ( 2217 ) = { 3.68492338, 5.93546108, 0.00000000 };
Point ( 2218 ) = { 3.68665015, 5.93438869, 0.00000000 };
Point ( 2219 ) = { 3.68942665, 5.93693104, 0.00000000 };
Point ( 2220 ) = { 3.69220592, 5.93947584, 0.00000000 };
Point ( 2221 ) = { 3.69393306, 5.93840184, 0.00000000 };
Point ( 2222 ) = { 3.69566069, 5.93732683, 0.00000000 };
Point ( 2223 ) = { 3.69738800, 5.93625133, 0.00000000 };
Point ( 2224 ) = { 3.69911421, 5.93517581, 0.00000000 };
Point ( 2225 ) = { 3.70084010, 5.93409980, 0.00000000 };
Point ( 2226 ) = { 3.70256647, 5.93302279, 0.00000000 };
Point ( 2227 ) = { 3.70429253, 5.93194527, 0.00000000 };
Point ( 2228 ) = { 3.70601749, 5.93086775, 0.00000000 };
Point ( 2229 ) = { 3.70495660, 5.92725196, 0.00000000 };
Point ( 2230 ) = { 3.70389670, 5.92363974, 0.00000000 };
Point ( 2231 ) = { 3.70562003, 5.92256184, 0.00000000 };
Point ( 2232 ) = { 3.70734304, 5.92148343, 0.00000000 };
Point ( 2233 ) = { 3.70906496, 5.92040502, 0.00000000 };
Point ( 2234 ) = { 3.71078656, 5.91932611, 0.00000000 };
Point ( 2235 ) = { 3.71250863, 5.91824621, 0.00000000 };
Point ( 2236 ) = { 3.71144485, 5.91463884, 0.00000000 };
Point ( 2237 ) = { 3.71038294, 5.91103641, 0.00000000 };
Point ( 2238 ) = { 3.71210182, 5.90995712, 0.00000000 };
Point ( 2239 ) = { 3.71382116, 5.90887683, 0.00000000 };
Point ( 2240 ) = { 3.71554020, 5.90779604, 0.00000000 };
Point ( 2241 ) = { 3.71725813, 5.90671525, 0.00000000 };
Point ( 2242 ) = { 3.71897574, 5.90563396, 0.00000000 };
Point ( 2243 ) = { 3.72069383, 5.90455167, 0.00000000 };
Point ( 2244 ) = { 3.72241161, 5.90346888, 0.00000000 };
Point ( 2245 ) = { 3.72134296, 5.89987242, 0.00000000 };
Point ( 2246 ) = { 3.72027441, 5.89627808, 0.00000000 };
Point ( 2247 ) = { 3.72198900, 5.89519592, 0.00000000 };
Point ( 2248 ) = { 3.72370405, 5.89411275, 0.00000000 };
Point ( 2249 ) = { 3.72541878, 5.89302909, 0.00000000 };
Point ( 2250 ) = { 3.72713242, 5.89194542, 0.00000000 };
Point ( 2251 ) = { 3.72884574, 5.89086126, 0.00000000 };
Point ( 2252 ) = { 3.73055953, 5.88977610, 0.00000000 };
Point ( 2253 ) = { 3.73227301, 5.88869045, 0.00000000 };
Point ( 2254 ) = { 3.73506229, 5.89119662, 0.00000000 };
Point ( 2255 ) = { 3.73785345, 5.89370381, 0.00000000 };
Point ( 2256 ) = { 3.73956807, 5.89261603, 0.00000000 };
Point ( 2257 ) = { 3.74128237, 5.89152775, 0.00000000 };
Point ( 2258 ) = { 3.74299557, 5.89043948, 0.00000000 };
Point ( 2259 ) = { 3.74191437, 5.88684676, 0.00000000 };
Point ( 2260 ) = { 3.74083329, 5.88325618, 0.00000000 };
Point ( 2261 ) = { 3.74254486, 5.88216754, 0.00000000 };
Point ( 2262 ) = { 3.74425612, 5.88107839, 0.00000000 };
Point ( 2263 ) = { 3.74596628, 5.87998925, 0.00000000 };
Point ( 2264 ) = { 3.74767613, 5.87889961, 0.00000000 };
Point ( 2265 ) = { 3.74938644, 5.87780897, 0.00000000 };
Point ( 2266 ) = { 3.75109643, 5.87671784, 0.00000000 };
Point ( 2267 ) = { 3.75280532, 5.87562671, 0.00000000 };
Point ( 2268 ) = { 3.75451390, 5.87453508, 0.00000000 };
Point ( 2269 ) = { 3.75622293, 5.87344245, 0.00000000 };
Point ( 2270 ) = { 3.75793166, 5.87234933, 0.00000000 };
Point ( 2271 ) = { 3.75963928, 5.87125621, 0.00000000 };
Point ( 2272 ) = { 3.76134736, 5.87016209, 0.00000000 };
Point ( 2273 ) = { 3.76305513, 5.86906748, 0.00000000 };
Point ( 2274 ) = { 3.76476179, 5.86797287, 0.00000000 };
Point ( 2275 ) = { 3.76646814, 5.86687776, 0.00000000 };
Point ( 2276 ) = { 3.76817495, 5.86578166, 0.00000000 };
Point ( 2277 ) = { 3.76988145, 5.86468506, 0.00000000 };
Point ( 2278 ) = { 3.77158684, 5.86358847, 0.00000000 };
Point ( 2279 ) = { 3.77329191, 5.86249138, 0.00000000 };
Point ( 2280 ) = { 3.77499744, 5.86139329, 0.00000000 };
Point ( 2281 ) = { 3.77670266, 5.86029470, 0.00000000 };
Point ( 2282 ) = { 3.77840677, 5.85919612, 0.00000000 };
Point ( 2283 ) = { 3.78011057, 5.85809705, 0.00000000 };
Point ( 2284 ) = { 3.78181482, 5.85699698, 0.00000000 };
Point ( 2285 ) = { 3.78351876, 5.85589641, 0.00000000 };
Point ( 2286 ) = { 3.78522159, 5.85479585, 0.00000000 };
Point ( 2287 ) = { 3.78803375, 5.85727652, 0.00000000 };
Point ( 2288 ) = { 3.79084780, 5.85975819, 0.00000000 };
Point ( 2289 ) = { 3.79255254, 5.85865499, 0.00000000 };
Point ( 2290 ) = { 3.79425617, 5.85755180, 0.00000000 };
Point ( 2291 ) = { 3.79595949, 5.85644812, 0.00000000 };
Point ( 2292 ) = { 3.79766327, 5.85534344, 0.00000000 };
Point ( 2293 ) = { 3.79936672, 5.85423826, 0.00000000 };
Point ( 2294 ) = { 3.80106907, 5.85313309, 0.00000000 };
Point ( 2295 ) = { 3.80277110, 5.85202742, 0.00000000 };
Point ( 2296 ) = { 3.80447359, 5.85092076, 0.00000000 };
Point ( 2297 ) = { 3.80617576, 5.84981360, 0.00000000 };
Point ( 2298 ) = { 3.80787682, 5.84870645, 0.00000000 };
Point ( 2299 ) = { 3.80957757, 5.84759881, 0.00000000 };
Point ( 2300 ) = { 3.81240234, 5.85007383, 0.00000000 };
Point ( 2301 ) = { 3.81523083, 5.85255262, 0.00000000 };
Point ( 2302 ) = { 3.81693347, 5.85144233, 0.00000000 };
Point ( 2303 ) = { 3.81863501, 5.85033205, 0.00000000 };
Point ( 2304 ) = { 3.82033701, 5.84922077, 0.00000000 };
Point ( 2305 ) = { 3.82203868, 5.84810900, 0.00000000 };
Point ( 2306 ) = { 3.82487248, 5.85058713, 0.00000000 };
Point ( 2307 ) = { 3.82770910, 5.85306765, 0.00000000 };
Point ( 2308 ) = { 3.82941111, 5.85195424, 0.00000000 };
Point ( 2309 ) = { 3.83111357, 5.85083982, 0.00000000 };
Point ( 2310 ) = { 3.83281571, 5.84972491, 0.00000000 };
Point ( 2311 ) = { 3.83565732, 5.85220534, 0.00000000 };
Point ( 2312 ) = { 3.83850085, 5.85468677, 0.00000000 };
Point ( 2313 ) = { 3.84020333, 5.85357022, 0.00000000 };
Point ( 2314 ) = { 3.84305080, 5.85605296, 0.00000000 };
Point ( 2315 ) = { 3.84590111, 5.85853809, 0.00000000 };
Point ( 2316 ) = { 3.84760549, 5.85741888, 0.00000000 };
Point ( 2317 ) = { 3.85045898, 5.85990584, 0.00000000 };
Point ( 2318 ) = { 3.85447055, 5.86601095, 0.00000000 };
Point ( 2319 ) = { 3.85562596, 5.86962888, 0.00000000 };
Point ( 2320 ) = { 3.85678207, 5.87325066, 0.00000000 };
Point ( 2321 ) = { 3.85793833, 5.87687463, 0.00000000 };
Point ( 2322 ) = { 3.85622829, 5.87799685, 0.00000000 };
Point ( 2323 ) = { 3.85451870, 5.87911806, 0.00000000 };
Point ( 2324 ) = { 3.85567433, 5.88274603, 0.00000000 };
Point ( 2325 ) = { 3.85683196, 5.88637902, 0.00000000 };
Point ( 2326 ) = { 3.85511915, 5.88750091, 0.00000000 };
Point ( 2327 ) = { 3.85340602, 5.88862231, 0.00000000 };
Point ( 2328 ) = { 3.85169334, 5.88974270, 0.00000000 };
Point ( 2329 ) = { 3.84998034, 5.89086259, 0.00000000 };
Point ( 2330 ) = { 3.85113443, 5.89450078, 0.00000000 };
Point ( 2331 ) = { 3.85228869, 5.89814118, 0.00000000 };
Point ( 2332 ) = { 3.85057246, 5.89926176, 0.00000000 };
Point ( 2333 ) = { 3.84885669, 5.90038132, 0.00000000 };
Point ( 2334 ) = { 3.84713981, 5.90150090, 0.00000000 };
Point ( 2335 ) = { 3.84542260, 5.90261997, 0.00000000 };
Point ( 2336 ) = { 3.84370586, 5.90373804, 0.00000000 };
Point ( 2337 ) = { 3.84485629, 5.90738347, 0.00000000 };
Point ( 2338 ) = { 3.84600872, 5.91103395, 0.00000000 };
Point ( 2339 ) = { 3.84428874, 5.91215270, 0.00000000 };
Point ( 2340 ) = { 3.84256844, 5.91327094, 0.00000000 };
Point ( 2341 ) = { 3.84084859, 5.91438818, 0.00000000 };
Point ( 2342 ) = { 3.83912842, 5.91550491, 0.00000000 };
Point ( 2343 ) = { 3.84027729, 5.91916062, 0.00000000 };
Point ( 2344 ) = { 3.84142632, 5.92281854, 0.00000000 };
Point ( 2345 ) = { 3.83970292, 5.92393596, 0.00000000 };
Point ( 2346 ) = { 3.83797997, 5.92505236, 0.00000000 };
Point ( 2347 ) = { 3.83625670, 5.92616826, 0.00000000 };
Point ( 2348 ) = { 3.83453232, 5.92728417, 0.00000000 };
Point ( 2349 ) = { 3.83280761, 5.92839958, 0.00000000 };
Point ( 2350 ) = { 3.83395279, 5.93206256, 0.00000000 };
Point ( 2351 ) = { 3.83509997, 5.93573061, 0.00000000 };
Point ( 2352 ) = { 3.83337280, 5.93684619, 0.00000000 };
Point ( 2353 ) = { 3.83164531, 5.93796126, 0.00000000 };
Point ( 2354 ) = { 3.82991829, 5.93907531, 0.00000000 };
Point ( 2355 ) = { 3.82819094, 5.94018887, 0.00000000 };
Point ( 2356 ) = { 3.82933453, 5.94386217, 0.00000000 };
Point ( 2357 ) = { 3.83047828, 5.94753771, 0.00000000 };
Point ( 2358 ) = { 3.82874768, 5.94865194, 0.00000000 };
Point ( 2359 ) = { 3.82701755, 5.94976515, 0.00000000 };
Point ( 2360 ) = { 3.82528709, 5.95087787, 0.00000000 };
Point ( 2361 ) = { 3.82355552, 5.95199058, 0.00000000 };
Point ( 2362 ) = { 3.82469606, 5.95567112, 0.00000000 };
Point ( 2363 ) = { 3.82583860, 5.95935677, 0.00000000 };
Point ( 2364 ) = { 3.82410536, 5.96046914, 0.00000000 };
Point ( 2365 ) = { 3.82237179, 5.96158100, 0.00000000 };
Point ( 2366 ) = { 3.82063710, 5.96269287, 0.00000000 };
Point ( 2367 ) = { 3.82177750, 5.96638320, 0.00000000 };
Point ( 2368 ) = { 3.82291806, 5.97007578, 0.00000000 };
Point ( 2369 ) = { 3.82406009, 5.97377180, 0.00000000 };
Point ( 2370 ) = { 3.82808850, 5.98006480, 0.00000000 };
Point ( 2371 ) = { 3.83097580, 5.98265919, 0.00000000 };
Point ( 2372 ) = { 3.83271630, 5.98154431, 0.00000000 };
Point ( 2373 ) = { 3.83560768, 5.98414015, 0.00000000 };
Point ( 2374 ) = { 3.83850105, 5.98673709, 0.00000000 };
Point ( 2375 ) = { 3.84024194, 5.98562053, 0.00000000 };
Point ( 2376 ) = { 3.84313860, 5.98821943, 0.00000000 };
Point ( 2377 ) = { 3.84603820, 5.99082088, 0.00000000 };
Point ( 2378 ) = { 3.84778107, 5.98970162, 0.00000000 };
Point ( 2379 ) = { 3.84952361, 5.98858186, 0.00000000 };
Point ( 2380 ) = { 3.85242767, 5.99118418, 0.00000000 };
Point ( 2381 ) = { 3.85533560, 5.99379050, 0.00000000 };
Point ( 2382 ) = { 3.85707854, 5.99266905, 0.00000000 };
Point ( 2383 ) = { 3.85999058, 5.99527684, 0.00000000 };
Point ( 2384 ) = { 3.86290558, 5.99788720, 0.00000000 };
Point ( 2385 ) = { 3.86465051, 5.99676303, 0.00000000 };
Point ( 2386 ) = { 3.86756883, 5.99937537, 0.00000000 };
Point ( 2387 ) = { 3.87048919, 6.00198883, 0.00000000 };
Point ( 2388 ) = { 3.87223450, 6.00086297, 0.00000000 };
Point ( 2389 ) = { 3.87515899, 6.00347789, 0.00000000 };
Point ( 2390 ) = { 3.87927037, 6.00984734, 0.00000000 };
Point ( 2391 ) = { 3.88338844, 6.01622713, 0.00000000 };
Point ( 2392 ) = { 3.88751698, 6.02262315, 0.00000000 };
Point ( 2393 ) = { 3.89165224, 6.02902959, 0.00000000 };
Point ( 2394 ) = { 3.89460156, 6.03167279, 0.00000000 };
Point ( 2395 ) = { 3.89755389, 6.03431861, 0.00000000 };
Point ( 2396 ) = { 3.90050830, 6.03696559, 0.00000000 };
Point ( 2397 ) = { 3.90226379, 6.03583100, 0.00000000 };
Point ( 2398 ) = { 3.90522199, 6.03847974, 0.00000000 };
Point ( 2399 ) = { 3.90818417, 6.04113260, 0.00000000 };
Point ( 2400 ) = { 3.90994168, 6.03999525, 0.00000000 };
Point ( 2401 ) = { 3.91290727, 6.04265014, 0.00000000 };
Point ( 2402 ) = { 3.91587495, 6.04530620, 0.00000000 };
Point ( 2403 ) = { 3.91763286, 6.04416714, 0.00000000 };
Point ( 2404 ) = { 3.92060476, 6.04682471, 0.00000000 };
Point ( 2405 ) = { 3.92358067, 6.04948641, 0.00000000 };
Point ( 2406 ) = { 3.92655964, 6.05215077, 0.00000000 };
Point ( 2407 ) = { 3.93076417, 6.05863137, 0.00000000 };
Point ( 2408 ) = { 3.93497562, 6.06512262, 0.00000000 };
Point ( 2409 ) = { 3.93620182, 6.06894606, 0.00000000 };
Point ( 2410 ) = { 3.93742922, 6.07277340, 0.00000000 };
Point ( 2411 ) = { 3.93865877, 6.07660614, 0.00000000 };
Point ( 2412 ) = { 3.93988992, 6.08044255, 0.00000000 };
Point ( 2413 ) = { 3.94112228, 6.08428288, 0.00000000 };
Point ( 2414 ) = { 3.94235583, 6.08812715, 0.00000000 };
Point ( 2415 ) = { 3.94659719, 6.09467703, 0.00000000 };
Point ( 2416 ) = { 3.94783547, 6.09853278, 0.00000000 };
Point ( 2417 ) = { 3.94907455, 6.10239275, 0.00000000 };
Point ( 2418 ) = { 3.95031387, 6.10625518, 0.00000000 };
Point ( 2419 ) = { 3.94853708, 6.10740427, 0.00000000 };
Point ( 2420 ) = { 3.94676078, 6.10855231, 0.00000000 };
Point ( 2421 ) = { 3.94498333, 6.10970037, 0.00000000 };
Point ( 2422 ) = { 3.94622048, 6.11356785, 0.00000000 };
Point ( 2423 ) = { 3.94745981, 6.11744081, 0.00000000 };
Point ( 2424 ) = { 3.94568059, 6.11858854, 0.00000000 };
Point ( 2425 ) = { 3.94390103, 6.11973576, 0.00000000 };
Point ( 2426 ) = { 3.94212032, 6.12088298, 0.00000000 };
Point ( 2427 ) = { 3.94033928, 6.12202968, 0.00000000 };
Point ( 2428 ) = { 3.93855872, 6.12317534, 0.00000000 };
Point ( 2429 ) = { 3.93677783, 6.12432048, 0.00000000 };
Point ( 2430 ) = { 3.93499579, 6.12546563, 0.00000000 };
Point ( 2431 ) = { 3.93321342, 6.12661026, 0.00000000 };
Point ( 2432 ) = { 3.93143153, 6.12775384, 0.00000000 };
Point ( 2433 ) = { 3.92964931, 6.12889691, 0.00000000 };
Point ( 2434 ) = { 3.92786594, 6.13003999, 0.00000000 };
Point ( 2435 ) = { 3.92608223, 6.13118254, 0.00000000 };
Point ( 2436 ) = { 3.92429901, 6.13232405, 0.00000000 };
Point ( 2437 ) = { 3.92251465, 6.13346557, 0.00000000 };
Point ( 2438 ) = { 3.92373939, 6.13734754, 0.00000000 };
Point ( 2439 ) = { 3.92496437, 6.14123200, 0.00000000 };
Point ( 2440 ) = { 3.92317823, 6.14237318, 0.00000000 };
Point ( 2441 ) = { 3.92139175, 6.14351385, 0.00000000 };
Point ( 2442 ) = { 3.91960413, 6.14465452, 0.00000000 };
Point ( 2443 ) = { 3.91781618, 6.14579467, 0.00000000 };
Point ( 2444 ) = { 3.91602871, 6.14693378, 0.00000000 };
Point ( 2445 ) = { 3.91424091, 6.14807237, 0.00000000 };
Point ( 2446 ) = { 3.91546029, 6.15196296, 0.00000000 };
Point ( 2447 ) = { 3.91668184, 6.15585907, 0.00000000 };
Point ( 2448 ) = { 3.91489062, 6.15699837, 0.00000000 };
Point ( 2449 ) = { 3.91309990, 6.15813663, 0.00000000 };
Point ( 2450 ) = { 3.91130884, 6.15927437, 0.00000000 };
Point ( 2451 ) = { 3.90951663, 6.16041210, 0.00000000 };
Point ( 2452 ) = { 3.90772409, 6.16154932, 0.00000000 };
Point ( 2453 ) = { 3.90894157, 6.16545097, 0.00000000 };
Point ( 2454 ) = { 3.91015928, 6.16935512, 0.00000000 };
Point ( 2455 ) = { 3.90836413, 6.17049252, 0.00000000 };
Point ( 2456 ) = { 3.90656866, 6.17162940, 0.00000000 };
Point ( 2457 ) = { 3.90477368, 6.17276523, 0.00000000 };
Point ( 2458 ) = { 3.90297837, 6.17390055, 0.00000000 };
Point ( 2459 ) = { 3.90118191, 6.17503586, 0.00000000 };
Point ( 2460 ) = { 3.90239471, 6.17894607, 0.00000000 };
Point ( 2461 ) = { 3.90360966, 6.18286185, 0.00000000 };
Point ( 2462 ) = { 3.90181142, 6.18399682, 0.00000000 };
Point ( 2463 ) = { 3.90001284, 6.18513127, 0.00000000 };
Point ( 2464 ) = { 3.89821311, 6.18626572, 0.00000000 };
Point ( 2465 ) = { 3.89641305, 6.18739965, 0.00000000 };
Point ( 2466 ) = { 3.89461348, 6.18853253, 0.00000000 };
Point ( 2467 ) = { 3.89582434, 6.19245386, 0.00000000 };
BSpline ( 2 ) = { 1956 : 2467, 1956 };
Line Loop( 2 ) = { 2 };


// == Ice-Land mass number 31 =====================================
Point ( 2468 ) = { 1.12032250, 6.51989292, 0.00000000 };
Point ( 2469 ) = { 1.11842549, 6.52021860, 0.00000000 };
Point ( 2470 ) = { 1.11652925, 6.52054359, 0.00000000 };
Point ( 2471 ) = { 1.11463205, 6.52086816, 0.00000000 };
Point ( 2472 ) = { 1.11273562, 6.52119204, 0.00000000 };
Point ( 2473 ) = { 1.11083823, 6.52151552, 0.00000000 };
Point ( 2474 ) = { 1.10894162, 6.52183829, 0.00000000 };
Point ( 2475 ) = { 1.10704404, 6.52216066, 0.00000000 };
Point ( 2476 ) = { 1.10514724, 6.52248233, 0.00000000 };
Point ( 2477 ) = { 1.10324947, 6.52280360, 0.00000000 };
Point ( 2478 ) = { 1.10135248, 6.52312417, 0.00000000 };
Point ( 2479 ) = { 1.09945453, 6.52344433, 0.00000000 };
Point ( 2480 ) = { 1.09755735, 6.52376380, 0.00000000 };
Point ( 2481 ) = { 1.09565921, 6.52408286, 0.00000000 };
Point ( 2482 ) = { 1.09417225, 6.52103397, 0.00000000 };
Point ( 2483 ) = { 1.09268646, 6.51798641, 0.00000000 };
Point ( 2484 ) = { 1.09079001, 6.51830405, 0.00000000 };
Point ( 2485 ) = { 1.08889346, 6.51862114, 0.00000000 };
Point ( 2486 ) = { 1.08699768, 6.51893754, 0.00000000 };
Point ( 2487 ) = { 1.08510095, 6.51925352, 0.00000000 };
Point ( 2488 ) = { 1.08320499, 6.51956881, 0.00000000 };
Point ( 2489 ) = { 1.08130808, 6.51988370, 0.00000000 };
Point ( 2490 ) = { 1.07941194, 6.52019788, 0.00000000 };
Point ( 2491 ) = { 1.07793335, 6.51715016, 0.00000000 };
Point ( 2492 ) = { 1.07645618, 6.51410523, 0.00000000 };
Point ( 2493 ) = { 1.07456172, 6.51441801, 0.00000000 };
Point ( 2494 ) = { 1.07266630, 6.51473038, 0.00000000 };
Point ( 2495 ) = { 1.07077166, 6.51504205, 0.00000000 };
Point ( 2496 ) = { 1.06887606, 6.51535332, 0.00000000 };
Point ( 2497 ) = { 1.06698124, 6.51566389, 0.00000000 };
Point ( 2498 ) = { 1.06508546, 6.51597405, 0.00000000 };
Point ( 2499 ) = { 1.06319045, 6.51628352, 0.00000000 };
Point ( 2500 ) = { 1.06129449, 6.51659258, 0.00000000 };
Point ( 2501 ) = { 1.05939845, 6.51690109, 0.00000000 };
Point ( 2502 ) = { 1.05750317, 6.51720890, 0.00000000 };
Point ( 2503 ) = { 1.05560694, 6.51751631, 0.00000000 };
Point ( 2504 ) = { 1.05371149, 6.51782302, 0.00000000 };
Point ( 2505 ) = { 1.05224637, 6.51477574, 0.00000000 };
Point ( 2506 ) = { 1.05078288, 6.51173270, 0.00000000 };
Point ( 2507 ) = { 1.04888911, 6.51203801, 0.00000000 };
Point ( 2508 ) = { 1.04699439, 6.51234291, 0.00000000 };
Point ( 2509 ) = { 1.04510044, 6.51264712, 0.00000000 };
Point ( 2510 ) = { 1.04320554, 6.51295092, 0.00000000 };
Point ( 2511 ) = { 1.04131142, 6.51325402, 0.00000000 };
Point ( 2512 ) = { 1.03985376, 6.51021164, 0.00000000 };
Point ( 2513 ) = { 1.03839749, 6.50717203, 0.00000000 };
Point ( 2514 ) = { 1.03650505, 6.50747374, 0.00000000 };
Point ( 2515 ) = { 1.03461165, 6.50777503, 0.00000000 };
Point ( 2516 ) = { 1.03315898, 6.50473728, 0.00000000 };
Point ( 2517 ) = { 1.03170746, 6.50170083, 0.00000000 };
Point ( 2518 ) = { 1.02981575, 6.50200073, 0.00000000 };
Point ( 2519 ) = { 1.02792394, 6.50230008, 0.00000000 };
Point ( 2520 ) = { 1.02647558, 6.49926556, 0.00000000 };
Point ( 2521 ) = { 1.02502861, 6.49623380, 0.00000000 };
Point ( 2522 ) = { 1.02358258, 6.49320486, 0.00000000 };
Point ( 2523 ) = { 1.02258253, 6.48686091, 0.00000000 };
Point ( 2524 ) = { 1.02113976, 6.48384065, 0.00000000 };
Point ( 2525 ) = { 1.01969880, 6.48082305, 0.00000000 };
Point ( 2526 ) = { 1.02014326, 6.47751325, 0.00000000 };
Point ( 2527 ) = { 1.02202785, 6.47721616, 0.00000000 };
Point ( 2528 ) = { 1.02247088, 6.47390925, 0.00000000 };
Point ( 2529 ) = { 1.02291322, 6.47060390, 0.00000000 };
Point ( 2530 ) = { 1.02479580, 6.47030601, 0.00000000 };
Point ( 2531 ) = { 1.02523714, 6.46700349, 0.00000000 };
Point ( 2532 ) = { 1.02567825, 6.46370542, 0.00000000 };
Point ( 2533 ) = { 1.02755796, 6.46340686, 0.00000000 };
Point ( 2534 ) = { 1.02943845, 6.46310762, 0.00000000 };
Point ( 2535 ) = { 1.02987675, 6.45981236, 0.00000000 };
Point ( 2536 ) = { 1.03031436, 6.45651866, 0.00000000 };
Point ( 2537 ) = { 1.03219284, 6.45621862, 0.00000000 };
Point ( 2538 ) = { 1.03407038, 6.45591817, 0.00000000 };
Point ( 2539 ) = { 1.03594868, 6.45561703, 0.00000000 };
Point ( 2540 ) = { 1.03782604, 6.45531549, 0.00000000 };
Point ( 2541 ) = { 1.03970418, 6.45501326, 0.00000000 };
Point ( 2542 ) = { 1.04158136, 6.45471062, 0.00000000 };
Point ( 2543 ) = { 1.04345932, 6.45440730, 0.00000000 };
Point ( 2544 ) = { 1.04533633, 6.45410357, 0.00000000 };
Point ( 2545 ) = { 1.04721410, 6.45379916, 0.00000000 };
Point ( 2546 ) = { 1.04764264, 6.45050733, 0.00000000 };
Point ( 2547 ) = { 1.04807096, 6.44721993, 0.00000000 };
Point ( 2548 ) = { 1.04994673, 6.44691472, 0.00000000 };
Point ( 2549 ) = { 1.05182242, 6.44660896, 0.00000000 };
Point ( 2550 ) = { 1.05369716, 6.44630280, 0.00000000 };
Point ( 2551 ) = { 1.05557267, 6.44599596, 0.00000000 };
Point ( 2552 ) = { 1.05744723, 6.44568870, 0.00000000 };
Point ( 2553 ) = { 1.05932256, 6.44538077, 0.00000000 };
Point ( 2554 ) = { 1.06119695, 6.44507242, 0.00000000 };
Point ( 2555 ) = { 1.06307210, 6.44476340, 0.00000000 };
Point ( 2556 ) = { 1.06494630, 6.44445396, 0.00000000 };
Point ( 2557 ) = { 1.06682127, 6.44414384, 0.00000000 };
Point ( 2558 ) = { 1.06869529, 6.44383332, 0.00000000 };
Point ( 2559 ) = { 1.07057008, 6.44352211, 0.00000000 };
Point ( 2560 ) = { 1.07244393, 6.44321050, 0.00000000 };
Point ( 2561 ) = { 1.07431854, 6.44289820, 0.00000000 };
Point ( 2562 ) = { 1.07619220, 6.44258550, 0.00000000 };
Point ( 2563 ) = { 1.07806662, 6.44227211, 0.00000000 };
Point ( 2564 ) = { 1.07994096, 6.44195817, 0.00000000 };
Point ( 2565 ) = { 1.08181434, 6.44164383, 0.00000000 };
Point ( 2566 ) = { 1.08368850, 6.44132880, 0.00000000 };
Point ( 2567 ) = { 1.08556170, 6.44101338, 0.00000000 };
Point ( 2568 ) = { 1.08597088, 6.43772646, 0.00000000 };
Point ( 2569 ) = { 1.08637939, 6.43444110, 0.00000000 };
Point ( 2570 ) = { 1.08825059, 6.43412489, 0.00000000 };
Point ( 2571 ) = { 1.09012256, 6.43380799, 0.00000000 };
Point ( 2572 ) = { 1.09199357, 6.43349069, 0.00000000 };
Point ( 2573 ) = { 1.09386535, 6.43317270, 0.00000000 };
Point ( 2574 ) = { 1.09573618, 6.43285431, 0.00000000 };
Point ( 2575 ) = { 1.09760778, 6.43253524, 0.00000000 };
Point ( 2576 ) = { 1.09947842, 6.43221576, 0.00000000 };
Point ( 2577 ) = { 1.10134983, 6.43189560, 0.00000000 };
Point ( 2578 ) = { 1.10322029, 6.43157503, 0.00000000 };
Point ( 2579 ) = { 1.10509151, 6.43125378, 0.00000000 };
Point ( 2580 ) = { 1.10696264, 6.43093198, 0.00000000 };
Point ( 2581 ) = { 1.10883282, 6.43060978, 0.00000000 };
Point ( 2582 ) = { 1.11070376, 6.43028689, 0.00000000 };
Point ( 2583 ) = { 1.11257375, 6.42996361, 0.00000000 };
Point ( 2584 ) = { 1.11444451, 6.42963964, 0.00000000 };
Point ( 2585 ) = { 1.11631431, 6.42931526, 0.00000000 };
Point ( 2586 ) = { 1.11818487, 6.42899020, 0.00000000 };
Point ( 2587 ) = { 1.12005449, 6.42866474, 0.00000000 };
Point ( 2588 ) = { 1.12044537, 6.42538027, 0.00000000 };
Point ( 2589 ) = { 1.12083609, 6.42210021, 0.00000000 };
Point ( 2590 ) = { 1.12270370, 6.42177398, 0.00000000 };
Point ( 2591 ) = { 1.12457207, 6.42144706, 0.00000000 };
Point ( 2592 ) = { 1.12643949, 6.42111974, 0.00000000 };
Point ( 2593 ) = { 1.12830767, 6.42079173, 0.00000000 };
Point ( 2594 ) = { 1.13017490, 6.42046333, 0.00000000 };
Point ( 2595 ) = { 1.13204289, 6.42013423, 0.00000000 };
Point ( 2596 ) = { 1.13391078, 6.41980459, 0.00000000 };
Point ( 2597 ) = { 1.13577772, 6.41947456, 0.00000000 };
Point ( 2598 ) = { 1.13764542, 6.41914383, 0.00000000 };
Point ( 2599 ) = { 1.13951217, 6.41881272, 0.00000000 };
Point ( 2600 ) = { 1.14137968, 6.41848090, 0.00000000 };
Point ( 2601 ) = { 1.14324623, 6.41814870, 0.00000000 };
Point ( 2602 ) = { 1.14511355, 6.41781580, 0.00000000 };
Point ( 2603 ) = { 1.14697991, 6.41748251, 0.00000000 };
Point ( 2604 ) = { 1.14884703, 6.41714852, 0.00000000 };
Point ( 2605 ) = { 1.15071320, 6.41681415, 0.00000000 };
Point ( 2606 ) = { 1.15258012, 6.41647908, 0.00000000 };
Point ( 2607 ) = { 1.15444610, 6.41614361, 0.00000000 };
Point ( 2608 ) = { 1.15481924, 6.41286453, 0.00000000 };
Point ( 2609 ) = { 1.15519172, 6.40958700, 0.00000000 };
Point ( 2610 ) = { 1.15705569, 6.40925078, 0.00000000 };
Point ( 2611 ) = { 1.15892042, 6.40891386, 0.00000000 };
Point ( 2612 ) = { 1.16078504, 6.40857640, 0.00000000 };
Point ( 2613 ) = { 1.16264872, 6.40823855, 0.00000000 };
Point ( 2614 ) = { 1.16451315, 6.40790001, 0.00000000 };
Point ( 2615 ) = { 1.16637663, 6.40756108, 0.00000000 };
Point ( 2616 ) = { 1.16824086, 6.40722145, 0.00000000 };
Point ( 2617 ) = { 1.17010414, 6.40688143, 0.00000000 };
Point ( 2618 ) = { 1.17196817, 6.40654072, 0.00000000 };
Point ( 2619 ) = { 1.17383126, 6.40619962, 0.00000000 };
Point ( 2620 ) = { 1.17569509, 6.40585782, 0.00000000 };
Point ( 2621 ) = { 1.17755798, 6.40551564, 0.00000000 };
Point ( 2622 ) = { 1.17942161, 6.40517276, 0.00000000 };
Point ( 2623 ) = { 1.18128430, 6.40482949, 0.00000000 };
Point ( 2624 ) = { 1.18314774, 6.40448553, 0.00000000 };
Point ( 2625 ) = { 1.18501022, 6.40414117, 0.00000000 };
Point ( 2626 ) = { 1.18687346, 6.40379612, 0.00000000 };
Point ( 2627 ) = { 1.18873659, 6.40345053, 0.00000000 };
Point ( 2628 ) = { 1.19059878, 6.40310456, 0.00000000 };
Point ( 2629 ) = { 1.19210830, 6.40603752, 0.00000000 };
Point ( 2630 ) = { 1.19361899, 6.40897171, 0.00000000 };
Point ( 2631 ) = { 1.19548278, 6.40862431, 0.00000000 };
Point ( 2632 ) = { 1.19734732, 6.40827622, 0.00000000 };
Point ( 2633 ) = { 1.19921090, 6.40792774, 0.00000000 };
Point ( 2634 ) = { 1.20107524, 6.40757855, 0.00000000 };
Point ( 2635 ) = { 1.20259035, 6.41051370, 0.00000000 };
Point ( 2636 ) = { 1.20410715, 6.41345292, 0.00000000 };
Point ( 2637 ) = { 1.20597310, 6.41310231, 0.00000000 };
Point ( 2638 ) = { 1.20783808, 6.41275133, 0.00000000 };
Point ( 2639 ) = { 1.20935846, 6.41569223, 0.00000000 };
Point ( 2640 ) = { 1.21053459, 6.42193163, 0.00000000 };
Point ( 2641 ) = { 1.21018906, 6.42523333, 0.00000000 };
Point ( 2642 ) = { 1.20984359, 6.42853796, 0.00000000 };
Point ( 2643 ) = { 1.20949747, 6.43184417, 0.00000000 };
Point ( 2644 ) = { 1.20915055, 6.43515348, 0.00000000 };
Point ( 2645 ) = { 1.20880352, 6.43846724, 0.00000000 };
Point ( 2646 ) = { 1.20693105, 6.43881851, 0.00000000 };
Point ( 2647 ) = { 1.20505762, 6.43916939, 0.00000000 };
Point ( 2648 ) = { 1.20470871, 6.44248590, 0.00000000 };
Point ( 2649 ) = { 1.20435915, 6.44580400, 0.00000000 };
Point ( 2650 ) = { 1.20248369, 6.44615413, 0.00000000 };
Point ( 2651 ) = { 1.20213279, 6.44947516, 0.00000000 };
Point ( 2652 ) = { 1.20178178, 6.45280067, 0.00000000 };
Point ( 2653 ) = { 1.19990428, 6.45315006, 0.00000000 };
Point ( 2654 ) = { 1.19802754, 6.45349874, 0.00000000 };
Point ( 2655 ) = { 1.19767378, 6.45682716, 0.00000000 };
Point ( 2656 ) = { 1.19731936, 6.46015719, 0.00000000 };
Point ( 2657 ) = { 1.19543973, 6.46050528, 0.00000000 };
Point ( 2658 ) = { 1.19356085, 6.46085266, 0.00000000 };
Point ( 2659 ) = { 1.19320411, 6.46418554, 0.00000000 };
Point ( 2660 ) = { 1.19284725, 6.46752291, 0.00000000 };
Point ( 2661 ) = { 1.19096634, 6.46786954, 0.00000000 };
Point ( 2662 ) = { 1.18908446, 6.46821578, 0.00000000 };
Point ( 2663 ) = { 1.18720334, 6.46856131, 0.00000000 };
Point ( 2664 ) = { 1.18532126, 6.46890645, 0.00000000 };
Point ( 2665 ) = { 1.18496056, 6.47224640, 0.00000000 };
Point ( 2666 ) = { 1.18459946, 6.47558940, 0.00000000 };
Point ( 2667 ) = { 1.18271534, 6.47593379, 0.00000000 };
Point ( 2668 ) = { 1.18083197, 6.47627747, 0.00000000 };
Point ( 2669 ) = { 1.17894765, 6.47662076, 0.00000000 };
Point ( 2670 ) = { 1.17706409, 6.47696334, 0.00000000 };
Point ( 2671 ) = { 1.17517956, 6.47730553, 0.00000000 };
Point ( 2672 ) = { 1.17329580, 6.47764702, 0.00000000 };
Point ( 2673 ) = { 1.17141108, 6.47798812, 0.00000000 };
Point ( 2674 ) = { 1.16952625, 6.47832867, 0.00000000 };
Point ( 2675 ) = { 1.16764220, 6.47866851, 0.00000000 };
Point ( 2676 ) = { 1.16575718, 6.47900796, 0.00000000 };
Point ( 2677 ) = { 1.16538596, 6.48235297, 0.00000000 };
Point ( 2678 ) = { 1.16501408, 6.48569960, 0.00000000 };
Point ( 2679 ) = { 1.16312701, 6.48603829, 0.00000000 };
Point ( 2680 ) = { 1.16124071, 6.48637627, 0.00000000 };
Point ( 2681 ) = { 1.15935345, 6.48671386, 0.00000000 };
Point ( 2682 ) = { 1.15746695, 6.48705075, 0.00000000 };
Point ( 2683 ) = { 1.15557949, 6.48738724, 0.00000000 };
Point ( 2684 ) = { 1.15369280, 6.48772303, 0.00000000 };
Point ( 2685 ) = { 1.15180515, 6.48805842, 0.00000000 };
Point ( 2686 ) = { 1.14991826, 6.48839311, 0.00000000 };
Point ( 2687 ) = { 1.14803041, 6.48872740, 0.00000000 };
Point ( 2688 ) = { 1.14764936, 6.49207612, 0.00000000 };
Point ( 2689 ) = { 1.14726790, 6.49542792, 0.00000000 };
Point ( 2690 ) = { 1.14537800, 6.49576144, 0.00000000 };
Point ( 2691 ) = { 1.14348801, 6.49609441, 0.00000000 };
Point ( 2692 ) = { 1.14159879, 6.49642668, 0.00000000 };
Point ( 2693 ) = { 1.13970860, 6.49675856, 0.00000000 };
Point ( 2694 ) = { 1.13932282, 6.50011299, 0.00000000 };
Point ( 2695 ) = { 1.13893689, 6.50347197, 0.00000000 };
Point ( 2696 ) = { 1.13704465, 6.50380307, 0.00000000 };
Point ( 2697 ) = { 1.13515319, 6.50413346, 0.00000000 };
Point ( 2698 ) = { 1.13326076, 6.50446346, 0.00000000 };
Point ( 2699 ) = { 1.13136910, 6.50479276, 0.00000000 };
Point ( 2700 ) = { 1.13097840, 6.50815446, 0.00000000 };
Point ( 2701 ) = { 1.13058729, 6.51151925, 0.00000000 };
Point ( 2702 ) = { 1.12869358, 6.51184777, 0.00000000 };
Point ( 2703 ) = { 1.12679891, 6.51217589, 0.00000000 };
Point ( 2704 ) = { 1.12490501, 6.51250330, 0.00000000 };
Point ( 2705 ) = { 1.12301014, 6.51283032, 0.00000000 };
Point ( 2706 ) = { 1.12111605, 6.51315664, 0.00000000 };
Point ( 2707 ) = { 1.12071962, 6.51652396, 0.00000000 };
BSpline ( 3 ) = { 2468 : 2707, 2468 };
Line Loop( 3 ) = { 3 };


// == Ice-Land mass number 37 =====================================
Point ( 2708 ) = { 0.17521212, 6.76631211, 0.00000000 };
Point ( 2709 ) = { 0.17324436, 6.76636277, 0.00000000 };
Point ( 2710 ) = { 0.17127567, 6.76641289, 0.00000000 };
Point ( 2711 ) = { 0.16930788, 6.76646242, 0.00000000 };
Point ( 2712 ) = { 0.16733916, 6.76651139, 0.00000000 };
Point ( 2713 ) = { 0.16537134, 6.76655977, 0.00000000 };
Point ( 2714 ) = { 0.16340260, 6.76660760, 0.00000000 };
Point ( 2715 ) = { 0.16143475, 6.76665483, 0.00000000 };
Point ( 2716 ) = { 0.15946598, 6.76670152, 0.00000000 };
Point ( 2717 ) = { 0.15749810, 6.76674760, 0.00000000 };
Point ( 2718 ) = { 0.15552931, 6.76679314, 0.00000000 };
Point ( 2719 ) = { 0.15446768, 6.76341469, 0.00000000 };
Point ( 2720 ) = { 0.15340708, 6.76003786, 0.00000000 };
Point ( 2721 ) = { 0.15144024, 6.76008221, 0.00000000 };
Point ( 2722 ) = { 0.14947428, 6.76012597, 0.00000000 };
Point ( 2723 ) = { 0.14750742, 6.76016917, 0.00000000 };
Point ( 2724 ) = { 0.14554054, 6.76021180, 0.00000000 };
Point ( 2725 ) = { 0.14357454, 6.76025384, 0.00000000 };
Point ( 2726 ) = { 0.14160764, 6.76029533, 0.00000000 };
Point ( 2727 ) = { 0.13964162, 6.76033623, 0.00000000 };
Point ( 2728 ) = { 0.13767470, 6.76037657, 0.00000000 };
Point ( 2729 ) = { 0.13662301, 6.75700046, 0.00000000 };
Point ( 2730 ) = { 0.13557241, 6.75362908, 0.00000000 };
Point ( 2731 ) = { 0.13360743, 6.75366824, 0.00000000 };
Point ( 2732 ) = { 0.13164334, 6.75370681, 0.00000000 };
Point ( 2733 ) = { 0.12967835, 6.75374482, 0.00000000 };
Point ( 2734 ) = { 0.12771423, 6.75378225, 0.00000000 };
Point ( 2735 ) = { 0.12574921, 6.75381912, 0.00000000 };
Point ( 2736 ) = { 0.12378508, 6.75385541, 0.00000000 };
Point ( 2737 ) = { 0.12274096, 6.75048538, 0.00000000 };
Point ( 2738 ) = { 0.12169785, 6.74711696, 0.00000000 };
Point ( 2739 ) = { 0.11973567, 6.74715206, 0.00000000 };
Point ( 2740 ) = { 0.11869459, 6.74378650, 0.00000000 };
Point ( 2741 ) = { 0.11765457, 6.74042565, 0.00000000 };
Point ( 2742 ) = { 0.11569343, 6.74045960, 0.00000000 };
Point ( 2743 ) = { 0.11373319, 6.74049296, 0.00000000 };
Point ( 2744 ) = { 0.11269616, 6.73713465, 0.00000000 };
Point ( 2745 ) = { 0.11166014, 6.73377794, 0.00000000 };
Point ( 2746 ) = { 0.10970184, 6.73381013, 0.00000000 };
Point ( 2747 ) = { 0.10866783, 6.73045627, 0.00000000 };
Point ( 2748 ) = { 0.10855922, 6.72372973, 0.00000000 };
Point ( 2749 ) = { 0.10752733, 6.72038557, 0.00000000 };
Point ( 2750 ) = { 0.10649691, 6.71704453, 0.00000000 };
Point ( 2751 ) = { 0.10546753, 6.71370814, 0.00000000 };
Point ( 2752 ) = { 0.10351417, 6.71373855, 0.00000000 };
Point ( 2753 ) = { 0.10156170, 6.71376837, 0.00000000 };
Point ( 2754 ) = { 0.10053484, 6.71043450, 0.00000000 };
Point ( 2755 ) = { 0.09950899, 6.70710222, 0.00000000 };
Point ( 2756 ) = { 0.09755844, 6.70713087, 0.00000000 };
Point ( 2757 ) = { 0.09653457, 6.70380140, 0.00000000 };
Point ( 2758 ) = { 0.09551172, 6.70047503, 0.00000000 };
Point ( 2759 ) = { 0.09356310, 6.70050252, 0.00000000 };
Point ( 2760 ) = { 0.09161358, 6.70052946, 0.00000000 };
Point ( 2761 ) = { 0.09059413, 6.69720559, 0.00000000 };
Point ( 2762 ) = { 0.09050402, 6.69054414, 0.00000000 };
Point ( 2763 ) = { 0.09041408, 6.68389563, 0.00000000 };
Point ( 2764 ) = { 0.08939774, 6.68058778, 0.00000000 };
Point ( 2765 ) = { 0.08838197, 6.67728300, 0.00000000 };
Point ( 2766 ) = { 0.08930899, 6.67395559, 0.00000000 };
Point ( 2767 ) = { 0.09023465, 6.67063127, 0.00000000 };
Point ( 2768 ) = { 0.09014524, 6.66402140, 0.00000000 };
Point ( 2769 ) = { 0.08913205, 6.66073279, 0.00000000 };
Point ( 2770 ) = { 0.08811942, 6.65744723, 0.00000000 };
Point ( 2771 ) = { 0.08904384, 6.65414059, 0.00000000 };
Point ( 2772 ) = { 0.08996689, 6.65083701, 0.00000000 };
Point ( 2773 ) = { 0.08895579, 6.64756113, 0.00000000 };
Point ( 2774 ) = { 0.08794524, 6.64428829, 0.00000000 };
Point ( 2775 ) = { 0.08785843, 6.63772938, 0.00000000 };
Point ( 2776 ) = { 0.08777174, 6.63118012, 0.00000000 };
Point ( 2777 ) = { 0.08768526, 6.62464648, 0.00000000 };
Point ( 2778 ) = { 0.08759891, 6.61812243, 0.00000000 };
Point ( 2779 ) = { 0.08751276, 6.61161391, 0.00000000 };
Point ( 2780 ) = { 0.08742674, 6.60511492, 0.00000000 };
Point ( 2781 ) = { 0.08734088, 6.59862841, 0.00000000 };
Point ( 2782 ) = { 0.08725523, 6.59215730, 0.00000000 };
Point ( 2783 ) = { 0.08716974, 6.58569859, 0.00000000 };
Point ( 2784 ) = { 0.08708437, 6.57924929, 0.00000000 };
Point ( 2785 ) = { 0.08699917, 6.57281232, 0.00000000 };
Point ( 2786 ) = { 0.08691417, 6.56639059, 0.00000000 };
Point ( 2787 ) = { 0.08682930, 6.55997818, 0.00000000 };
Point ( 2788 ) = { 0.08674462, 6.55358093, 0.00000000 };
Point ( 2789 ) = { 0.08765524, 6.55037273, 0.00000000 };
Point ( 2790 ) = { 0.08856454, 6.54716745, 0.00000000 };
Point ( 2791 ) = { 0.08947296, 6.54396655, 0.00000000 };
Point ( 2792 ) = { 0.09038094, 6.54076854, 0.00000000 };
Point ( 2793 ) = { 0.09128801, 6.53757198, 0.00000000 };
Point ( 2794 ) = { 0.09318924, 6.53754516, 0.00000000 };
Point ( 2795 ) = { 0.09409449, 6.53435124, 0.00000000 };
Point ( 2796 ) = { 0.09499888, 6.53116167, 0.00000000 };
Point ( 2797 ) = { 0.09689825, 6.53113376, 0.00000000 };
Point ( 2798 ) = { 0.09879849, 6.53110530, 0.00000000 };
Point ( 2799 ) = { 0.09969971, 6.52791810, 0.00000000 };
Point ( 2800 ) = { 0.10060003, 6.52473233, 0.00000000 };
Point ( 2801 ) = { 0.10249840, 6.52470279, 0.00000000 };
Point ( 2802 ) = { 0.10439589, 6.52467270, 0.00000000 };
Point ( 2803 ) = { 0.10629424, 6.52464205, 0.00000000 };
Point ( 2804 ) = { 0.10819171, 6.52461087, 0.00000000 };
Point ( 2805 ) = { 0.10908788, 6.52142694, 0.00000000 };
Point ( 2806 ) = { 0.10998321, 6.51824734, 0.00000000 };
Point ( 2807 ) = { 0.11187882, 6.51821508, 0.00000000 };
Point ( 2808 ) = { 0.11377529, 6.51818225, 0.00000000 };
Point ( 2809 ) = { 0.11567176, 6.51814887, 0.00000000 };
Point ( 2810 ) = { 0.11756734, 6.51811496, 0.00000000 };
Point ( 2811 ) = { 0.11946378, 6.51808047, 0.00000000 };
Point ( 2812 ) = { 0.12135935, 6.51804546, 0.00000000 };
Point ( 2813 ) = { 0.12325577, 6.51800987, 0.00000000 };
Point ( 2814 ) = { 0.12515132, 6.51797375, 0.00000000 };
Point ( 2815 ) = { 0.12603837, 6.51479495, 0.00000000 };
Point ( 2816 ) = { 0.12692454, 6.51161758, 0.00000000 };
Point ( 2817 ) = { 0.12881822, 6.51158040, 0.00000000 };
Point ( 2818 ) = { 0.13071276, 6.51154264, 0.00000000 };
Point ( 2819 ) = { 0.13260643, 6.51150435, 0.00000000 };
Point ( 2820 ) = { 0.13450095, 6.51146550, 0.00000000 };
Point ( 2821 ) = { 0.13639459, 6.51142611, 0.00000000 };
Point ( 2822 ) = { 0.13828908, 6.51138615, 0.00000000 };
Point ( 2823 ) = { 0.14018270, 6.51134565, 0.00000000 };
Point ( 2824 ) = { 0.14207717, 6.51130459, 0.00000000 };
Point ( 2825 ) = { 0.14397163, 6.51126298, 0.00000000 };
Point ( 2826 ) = { 0.14586521, 6.51122083, 0.00000000 };
Point ( 2827 ) = { 0.14775965, 6.51117812, 0.00000000 };
Point ( 2828 ) = { 0.14965321, 6.51113487, 0.00000000 };
Point ( 2829 ) = { 0.15154762, 6.51109106, 0.00000000 };
Point ( 2830 ) = { 0.15344115, 6.51104671, 0.00000000 };
Point ( 2831 ) = { 0.15533553, 6.51100179, 0.00000000 };
Point ( 2832 ) = { 0.15722904, 6.51095634, 0.00000000 };
Point ( 2833 ) = { 0.15912339, 6.51091032, 0.00000000 };
Point ( 2834 ) = { 0.16101687, 6.51086377, 0.00000000 };
Point ( 2835 ) = { 0.16291120, 6.51081664, 0.00000000 };
Point ( 2836 ) = { 0.16480465, 6.51076899, 0.00000000 };
Point ( 2837 ) = { 0.16669896, 6.51072076, 0.00000000 };
Point ( 2838 ) = { 0.16859238, 6.51067201, 0.00000000 };
Point ( 2839 ) = { 0.17048665, 6.51062268, 0.00000000 };
Point ( 2840 ) = { 0.17238092, 6.51057280, 0.00000000 };
Point ( 2841 ) = { 0.17427429, 6.51052240, 0.00000000 };
Point ( 2842 ) = { 0.17530642, 6.51365540, 0.00000000 };
Point ( 2843 ) = { 0.17633950, 6.51678978, 0.00000000 };
Point ( 2844 ) = { 0.17823468, 6.51673822, 0.00000000 };
Point ( 2845 ) = { 0.18013072, 6.51668609, 0.00000000 };
Point ( 2846 ) = { 0.18202588, 6.51663343, 0.00000000 };
Point ( 2847 ) = { 0.18392189, 6.51658019, 0.00000000 };
Point ( 2848 ) = { 0.18581701, 6.51652643, 0.00000000 };
Point ( 2849 ) = { 0.18685565, 6.51966214, 0.00000000 };
Point ( 2850 ) = { 0.18789534, 6.52280214, 0.00000000 };
Point ( 2851 ) = { 0.18893559, 6.52594499, 0.00000000 };
Point ( 2852 ) = { 0.18911933, 6.53229162, 0.00000000 };
Point ( 2853 ) = { 0.18930351, 6.53865323, 0.00000000 };
Point ( 2854 ) = { 0.18948795, 6.54502404, 0.00000000 };
Point ( 2855 ) = { 0.18967283, 6.55140991, 0.00000000 };
Point ( 2856 ) = { 0.18985798, 6.55780505, 0.00000000 };
Point ( 2857 ) = { 0.19004357, 6.56421533, 0.00000000 };
Point ( 2858 ) = { 0.18918149, 6.56745118, 0.00000000 };
Point ( 2859 ) = { 0.18727068, 6.56750594, 0.00000000 };
Point ( 2860 ) = { 0.18640681, 6.57074449, 0.00000000 };
Point ( 2861 ) = { 0.18554213, 6.57398748, 0.00000000 };
Point ( 2862 ) = { 0.18467616, 6.57723343, 0.00000000 };
Point ( 2863 ) = { 0.18380934, 6.58048236, 0.00000000 };
Point ( 2864 ) = { 0.18189562, 6.58053554, 0.00000000 };
Point ( 2865 ) = { 0.18102699, 6.58378719, 0.00000000 };
Point ( 2866 ) = { 0.18015747, 6.58704034, 0.00000000 };
Point ( 2867 ) = { 0.17928752, 6.59029646, 0.00000000 };
Point ( 2868 ) = { 0.17841672, 6.59355556, 0.00000000 };
Point ( 2869 ) = { 0.17649832, 6.59360719, 0.00000000 };
Point ( 2870 ) = { 0.17562570, 6.59686903, 0.00000000 };
Point ( 2871 ) = { 0.17475227, 6.60013534, 0.00000000 };
Point ( 2872 ) = { 0.17283195, 6.60018591, 0.00000000 };
Point ( 2873 ) = { 0.17195626, 6.60345497, 0.00000000 };
Point ( 2874 ) = { 0.17107970, 6.60672705, 0.00000000 };
Point ( 2875 ) = { 0.17020272, 6.61000212, 0.00000000 };
Point ( 2876 ) = { 0.16932483, 6.61327871, 0.00000000 };
Point ( 2877 ) = { 0.16740068, 6.61332770, 0.00000000 };
Point ( 2878 ) = { 0.16652097, 6.61660705, 0.00000000 };
Point ( 2879 ) = { 0.16564042, 6.61989091, 0.00000000 };
Point ( 2880 ) = { 0.16475855, 6.62317781, 0.00000000 };
Point ( 2881 ) = { 0.16387578, 6.62646624, 0.00000000 };
Point ( 2882 ) = { 0.16194868, 6.62651362, 0.00000000 };
Point ( 2883 ) = { 0.16106407, 6.62980483, 0.00000000 };
Point ( 2884 ) = { 0.16017862, 6.63310057, 0.00000000 };
Point ( 2885 ) = { 0.15929273, 6.63639934, 0.00000000 };
Point ( 2886 ) = { 0.15945013, 6.64295694, 0.00000000 };
Point ( 2887 ) = { 0.15960791, 6.64953023, 0.00000000 };
Point ( 2888 ) = { 0.15976592, 6.65611324, 0.00000000 };
Point ( 2889 ) = { 0.15992431, 6.66271203, 0.00000000 };
Point ( 2890 ) = { 0.16008294, 6.66932060, 0.00000000 };
Point ( 2891 ) = { 0.16024194, 6.67594504, 0.00000000 };
Point ( 2892 ) = { 0.16129278, 6.67923870, 0.00000000 };
Point ( 2893 ) = { 0.16234511, 6.68253542, 0.00000000 };
Point ( 2894 ) = { 0.16250659, 6.68918257, 0.00000000 };
Point ( 2895 ) = { 0.16266839, 6.69584266, 0.00000000 };
Point ( 2896 ) = { 0.16372401, 6.69915536, 0.00000000 };
Point ( 2897 ) = { 0.16567223, 6.69910746, 0.00000000 };
Point ( 2898 ) = { 0.16762133, 6.69905898, 0.00000000 };
Point ( 2899 ) = { 0.16867948, 6.70237416, 0.00000000 };
Point ( 2900 ) = { 0.16973868, 6.70569243, 0.00000000 };
Point ( 2901 ) = { 0.17168969, 6.70564276, 0.00000000 };
Point ( 2902 ) = { 0.17363980, 6.70559255, 0.00000000 };
Point ( 2903 ) = { 0.17470243, 6.70891329, 0.00000000 };
Point ( 2904 ) = { 0.17576607, 6.71223560, 0.00000000 };
Point ( 2905 ) = { 0.17771899, 6.71218418, 0.00000000 };
Point ( 2906 ) = { 0.17967101, 6.71213221, 0.00000000 };
Point ( 2907 ) = { 0.18073764, 6.71545700, 0.00000000 };
Point ( 2908 ) = { 0.18091836, 6.72217191, 0.00000000 };
Point ( 2909 ) = { 0.18109936, 6.72889688, 0.00000000 };
Point ( 2910 ) = { 0.18216940, 6.73223942, 0.00000000 };
Point ( 2911 ) = { 0.18324007, 6.73558511, 0.00000000 };
Point ( 2912 ) = { 0.18235195, 6.73898570, 0.00000000 };
Point ( 2913 ) = { 0.18146249, 6.74238950, 0.00000000 };
Point ( 2914 ) = { 0.18057218, 6.74579805, 0.00000000 };
Point ( 2915 ) = { 0.17968141, 6.74920979, 0.00000000 };
Point ( 2916 ) = { 0.17986186, 6.75598777, 0.00000000 };
Point ( 2917 ) = { 0.17896938, 6.75940941, 0.00000000 };
Point ( 2918 ) = { 0.17700272, 6.75946120, 0.00000000 };
Point ( 2919 ) = { 0.17610789, 6.76288582, 0.00000000 };
BSpline ( 4 ) = { 2708 : 2919, 2708 };
Line Loop( 4 ) = { 4 };


// == Ice-Land mass number 40 =====================================
Point ( 2920 ) = { 3.30148275, 6.41022486, 0.00000000 };
Point ( 2921 ) = { 3.29961840, 6.41118472, 0.00000000 };
Point ( 2922 ) = { 3.29775293, 6.41214447, 0.00000000 };
Point ( 2923 ) = { 3.29588717, 6.41310368, 0.00000000 };
Point ( 2924 ) = { 3.29402199, 6.41406191, 0.00000000 };
Point ( 2925 ) = { 3.29215653, 6.41501960, 0.00000000 };
Point ( 2926 ) = { 3.29028994, 6.41597718, 0.00000000 };
Point ( 2927 ) = { 3.28842307, 6.41693422, 0.00000000 };
Point ( 2928 ) = { 3.28655678, 6.41789028, 0.00000000 };
Point ( 2929 ) = { 3.28468935, 6.41884623, 0.00000000 };
Point ( 2930 ) = { 3.28282165, 6.41980164, 0.00000000 };
Point ( 2931 ) = { 3.28095452, 6.42075607, 0.00000000 };
Point ( 2932 ) = { 3.27908712, 6.42170996, 0.00000000 };
Point ( 2933 ) = { 3.27721858, 6.42266374, 0.00000000 };
Point ( 2934 ) = { 3.27534976, 6.42361698, 0.00000000 };
Point ( 2935 ) = { 3.27348153, 6.42456923, 0.00000000 };
Point ( 2936 ) = { 3.27161301, 6.42552095, 0.00000000 };
Point ( 2937 ) = { 3.26974337, 6.42647255, 0.00000000 };
Point ( 2938 ) = { 3.26787344, 6.42742361, 0.00000000 };
Point ( 2939 ) = { 3.26519335, 6.42446443, 0.00000000 };
Point ( 2940 ) = { 3.26251681, 6.42150977, 0.00000000 };
Point ( 2941 ) = { 3.26064919, 6.42245829, 0.00000000 };
Point ( 2942 ) = { 3.25878043, 6.42340671, 0.00000000 };
Point ( 2943 ) = { 3.25691140, 6.42435458, 0.00000000 };
Point ( 2944 ) = { 3.25504295, 6.42530147, 0.00000000 };
Point ( 2945 ) = { 3.25317337, 6.42624826, 0.00000000 };
Point ( 2946 ) = { 3.25130351, 6.42719450, 0.00000000 };
Point ( 2947 ) = { 3.24943424, 6.42813976, 0.00000000 };
Point ( 2948 ) = { 3.24756469, 6.42908448, 0.00000000 };
Point ( 2949 ) = { 3.24569400, 6.43002909, 0.00000000 };
Point ( 2950 ) = { 3.24382305, 6.43097315, 0.00000000 };
Point ( 2951 ) = { 3.24115786, 6.42801368, 0.00000000 };
Point ( 2952 ) = { 3.23849462, 6.42505558, 0.00000000 };
Point ( 2953 ) = { 3.23662596, 6.42599712, 0.00000000 };
Point ( 2954 ) = { 3.23475618, 6.42693854, 0.00000000 };
Point ( 2955 ) = { 3.23288612, 6.42787943, 0.00000000 };
Point ( 2956 ) = { 3.23101665, 6.42881933, 0.00000000 };
Point ( 2957 ) = { 3.22914690, 6.42975870, 0.00000000 };
Point ( 2958 ) = { 3.22727602, 6.43069795, 0.00000000 };
Point ( 2959 ) = { 3.22540487, 6.43163665, 0.00000000 };
Point ( 2960 ) = { 3.22275039, 6.42867609, 0.00000000 };
Point ( 2961 ) = { 3.22009942, 6.42572005, 0.00000000 };
Point ( 2962 ) = { 3.21822972, 6.42665667, 0.00000000 };
Point ( 2963 ) = { 3.21635974, 6.42759274, 0.00000000 };
Point ( 2964 ) = { 3.21371321, 6.42463811, 0.00000000 };
Point ( 2965 ) = { 3.21106861, 6.42168485, 0.00000000 };
Point ( 2966 ) = { 3.20920094, 6.42261841, 0.00000000 };
Point ( 2967 ) = { 3.20655948, 6.41966753, 0.00000000 };
Point ( 2968 ) = { 3.20392151, 6.41672115, 0.00000000 };
Point ( 2969 ) = { 3.20205443, 6.41765306, 0.00000000 };
Point ( 2970 ) = { 3.19942044, 6.41470862, 0.00000000 };
Point ( 2971 ) = { 3.19678838, 6.41176554, 0.00000000 };
Point ( 2972 ) = { 3.19415900, 6.40882539, 0.00000000 };
Point ( 2973 ) = { 3.19077182, 6.40202928, 0.00000000 };
Point ( 2974 ) = { 3.18739013, 6.39524419, 0.00000000 };
Point ( 2975 ) = { 3.18401700, 6.38847628, 0.00000000 };
Point ( 2976 ) = { 3.18064933, 6.38171932, 0.00000000 };
Point ( 2977 ) = { 3.17728864, 6.37497637, 0.00000000 };
Point ( 2978 ) = { 3.17468516, 6.37207336, 0.00000000 };
Point ( 2979 ) = { 3.17208389, 6.36917342, 0.00000000 };
Point ( 2980 ) = { 3.16948527, 6.36627634, 0.00000000 };
Point ( 2981 ) = { 3.16763286, 6.36719823, 0.00000000 };
Point ( 2982 ) = { 3.16578104, 6.36811917, 0.00000000 };
Point ( 2983 ) = { 3.16392894, 6.36903956, 0.00000000 };
Point ( 2984 ) = { 3.16207574, 6.36995984, 0.00000000 };
Point ( 2985 ) = { 3.15948312, 6.36706259, 0.00000000 };
Point ( 2986 ) = { 3.15689237, 6.36416665, 0.00000000 };
Point ( 2987 ) = { 3.15504143, 6.36508446, 0.00000000 };
Point ( 2988 ) = { 3.15318937, 6.36600215, 0.00000000 };
Point ( 2989 ) = { 3.15133705, 6.36691930, 0.00000000 };
Point ( 2990 ) = { 3.14948530, 6.36783550, 0.00000000 };
Point ( 2991 ) = { 3.14763329, 6.36875115, 0.00000000 };
Point ( 2992 ) = { 3.14578017, 6.36966669, 0.00000000 };
Point ( 2993 ) = { 3.14319710, 6.36676909, 0.00000000 };
Point ( 2994 ) = { 3.14061666, 6.36387433, 0.00000000 };
Point ( 2995 ) = { 3.13876580, 6.36478741, 0.00000000 };
Point ( 2996 ) = { 3.13691468, 6.36569995, 0.00000000 };
Point ( 2997 ) = { 3.13433853, 6.36280654, 0.00000000 };
Point ( 2998 ) = { 3.13176574, 6.35991750, 0.00000000 };
Point ( 2999 ) = { 3.12919556, 6.35703129, 0.00000000 };
Point ( 3000 ) = { 3.12590925, 6.35035509, 0.00000000 };
Point ( 3001 ) = { 3.12519269, 6.34656910, 0.00000000 };
Point ( 3002 ) = { 3.12703909, 6.34565956, 0.00000000 };
Point ( 3003 ) = { 3.12632166, 6.34187775, 0.00000000 };
Point ( 3004 ) = { 3.12560413, 6.33809818, 0.00000000 };
Point ( 3005 ) = { 3.12744722, 6.33718893, 0.00000000 };
Point ( 3006 ) = { 3.12929090, 6.33627873, 0.00000000 };
Point ( 3007 ) = { 3.13113431, 6.33536799, 0.00000000 };
Point ( 3008 ) = { 3.13041413, 6.33159281, 0.00000000 };
Point ( 3009 ) = { 3.12969536, 6.32782290, 0.00000000 };
Point ( 3010 ) = { 3.13153547, 6.32691246, 0.00000000 };
Point ( 3011 ) = { 3.13337615, 6.32600107, 0.00000000 };
Point ( 3012 ) = { 3.13521657, 6.32508915, 0.00000000 };
Point ( 3013 ) = { 3.13705589, 6.32417711, 0.00000000 };
Point ( 3014 ) = { 3.13889577, 6.32326411, 0.00000000 };
Point ( 3015 ) = { 3.14146033, 6.32611944, 0.00000000 };
Point ( 3016 ) = { 3.14402822, 6.32897908, 0.00000000 };
Point ( 3017 ) = { 3.14586866, 6.32806448, 0.00000000 };
Point ( 3018 ) = { 3.14770884, 6.32714934, 0.00000000 };
Point ( 3019 ) = { 3.14954959, 6.32623324, 0.00000000 };
Point ( 3020 ) = { 3.15139008, 6.32531661, 0.00000000 };
Point ( 3021 ) = { 3.15322946, 6.32439987, 0.00000000 };
Point ( 3022 ) = { 3.15506857, 6.32348259, 0.00000000 };
Point ( 3023 ) = { 3.15690825, 6.32256435, 0.00000000 };
Point ( 3024 ) = { 3.15874767, 6.32164558, 0.00000000 };
Point ( 3025 ) = { 3.16058598, 6.32072669, 0.00000000 };
Point ( 3026 ) = { 3.16242402, 6.31980727, 0.00000000 };
Point ( 3027 ) = { 3.16500282, 6.32266222, 0.00000000 };
Point ( 3028 ) = { 3.16758347, 6.32551845, 0.00000000 };
Point ( 3029 ) = { 3.16942375, 6.32459657, 0.00000000 };
Point ( 3030 ) = { 3.17126292, 6.32367458, 0.00000000 };
Point ( 3031 ) = { 3.17310266, 6.32275163, 0.00000000 };
Point ( 3032 ) = { 3.17494213, 6.32182815, 0.00000000 };
Point ( 3033 ) = { 3.17678049, 6.32090455, 0.00000000 };
Point ( 3034 ) = { 3.17936748, 6.32376003, 0.00000000 };
Point ( 3035 ) = { 3.18195785, 6.32661982, 0.00000000 };
Point ( 3036 ) = { 3.18379845, 6.32569376, 0.00000000 };
Point ( 3037 ) = { 3.18639270, 6.32855539, 0.00000000 };
Point ( 3038 ) = { 3.18898880, 6.33141830, 0.00000000 };
Point ( 3039 ) = { 3.19082995, 6.33049062, 0.00000000 };
Point ( 3040 ) = { 3.19267083, 6.32956240, 0.00000000 };
Point ( 3041 ) = { 3.19451228, 6.32863323, 0.00000000 };
Point ( 3042 ) = { 3.19635347, 6.32770351, 0.00000000 };
Point ( 3043 ) = { 3.19895511, 6.33056642, 0.00000000 };
Point ( 3044 ) = { 3.20156017, 6.33343367, 0.00000000 };
Point ( 3045 ) = { 3.20340190, 6.33250233, 0.00000000 };
Point ( 3046 ) = { 3.20524421, 6.33157003, 0.00000000 };
Point ( 3047 ) = { 3.20708625, 6.33063720, 0.00000000 };
Point ( 3048 ) = { 3.20892717, 6.32970425, 0.00000000 };
Point ( 3049 ) = { 3.21076866, 6.32877035, 0.00000000 };
Point ( 3050 ) = { 3.21260988, 6.32783591, 0.00000000 };
Point ( 3051 ) = { 3.21444999, 6.32690136, 0.00000000 };
Point ( 3052 ) = { 3.21706353, 6.32976610, 0.00000000 };
Point ( 3053 ) = { 3.21967971, 6.33263367, 0.00000000 };
Point ( 3054 ) = { 3.22152206, 6.33169663, 0.00000000 };
Point ( 3055 ) = { 3.22336413, 6.33075906, 0.00000000 };
Point ( 3056 ) = { 3.22598464, 6.33362792, 0.00000000 };
Point ( 3057 ) = { 3.22860703, 6.33649808, 0.00000000 };
Point ( 3058 ) = { 3.23044966, 6.33555888, 0.00000000 };
Point ( 3059 ) = { 3.23307597, 6.33843088, 0.00000000 };
Point ( 3060 ) = { 3.23570496, 6.34130571, 0.00000000 };
Point ( 3061 ) = { 3.23754982, 6.34036402, 0.00000000 };
Point ( 3062 ) = { 3.24018190, 6.34324113, 0.00000000 };
Point ( 3063 ) = { 3.24281743, 6.34612262, 0.00000000 };
Point ( 3064 ) = { 3.24466285, 6.34517929, 0.00000000 };
Point ( 3065 ) = { 3.24730233, 6.34806264, 0.00000000 };
Point ( 3066 ) = { 3.24994450, 6.35094884, 0.00000000 };
Point ( 3067 ) = { 3.25179217, 6.35000300, 0.00000000 };
Point ( 3068 ) = { 3.25363873, 6.34905705, 0.00000000 };
Point ( 3069 ) = { 3.25548585, 6.34811013, 0.00000000 };
Point ( 3070 ) = { 3.25733270, 6.34716268, 0.00000000 };
Point ( 3071 ) = { 3.25998050, 6.35004887, 0.00000000 };
Point ( 3072 ) = { 3.26263020, 6.35293637, 0.00000000 };
Point ( 3073 ) = { 3.26447761, 6.35198728, 0.00000000 };
Point ( 3074 ) = { 3.26632558, 6.35103721, 0.00000000 };
Point ( 3075 ) = { 3.26817328, 6.35008660, 0.00000000 };
Point ( 3076 ) = { 3.27001986, 6.34913589, 0.00000000 };
Point ( 3077 ) = { 3.27186616, 6.34818464, 0.00000000 };
Point ( 3078 ) = { 3.27371303, 6.34723242, 0.00000000 };
Point ( 3079 ) = { 3.27555962, 6.34627967, 0.00000000 };
Point ( 3080 ) = { 3.27821791, 6.34916462, 0.00000000 };
Point ( 3081 ) = { 3.28087971, 6.35205397, 0.00000000 };
Point ( 3082 ) = { 3.28272686, 6.35109956, 0.00000000 };
Point ( 3083 ) = { 3.28457457, 6.35014418, 0.00000000 };
Point ( 3084 ) = { 3.28724120, 6.35303463, 0.00000000 };
Point ( 3085 ) = { 3.28990975, 6.35592639, 0.00000000 };
Point ( 3086 ) = { 3.29258061, 6.35882124, 0.00000000 };
Point ( 3087 ) = { 3.29608104, 6.36558148, 0.00000000 };
Point ( 3088 ) = { 3.29958718, 6.37235273, 0.00000000 };
Point ( 3089 ) = { 3.30041667, 6.37622519, 0.00000000 };
Point ( 3090 ) = { 3.30124652, 6.38010179, 0.00000000 };
Point ( 3091 ) = { 3.30207634, 6.38398076, 0.00000000 };
Point ( 3092 ) = { 3.30290694, 6.38786366, 0.00000000 };
Point ( 3093 ) = { 3.30373913, 6.39175206, 0.00000000 };
Point ( 3094 ) = { 3.30188016, 6.39271257, 0.00000000 };
Point ( 3095 ) = { 3.30271242, 6.39660494, 0.00000000 };
Point ( 3096 ) = { 3.30354466, 6.40049969, 0.00000000 };
Point ( 3097 ) = { 3.30168230, 6.40146059, 0.00000000 };
Point ( 3098 ) = { 3.29981965, 6.40242094, 0.00000000 };
Point ( 3099 ) = { 3.30065040, 6.40632014, 0.00000000 };
BSpline ( 5 ) = { 2920 : 3099, 2920 };
Line Loop( 5 ) = { 5 };


// == Ice-Land mass number 44 =====================================
Point ( 3100 ) = { 3.57160041, 6.21957344, 0.00000000 };
Point ( 3101 ) = { 3.56979068, 6.22061234, 0.00000000 };
Point ( 3102 ) = { 3.56798063, 6.22165071, 0.00000000 };
Point ( 3103 ) = { 3.56617112, 6.22268807, 0.00000000 };
Point ( 3104 ) = { 3.56436131, 6.22372491, 0.00000000 };
Point ( 3105 ) = { 3.56255036, 6.22476170, 0.00000000 };
Point ( 3106 ) = { 3.56073911, 6.22579796, 0.00000000 };
Point ( 3107 ) = { 3.55892839, 6.22683322, 0.00000000 };
Point ( 3108 ) = { 3.55711737, 6.22786796, 0.00000000 };
Point ( 3109 ) = { 3.55530522, 6.22890264, 0.00000000 };
Point ( 3110 ) = { 3.55349277, 6.22993679, 0.00000000 };
Point ( 3111 ) = { 3.55168085, 6.23096995, 0.00000000 };
Point ( 3112 ) = { 3.54986862, 6.23200257, 0.00000000 };
Point ( 3113 ) = { 3.54805527, 6.23303514, 0.00000000 };
Point ( 3114 ) = { 3.54624162, 6.23406719, 0.00000000 };
Point ( 3115 ) = { 3.54442849, 6.23509823, 0.00000000 };
Point ( 3116 ) = { 3.54261424, 6.23612922, 0.00000000 };
Point ( 3117 ) = { 3.53982527, 6.23333096, 0.00000000 };
Point ( 3118 ) = { 3.53703830, 6.23053396, 0.00000000 };
Point ( 3119 ) = { 3.53522620, 6.23156233, 0.00000000 };
Point ( 3120 ) = { 3.53341381, 6.23259017, 0.00000000 };
Point ( 3121 ) = { 3.53160028, 6.23361795, 0.00000000 };
Point ( 3122 ) = { 3.52978646, 6.23464521, 0.00000000 };
Point ( 3123 ) = { 3.52797317, 6.23567147, 0.00000000 };
Point ( 3124 ) = { 3.52615958, 6.23669720, 0.00000000 };
Point ( 3125 ) = { 3.52338033, 6.23389811, 0.00000000 };
Point ( 3126 ) = { 3.52060478, 6.23110331, 0.00000000 };
Point ( 3127 ) = { 3.51879169, 6.23212737, 0.00000000 };
Point ( 3128 ) = { 3.51697913, 6.23315043, 0.00000000 };
Point ( 3129 ) = { 3.51420844, 6.23035655, 0.00000000 };
Point ( 3130 ) = { 3.51143973, 6.22756392, 0.00000000 };
Point ( 3131 ) = { 3.50962767, 6.22858531, 0.00000000 };
Point ( 3132 ) = { 3.50781531, 6.22960617, 0.00000000 };
Point ( 3133 ) = { 3.50600349, 6.23062604, 0.00000000 };
Point ( 3134 ) = { 3.50419054, 6.23164585, 0.00000000 };
Point ( 3135 ) = { 3.50142748, 6.22885300, 0.00000000 };
Point ( 3136 ) = { 3.49866809, 6.22606441, 0.00000000 };
Point ( 3137 ) = { 3.49685729, 6.22708162, 0.00000000 };
Point ( 3138 ) = { 3.49504620, 6.22809830, 0.00000000 };
Point ( 3139 ) = { 3.49323399, 6.22911492, 0.00000000 };
Point ( 3140 ) = { 3.49142147, 6.23013102, 0.00000000 };
Point ( 3141 ) = { 3.48960950, 6.23114612, 0.00000000 };
Point ( 3142 ) = { 3.48779723, 6.23216069, 0.00000000 };
Point ( 3143 ) = { 3.48598383, 6.23317521, 0.00000000 };
Point ( 3144 ) = { 3.48323292, 6.23038377, 0.00000000 };
Point ( 3145 ) = { 3.48048397, 6.22759357, 0.00000000 };
Point ( 3146 ) = { 3.47867273, 6.22860549, 0.00000000 };
Point ( 3147 ) = { 3.47686120, 6.22961689, 0.00000000 };
Point ( 3148 ) = { 3.47504854, 6.23062822, 0.00000000 };
Point ( 3149 ) = { 3.47230482, 6.22783838, 0.00000000 };
Point ( 3150 ) = { 3.46956389, 6.22505129, 0.00000000 };
Point ( 3151 ) = { 3.46775339, 6.22606004, 0.00000000 };
Point ( 3152 ) = { 3.46501605, 6.22327490, 0.00000000 };
Point ( 3153 ) = { 3.46228233, 6.22049401, 0.00000000 };
Point ( 3154 ) = { 3.46047233, 6.22150110, 0.00000000 };
Point ( 3155 ) = { 3.45774261, 6.21872192, 0.00000000 };
Point ( 3156 ) = { 3.45501565, 6.21594547, 0.00000000 };
Point ( 3157 ) = { 3.45320780, 6.21694999, 0.00000000 };
Point ( 3158 ) = { 3.45048401, 6.21417571, 0.00000000 };
Point ( 3159 ) = { 3.44776213, 6.21140265, 0.00000000 };
Point ( 3160 ) = { 3.44595478, 6.21240551, 0.00000000 };
Point ( 3161 ) = { 3.44323688, 6.20963416, 0.00000000 };
Point ( 3162 ) = { 3.44052174, 6.20686553, 0.00000000 };
Point ( 3163 ) = { 3.43871653, 6.20786583, 0.00000000 };
Point ( 3164 ) = { 3.43600453, 6.20509935, 0.00000000 };
Point ( 3165 ) = { 3.43329610, 6.20233707, 0.00000000 };
Point ( 3166 ) = { 3.43149138, 6.20333573, 0.00000000 };
Point ( 3167 ) = { 3.42878690, 6.20057514, 0.00000000 };
Point ( 3168 ) = { 3.42608432, 6.19781577, 0.00000000 };
Point ( 3169 ) = { 3.42428174, 6.19881187, 0.00000000 };
Point ( 3170 ) = { 3.42158229, 6.19605464, 0.00000000 };
Point ( 3171 ) = { 3.41888638, 6.19330159, 0.00000000 };
Point ( 3172 ) = { 3.41619318, 6.19055124, 0.00000000 };
Point ( 3173 ) = { 3.41261269, 6.18406297, 0.00000000 };
Point ( 3174 ) = { 3.40904119, 6.17759098, 0.00000000 };
Point ( 3175 ) = { 3.40815555, 6.17386274, 0.00000000 };
Point ( 3176 ) = { 3.40727073, 6.17013821, 0.00000000 };
Point ( 3177 ) = { 3.40638754, 6.16641885, 0.00000000 };
Point ( 3178 ) = { 3.40550475, 6.16270341, 0.00000000 };
Point ( 3179 ) = { 3.40462196, 6.15899018, 0.00000000 };
Point ( 3180 ) = { 3.40641296, 6.15799979, 0.00000000 };
Point ( 3181 ) = { 3.40553031, 6.15429027, 0.00000000 };
Point ( 3182 ) = { 3.40464929, 6.15058589, 0.00000000 };
Point ( 3183 ) = { 3.40643866, 6.14959504, 0.00000000 };
Point ( 3184 ) = { 3.40822692, 6.14860413, 0.00000000 };
Point ( 3185 ) = { 3.40734415, 6.14490415, 0.00000000 };
Point ( 3186 ) = { 3.40646138, 6.14120637, 0.00000000 };
Point ( 3187 ) = { 3.40824802, 6.14021500, 0.00000000 };
Point ( 3188 ) = { 3.41003437, 6.13922311, 0.00000000 };
Point ( 3189 ) = { 3.41181962, 6.13823115, 0.00000000 };
Point ( 3190 ) = { 3.41360458, 6.13723868, 0.00000000 };
Point ( 3191 ) = { 3.41539007, 6.13624523, 0.00000000 };
Point ( 3192 ) = { 3.41717526, 6.13525126, 0.00000000 };
Point ( 3193 ) = { 3.41895936, 6.13425723, 0.00000000 };
Point ( 3194 ) = { 3.42074398, 6.13326222, 0.00000000 };
Point ( 3195 ) = { 3.42252831, 6.13226669, 0.00000000 };
Point ( 3196 ) = { 3.42431153, 6.13127110, 0.00000000 };
Point ( 3197 ) = { 3.42609446, 6.13027500, 0.00000000 };
Point ( 3198 ) = { 3.42787792, 6.12927791, 0.00000000 };
Point ( 3199 ) = { 3.42966109, 6.12828031, 0.00000000 };
Point ( 3200 ) = { 3.43144316, 6.12728265, 0.00000000 };
Point ( 3201 ) = { 3.43322493, 6.12628447, 0.00000000 };
Point ( 3202 ) = { 3.43500723, 6.12528531, 0.00000000 };
Point ( 3203 ) = { 3.43678924, 6.12428563, 0.00000000 };
Point ( 3204 ) = { 3.43857014, 6.12328590, 0.00000000 };
Point ( 3205 ) = { 3.44035075, 6.12228564, 0.00000000 };
Point ( 3206 ) = { 3.44213189, 6.12128441, 0.00000000 };
Point ( 3207 ) = { 3.44391273, 6.12028266, 0.00000000 };
Point ( 3208 ) = { 3.44569247, 6.11928086, 0.00000000 };
Point ( 3209 ) = { 3.44747273, 6.11827807, 0.00000000 };
Point ( 3210 ) = { 3.44656648, 6.11458970, 0.00000000 };
Point ( 3211 ) = { 3.44566106, 6.11090497, 0.00000000 };
Point ( 3212 ) = { 3.44743807, 6.10990265, 0.00000000 };
Point ( 3213 ) = { 3.44921479, 6.10889982, 0.00000000 };
Point ( 3214 ) = { 3.45099203, 6.10789601, 0.00000000 };
Point ( 3215 ) = { 3.45276898, 6.10689169, 0.00000000 };
Point ( 3216 ) = { 3.45454482, 6.10588730, 0.00000000 };
Point ( 3217 ) = { 3.45632037, 6.10488241, 0.00000000 };
Point ( 3218 ) = { 3.45900936, 6.10755941, 0.00000000 };
Point ( 3219 ) = { 3.46170105, 6.11023900, 0.00000000 };
Point ( 3220 ) = { 3.46347868, 6.10923156, 0.00000000 };
Point ( 3221 ) = { 3.46525520, 6.10822406, 0.00000000 };
Point ( 3222 ) = { 3.46703143, 6.10721605, 0.00000000 };
Point ( 3223 ) = { 3.46972815, 6.10989589, 0.00000000 };
Point ( 3224 ) = { 3.47242674, 6.11257688, 0.00000000 };
Point ( 3225 ) = { 3.47420505, 6.11156631, 0.00000000 };
Point ( 3226 ) = { 3.47690672, 6.11424935, 0.00000000 };
Point ( 3227 ) = { 3.47961193, 6.11693645, 0.00000000 };
Point ( 3228 ) = { 3.48139151, 6.11592379, 0.00000000 };
Point ( 3229 ) = { 3.48410063, 6.11861248, 0.00000000 };
Point ( 3230 ) = { 3.48681163, 6.12130233, 0.00000000 };
Point ( 3231 ) = { 3.48859166, 6.12028804, 0.00000000 };
Point ( 3232 ) = { 3.49037140, 6.11927324, 0.00000000 };
Point ( 3233 ) = { 3.49308670, 6.12196412, 0.00000000 };
Point ( 3234 ) = { 3.49580555, 6.12465909, 0.00000000 };
Point ( 3235 ) = { 3.49758738, 6.12364172, 0.00000000 };
Point ( 3236 ) = { 3.50030935, 6.12633876, 0.00000000 };
Point ( 3237 ) = { 3.50303322, 6.12903695, 0.00000000 };
Point ( 3238 ) = { 3.50575983, 6.13173778, 0.00000000 };
Point ( 3239 ) = { 3.50849003, 6.13444271, 0.00000000 };
Point ( 3240 ) = { 3.51122339, 6.13715005, 0.00000000 };
Point ( 3241 ) = { 3.51490937, 6.14359265, 0.00000000 };
Point ( 3242 ) = { 3.51860463, 6.15005147, 0.00000000 };
Point ( 3243 ) = { 3.51955909, 6.15379648, 0.00000000 };
Point ( 3244 ) = { 3.52051485, 6.15754499, 0.00000000 };
Point ( 3245 ) = { 3.52147234, 6.16129873, 0.00000000 };
Point ( 3246 ) = { 3.52243074, 6.16505623, 0.00000000 };
Point ( 3247 ) = { 3.52339003, 6.16881750, 0.00000000 };
Point ( 3248 ) = { 3.52434981, 6.17258276, 0.00000000 };
Point ( 3249 ) = { 3.52530964, 6.17635032, 0.00000000 };
Point ( 3250 ) = { 3.52627037, 6.18012165, 0.00000000 };
Point ( 3251 ) = { 3.52999469, 6.18664887, 0.00000000 };
Point ( 3252 ) = { 3.53276104, 6.18940519, 0.00000000 };
Point ( 3253 ) = { 3.53553021, 6.19216423, 0.00000000 };
Point ( 3254 ) = { 3.53830219, 6.19492599, 0.00000000 };
Point ( 3255 ) = { 3.54107658, 6.19769071, 0.00000000 };
Point ( 3256 ) = { 3.54385294, 6.20045666, 0.00000000 };
Point ( 3257 ) = { 3.54565599, 6.19942578, 0.00000000 };
Point ( 3258 ) = { 3.54745957, 6.19839391, 0.00000000 };
Point ( 3259 ) = { 3.54926284, 6.19736151, 0.00000000 };
Point ( 3260 ) = { 3.55204444, 6.20012776, 0.00000000 };
Point ( 3261 ) = { 3.55482974, 6.20289826, 0.00000000 };
Point ( 3262 ) = { 3.55663350, 6.20186419, 0.00000000 };
Point ( 3263 ) = { 3.55843779, 6.20082912, 0.00000000 };
Point ( 3264 ) = { 3.56024177, 6.19979353, 0.00000000 };
Point ( 3265 ) = { 3.56204462, 6.19875789, 0.00000000 };
Point ( 3266 ) = { 3.56483640, 6.20152764, 0.00000000 };
Point ( 3267 ) = { 3.56763016, 6.20429863, 0.00000000 };
Point ( 3268 ) = { 3.57042678, 6.20707236, 0.00000000 };
Point ( 3269 ) = { 3.57142021, 6.21088971, 0.00000000 };
Point ( 3270 ) = { 3.56961299, 6.21192856, 0.00000000 };
Point ( 3271 ) = { 3.57060667, 6.21574982, 0.00000000 };
BSpline ( 6 ) = { 3100 : 3271, 3100 };
Line Loop( 6 ) = { 6 };


// == Ice-Land mass number 47 =====================================
Point ( 3272 ) = { 4.52512208, 5.87599111, 0.00000000 };
Point ( 3273 ) = { 4.52341227, 5.87730744, 0.00000000 };
Point ( 3274 ) = { 4.52170285, 5.87862268, 0.00000000 };
Point ( 3275 ) = { 4.51999306, 5.87993742, 0.00000000 };
Point ( 3276 ) = { 4.51828210, 5.88125227, 0.00000000 };
Point ( 3277 ) = { 4.51657075, 5.88256661, 0.00000000 };
Point ( 3278 ) = { 4.51485981, 5.88387986, 0.00000000 };
Point ( 3279 ) = { 4.51314849, 5.88519261, 0.00000000 };
Point ( 3280 ) = { 4.51143600, 5.88650546, 0.00000000 };
Point ( 3281 ) = { 4.50972313, 5.88781782, 0.00000000 };
Point ( 3282 ) = { 4.50801066, 5.88912907, 0.00000000 };
Point ( 3283 ) = { 4.50468000, 5.88655122, 0.00000000 };
Point ( 3284 ) = { 4.50135398, 5.88397748, 0.00000000 };
Point ( 3285 ) = { 4.49964184, 5.88528690, 0.00000000 };
Point ( 3286 ) = { 4.49792933, 5.88659582, 0.00000000 };
Point ( 3287 ) = { 4.49621721, 5.88790365, 0.00000000 };
Point ( 3288 ) = { 4.49289655, 5.88532994, 0.00000000 };
Point ( 3289 ) = { 4.48957826, 5.88275739, 0.00000000 };
Point ( 3290 ) = { 4.48786648, 5.88406339, 0.00000000 };
Point ( 3291 ) = { 4.48615510, 5.88536829, 0.00000000 };
Point ( 3292 ) = { 4.48284219, 5.88279614, 0.00000000 };
Point ( 3293 ) = { 4.47953389, 5.88022810, 0.00000000 };
Point ( 3294 ) = { 4.47782284, 5.88153117, 0.00000000 };
Point ( 3295 ) = { 4.47611142, 5.88283375, 0.00000000 };
Point ( 3296 ) = { 4.47280808, 5.88026640, 0.00000000 };
Point ( 3297 ) = { 4.46791798, 5.87383753, 0.00000000 };
Point ( 3298 ) = { 4.46462429, 5.87127899, 0.00000000 };
Point ( 3299 ) = { 4.46133406, 5.86872306, 0.00000000 };
Point ( 3300 ) = { 4.45646676, 5.86232030, 0.00000000 };
Point ( 3301 ) = { 4.45160987, 5.85593125, 0.00000000 };
Point ( 3302 ) = { 4.44833535, 5.85339019, 0.00000000 };
Point ( 3303 ) = { 4.44506386, 5.85085201, 0.00000000 };
Point ( 3304 ) = { 4.44179578, 5.84831640, 0.00000000 };
Point ( 3305 ) = { 4.44009402, 5.84960850, 0.00000000 };
Point ( 3306 ) = { 4.43683049, 5.84707421, 0.00000000 };
Point ( 3307 ) = { 4.43356925, 5.84454104, 0.00000000 };
Point ( 3308 ) = { 4.43031141, 5.84201044, 0.00000000 };
Point ( 3309 ) = { 4.42875501, 5.83819469, 0.00000000 };
Point ( 3310 ) = { 4.42720015, 5.83438289, 0.00000000 };
Point ( 3311 ) = { 4.42564794, 5.83057648, 0.00000000 };
Point ( 3312 ) = { 4.42734416, 5.82928859, 0.00000000 };
Point ( 3313 ) = { 4.42579277, 5.82548629, 0.00000000 };
Point ( 3314 ) = { 4.42424182, 5.82168647, 0.00000000 };
Point ( 3315 ) = { 4.42593468, 5.82039957, 0.00000000 };
Point ( 3316 ) = { 4.42762717, 5.81911219, 0.00000000 };
Point ( 3317 ) = { 4.42932005, 5.81782372, 0.00000000 };
Point ( 3318 ) = { 4.42776733, 5.81402919, 0.00000000 };
Point ( 3319 ) = { 4.42621725, 5.81024001, 0.00000000 };
Point ( 3320 ) = { 4.42790678, 5.80895255, 0.00000000 };
Point ( 3321 ) = { 4.42959593, 5.80766459, 0.00000000 };
Point ( 3322 ) = { 4.43128549, 5.80637555, 0.00000000 };
Point ( 3323 ) = { 4.43297467, 5.80508602, 0.00000000 };
Point ( 3324 ) = { 4.43142133, 5.80130286, 0.00000000 };
Point ( 3325 ) = { 4.42986843, 5.79752217, 0.00000000 };
Point ( 3326 ) = { 4.43155503, 5.79623305, 0.00000000 };
Point ( 3327 ) = { 4.43324126, 5.79494344, 0.00000000 };
Point ( 3328 ) = { 4.43492634, 5.79365393, 0.00000000 };
Point ( 3329 ) = { 4.43661105, 5.79236394, 0.00000000 };
Point ( 3330 ) = { 4.43505568, 5.78858866, 0.00000000 };
Point ( 3331 ) = { 4.43350295, 5.78481870, 0.00000000 };
Point ( 3332 ) = { 4.43518585, 5.78352852, 0.00000000 };
Point ( 3333 ) = { 4.43686761, 5.78223845, 0.00000000 };
Point ( 3334 ) = { 4.43854900, 5.78094789, 0.00000000 };
Point ( 3335 ) = { 4.44023078, 5.77965625, 0.00000000 };
Point ( 3336 ) = { 4.43867520, 5.77589198, 0.00000000 };
Point ( 3337 ) = { 4.43712006, 5.77213017, 0.00000000 };
Point ( 3338 ) = { 4.43879851, 5.77083953, 0.00000000 };
Point ( 3339 ) = { 4.44047658, 5.76954841, 0.00000000 };
Point ( 3340 ) = { 4.44215504, 5.76825621, 0.00000000 };
Point ( 3341 ) = { 4.44383313, 5.76696351, 0.00000000 };
Point ( 3342 ) = { 4.44227477, 5.76320768, 0.00000000 };
Point ( 3343 ) = { 4.44071904, 5.75945713, 0.00000000 };
Point ( 3344 ) = { 4.44239457, 5.75816485, 0.00000000 };
Point ( 3345 ) = { 4.44406972, 5.75687209, 0.00000000 };
Point ( 3346 ) = { 4.44574373, 5.75557944, 0.00000000 };
Point ( 3347 ) = { 4.44741737, 5.75428630, 0.00000000 };
Point ( 3348 ) = { 4.44909139, 5.75299208, 0.00000000 };
Point ( 3349 ) = { 4.45076504, 5.75169737, 0.00000000 };
Point ( 3350 ) = { 4.45243754, 5.75040277, 0.00000000 };
Point ( 3351 ) = { 4.45410967, 5.74910768, 0.00000000 };
Point ( 3352 ) = { 4.45578218, 5.74781151, 0.00000000 };
Point ( 3353 ) = { 4.45745432, 5.74651485, 0.00000000 };
Point ( 3354 ) = { 4.45912532, 5.74521831, 0.00000000 };
Point ( 3355 ) = { 4.46079594, 5.74392127, 0.00000000 };
Point ( 3356 ) = { 4.46246695, 5.74262316, 0.00000000 };
Point ( 3357 ) = { 4.46413758, 5.74132456, 0.00000000 };
Point ( 3358 ) = { 4.46580706, 5.74002607, 0.00000000 };
Point ( 3359 ) = { 4.46747694, 5.73872650, 0.00000000 };
Point ( 3360 ) = { 4.46914643, 5.73742644, 0.00000000 };
Point ( 3361 ) = { 4.46757373, 5.73368748, 0.00000000 };
Point ( 3362 ) = { 4.46600148, 5.72995094, 0.00000000 };
Point ( 3363 ) = { 4.46766766, 5.72865191, 0.00000000 };
Point ( 3364 ) = { 4.46933422, 5.72735180, 0.00000000 };
Point ( 3365 ) = { 4.47100041, 5.72605120, 0.00000000 };
Point ( 3366 ) = { 4.47266545, 5.72475072, 0.00000000 };
Point ( 3367 ) = { 4.47433012, 5.72344975, 0.00000000 };
Point ( 3368 ) = { 4.47599441, 5.72214829, 0.00000000 };
Point ( 3369 ) = { 4.47765984, 5.72084516, 0.00000000 };
Point ( 3370 ) = { 4.47932337, 5.71954274, 0.00000000 };
Point ( 3371 ) = { 4.48098652, 5.71823983, 0.00000000 };
Point ( 3372 ) = { 4.48265082, 5.71693525, 0.00000000 };
Point ( 3373 ) = { 4.48431321, 5.71563138, 0.00000000 };
Point ( 3374 ) = { 4.48756051, 5.71805804, 0.00000000 };
Point ( 3375 ) = { 4.49081006, 5.72048573, 0.00000000 };
Point ( 3376 ) = { 4.49247349, 5.71917949, 0.00000000 };
Point ( 3377 ) = { 4.49413805, 5.71787156, 0.00000000 };
Point ( 3378 ) = { 4.49739238, 5.72029979, 0.00000000 };
Point ( 3379 ) = { 4.50224819, 5.72647596, 0.00000000 };
Point ( 3380 ) = { 4.50384566, 5.73022251, 0.00000000 };
Point ( 3381 ) = { 4.50544396, 5.73397351, 0.00000000 };
Point ( 3382 ) = { 4.50704495, 5.73772981, 0.00000000 };
Point ( 3383 ) = { 4.50864830, 5.74148939, 0.00000000 };
Point ( 3384 ) = { 4.51025212, 5.74525143, 0.00000000 };
Point ( 3385 ) = { 4.50858111, 5.74656284, 0.00000000 };
Point ( 3386 ) = { 4.51018543, 5.75032924, 0.00000000 };
Point ( 3387 ) = { 4.51179246, 5.75410096, 0.00000000 };
Point ( 3388 ) = { 4.51011734, 5.75541402, 0.00000000 };
Point ( 3389 ) = { 4.50844338, 5.75672540, 0.00000000 };
Point ( 3390 ) = { 4.51004981, 5.76050196, 0.00000000 };
Point ( 3391 ) = { 4.51165672, 5.76428100, 0.00000000 };
Point ( 3392 ) = { 4.50997864, 5.76559402, 0.00000000 };
Point ( 3393 ) = { 4.51158605, 5.76937745, 0.00000000 };
Point ( 3394 ) = { 4.51319618, 5.77316623, 0.00000000 };
Point ( 3395 ) = { 4.51480792, 5.77695895, 0.00000000 };
Point ( 3396 ) = { 4.51642126, 5.78075560, 0.00000000 };
Point ( 3397 ) = { 4.51473993, 5.78206881, 0.00000000 };
Point ( 3398 ) = { 4.51635339, 5.78587017, 0.00000000 };
Point ( 3399 ) = { 4.51796734, 5.78967405, 0.00000000 };
Point ( 3400 ) = { 4.51958290, 5.79348188, 0.00000000 };
Point ( 3401 ) = { 4.52120008, 5.79729368, 0.00000000 };
Point ( 3402 ) = { 4.51951393, 5.79860828, 0.00000000 };
Point ( 3403 ) = { 4.51782741, 5.79992238, 0.00000000 };
Point ( 3404 ) = { 4.51944398, 5.80373908, 0.00000000 };
Point ( 3405 ) = { 4.52106330, 5.80756121, 0.00000000 };
Point ( 3406 ) = { 4.51937340, 5.80887637, 0.00000000 };
Point ( 3407 ) = { 4.51768388, 5.81019043, 0.00000000 };
Point ( 3408 ) = { 4.51599321, 5.81150461, 0.00000000 };
Point ( 3409 ) = { 4.51761082, 5.81533213, 0.00000000 };
Point ( 3410 ) = { 4.51923004, 5.81916365, 0.00000000 };
Point ( 3411 ) = { 4.51753754, 5.82047767, 0.00000000 };
Point ( 3412 ) = { 4.51584465, 5.82179120, 0.00000000 };
Point ( 3413 ) = { 4.51415061, 5.82310484, 0.00000000 };
Point ( 3414 ) = { 4.51576811, 5.82694177, 0.00000000 };
Point ( 3415 ) = { 4.51738610, 5.83078125, 0.00000000 };
Point ( 3416 ) = { 4.51569022, 5.83209473, 0.00000000 };
Point ( 3417 ) = { 4.51730911, 5.83593839, 0.00000000 };
Point ( 3418 ) = { 4.51893075, 5.83978752, 0.00000000 };
Point ( 3419 ) = { 4.51723147, 5.84110206, 0.00000000 };
Point ( 3420 ) = { 4.51885324, 5.84495599, 0.00000000 };
Point ( 3421 ) = { 4.52047550, 5.84881249, 0.00000000 };
Point ( 3422 ) = { 4.52209979, 5.85267273, 0.00000000 };
Point ( 3423 ) = { 4.52372684, 5.85653848, 0.00000000 };
Point ( 3424 ) = { 4.52202347, 5.85785381, 0.00000000 };
Point ( 3425 ) = { 4.52365065, 5.86172438, 0.00000000 };
Point ( 3426 ) = { 4.52527834, 5.86559754, 0.00000000 };
Point ( 3427 ) = { 4.52357155, 5.86691393, 0.00000000 };
Point ( 3428 ) = { 4.52186516, 5.86822921, 0.00000000 };
Point ( 3429 ) = { 4.52349223, 5.87210738, 0.00000000 };
BSpline ( 7 ) = { 3272 : 3429, 3272 };
Line Loop( 7 ) = { 7 };


// == Ice-Land mass number 51 =====================================
Point ( 3430 ) = { 0.01957054, 6.72793965, 0.00000000 };
Point ( 3431 ) = { 0.01761394, 6.72794506, 0.00000000 };
Point ( 3432 ) = { 0.01565644, 6.72794990, 0.00000000 };
Point ( 3433 ) = { 0.01369984, 6.72795417, 0.00000000 };
Point ( 3434 ) = { 0.01174233, 6.72795787, 0.00000000 };
Point ( 3435 ) = { 0.00978573, 6.72796100, 0.00000000 };
Point ( 3436 ) = { 0.00782823, 6.72796356, 0.00000000 };
Point ( 3437 ) = { 0.00587162, 6.72796555, 0.00000000 };
Point ( 3438 ) = { 0.00391411, 6.72796698, 0.00000000 };
Point ( 3439 ) = { 0.00195750, 6.72796783, 0.00000000 };
Point ( 3440 ) = { 0.00000000, 6.72796812, 0.00000000 };
Point ( 3441 ) = { -0.00195750, 6.72796783, 0.00000000 };
Point ( 3442 ) = { -0.00391411, 6.72796698, 0.00000000 };
Point ( 3443 ) = { -0.00587162, 6.72796555, 0.00000000 };
Point ( 3444 ) = { -0.00782823, 6.72796356, 0.00000000 };
Point ( 3445 ) = { -0.00978573, 6.72796100, 0.00000000 };
Point ( 3446 ) = { -0.01174233, 6.72795787, 0.00000000 };
Point ( 3447 ) = { -0.01369984, 6.72795417, 0.00000000 };
Point ( 3448 ) = { -0.01565644, 6.72794990, 0.00000000 };
Point ( 3449 ) = { -0.01761394, 6.72794506, 0.00000000 };
Point ( 3450 ) = { -0.01957054, 6.72793965, 0.00000000 };
Point ( 3451 ) = { -0.02152804, 6.72793367, 0.00000000 };
Point ( 3452 ) = { -0.02348463, 6.72792713, 0.00000000 };
Point ( 3453 ) = { -0.02544212, 6.72792001, 0.00000000 };
Point ( 3454 ) = { -0.02739872, 6.72791233, 0.00000000 };
Point ( 3455 ) = { -0.02935621, 6.72790407, 0.00000000 };
Point ( 3456 ) = { -0.03131369, 6.72789525, 0.00000000 };
Point ( 3457 ) = { -0.03327028, 6.72788585, 0.00000000 };
Point ( 3458 ) = { -0.03522776, 6.72787589, 0.00000000 };
Point ( 3459 ) = { -0.03718434, 6.72786536, 0.00000000 };
Point ( 3460 ) = { -0.03914181, 6.72785426, 0.00000000 };
Point ( 3461 ) = { -0.04109838, 6.72784259, 0.00000000 };
Point ( 3462 ) = { -0.04305585, 6.72783035, 0.00000000 };
Point ( 3463 ) = { -0.04501242, 6.72781754, 0.00000000 };
Point ( 3464 ) = { -0.04596816, 6.72444894, 0.00000000 };
Point ( 3465 ) = { -0.04692295, 6.72108195, 0.00000000 };
Point ( 3466 ) = { -0.04887755, 6.72106802, 0.00000000 };
Point ( 3467 ) = { -0.05083304, 6.72105352, 0.00000000 };
Point ( 3468 ) = { -0.05278764, 6.72103845, 0.00000000 };
Point ( 3469 ) = { -0.05474313, 6.72102281, 0.00000000 };
Point ( 3470 ) = { -0.05569259, 6.71765786, 0.00000000 };
Point ( 3471 ) = { -0.05563704, 6.71095694, 0.00000000 };
Point ( 3472 ) = { -0.05463394, 6.70761786, 0.00000000 };
Point ( 3473 ) = { -0.05363140, 6.70428190, 0.00000000 };
Point ( 3474 ) = { -0.05357798, 6.69760400, 0.00000000 };
Point ( 3475 ) = { -0.05352469, 6.69094215, 0.00000000 };
Point ( 3476 ) = { -0.05447096, 6.68760824, 0.00000000 };
Point ( 3477 ) = { -0.05541585, 6.68427742, 0.00000000 };
Point ( 3478 ) = { -0.05635978, 6.68094818, 0.00000000 };
Point ( 3479 ) = { -0.05830361, 6.68093150, 0.00000000 };
Point ( 3480 ) = { -0.06024742, 6.68091425, 0.00000000 };
Point ( 3481 ) = { -0.06118848, 6.67758756, 0.00000000 };
Point ( 3482 ) = { -0.06212861, 6.67426395, 0.00000000 };
Point ( 3483 ) = { -0.06306824, 6.67094343, 0.00000000 };
Point ( 3484 ) = { -0.06300574, 6.66433325, 0.00000000 };
Point ( 3485 ) = { -0.06200551, 6.66104054, 0.00000000 };
Point ( 3486 ) = { -0.06100671, 6.65775088, 0.00000000 };
Point ( 3487 ) = { -0.06000891, 6.65446577, 0.00000000 };
Point ( 3488 ) = { -0.05807279, 6.65448295, 0.00000000 };
Point ( 3489 ) = { -0.05707649, 6.65120059, 0.00000000 };
Point ( 3490 ) = { -0.05608116, 6.64791975, 0.00000000 };
Point ( 3491 ) = { -0.05414783, 6.64793578, 0.00000000 };
Point ( 3492 ) = { -0.05221361, 6.64795125, 0.00000000 };
Point ( 3493 ) = { -0.05028027, 6.64796616, 0.00000000 };
Point ( 3494 ) = { -0.04834604, 6.64798051, 0.00000000 };
Point ( 3495 ) = { -0.04735594, 6.64470155, 0.00000000 };
Point ( 3496 ) = { -0.04636684, 6.64142711, 0.00000000 };
Point ( 3497 ) = { -0.04443451, 6.64144032, 0.00000000 };
Point ( 3498 ) = { -0.04250306, 6.64145297, 0.00000000 };
Point ( 3499 ) = { -0.04057073, 6.64146505, 0.00000000 };
Point ( 3500 ) = { -0.03863928, 6.64147657, 0.00000000 };
Point ( 3501 ) = { -0.03670693, 6.64148753, 0.00000000 };
Point ( 3502 ) = { -0.03477547, 6.64149792, 0.00000000 };
Point ( 3503 ) = { -0.03284313, 6.64150776, 0.00000000 };
Point ( 3504 ) = { -0.03091166, 6.64151703, 0.00000000 };
Point ( 3505 ) = { -0.02897931, 6.64152574, 0.00000000 };
Point ( 3506 ) = { -0.02704695, 6.64153389, 0.00000000 };
Point ( 3507 ) = { -0.02511548, 6.64154148, 0.00000000 };
Point ( 3508 ) = { -0.02318312, 6.64154851, 0.00000000 };
Point ( 3509 ) = { -0.02222836, 6.64483311, 0.00000000 };
Point ( 3510 ) = { -0.02127265, 6.64812226, 0.00000000 };
Point ( 3511 ) = { -0.01933838, 6.64812817, 0.00000000 };
Point ( 3512 ) = { -0.01838077, 6.65142008, 0.00000000 };
Point ( 3513 ) = { -0.01839897, 6.65800496, 0.00000000 };
Point ( 3514 ) = { -0.01743948, 6.66130630, 0.00000000 };
Point ( 3515 ) = { -0.01647859, 6.66461070, 0.00000000 };
Point ( 3516 ) = { -0.01551674, 6.66791665, 0.00000000 };
Point ( 3517 ) = { -0.01357759, 6.66792089, 0.00000000 };
Point ( 3518 ) = { -0.01163756, 6.66792455, 0.00000000 };
Point ( 3519 ) = { -0.01067327, 6.67123301, 0.00000000 };
Point ( 3520 ) = { -0.00970804, 6.67454605, 0.00000000 };
Point ( 3521 ) = { -0.00776607, 6.67454859, 0.00000000 };
Point ( 3522 ) = { -0.00679891, 6.67786443, 0.00000000 };
Point ( 3523 ) = { -0.00583079, 6.68118335, 0.00000000 };
Point ( 3524 ) = { -0.00388690, 6.68118477, 0.00000000 };
Point ( 3525 ) = { -0.00194389, 6.68118561, 0.00000000 };
Point ( 3526 ) = { 0.00000000, 6.68118590, 0.00000000 };
Point ( 3527 ) = { 0.00194389, 6.68118561, 0.00000000 };
Point ( 3528 ) = { 0.00388690, 6.68118477, 0.00000000 };
Point ( 3529 ) = { 0.00583079, 6.68118335, 0.00000000 };
Point ( 3530 ) = { 0.00777379, 6.68118138, 0.00000000 };
Point ( 3531 ) = { 0.00971768, 6.68117883, 0.00000000 };
Point ( 3532 ) = { 0.01166069, 6.68117572, 0.00000000 };
Point ( 3533 ) = { 0.01360458, 6.68117205, 0.00000000 };
Point ( 3534 ) = { 0.01554757, 6.68116781, 0.00000000 };
Point ( 3535 ) = { 0.01749146, 6.68116300, 0.00000000 };
Point ( 3536 ) = { 0.01943446, 6.68115763, 0.00000000 };
Point ( 3537 ) = { 0.02137834, 6.68115169, 0.00000000 };
Point ( 3538 ) = { 0.02332134, 6.68114519, 0.00000000 };
Point ( 3539 ) = { 0.02526522, 6.68113813, 0.00000000 };
Point ( 3540 ) = { 0.02720820, 6.68113050, 0.00000000 };
Point ( 3541 ) = { 0.02915208, 6.68112230, 0.00000000 };
Point ( 3542 ) = { 0.03013899, 6.68443918, 0.00000000 };
Point ( 3543 ) = { 0.03112688, 6.68775763, 0.00000000 };
Point ( 3544 ) = { 0.03307179, 6.68774829, 0.00000000 };
Point ( 3545 ) = { 0.03501759, 6.68773839, 0.00000000 };
Point ( 3546 ) = { 0.03600795, 6.69105935, 0.00000000 };
Point ( 3547 ) = { 0.03604380, 6.69772132, 0.00000000 };
Point ( 3548 ) = { 0.03607974, 6.70439933, 0.00000000 };
Point ( 3549 ) = { 0.03512237, 6.70774840, 0.00000000 };
Point ( 3550 ) = { 0.03416359, 6.71110060, 0.00000000 };
Point ( 3551 ) = { 0.03320386, 6.71445441, 0.00000000 };
Point ( 3552 ) = { 0.03125118, 6.71446378, 0.00000000 };
Point ( 3553 ) = { 0.02929760, 6.71447259, 0.00000000 };
Point ( 3554 ) = { 0.02833495, 6.71782896, 0.00000000 };
Point ( 3555 ) = { 0.02737134, 6.72119001, 0.00000000 };
Point ( 3556 ) = { 0.02541670, 6.72119769, 0.00000000 };
Point ( 3557 ) = { 0.02346117, 6.72120480, 0.00000000 };
Point ( 3558 ) = { 0.02150653, 6.72121134, 0.00000000 };
Point ( 3559 ) = { 0.02053902, 6.72457469, 0.00000000 };
BSpline ( 8 ) = { 3430 : 3559, 3430 };
Line Loop( 8 ) = { 8 };


// == Ice-Land mass number 56 =====================================
Point ( 3560 ) = { 0.58291105, 6.53139226, 0.00000000 };
Point ( 3561 ) = { 0.58101159, 6.53156150, 0.00000000 };
Point ( 3562 ) = { 0.57911120, 6.53173027, 0.00000000 };
Point ( 3563 ) = { 0.57721164, 6.53189841, 0.00000000 };
Point ( 3564 ) = { 0.57531116, 6.53206608, 0.00000000 };
Point ( 3565 ) = { 0.57341150, 6.53223311, 0.00000000 };
Point ( 3566 ) = { 0.57151092, 6.53239967, 0.00000000 };
Point ( 3567 ) = { 0.56961029, 6.53256567, 0.00000000 };
Point ( 3568 ) = { 0.56771048, 6.53273105, 0.00000000 };
Point ( 3569 ) = { 0.56580976, 6.53289595, 0.00000000 };
Point ( 3570 ) = { 0.56390986, 6.53306022, 0.00000000 };
Point ( 3571 ) = { 0.56200904, 6.53322401, 0.00000000 };
Point ( 3572 ) = { 0.56010904, 6.53338718, 0.00000000 };
Point ( 3573 ) = { 0.55820812, 6.53354986, 0.00000000 };
Point ( 3574 ) = { 0.55630803, 6.53371192, 0.00000000 };
Point ( 3575 ) = { 0.55440702, 6.53387351, 0.00000000 };
Point ( 3576 ) = { 0.55318707, 6.53076808, 0.00000000 };
Point ( 3577 ) = { 0.55196816, 6.52766401, 0.00000000 };
Point ( 3578 ) = { 0.55006891, 6.52782433, 0.00000000 };
Point ( 3579 ) = { 0.54817048, 6.52798403, 0.00000000 };
Point ( 3580 ) = { 0.54627114, 6.52814324, 0.00000000 };
Point ( 3581 ) = { 0.54437262, 6.52830183, 0.00000000 };
Point ( 3582 ) = { 0.54247319, 6.52845994, 0.00000000 };
Point ( 3583 ) = { 0.54057371, 6.52861749, 0.00000000 };
Point ( 3584 ) = { 0.53936139, 6.52551413, 0.00000000 };
Point ( 3585 ) = { 0.53815035, 6.52241503, 0.00000000 };
Point ( 3586 ) = { 0.53625263, 6.52257132, 0.00000000 };
Point ( 3587 ) = { 0.53435573, 6.52272700, 0.00000000 };
Point ( 3588 ) = { 0.53245792, 6.52288220, 0.00000000 };
Point ( 3589 ) = { 0.53056093, 6.52303677, 0.00000000 };
Point ( 3590 ) = { 0.52866303, 6.52319086, 0.00000000 };
Point ( 3591 ) = { 0.52676595, 6.52334433, 0.00000000 };
Point ( 3592 ) = { 0.52486796, 6.52349731, 0.00000000 };
Point ( 3593 ) = { 0.52297079, 6.52364968, 0.00000000 };
Point ( 3594 ) = { 0.52107271, 6.52380156, 0.00000000 };
Point ( 3595 ) = { 0.51917545, 6.52395282, 0.00000000 };
Point ( 3596 ) = { 0.51727729, 6.52410360, 0.00000000 };
Point ( 3597 ) = { 0.51537994, 6.52425376, 0.00000000 };
Point ( 3598 ) = { 0.51348169, 6.52440343, 0.00000000 };
Point ( 3599 ) = { 0.51158339, 6.52455255, 0.00000000 };
Point ( 3600 ) = { 0.50968591, 6.52470105, 0.00000000 };
Point ( 3601 ) = { 0.50778753, 6.52484907, 0.00000000 };
Point ( 3602 ) = { 0.50659208, 6.52174718, 0.00000000 };
Point ( 3603 ) = { 0.50609920, 6.51540202, 0.00000000 };
Point ( 3604 ) = { 0.50680016, 6.51216179, 0.00000000 };
Point ( 3605 ) = { 0.50750085, 6.50892446, 0.00000000 };
Point ( 3606 ) = { 0.50820073, 6.50568862, 0.00000000 };
Point ( 3607 ) = { 0.50889948, 6.50245575, 0.00000000 };
Point ( 3608 ) = { 0.50959766, 6.49922725, 0.00000000 };
Point ( 3609 ) = { 0.51148859, 6.49907871, 0.00000000 };
Point ( 3610 ) = { 0.51218556, 6.49585290, 0.00000000 };
Point ( 3611 ) = { 0.51288173, 6.49262857, 0.00000000 };
Point ( 3612 ) = { 0.51476987, 6.49247914, 0.00000000 };
Point ( 3613 ) = { 0.51665884, 6.49232909, 0.00000000 };
Point ( 3614 ) = { 0.51854690, 6.49217857, 0.00000000 };
Point ( 3615 ) = { 0.51923956, 6.48895655, 0.00000000 };
Point ( 3616 ) = { 0.51993154, 6.48573744, 0.00000000 };
Point ( 3617 ) = { 0.52181768, 6.48558596, 0.00000000 };
Point ( 3618 ) = { 0.52370464, 6.48543386, 0.00000000 };
Point ( 3619 ) = { 0.52559070, 6.48528129, 0.00000000 };
Point ( 3620 ) = { 0.52747757, 6.48512809, 0.00000000 };
Point ( 3621 ) = { 0.52936353, 6.48497442, 0.00000000 };
Point ( 3622 ) = { 0.53125032, 6.48482013, 0.00000000 };
Point ( 3623 ) = { 0.53313619, 6.48466535, 0.00000000 };
Point ( 3624 ) = { 0.53502289, 6.48450996, 0.00000000 };
Point ( 3625 ) = { 0.53690867, 6.48435410, 0.00000000 };
Point ( 3626 ) = { 0.53879527, 6.48419761, 0.00000000 };
Point ( 3627 ) = { 0.54000016, 6.48726187, 0.00000000 };
Point ( 3628 ) = { 0.54120619, 6.49032890, 0.00000000 };
Point ( 3629 ) = { 0.54309367, 6.49017124, 0.00000000 };
Point ( 3630 ) = { 0.54498196, 6.49001295, 0.00000000 };
Point ( 3631 ) = { 0.54686935, 6.48985418, 0.00000000 };
Point ( 3632 ) = { 0.54875755, 6.48969480, 0.00000000 };
Point ( 3633 ) = { 0.55064484, 6.48953493, 0.00000000 };
Point ( 3634 ) = { 0.55253295, 6.48937445, 0.00000000 };
Point ( 3635 ) = { 0.55442015, 6.48921349, 0.00000000 };
Point ( 3636 ) = { 0.55630816, 6.48905191, 0.00000000 };
Point ( 3637 ) = { 0.55819527, 6.48888985, 0.00000000 };
Point ( 3638 ) = { 0.55941049, 6.49195647, 0.00000000 };
Point ( 3639 ) = { 0.56062674, 6.49502443, 0.00000000 };
Point ( 3640 ) = { 0.56251559, 6.49486111, 0.00000000 };
Point ( 3641 ) = { 0.56440524, 6.49469717, 0.00000000 };
Point ( 3642 ) = { 0.56629399, 6.49453276, 0.00000000 };
Point ( 3643 ) = { 0.56818355, 6.49436772, 0.00000000 };
Point ( 3644 ) = { 0.56940454, 6.49743703, 0.00000000 };
Point ( 3645 ) = { 0.57062683, 6.50051055, 0.00000000 };
Point ( 3646 ) = { 0.57251727, 6.50034433, 0.00000000 };
Point ( 3647 ) = { 0.57440852, 6.50017748, 0.00000000 };
Point ( 3648 ) = { 0.57563333, 6.50325311, 0.00000000 };
Point ( 3649 ) = { 0.57685919, 6.50633007, 0.00000000 };
Point ( 3650 ) = { 0.57875219, 6.50616196, 0.00000000 };
Point ( 3651 ) = { 0.58064426, 6.50599337, 0.00000000 };
Point ( 3652 ) = { 0.58253716, 6.50582416, 0.00000000 };
Point ( 3653 ) = { 0.58442914, 6.50565447, 0.00000000 };
Point ( 3654 ) = { 0.58566019, 6.50873275, 0.00000000 };
Point ( 3655 ) = { 0.58689255, 6.51181527, 0.00000000 };
Point ( 3656 ) = { 0.58878627, 6.51164431, 0.00000000 };
Point ( 3657 ) = { 0.59002070, 6.51472926, 0.00000000 };
Point ( 3658 ) = { 0.58935981, 6.51798731, 0.00000000 };
Point ( 3659 ) = { 0.58869868, 6.52124828, 0.00000000 };
Point ( 3660 ) = { 0.58803702, 6.52451368, 0.00000000 };
Point ( 3661 ) = { 0.58613869, 6.52468450, 0.00000000 };
Point ( 3662 ) = { 0.58424117, 6.52485468, 0.00000000 };
Point ( 3663 ) = { 0.58357651, 6.52812271, 0.00000000 };
BSpline ( 9 ) = { 3560 : 3663, 3560 };
Line Loop( 9 ) = { 9 };


// == Ice-Land mass number 62 =====================================
Point ( 3664 ) = { 1.74027149, 6.54808684, 0.00000000 };
Point ( 3665 ) = { 1.73836712, 6.54859267, 0.00000000 };
Point ( 3666 ) = { 1.73646173, 6.54909817, 0.00000000 };
Point ( 3667 ) = { 1.73455706, 6.54960288, 0.00000000 };
Point ( 3668 ) = { 1.73265138, 6.55010728, 0.00000000 };
Point ( 3669 ) = { 1.73074642, 6.55061088, 0.00000000 };
Point ( 3670 ) = { 1.72884045, 6.55111417, 0.00000000 };
Point ( 3671 ) = { 1.72693520, 6.55161667, 0.00000000 };
Point ( 3672 ) = { 1.72502893, 6.55211884, 0.00000000 };
Point ( 3673 ) = { 1.72312252, 6.55262046, 0.00000000 };
Point ( 3674 ) = { 1.72121683, 6.55312130, 0.00000000 };
Point ( 3675 ) = { 1.71931012, 6.55362181, 0.00000000 };
Point ( 3676 ) = { 1.71740414, 6.55412154, 0.00000000 };
Point ( 3677 ) = { 1.71549715, 6.55462094, 0.00000000 };
Point ( 3678 ) = { 1.71359088, 6.55511956, 0.00000000 };
Point ( 3679 ) = { 1.71168359, 6.55561785, 0.00000000 };
Point ( 3680 ) = { 1.70977703, 6.55611536, 0.00000000 };
Point ( 3681 ) = { 1.70796319, 6.55306412, 0.00000000 };
Point ( 3682 ) = { 1.70615151, 6.55001724, 0.00000000 };
Point ( 3683 ) = { 1.70424658, 6.55051314, 0.00000000 };
Point ( 3684 ) = { 1.70234063, 6.55100871, 0.00000000 };
Point ( 3685 ) = { 1.70043542, 6.55150351, 0.00000000 };
Point ( 3686 ) = { 1.69862816, 6.54845791, 0.00000000 };
Point ( 3687 ) = { 1.69682227, 6.54541365, 0.00000000 };
Point ( 3688 ) = { 1.69501858, 6.54237213, 0.00000000 };
Point ( 3689 ) = { 1.69331804, 6.53580845, 0.00000000 };
Point ( 3690 ) = { 1.69341851, 6.53228378, 0.00000000 };
Point ( 3691 ) = { 1.69531900, 6.53179080, 0.00000000 };
Point ( 3692 ) = { 1.69541829, 6.52826942, 0.00000000 };
Point ( 3693 ) = { 1.69551781, 6.52475286, 0.00000000 };
Point ( 3694 ) = { 1.69741611, 6.52425927, 0.00000000 };
Point ( 3695 ) = { 1.69751445, 6.52074600, 0.00000000 };
Point ( 3696 ) = { 1.69761226, 6.51723453, 0.00000000 };
Point ( 3697 ) = { 1.69950837, 6.51674034, 0.00000000 };
Point ( 3698 ) = { 1.69960500, 6.51323215, 0.00000000 };
Point ( 3699 ) = { 1.69970187, 6.50972876, 0.00000000 };
Point ( 3700 ) = { 1.70159580, 6.50923396, 0.00000000 };
Point ( 3701 ) = { 1.70169150, 6.50573383, 0.00000000 };
Point ( 3702 ) = { 1.70178666, 6.50223550, 0.00000000 };
Point ( 3703 ) = { 1.70367841, 6.50174009, 0.00000000 };
Point ( 3704 ) = { 1.70377240, 6.49824503, 0.00000000 };
Point ( 3705 ) = { 1.70386664, 6.49475473, 0.00000000 };
Point ( 3706 ) = { 1.70575622, 6.49425871, 0.00000000 };
Point ( 3707 ) = { 1.70584928, 6.49077166, 0.00000000 };
Point ( 3708 ) = { 1.70594182, 6.48728639, 0.00000000 };
Point ( 3709 ) = { 1.70782922, 6.48678977, 0.00000000 };
Point ( 3710 ) = { 1.70792103, 6.48330763, 0.00000000 };
Point ( 3711 ) = { 1.70801268, 6.47982876, 0.00000000 };
Point ( 3712 ) = { 1.70989706, 6.47933177, 0.00000000 };
Point ( 3713 ) = { 1.70998756, 6.47585612, 0.00000000 };
Point ( 3714 ) = { 1.71007831, 6.47238521, 0.00000000 };
Point ( 3715 ) = { 1.71196051, 6.47188761, 0.00000000 };
Point ( 3716 ) = { 1.71205011, 6.46841992, 0.00000000 };
Point ( 3717 ) = { 1.71213956, 6.46495546, 0.00000000 };
Point ( 3718 ) = { 1.71401960, 6.46445727, 0.00000000 };
Point ( 3719 ) = { 1.71410790, 6.46099603, 0.00000000 };
Point ( 3720 ) = { 1.71419567, 6.45753654, 0.00000000 };
Point ( 3721 ) = { 1.71607356, 6.45703775, 0.00000000 };
Point ( 3722 ) = { 1.71795216, 6.45653819, 0.00000000 };
Point ( 3723 ) = { 1.71803735, 6.45308200, 0.00000000 };
Point ( 3724 ) = { 1.71812239, 6.44962904, 0.00000000 };
Point ( 3725 ) = { 1.71999884, 6.44912887, 0.00000000 };
Point ( 3726 ) = { 1.72187429, 6.44862840, 0.00000000 };
Point ( 3727 ) = { 1.72375044, 6.44812714, 0.00000000 };
Point ( 3728 ) = { 1.72562560, 6.44762557, 0.00000000 };
Point ( 3729 ) = { 1.72570692, 6.44417562, 0.00000000 };
Point ( 3730 ) = { 1.72578849, 6.44073034, 0.00000000 };
Point ( 3731 ) = { 1.72766235, 6.44022795, 0.00000000 };
Point ( 3732 ) = { 1.72953521, 6.43972525, 0.00000000 };
Point ( 3733 ) = { 1.73133021, 6.44266711, 0.00000000 };
Point ( 3734 ) = { 1.73312732, 6.44561315, 0.00000000 };
Point ( 3735 ) = { 1.73500175, 6.44510886, 0.00000000 };
Point ( 3736 ) = { 1.73680145, 6.44805710, 0.00000000 };
Point ( 3737 ) = { 1.73860289, 6.45100806, 0.00000000 };
Point ( 3738 ) = { 1.74040563, 6.45396187, 0.00000000 };
Point ( 3739 ) = { 1.74220971, 6.45691694, 0.00000000 };
Point ( 3740 ) = { 1.74401597, 6.45987462, 0.00000000 };
Point ( 3741 ) = { 1.74582396, 6.46283504, 0.00000000 };
Point ( 3742 ) = { 1.74763327, 6.46579832, 0.00000000 };
Point ( 3743 ) = { 1.74944472, 6.46876582, 0.00000000 };
Point ( 3744 ) = { 1.75125836, 6.47173596, 0.00000000 };
Point ( 3745 ) = { 1.75307374, 6.47470885, 0.00000000 };
Point ( 3746 ) = { 1.75489046, 6.47768461, 0.00000000 };
Point ( 3747 ) = { 1.75664272, 6.48415262, 0.00000000 };
Point ( 3748 ) = { 1.75657720, 6.48764833, 0.00000000 };
Point ( 3749 ) = { 1.75651113, 6.49114745, 0.00000000 };
Point ( 3750 ) = { 1.75644453, 6.49464838, 0.00000000 };
Point ( 3751 ) = { 1.75637824, 6.49815249, 0.00000000 };
Point ( 3752 ) = { 1.75631223, 6.50166138, 0.00000000 };
Point ( 3753 ) = { 1.75442049, 6.50217210, 0.00000000 };
Point ( 3754 ) = { 1.75435334, 6.50568429, 0.00000000 };
Point ( 3755 ) = { 1.75428566, 6.50919829, 0.00000000 };
Point ( 3756 ) = { 1.75239173, 6.50970842, 0.00000000 };
Point ( 3757 ) = { 1.75232291, 6.51322572, 0.00000000 };
Point ( 3758 ) = { 1.75225436, 6.51674783, 0.00000000 };
Point ( 3759 ) = { 1.75035823, 6.51725737, 0.00000000 };
Point ( 3760 ) = { 1.75028853, 6.52078279, 0.00000000 };
Point ( 3761 ) = { 1.75021830, 6.52431004, 0.00000000 };
Point ( 3762 ) = { 1.74831998, 6.52481899, 0.00000000 };
Point ( 3763 ) = { 1.74824816, 6.52834967, 0.00000000 };
Point ( 3764 ) = { 1.74817662, 6.53188519, 0.00000000 };
Point ( 3765 ) = { 1.74627696, 6.53239332, 0.00000000 };
Point ( 3766 ) = { 1.74437629, 6.53290112, 0.00000000 };
Point ( 3767 ) = { 1.74430299, 6.53643983, 0.00000000 };
Point ( 3768 ) = { 1.74422917, 6.53998038, 0.00000000 };
Point ( 3769 ) = { 1.74232628, 6.54048759, 0.00000000 };
Point ( 3770 ) = { 1.74042412, 6.54099401, 0.00000000 };
Point ( 3771 ) = { 1.74034767, 6.54453799, 0.00000000 };
BSpline ( 10 ) = { 3664 : 3771, 3664 };
Line Loop( 10 ) = { 10 };


// == Ice-Land mass number 91 =====================================
Point ( 3772 ) = { 0.45307241, 6.64590334, 0.00000000 };
Point ( 3773 ) = { 0.45113877, 6.64603488, 0.00000000 };
Point ( 3774 ) = { 0.44920597, 6.64616580, 0.00000000 };
Point ( 3775 ) = { 0.44727224, 6.64629621, 0.00000000 };
Point ( 3776 ) = { 0.44533937, 6.64642600, 0.00000000 };
Point ( 3777 ) = { 0.44340557, 6.64655529, 0.00000000 };
Point ( 3778 ) = { 0.44147262, 6.64668396, 0.00000000 };
Point ( 3779 ) = { 0.44028754, 6.64345659, 0.00000000 };
Point ( 3780 ) = { 0.43910373, 6.64023370, 0.00000000 };
Point ( 3781 ) = { 0.43717261, 6.64036112, 0.00000000 };
Point ( 3782 ) = { 0.43524058, 6.64048804, 0.00000000 };
Point ( 3783 ) = { 0.43405980, 6.63726744, 0.00000000 };
Point ( 3784 ) = { 0.43363071, 6.63070627, 0.00000000 };
Point ( 3785 ) = { 0.43438070, 6.62736881, 0.00000000 };
Point ( 3786 ) = { 0.43512994, 6.62403444, 0.00000000 };
Point ( 3787 ) = { 0.43587832, 6.62070166, 0.00000000 };
Point ( 3788 ) = { 0.43780372, 6.62057461, 0.00000000 };
Point ( 3789 ) = { 0.43855038, 6.61724469, 0.00000000 };
Point ( 3790 ) = { 0.43929639, 6.61391932, 0.00000000 };
Point ( 3791 ) = { 0.44121981, 6.61379129, 0.00000000 };
Point ( 3792 ) = { 0.44314408, 6.61366264, 0.00000000 };
Point ( 3793 ) = { 0.44388697, 6.61033993, 0.00000000 };
Point ( 3794 ) = { 0.44462901, 6.60701880, 0.00000000 };
Point ( 3795 ) = { 0.44655131, 6.60688916, 0.00000000 };
Point ( 3796 ) = { 0.44847269, 6.60675901, 0.00000000 };
Point ( 3797 ) = { 0.45039491, 6.60662825, 0.00000000 };
Point ( 3798 ) = { 0.45113331, 6.60330953, 0.00000000 };
Point ( 3799 ) = { 0.45187107, 6.59999536, 0.00000000 };
Point ( 3800 ) = { 0.45379132, 6.59986361, 0.00000000 };
Point ( 3801 ) = { 0.45571066, 6.59973136, 0.00000000 };
Point ( 3802 ) = { 0.45763083, 6.59959849, 0.00000000 };
Point ( 3803 ) = { 0.45955009, 6.59946512, 0.00000000 };
Point ( 3804 ) = { 0.46147019, 6.59933114, 0.00000000 };
Point ( 3805 ) = { 0.46265783, 6.60251208, 0.00000000 };
Point ( 3806 ) = { 0.46384673, 6.60569744, 0.00000000 };
Point ( 3807 ) = { 0.46576776, 6.60556226, 0.00000000 };
Point ( 3808 ) = { 0.46768963, 6.60542647, 0.00000000 };
Point ( 3809 ) = { 0.46888110, 6.60861409, 0.00000000 };
Point ( 3810 ) = { 0.47007363, 6.61180315, 0.00000000 };
Point ( 3811 ) = { 0.47199732, 6.61166610, 0.00000000 };
Point ( 3812 ) = { 0.47392008, 6.61152856, 0.00000000 };
Point ( 3813 ) = { 0.47584369, 6.61139039, 0.00000000 };
Point ( 3814 ) = { 0.47704016, 6.61458134, 0.00000000 };
Point ( 3815 ) = { 0.47751131, 6.62111421, 0.00000000 };
Point ( 3816 ) = { 0.47678387, 6.62445327, 0.00000000 };
Point ( 3817 ) = { 0.47485646, 6.62459171, 0.00000000 };
Point ( 3818 ) = { 0.47292990, 6.62472953, 0.00000000 };
Point ( 3819 ) = { 0.47219934, 6.62807129, 0.00000000 };
Point ( 3820 ) = { 0.47146814, 6.63141764, 0.00000000 };
Point ( 3821 ) = { 0.46953959, 6.63155447, 0.00000000 };
Point ( 3822 ) = { 0.46761012, 6.63169080, 0.00000000 };
Point ( 3823 ) = { 0.46687669, 6.63503980, 0.00000000 };
Point ( 3824 ) = { 0.46614240, 6.63839039, 0.00000000 };
Point ( 3825 ) = { 0.46421094, 6.63852574, 0.00000000 };
Point ( 3826 ) = { 0.46227944, 6.63866052, 0.00000000 };
Point ( 3827 ) = { 0.46034878, 6.63879467, 0.00000000 };
Point ( 3828 ) = { 0.45841720, 6.63892833, 0.00000000 };
Point ( 3829 ) = { 0.45648647, 6.63906137, 0.00000000 };
Point ( 3830 ) = { 0.45455481, 6.63919390, 0.00000000 };
Point ( 3831 ) = { 0.45381394, 6.64254631, 0.00000000 };
BSpline ( 11 ) = { 3772 : 3831, 3772 };
Line Loop( 11 ) = { 11 };


// == Ice-Land mass number 93 =====================================
Point ( 3832 ) = { 0.06254953, 5.37551442, 0.00000000 };
Point ( 3833 ) = { 0.06098624, 5.37553239, 0.00000000 };
Point ( 3834 ) = { 0.05942222, 5.37554990, 0.00000000 };
Point ( 3835 ) = { 0.05785892, 5.37556696, 0.00000000 };
Point ( 3836 ) = { 0.05629489, 5.37558356, 0.00000000 };
Point ( 3837 ) = { 0.05473158, 5.37559971, 0.00000000 };
Point ( 3838 ) = { 0.05316754, 5.37561540, 0.00000000 };
Point ( 3839 ) = { 0.05160422, 5.37563064, 0.00000000 };
Point ( 3840 ) = { 0.05004018, 5.37564542, 0.00000000 };
Point ( 3841 ) = { 0.04847685, 5.37565975, 0.00000000 };
Point ( 3842 ) = { 0.04691279, 5.37567363, 0.00000000 };
Point ( 3843 ) = { 0.04611211, 5.37350647, 0.00000000 };
Point ( 3844 ) = { 0.04531208, 5.37134188, 0.00000000 };
Point ( 3845 ) = { 0.04375000, 5.37135483, 0.00000000 };
Point ( 3846 ) = { 0.04218720, 5.37136733, 0.00000000 };
Point ( 3847 ) = { 0.04138943, 5.36920385, 0.00000000 };
Point ( 3848 ) = { 0.04059230, 5.36704096, 0.00000000 };
Point ( 3849 ) = { 0.03979545, 5.36487964, 0.00000000 };
Point ( 3850 ) = { 0.03976336, 5.36055235, 0.00000000 };
Point ( 3851 ) = { 0.03973129, 5.35622983, 0.00000000 };
Point ( 3852 ) = { 0.04049417, 5.35406625, 0.00000000 };
Point ( 3853 ) = { 0.04205122, 5.35405425, 0.00000000 };
Point ( 3854 ) = { 0.04281286, 5.35189202, 0.00000000 };
Point ( 3855 ) = { 0.04277839, 5.34758296, 0.00000000 };
Point ( 3856 ) = { 0.04353881, 5.34542565, 0.00000000 };
Point ( 3857 ) = { 0.04509335, 5.34541276, 0.00000000 };
Point ( 3858 ) = { 0.04585253, 5.34325680, 0.00000000 };
Point ( 3859 ) = { 0.04661109, 5.34110141, 0.00000000 };
Point ( 3860 ) = { 0.04816508, 5.34108762, 0.00000000 };
Point ( 3861 ) = { 0.04971836, 5.34107339, 0.00000000 };
Point ( 3862 ) = { 0.05047505, 5.33891912, 0.00000000 };
Point ( 3863 ) = { 0.05123114, 5.33676641, 0.00000000 };
Point ( 3864 ) = { 0.05278316, 5.33675129, 0.00000000 };
Point ( 3865 ) = { 0.05433589, 5.33673571, 0.00000000 };
Point ( 3866 ) = { 0.05588790, 5.33671968, 0.00000000 };
Point ( 3867 ) = { 0.05664150, 5.33456787, 0.00000000 };
Point ( 3868 ) = { 0.05739450, 5.33241860, 0.00000000 };
Point ( 3869 ) = { 0.05894526, 5.33240169, 0.00000000 };
Point ( 3870 ) = { 0.06049672, 5.33238431, 0.00000000 };
Point ( 3871 ) = { 0.06204746, 5.33236649, 0.00000000 };
Point ( 3872 ) = { 0.06359892, 5.33234821, 0.00000000 };
Point ( 3873 ) = { 0.06514965, 5.33232949, 0.00000000 };
Point ( 3874 ) = { 0.06595184, 5.33446089, 0.00000000 };
Point ( 3875 ) = { 0.06600487, 5.33874971, 0.00000000 };
Point ( 3876 ) = { 0.06680838, 5.34088696, 0.00000000 };
Point ( 3877 ) = { 0.06836160, 5.34086730, 0.00000000 };
Point ( 3878 ) = { 0.06916637, 5.34300586, 0.00000000 };
Point ( 3879 ) = { 0.06997178, 5.34514499, 0.00000000 };
Point ( 3880 ) = { 0.07077784, 5.34728566, 0.00000000 };
Point ( 3881 ) = { 0.07083487, 5.35159448, 0.00000000 };
Point ( 3882 ) = { 0.07089196, 5.35590804, 0.00000000 };
Point ( 3883 ) = { 0.07014109, 5.35807859, 0.00000000 };
Point ( 3884 ) = { 0.06938961, 5.36025072, 0.00000000 };
Point ( 3885 ) = { 0.06863751, 5.36242343, 0.00000000 };
Point ( 3886 ) = { 0.06788515, 5.36459773, 0.00000000 };
Point ( 3887 ) = { 0.06713220, 5.36677460, 0.00000000 };
Point ( 3888 ) = { 0.06557073, 5.36679391, 0.00000000 };
Point ( 3889 ) = { 0.06481654, 5.36897215, 0.00000000 };
Point ( 3890 ) = { 0.06406172, 5.37115098, 0.00000000 };
Point ( 3891 ) = { 0.06330593, 5.37333141, 0.00000000 };
BSpline ( 12 ) = { 3832 : 3891, 3832 };
Line Loop( 12 ) = { 12 };


// == Ice-Land mass number 159 ====================================
Point ( 3892 ) = { 3.32430956, 6.46840768, 0.00000000 };
Point ( 3893 ) = { 3.32242830, 6.46937417, 0.00000000 };
Point ( 3894 ) = { 3.32054675, 6.47034012, 0.00000000 };
Point ( 3895 ) = { 3.31866406, 6.47130596, 0.00000000 };
Point ( 3896 ) = { 3.31678110, 6.47227125, 0.00000000 };
Point ( 3897 ) = { 3.31405447, 6.46926812, 0.00000000 };
Point ( 3898 ) = { 3.31132987, 6.46626643, 0.00000000 };
Point ( 3899 ) = { 3.30860765, 6.46326798, 0.00000000 };
Point ( 3900 ) = { 3.30776856, 6.45931201, 0.00000000 };
Point ( 3901 ) = { 3.30964690, 6.45834978, 0.00000000 };
Point ( 3902 ) = { 3.30880745, 6.45439811, 0.00000000 };
Point ( 3903 ) = { 3.30796798, 6.45044888, 0.00000000 };
Point ( 3904 ) = { 3.30984460, 6.44948616, 0.00000000 };
Point ( 3905 ) = { 3.31256228, 6.45247184, 0.00000000 };
Point ( 3906 ) = { 3.31528195, 6.45545894, 0.00000000 };
Point ( 3907 ) = { 3.31715917, 6.45449452, 0.00000000 };
Point ( 3908 ) = { 3.31988297, 6.45748361, 0.00000000 };
Point ( 3909 ) = { 3.32345999, 6.46444126, 0.00000000 };
BSpline ( 13 ) = { 3892 : 3909, 3892 };
Line Loop( 13 ) = { 13 };


// == Ice-Land mass number 1 ======================================
Point ( 3910 ) = { -0.60141060, 6.87415459, 0.00000000 };
Point ( 3911 ) = { -0.60010318, 6.87072261, 0.00000000 };
Point ( 3912 ) = { -0.59879708, 6.86729392, 0.00000000 };
Point ( 3913 ) = { -0.59679993, 6.86746777, 0.00000000 };
Point ( 3914 ) = { -0.59480181, 6.86764112, 0.00000000 };
Point ( 3915 ) = { -0.59280456, 6.86781381, 0.00000000 };
Point ( 3916 ) = { -0.59150277, 6.86438727, 0.00000000 };
Point ( 3917 ) = { -0.59020215, 6.86096241, 0.00000000 };
Point ( 3918 ) = { -0.58820684, 6.86113376, 0.00000000 };
Point ( 3919 ) = { -0.58621057, 6.86130461, 0.00000000 };
Point ( 3920 ) = { -0.58491371, 6.85788224, 0.00000000 };
Point ( 3921 ) = { -0.58361815, 6.85446314, 0.00000000 };
Point ( 3922 ) = { -0.58162382, 6.85463266, 0.00000000 };
Point ( 3923 ) = { -0.58033057, 6.85121646, 0.00000000 };
Point ( 3924 ) = { -0.57903875, 6.84780513, 0.00000000 };
Point ( 3925 ) = { -0.57704635, 6.84797331, 0.00000000 };
Point ( 3926 ) = { -0.57505482, 6.84814084, 0.00000000 };
Point ( 3927 ) = { -0.57376583, 6.84473206, 0.00000000 };
Point ( 3928 ) = { -0.57247800, 6.84132494, 0.00000000 };
Point ( 3929 ) = { -0.57048840, 6.84149114, 0.00000000 };
Point ( 3930 ) = { -0.56849784, 6.84165683, 0.00000000 };
Point ( 3931 ) = { -0.56650724, 6.84182195, 0.00000000 };
Point ( 3932 ) = { -0.56522413, 6.83841692, 0.00000000 };
Point ( 3933 ) = { -0.56394244, 6.83501674, 0.00000000 };
Point ( 3934 ) = { -0.56195377, 6.83518053, 0.00000000 };
Point ( 3935 ) = { -0.55996596, 6.83534367, 0.00000000 };
Point ( 3936 ) = { -0.55868708, 6.83194603, 0.00000000 };
Point ( 3937 ) = { -0.55740935, 6.82855003, 0.00000000 };
Point ( 3938 ) = { -0.55542347, 6.82871185, 0.00000000 };
Point ( 3939 ) = { -0.55343663, 6.82887316, 0.00000000 };
Point ( 3940 ) = { -0.55216261, 6.82547962, 0.00000000 };
Point ( 3941 ) = { -0.55089000, 6.82209090, 0.00000000 };
Point ( 3942 ) = { -0.54890509, 6.82225090, 0.00000000 };
Point ( 3943 ) = { -0.54763474, 6.81886503, 0.00000000 };
Point ( 3944 ) = { -0.54636554, 6.81548081, 0.00000000 };
Point ( 3945 ) = { -0.54438255, 6.81563948, 0.00000000 };
Point ( 3946 ) = { -0.54311560, 6.81225811, 0.00000000 };
Point ( 3947 ) = { -0.54256490, 6.80535066, 0.00000000 };
Point ( 3948 ) = { -0.54201503, 6.79845375, 0.00000000 };
Point ( 3949 ) = { -0.54075258, 6.79509070, 0.00000000 };
Point ( 3950 ) = { -0.53949093, 6.79173088, 0.00000000 };
Point ( 3951 ) = { -0.54020547, 6.78821578, 0.00000000 };
Point ( 3952 ) = { -0.54217958, 6.78805839, 0.00000000 };
Point ( 3953 ) = { -0.54289236, 6.78454642, 0.00000000 };
Point ( 3954 ) = { -0.54360440, 6.78103779, 0.00000000 };
Point ( 3955 ) = { -0.54557642, 6.78087941, 0.00000000 };
Point ( 3956 ) = { -0.54628671, 6.77737390, 0.00000000 };
Point ( 3957 ) = { -0.54502550, 6.77403214, 0.00000000 };
Point ( 3958 ) = { -0.54305548, 6.77419035, 0.00000000 };
Point ( 3959 ) = { -0.54179650, 6.77085138, 0.00000000 };
Point ( 3960 ) = { -0.54053877, 6.76751556, 0.00000000 };
Point ( 3961 ) = { -0.53857064, 6.76767247, 0.00000000 };
Point ( 3962 ) = { -0.53731513, 6.76433943, 0.00000000 };
Point ( 3963 ) = { -0.53606075, 6.76100797, 0.00000000 };
Point ( 3964 ) = { -0.53409451, 6.76116358, 0.00000000 };
Point ( 3965 ) = { -0.53212732, 6.76131869, 0.00000000 };
Point ( 3966 ) = { -0.53016009, 6.76147323, 0.00000000 };
Point ( 3967 ) = { -0.52891031, 6.75814379, 0.00000000 };
Point ( 3968 ) = { -0.52766177, 6.75481748, 0.00000000 };
Point ( 3969 ) = { -0.52569643, 6.75497072, 0.00000000 };
Point ( 3970 ) = { -0.52373195, 6.75512331, 0.00000000 };
Point ( 3971 ) = { -0.52176652, 6.75527541, 0.00000000 };
Point ( 3972 ) = { -0.51980195, 6.75542686, 0.00000000 };
Point ( 3973 ) = { -0.51783643, 6.75557781, 0.00000000 };
Point ( 3974 ) = { -0.51659397, 6.75225283, 0.00000000 };
Point ( 3975 ) = { -0.51535286, 6.74893253, 0.00000000 };
Point ( 3976 ) = { -0.51338923, 6.74908218, 0.00000000 };
Point ( 3977 ) = { -0.51142646, 6.74923120, 0.00000000 };
Point ( 3978 ) = { -0.50946275, 6.74937971, 0.00000000 };
Point ( 3979 ) = { -0.50749989, 6.74952759, 0.00000000 };
Point ( 3980 ) = { -0.50553609, 6.74967496, 0.00000000 };
Point ( 3981 ) = { -0.50357315, 6.74982169, 0.00000000 };
Point ( 3982 ) = { -0.50160926, 6.74996792, 0.00000000 };
Point ( 3983 ) = { -0.49964534, 6.75011358, 0.00000000 };
Point ( 3984 ) = { -0.49768227, 6.75025860, 0.00000000 };
Point ( 3985 ) = { -0.49571826, 6.75040311, 0.00000000 };
Point ( 3986 ) = { -0.49375510, 6.75054699, 0.00000000 };
Point ( 3987 ) = { -0.49179101, 6.75069037, 0.00000000 };
Point ( 3988 ) = { -0.48982777, 6.75083310, 0.00000000 };
Point ( 3989 ) = { -0.48786359, 6.75097533, 0.00000000 };
Point ( 3990 ) = { -0.48590027, 6.75111692, 0.00000000 };
Point ( 3991 ) = { -0.48393601, 6.75125801, 0.00000000 };
Point ( 3992 ) = { -0.48197261, 6.75139846, 0.00000000 };
Point ( 3993 ) = { -0.48000827, 6.75153841, 0.00000000 };
Point ( 3994 ) = { -0.47804478, 6.75167772, 0.00000000 };
Point ( 3995 ) = { -0.47608036, 6.75181652, 0.00000000 };
Point ( 3996 ) = { -0.47411680, 6.75195468, 0.00000000 };
Point ( 3997 ) = { -0.47215229, 6.75209234, 0.00000000 };
Point ( 3998 ) = { -0.47018775, 6.75222943, 0.00000000 };
Point ( 3999 ) = { -0.46944197, 6.75569477, 0.00000000 };
Point ( 4000 ) = { -0.46869553, 6.75916494, 0.00000000 };
Point ( 4001 ) = { -0.46672892, 6.75930102, 0.00000000 };
Point ( 4002 ) = { -0.46476318, 6.75943646, 0.00000000 };
Point ( 4003 ) = { -0.46279650, 6.75957140, 0.00000000 };
Point ( 4004 ) = { -0.46083068, 6.75970570, 0.00000000 };
Point ( 4005 ) = { -0.45886393, 6.75983950, 0.00000000 };
Point ( 4006 ) = { -0.45811167, 6.76331186, 0.00000000 };
Point ( 4007 ) = { -0.45735864, 6.76678750, 0.00000000 };
Point ( 4008 ) = { -0.45538982, 6.76692028, 0.00000000 };
Point ( 4009 ) = { -0.45342186, 6.76705243, 0.00000000 };
Point ( 4010 ) = { -0.45145297, 6.76718407, 0.00000000 };
Point ( 4011 ) = { -0.44948493, 6.76731507, 0.00000000 };
Point ( 4012 ) = { -0.44872663, 6.77079315, 0.00000000 };
Point ( 4013 ) = { -0.44796744, 6.77427296, 0.00000000 };
Point ( 4014 ) = { -0.44599735, 6.77440295, 0.00000000 };
Point ( 4015 ) = { -0.44402631, 6.77453243, 0.00000000 };
Point ( 4016 ) = { -0.44205524, 6.77466133, 0.00000000 };
Point ( 4017 ) = { -0.44008504, 6.77478960, 0.00000000 };
Point ( 4018 ) = { -0.43811389, 6.77491736, 0.00000000 };
Point ( 4019 ) = { -0.43614361, 6.77504448, 0.00000000 };
Point ( 4020 ) = { -0.43537756, 6.77852626, 0.00000000 };
Point ( 4021 ) = { -0.43461073, 6.78201133, 0.00000000 };
Point ( 4022 ) = { -0.43263839, 6.78213744, 0.00000000 };
Point ( 4023 ) = { -0.43066510, 6.78226302, 0.00000000 };
Point ( 4024 ) = { -0.42869269, 6.78238798, 0.00000000 };
Point ( 4025 ) = { -0.42792202, 6.78587569, 0.00000000 };
Point ( 4026 ) = { -0.42835488, 6.79273983, 0.00000000 };
Point ( 4027 ) = { -0.42878860, 6.79961757, 0.00000000 };
Point ( 4028 ) = { -0.42801600, 6.80312232, 0.00000000 };
Point ( 4029 ) = { -0.42603751, 6.80324651, 0.00000000 };
Point ( 4030 ) = { -0.42405809, 6.80337018, 0.00000000 };
Point ( 4031 ) = { -0.42328310, 6.80687778, 0.00000000 };
Point ( 4032 ) = { -0.42250742, 6.81039030, 0.00000000 };
Point ( 4033 ) = { -0.42052592, 6.81051294, 0.00000000 };
Point ( 4034 ) = { -0.41854528, 6.81063495, 0.00000000 };
Point ( 4035 ) = { -0.41656371, 6.81075644, 0.00000000 };
Point ( 4036 ) = { -0.41458210, 6.81087735, 0.00000000 };
Point ( 4037 ) = { -0.41260136, 6.81099763, 0.00000000 };
Point ( 4038 ) = { -0.41181931, 6.81451239, 0.00000000 };
Point ( 4039 ) = { -0.41103636, 6.81802891, 0.00000000 };
Point ( 4040 ) = { -0.40905354, 6.81814816, 0.00000000 };
Point ( 4041 ) = { -0.40706978, 6.81826689, 0.00000000 };
Point ( 4042 ) = { -0.40508689, 6.81838498, 0.00000000 };
Point ( 4043 ) = { -0.40310306, 6.81850255, 0.00000000 };
Point ( 4044 ) = { -0.40112011, 6.81861949, 0.00000000 };
Point ( 4045 ) = { -0.40033123, 6.82213823, 0.00000000 };
Point ( 4046 ) = { -0.39954163, 6.82566190, 0.00000000 };
Point ( 4047 ) = { -0.39755659, 6.82577781, 0.00000000 };
Point ( 4048 ) = { -0.39557061, 6.82589319, 0.00000000 };
Point ( 4049 ) = { -0.39358551, 6.82600794, 0.00000000 };
Point ( 4050 ) = { -0.39159946, 6.82612216, 0.00000000 };
Point ( 4051 ) = { -0.38961429, 6.82623576, 0.00000000 };
Point ( 4052 ) = { -0.38881874, 6.82976165, 0.00000000 };
Point ( 4053 ) = { -0.38802229, 6.83328931, 0.00000000 };
Point ( 4054 ) = { -0.38603412, 6.83340192, 0.00000000 };
Point ( 4055 ) = { -0.38404684, 6.83351389, 0.00000000 };
Point ( 4056 ) = { -0.38205861, 6.83362534, 0.00000000 };
Point ( 4057 ) = { -0.38007125, 6.83373616, 0.00000000 };
Point ( 4058 ) = { -0.37808296, 6.83384645, 0.00000000 };
Point ( 4059 ) = { -0.37609554, 6.83395612, 0.00000000 };
Point ( 4060 ) = { -0.37410719, 6.83406525, 0.00000000 };
Point ( 4061 ) = { -0.37211971, 6.83417376, 0.00000000 };
Point ( 4062 ) = { -0.37013129, 6.83428174, 0.00000000 };
Point ( 4063 ) = { -0.36814374, 6.83438909, 0.00000000 };
Point ( 4064 ) = { -0.36615526, 6.83449591, 0.00000000 };
Point ( 4065 ) = { -0.36416766, 6.83460211, 0.00000000 };
Point ( 4066 ) = { -0.36298890, 6.83118315, 0.00000000 };
Point ( 4067 ) = { -0.36181125, 6.82776585, 0.00000000 };
Point ( 4068 ) = { -0.35982560, 6.82787079, 0.00000000 };
Point ( 4069 ) = { -0.35783902, 6.82797519, 0.00000000 };
Point ( 4070 ) = { -0.35585240, 6.82807901, 0.00000000 };
Point ( 4071 ) = { -0.35386666, 6.82818221, 0.00000000 };
Point ( 4072 ) = { -0.35269417, 6.82476680, 0.00000000 };
Point ( 4073 ) = { -0.35152293, 6.82135623, 0.00000000 };
Point ( 4074 ) = { -0.34953915, 6.82145817, 0.00000000 };
Point ( 4075 ) = { -0.34755443, 6.82155958, 0.00000000 };
Point ( 4076 ) = { -0.34638681, 6.81815154, 0.00000000 };
Point ( 4077 ) = { -0.34522028, 6.81474515, 0.00000000 };
Point ( 4078 ) = { -0.34323751, 6.81484531, 0.00000000 };
Point ( 4079 ) = { -0.34125562, 6.81494484, 0.00000000 };
Point ( 4080 ) = { -0.34009179, 6.81154103, 0.00000000 };
Point ( 4081 ) = { -0.33892921, 6.80814204, 0.00000000 };
Point ( 4082 ) = { -0.33694927, 6.80824032, 0.00000000 };
Point ( 4083 ) = { -0.33578884, 6.80484420, 0.00000000 };
Point ( 4084 ) = { -0.33462949, 6.80144974, 0.00000000 };
Point ( 4085 ) = { -0.33265150, 6.80154676, 0.00000000 };
Point ( 4086 ) = { -0.33149430, 6.79815518, 0.00000000 };
Point ( 4087 ) = { -0.33033826, 6.79476680, 0.00000000 };
Point ( 4088 ) = { -0.32836221, 6.79486258, 0.00000000 };
Point ( 4089 ) = { -0.32720831, 6.79147707, 0.00000000 };
Point ( 4090 ) = { -0.32605565, 6.78809634, 0.00000000 };
Point ( 4091 ) = { -0.32408064, 6.78819092, 0.00000000 };
Point ( 4092 ) = { -0.32293056, 6.78481302, 0.00000000 };
Point ( 4093 ) = { -0.32178163, 6.78143831, 0.00000000 };
Point ( 4094 ) = { -0.31980855, 6.78153165, 0.00000000 };
Point ( 4095 ) = { -0.31866175, 6.77815979, 0.00000000 };
Point ( 4096 ) = { -0.31751602, 6.77478956, 0.00000000 };
Point ( 4097 ) = { -0.31554488, 6.77488165, 0.00000000 };
Point ( 4098 ) = { -0.31357462, 6.77497313, 0.00000000 };
Point ( 4099 ) = { -0.31243154, 6.77160543, 0.00000000 };
Point ( 4100 ) = { -0.31128961, 6.76824090, 0.00000000 };
Point ( 4101 ) = { -0.30932127, 6.76833114, 0.00000000 };
Point ( 4102 ) = { -0.30735201, 6.76842086, 0.00000000 };
Point ( 4103 ) = { -0.30538363, 6.76850995, 0.00000000 };
Point ( 4104 ) = { -0.30341431, 6.76859852, 0.00000000 };
Point ( 4105 ) = { -0.30144587, 6.76868647, 0.00000000 };
Point ( 4106 ) = { -0.30030997, 6.76532346, 0.00000000 };
Point ( 4107 ) = { -0.29917527, 6.76196517, 0.00000000 };
Point ( 4108 ) = { -0.29720876, 6.76205189, 0.00000000 };
Point ( 4109 ) = { -0.29524132, 6.76213808, 0.00000000 };
Point ( 4110 ) = { -0.29327387, 6.76222369, 0.00000000 };
Point ( 4111 ) = { -0.29130728, 6.76230869, 0.00000000 };
Point ( 4112 ) = { -0.29046959, 6.76575310, 0.00000000 };
Point ( 4113 ) = { -0.28963111, 6.76920231, 0.00000000 };
Point ( 4114 ) = { -0.28766250, 6.76928626, 0.00000000 };
Point ( 4115 ) = { -0.28569296, 6.76936966, 0.00000000 };
Point ( 4116 ) = { -0.28372430, 6.76945246, 0.00000000 };
Point ( 4117 ) = { -0.28175472, 6.76953473, 0.00000000 };
Point ( 4118 ) = { -0.27978601, 6.76961638, 0.00000000 };
Point ( 4119 ) = { -0.27781637, 6.76969750, 0.00000000 };
Point ( 4120 ) = { -0.27584762, 6.76977800, 0.00000000 };
Point ( 4121 ) = { -0.27387794, 6.76985798, 0.00000000 };
Point ( 4122 ) = { -0.27190913, 6.76993734, 0.00000000 };
Point ( 4123 ) = { -0.26993941, 6.77001616, 0.00000000 };
Point ( 4124 ) = { -0.26797056, 6.77009438, 0.00000000 };
Point ( 4125 ) = { -0.26600078, 6.77017206, 0.00000000 };
Point ( 4126 ) = { -0.26403099, 6.77024917, 0.00000000 };
Point ( 4127 ) = { -0.26206207, 6.77032566, 0.00000000 };
Point ( 4128 ) = { -0.26009223, 6.77040162, 0.00000000 };
Point ( 4129 ) = { -0.25812327, 6.77047698, 0.00000000 };
Point ( 4130 ) = { -0.25615339, 6.77055179, 0.00000000 };
Point ( 4131 ) = { -0.25418439, 6.77062600, 0.00000000 };
Point ( 4132 ) = { -0.25221446, 6.77069967, 0.00000000 };
Point ( 4133 ) = { -0.25024541, 6.77077273, 0.00000000 };
Point ( 4134 ) = { -0.24827544, 6.77084525, 0.00000000 };
Point ( 4135 ) = { -0.24630636, 6.77091717, 0.00000000 };
Point ( 4136 ) = { -0.24544495, 6.77436420, 0.00000000 };
Point ( 4137 ) = { -0.24458266, 6.77781449, 0.00000000 };
Point ( 4138 ) = { -0.24261155, 6.77788533, 0.00000000 };
Point ( 4139 ) = { -0.24063951, 6.77795563, 0.00000000 };
Point ( 4140 ) = { -0.23866835, 6.77802533, 0.00000000 };
Point ( 4141 ) = { -0.23669628, 6.77809448, 0.00000000 };
Point ( 4142 ) = { -0.23472418, 6.77816306, 0.00000000 };
Point ( 4143 ) = { -0.23275296, 6.77823104, 0.00000000 };
Point ( 4144 ) = { -0.23078082, 6.77829847, 0.00000000 };
Point ( 4145 ) = { -0.22880957, 6.77836530, 0.00000000 };
Point ( 4146 ) = { -0.22770870, 6.77498356, 0.00000000 };
Point ( 4147 ) = { -0.22660894, 6.77160502, 0.00000000 };
Point ( 4148 ) = { -0.22463963, 6.77167063, 0.00000000 };
Point ( 4149 ) = { -0.22266940, 6.77173571, 0.00000000 };
Point ( 4150 ) = { -0.22070006, 6.77180018, 0.00000000 };
Point ( 4151 ) = { -0.21872979, 6.77186410, 0.00000000 };
Point ( 4152 ) = { -0.21676040, 6.77192743, 0.00000000 };
Point ( 4153 ) = { -0.21479010, 6.77199021, 0.00000000 };
Point ( 4154 ) = { -0.21282068, 6.77205238, 0.00000000 };
Point ( 4155 ) = { -0.21085034, 6.77211402, 0.00000000 };
Point ( 4156 ) = { -0.20888088, 6.77217505, 0.00000000 };
Point ( 4157 ) = { -0.20691051, 6.77223554, 0.00000000 };
Point ( 4158 ) = { -0.20582167, 6.76885699, 0.00000000 };
Point ( 4159 ) = { -0.20473397, 6.76548319, 0.00000000 };
Point ( 4160 ) = { -0.20276644, 6.76554244, 0.00000000 };
Point ( 4161 ) = { -0.20079799, 6.76560115, 0.00000000 };
Point ( 4162 ) = { -0.19883043, 6.76565926, 0.00000000 };
Point ( 4163 ) = { -0.19686195, 6.76571683, 0.00000000 };
Point ( 4164 ) = { -0.19489436, 6.76577379, 0.00000000 };
Point ( 4165 ) = { -0.19292585, 6.76583021, 0.00000000 };
Point ( 4166 ) = { -0.19095822, 6.76588603, 0.00000000 };
Point ( 4167 ) = { -0.18987847, 6.76251320, 0.00000000 };
Point ( 4168 ) = { -0.18879975, 6.75914198, 0.00000000 };
Point ( 4169 ) = { -0.18683407, 6.75919660, 0.00000000 };
Point ( 4170 ) = { -0.18486747, 6.75925067, 0.00000000 };
Point ( 4171 ) = { -0.18290176, 6.75930415, 0.00000000 };
Point ( 4172 ) = { -0.18093513, 6.75935708, 0.00000000 };
Point ( 4173 ) = { -0.17896938, 6.75940941, 0.00000000 };
Point ( 4174 ) = { -0.17700272, 6.75946120, 0.00000000 };
Point ( 4175 ) = { -0.17593096, 6.75609128, 0.00000000 };
Point ( 4176 ) = { -0.17486032, 6.75272608, 0.00000000 };
Point ( 4177 ) = { -0.17289650, 6.75277665, 0.00000000 };
Point ( 4178 ) = { -0.17093177, 6.75282666, 0.00000000 };
Point ( 4179 ) = { -0.16896792, 6.75287609, 0.00000000 };
Point ( 4180 ) = { -0.16700316, 6.75292496, 0.00000000 };
Point ( 4181 ) = { -0.16503929, 6.75297325, 0.00000000 };
Point ( 4182 ) = { -0.16397460, 6.74960965, 0.00000000 };
Point ( 4183 ) = { -0.16291094, 6.74624767, 0.00000000 };
Point ( 4184 ) = { -0.16094901, 6.74629476, 0.00000000 };
Point ( 4185 ) = { -0.15898616, 6.74634130, 0.00000000 };
Point ( 4186 ) = { -0.15792597, 6.74298185, 0.00000000 };
Point ( 4187 ) = { -0.15686686, 6.73962709, 0.00000000 };
Point ( 4188 ) = { -0.15490596, 6.73967245, 0.00000000 };
Point ( 4189 ) = { -0.15384888, 6.73632052, 0.00000000 };
Point ( 4190 ) = { -0.15369491, 6.72957860, 0.00000000 };
Point ( 4191 ) = { -0.15459611, 6.72619172, 0.00000000 };
Point ( 4192 ) = { -0.15549686, 6.72280800, 0.00000000 };
Point ( 4193 ) = { -0.15639667, 6.71942590, 0.00000000 };
Point ( 4194 ) = { -0.15835079, 6.71938013, 0.00000000 };
Point ( 4195 ) = { -0.16030579, 6.71933378, 0.00000000 };
Point ( 4196 ) = { -0.16120228, 6.71595434, 0.00000000 };
Point ( 4197 ) = { -0.16209791, 6.71257959, 0.00000000 };
Point ( 4198 ) = { -0.16405093, 6.71253214, 0.00000000 };
Point ( 4199 ) = { -0.16600304, 6.71248415, 0.00000000 };
Point ( 4200 ) = { -0.16795604, 6.71243557, 0.00000000 };
Point ( 4201 ) = { -0.16990812, 6.71238644, 0.00000000 };
Point ( 4202 ) = { -0.17079937, 6.70901379, 0.00000000 };
Point ( 4203 ) = { -0.17168969, 6.70564276, 0.00000000 };
Point ( 4204 ) = { -0.17257867, 6.70227489, 0.00000000 };
Point ( 4205 ) = { -0.17346676, 6.69891016, 0.00000000 };
Point ( 4206 ) = { -0.17541581, 6.69885941, 0.00000000 };
Point ( 4207 ) = { -0.17736484, 6.69880809, 0.00000000 };
Point ( 4208 ) = { -0.17931296, 6.69875622, 0.00000000 };
Point ( 4209 ) = { -0.18126195, 6.69870377, 0.00000000 };
Point ( 4210 ) = { -0.18214524, 6.69534115, 0.00000000 };
Point ( 4211 ) = { -0.18302768, 6.69198319, 0.00000000 };
Point ( 4212 ) = { -0.18497471, 6.69192965, 0.00000000 };
Point ( 4213 ) = { -0.18692083, 6.69187557, 0.00000000 };
Point ( 4214 ) = { -0.18780088, 6.68852021, 0.00000000 };
Point ( 4215 ) = { -0.18868006, 6.68516797, 0.00000000 };
Point ( 4216 ) = { -0.18955790, 6.68181886, 0.00000000 };
Point ( 4217 ) = { -0.18936963, 6.67518230, 0.00000000 };
Point ( 4218 ) = { -0.18830548, 6.67189630, 0.00000000 };
Point ( 4219 ) = { -0.18724194, 6.66861337, 0.00000000 };
Point ( 4220 ) = { -0.18705640, 6.66200550, 0.00000000 };
Point ( 4221 ) = { -0.18793240, 6.65867759, 0.00000000 };
Point ( 4222 ) = { -0.18880708, 6.65535277, 0.00000000 };
Point ( 4223 ) = { -0.18968094, 6.65203254, 0.00000000 };
Point ( 4224 ) = { -0.19161634, 6.65197707, 0.00000000 };
Point ( 4225 ) = { -0.19355084, 6.65192106, 0.00000000 };
Point ( 4226 ) = { -0.19548621, 6.65186447, 0.00000000 };
Point ( 4227 ) = { -0.19742068, 6.65180733, 0.00000000 };
Point ( 4228 ) = { -0.19935602, 6.65174961, 0.00000000 };
Point ( 4229 ) = { -0.20022417, 6.64843119, 0.00000000 };
Point ( 4230 ) = { -0.20109142, 6.64511432, 0.00000000 };
Point ( 4231 ) = { -0.20302481, 6.64505554, 0.00000000 };
Point ( 4232 ) = { -0.20495818, 6.64499618, 0.00000000 };
Point ( 4233 ) = { -0.20689065, 6.64493630, 0.00000000 };
Point ( 4234 ) = { -0.20882399, 6.64487582, 0.00000000 };
Point ( 4235 ) = { -0.20968652, 6.64156102, 0.00000000 };
Point ( 4236 ) = { -0.21054823, 6.63825078, 0.00000000 };
Point ( 4237 ) = { -0.21247962, 6.63818924, 0.00000000 };
Point ( 4238 ) = { -0.21333952, 6.63488181, 0.00000000 };
Point ( 4239 ) = { -0.21226992, 6.63163794, 0.00000000 };
Point ( 4240 ) = { -0.21120094, 6.62839708, 0.00000000 };
Point ( 4241 ) = { -0.21099284, 6.62186618, 0.00000000 };
Point ( 4242 ) = { -0.21078506, 6.61534487, 0.00000000 };
Point ( 4243 ) = { -0.21057776, 6.60883908, 0.00000000 };
Point ( 4244 ) = { -0.21037077, 6.60234282, 0.00000000 };
Point ( 4245 ) = { -0.20930742, 6.59912989, 0.00000000 };
Point ( 4246 ) = { -0.20824554, 6.59591989, 0.00000000 };
Point ( 4247 ) = { -0.20718475, 6.59271431, 0.00000000 };
Point ( 4248 ) = { -0.20612455, 6.58951167, 0.00000000 };
Point ( 4249 ) = { -0.20506538, 6.58631197, 0.00000000 };
Point ( 4250 ) = { -0.20314996, 6.58637133, 0.00000000 };
Point ( 4251 ) = { -0.20209275, 6.58317424, 0.00000000 };
Point ( 4252 ) = { -0.20103653, 6.57997859, 0.00000000 };
Point ( 4253 ) = { -0.19912207, 6.58003681, 0.00000000 };
Point ( 4254 ) = { -0.19720848, 6.58009444, 0.00000000 };
Point ( 4255 ) = { -0.19615514, 6.57690110, 0.00000000 };
Point ( 4256 ) = { -0.19510283, 6.57371068, 0.00000000 };
Point ( 4257 ) = { -0.19319107, 6.57376714, 0.00000000 };
Point ( 4258 ) = { -0.19127842, 6.57382307, 0.00000000 };
Point ( 4259 ) = { -0.18936663, 6.57387842, 0.00000000 };
Point ( 4260 ) = { -0.18745395, 6.57393324, 0.00000000 };
Point ( 4261 ) = { -0.18640681, 6.57074449, 0.00000000 };
Point ( 4262 ) = { -0.18536073, 6.56756013, 0.00000000 };
Point ( 4263 ) = { -0.18344989, 6.56761378, 0.00000000 };
Point ( 4264 ) = { -0.18153991, 6.56766685, 0.00000000 };
Point ( 4265 ) = { -0.17962903, 6.56771940, 0.00000000 };
Point ( 4266 ) = { -0.17771902, 6.56777136, 0.00000000 };
Point ( 4267 ) = { -0.17580812, 6.56782279, 0.00000000 };
Point ( 4268 ) = { -0.17389807, 6.56787364, 0.00000000 };
Point ( 4269 ) = { -0.17198714, 6.56792395, 0.00000000 };
Point ( 4270 ) = { -0.17007619, 6.56797372, 0.00000000 };
Point ( 4271 ) = { -0.16903854, 6.56478983, 0.00000000 };
Point ( 4272 ) = { -0.16800185, 6.56160737, 0.00000000 };
Point ( 4273 ) = { -0.16609274, 6.56165598, 0.00000000 };
Point ( 4274 ) = { -0.16418449, 6.56170400, 0.00000000 };
Point ( 4275 ) = { -0.16227535, 6.56175149, 0.00000000 };
Point ( 4276 ) = { -0.16036707, 6.56179841, 0.00000000 };
Point ( 4277 ) = { -0.15845791, 6.56184479, 0.00000000 };
Point ( 4278 ) = { -0.15654961, 6.56189059, 0.00000000 };
Point ( 4279 ) = { -0.15464041, 6.56193586, 0.00000000 };
Point ( 4280 ) = { -0.15273208, 6.56198056, 0.00000000 };
Point ( 4281 ) = { -0.15082287, 6.56202472, 0.00000000 };
Point ( 4282 ) = { -0.14891451, 6.56206830, 0.00000000 };
Point ( 4283 ) = { -0.14700527, 6.56211135, 0.00000000 };
Point ( 4284 ) = { -0.14509689, 6.56215383, 0.00000000 };
Point ( 4285 ) = { -0.14407187, 6.55897068, 0.00000000 };
Point ( 4286 ) = { -0.14304789, 6.55579190, 0.00000000 };
Point ( 4287 ) = { -0.14114047, 6.55583324, 0.00000000 };
Point ( 4288 ) = { -0.13923392, 6.55587401, 0.00000000 };
Point ( 4289 ) = { -0.13732648, 6.55591424, 0.00000000 };
Point ( 4290 ) = { -0.13541990, 6.55595390, 0.00000000 };
Point ( 4291 ) = { -0.13351244, 6.55599303, 0.00000000 };
Point ( 4292 ) = { -0.13160584, 6.55603158, 0.00000000 };
Point ( 4293 ) = { -0.12969835, 6.55606959, 0.00000000 };
Point ( 4294 ) = { -0.12868226, 6.55289161, 0.00000000 };
Point ( 4295 ) = { -0.12766713, 6.54971506, 0.00000000 };
Point ( 4296 ) = { -0.12576149, 6.54975193, 0.00000000 };
Point ( 4297 ) = { -0.12385670, 6.54978823, 0.00000000 };
Point ( 4298 ) = { -0.12195103, 6.54982399, 0.00000000 };
Point ( 4299 ) = { -0.12004623, 6.54985918, 0.00000000 };
Point ( 4300 ) = { -0.11814054, 6.54989383, 0.00000000 };
Point ( 4301 ) = { -0.11623571, 6.54992791, 0.00000000 };
Point ( 4302 ) = { -0.11433000, 6.54996145, 0.00000000 };
Point ( 4303 ) = { -0.11242428, 6.54999444, 0.00000000 };
Point ( 4304 ) = { -0.11051943, 6.55002685, 0.00000000 };
Point ( 4305 ) = { -0.10861369, 6.55005873, 0.00000000 };
Point ( 4306 ) = { -0.10670882, 6.55009004, 0.00000000 };
Point ( 4307 ) = { -0.10480306, 6.55012081, 0.00000000 };
Point ( 4308 ) = { -0.10289817, 6.55015101, 0.00000000 };
Point ( 4309 ) = { -0.10099240, 6.55018067, 0.00000000 };
Point ( 4310 ) = { -0.09908749, 6.55020977, 0.00000000 };
Point ( 4311 ) = { -0.09718170, 6.55023832, 0.00000000 };
Point ( 4312 ) = { -0.09527677, 6.55026630, 0.00000000 };
Point ( 4313 ) = { -0.09337096, 6.55029375, 0.00000000 };
Point ( 4314 ) = { -0.09146602, 6.55032063, 0.00000000 };
Point ( 4315 ) = { -0.08956020, 6.55034696, 0.00000000 };
Point ( 4316 ) = { -0.08765524, 6.55037273, 0.00000000 };
Point ( 4317 ) = { -0.08574941, 6.55039795, 0.00000000 };
Point ( 4318 ) = { -0.08384356, 6.55042263, 0.00000000 };
Point ( 4319 ) = { -0.08193858, 6.55044673, 0.00000000 };
Point ( 4320 ) = { -0.08003273, 6.55047030, 0.00000000 };
Point ( 4321 ) = { -0.07911881, 6.55367743, 0.00000000 };
Point ( 4322 ) = { -0.07820398, 6.55688602, 0.00000000 };
Point ( 4323 ) = { -0.07728782, 6.56009754, 0.00000000 };
Point ( 4324 ) = { -0.07828037, 6.56329095, 0.00000000 };
Point ( 4325 ) = { -0.07927345, 6.56648728, 0.00000000 };
Point ( 4326 ) = { -0.08026749, 6.56968506, 0.00000000 };
Point ( 4327 ) = { -0.08217894, 6.56966143, 0.00000000 };
Point ( 4328 ) = { -0.08317487, 6.57286183, 0.00000000 };
Point ( 4329 ) = { -0.08417180, 6.57606663, 0.00000000 };
Point ( 4330 ) = { -0.08608510, 6.57604186, 0.00000000 };
Point ( 4331 ) = { -0.08799840, 6.57601654, 0.00000000 };
Point ( 4332 ) = { -0.08991082, 6.57599067, 0.00000000 };
Point ( 4333 ) = { -0.09091195, 6.57919752, 0.00000000 };
Point ( 4334 ) = { -0.09191407, 6.58240729, 0.00000000 };
Point ( 4335 ) = { -0.09382834, 6.58238029, 0.00000000 };
Point ( 4336 ) = { -0.09483237, 6.58559271, 0.00000000 };
Point ( 4337 ) = { -0.09583736, 6.58880659, 0.00000000 };
Point ( 4338 ) = { -0.09775349, 6.58877844, 0.00000000 };
Point ( 4339 ) = { -0.09876040, 6.59199498, 0.00000000 };
Point ( 4340 ) = { -0.09976829, 6.59521446, 0.00000000 };
Point ( 4341 ) = { -0.10168629, 6.59518516, 0.00000000 };
Point ( 4342 ) = { -0.10269610, 6.59840730, 0.00000000 };
Point ( 4343 ) = { -0.10370693, 6.60163387, 0.00000000 };
Point ( 4344 ) = { -0.10471830, 6.60486341, 0.00000000 };
Point ( 4345 ) = { -0.10482134, 6.61136215, 0.00000000 };
Point ( 4346 ) = { -0.10492453, 6.61787042, 0.00000000 };
Point ( 4347 ) = { -0.10593899, 6.62111542, 0.00000000 };
Point ( 4348 ) = { -0.10695488, 6.62436339, 0.00000000 };
Point ( 4349 ) = { -0.10604345, 6.62764399, 0.00000000 };
Point ( 4350 ) = { -0.10513155, 6.63092761, 0.00000000 };
Point ( 4351 ) = { -0.10614811, 6.63418517, 0.00000000 };
Point ( 4352 ) = { -0.10716611, 6.63744573, 0.00000000 };
Point ( 4353 ) = { -0.10727200, 6.64400436, 0.00000000 };
Point ( 4354 ) = { -0.10635803, 6.64730548, 0.00000000 };
Point ( 4355 ) = { -0.10544360, 6.65060964, 0.00000000 };
Point ( 4356 ) = { -0.10646330, 6.65388468, 0.00000000 };
Point ( 4357 ) = { -0.10748445, 6.65716274, 0.00000000 };
Point ( 4358 ) = { -0.10759101, 6.66376257, 0.00000000 };
Point ( 4359 ) = { -0.10769773, 6.67037218, 0.00000000 };
Point ( 4360 ) = { -0.10780470, 6.67699766, 0.00000000 };
Point ( 4361 ) = { -0.10688644, 6.68033085, 0.00000000 };
Point ( 4362 ) = { -0.10494368, 6.68036165, 0.00000000 };
Point ( 4363 ) = { -0.10402354, 6.68369768, 0.00000000 };
Point ( 4364 ) = { -0.10310246, 6.68703528, 0.00000000 };
Point ( 4365 ) = { -0.10115775, 6.68706498, 0.00000000 };
Point ( 4366 ) = { -0.09921214, 6.68709413, 0.00000000 };
Point ( 4367 ) = { -0.09828864, 6.69043430, 0.00000000 };
Point ( 4368 ) = { -0.09736421, 6.69377758, 0.00000000 };
Point ( 4369 ) = { -0.09541665, 6.69380563, 0.00000000 };
Point ( 4370 ) = { -0.09449033, 6.69715175, 0.00000000 };
Point ( 4371 ) = { -0.09356310, 6.70050252, 0.00000000 };
Point ( 4372 ) = { -0.09161358, 6.70052946, 0.00000000 };
Point ( 4373 ) = { -0.09068445, 6.70388309, 0.00000000 };
Point ( 4374 ) = { -0.09077496, 6.71057363, 0.00000000 };
Point ( 4375 ) = { -0.08984399, 6.71393540, 0.00000000 };
Point ( 4376 ) = { -0.08891165, 6.71730032, 0.00000000 };
Point ( 4377 ) = { -0.08797839, 6.72066992, 0.00000000 };
Point ( 4378 ) = { -0.08602300, 6.72069523, 0.00000000 };
Point ( 4379 ) = { -0.08406851, 6.72071997, 0.00000000 };
Point ( 4380 ) = { -0.08313235, 6.72409218, 0.00000000 };
Point ( 4381 ) = { -0.08219523, 6.72746601, 0.00000000 };
Point ( 4382 ) = { -0.08023877, 6.72748963, 0.00000000 };
Point ( 4383 ) = { -0.07929973, 6.73086635, 0.00000000 };
Point ( 4384 ) = { -0.07835977, 6.73424777, 0.00000000 };
Point ( 4385 ) = { -0.07640133, 6.73427028, 0.00000000 };
Point ( 4386 ) = { -0.07444199, 6.73429222, 0.00000000 };
Point ( 4387 ) = { -0.07248354, 6.73431359, 0.00000000 };
Point ( 4388 ) = { -0.07052418, 6.73433439, 0.00000000 };
Point ( 4389 ) = { -0.06856572, 6.73435462, 0.00000000 };
Point ( 4390 ) = { -0.06660635, 6.73437428, 0.00000000 };
Point ( 4391 ) = { -0.06464788, 6.73439337, 0.00000000 };
Point ( 4392 ) = { -0.06268850, 6.73441189, 0.00000000 };
Point ( 4393 ) = { -0.06073002, 6.73442984, 0.00000000 };
Point ( 4394 ) = { -0.05978025, 6.73781196, 0.00000000 };
Point ( 4395 ) = { -0.05882952, 6.74119571, 0.00000000 };
Point ( 4396 ) = { -0.05686817, 6.74121254, 0.00000000 };
Point ( 4397 ) = { -0.05490771, 6.74122880, 0.00000000 };
Point ( 4398 ) = { -0.05294634, 6.74124449, 0.00000000 };
Point ( 4399 ) = { -0.05098587, 6.74125960, 0.00000000 };
Point ( 4400 ) = { -0.04902449, 6.74127415, 0.00000000 };
Point ( 4401 ) = { -0.04706401, 6.74128812, 0.00000000 };
Point ( 4402 ) = { -0.04510263, 6.74130153, 0.00000000 };
Point ( 4403 ) = { -0.04314214, 6.74131436, 0.00000000 };
Point ( 4404 ) = { -0.04118075, 6.74132663, 0.00000000 };
Point ( 4405 ) = { -0.03922026, 6.74133832, 0.00000000 };
Point ( 4406 ) = { -0.03725886, 6.74134944, 0.00000000 };
Point ( 4407 ) = { -0.03529836, 6.74135999, 0.00000000 };
Point ( 4408 ) = { -0.03333696, 6.74136998, 0.00000000 };
Point ( 4409 ) = { -0.03137645, 6.74137939, 0.00000000 };
Point ( 4410 ) = { -0.02941504, 6.74138823, 0.00000000 };
Point ( 4411 ) = { -0.02745363, 6.74139650, 0.00000000 };
Point ( 4412 ) = { -0.02549312, 6.74140420, 0.00000000 };
Point ( 4413 ) = { -0.02353170, 6.74141134, 0.00000000 };
Point ( 4414 ) = { -0.02157118, 6.74141789, 0.00000000 };
Point ( 4415 ) = { -0.01960976, 6.74142388, 0.00000000 };
Point ( 4416 ) = { -0.01764924, 6.74142930, 0.00000000 };
Point ( 4417 ) = { -0.01568782, 6.74143415, 0.00000000 };
Point ( 4418 ) = { -0.01372729, 6.74143843, 0.00000000 };
Point ( 4419 ) = { -0.01176587, 6.74144214, 0.00000000 };
Point ( 4420 ) = { -0.00980534, 6.74144527, 0.00000000 };
Point ( 4421 ) = { -0.00784391, 6.74144784, 0.00000000 };
Point ( 4422 ) = { -0.00588339, 6.74144984, 0.00000000 };
Point ( 4423 ) = { -0.00392196, 6.74145126, 0.00000000 };
Point ( 4424 ) = { -0.00196143, 6.74145212, 0.00000000 };
Point ( 4425 ) = { 0.00000000, 6.74145241, 0.00000000 };
Point ( 4426 ) = { 0.00098121, 6.74483090, 0.00000000 };
Point ( 4427 ) = { 0.00196340, 6.74821412, 0.00000000 };
Point ( 4428 ) = { 0.00392589, 6.74821326, 0.00000000 };
Point ( 4429 ) = { 0.00588929, 6.74821183, 0.00000000 };
Point ( 4430 ) = { 0.00785178, 6.74820983, 0.00000000 };
Point ( 4431 ) = { 0.00981518, 6.74820726, 0.00000000 };
Point ( 4432 ) = { 0.01080184, 6.75159251, 0.00000000 };
Point ( 4433 ) = { 0.01178950, 6.75497939, 0.00000000 };
Point ( 4434 ) = { 0.01375486, 6.75497568, 0.00000000 };
Point ( 4435 ) = { 0.01571932, 6.75497139, 0.00000000 };
Point ( 4436 ) = { 0.01768468, 6.75496653, 0.00000000 };
Point ( 4437 ) = { 0.01964914, 6.75496110, 0.00000000 };
Point ( 4438 ) = { 0.02161450, 6.75495510, 0.00000000 };
Point ( 4439 ) = { 0.02260807, 6.75834373, 0.00000000 };
Point ( 4440 ) = { 0.02360265, 6.76173710, 0.00000000 };
Point ( 4441 ) = { 0.02556998, 6.76172994, 0.00000000 };
Point ( 4442 ) = { 0.02753641, 6.76172222, 0.00000000 };
Point ( 4443 ) = { 0.02853441, 6.76511821, 0.00000000 };
Point ( 4444 ) = { 0.02953341, 6.76851583, 0.00000000 };
Point ( 4445 ) = { 0.03150271, 6.76850695, 0.00000000 };
Point ( 4446 ) = { 0.03250325, 6.77190749, 0.00000000 };
Point ( 4447 ) = { 0.03350481, 6.77531280, 0.00000000 };
Point ( 4448 ) = { 0.03547609, 6.77530277, 0.00000000 };
Point ( 4449 ) = { 0.03744646, 6.77529216, 0.00000000 };
Point ( 4450 ) = { 0.03941773, 6.77528098, 0.00000000 };
Point ( 4451 ) = { 0.04138810, 6.77526923, 0.00000000 };
Point ( 4452 ) = { 0.04335936, 6.77525690, 0.00000000 };
Point ( 4453 ) = { 0.04436689, 6.77866396, 0.00000000 };
Point ( 4454 ) = { 0.04537542, 6.78207424, 0.00000000 };
Point ( 4455 ) = { 0.04734867, 6.78206075, 0.00000000 };
Point ( 4456 ) = { 0.04835921, 6.78547396, 0.00000000 };
Point ( 4457 ) = { 0.04937076, 6.78888883, 0.00000000 };
Point ( 4458 ) = { 0.05134599, 6.78887418, 0.00000000 };
Point ( 4459 ) = { 0.05332031, 6.78885896, 0.00000000 };
Point ( 4460 ) = { 0.05529553, 6.78884316, 0.00000000 };
Point ( 4461 ) = { 0.05631108, 6.79226037, 0.00000000 };
Point ( 4462 ) = { 0.05732766, 6.79568081, 0.00000000 };
Point ( 4463 ) = { 0.05930486, 6.79566385, 0.00000000 };
Point ( 4464 ) = { 0.06128206, 6.79564630, 0.00000000 };
Point ( 4465 ) = { 0.06325835, 6.79562819, 0.00000000 };
Point ( 4466 ) = { 0.06523553, 6.79560950, 0.00000000 };
Point ( 4467 ) = { 0.06721181, 6.79559024, 0.00000000 };
Point ( 4468 ) = { 0.06823484, 6.79901244, 0.00000000 };
Point ( 4469 ) = { 0.06925892, 6.80243945, 0.00000000 };
Point ( 4470 ) = { 0.07123719, 6.80241902, 0.00000000 };
Point ( 4471 ) = { 0.07321635, 6.80239800, 0.00000000 };
Point ( 4472 ) = { 0.07519460, 6.80237642, 0.00000000 };
Point ( 4473 ) = { 0.07717375, 6.80235426, 0.00000000 };
Point ( 4474 ) = { 0.07915199, 6.80233152, 0.00000000 };
Point ( 4475 ) = { 0.08113113, 6.80230821, 0.00000000 };
Point ( 4476 ) = { 0.08310935, 6.80228433, 0.00000000 };
Point ( 4477 ) = { 0.08414145, 6.80571249, 0.00000000 };
Point ( 4478 ) = { 0.08517459, 6.80914390, 0.00000000 };
Point ( 4479 ) = { 0.08715480, 6.80911885, 0.00000000 };
Point ( 4480 ) = { 0.08913591, 6.80909320, 0.00000000 };
Point ( 4481 ) = { 0.09111702, 6.80906698, 0.00000000 };
Point ( 4482 ) = { 0.09309721, 6.80904019, 0.00000000 };
Point ( 4483 ) = { 0.09507830, 6.80901282, 0.00000000 };
Point ( 4484 ) = { 0.09705847, 6.80898488, 0.00000000 };
Point ( 4485 ) = { 0.09809864, 6.81241774, 0.00000000 };
Point ( 4486 ) = { 0.09913985, 6.81585228, 0.00000000 };
Point ( 4487 ) = { 0.10112201, 6.81582316, 0.00000000 };
Point ( 4488 ) = { 0.10310507, 6.81579345, 0.00000000 };
Point ( 4489 ) = { 0.10508722, 6.81576318, 0.00000000 };
Point ( 4490 ) = { 0.10707026, 6.81573231, 0.00000000 };
Point ( 4491 ) = { 0.10905239, 6.81570089, 0.00000000 };
Point ( 4492 ) = { 0.11103541, 6.81566887, 0.00000000 };
Point ( 4493 ) = { 0.11301752, 6.81563629, 0.00000000 };
Point ( 4494 ) = { 0.11500053, 6.81560312, 0.00000000 };
Point ( 4495 ) = { 0.11698262, 6.81556939, 0.00000000 };
Point ( 4496 ) = { 0.11896561, 6.81553506, 0.00000000 };
Point ( 4497 ) = { 0.12094858, 6.81550016, 0.00000000 };
Point ( 4498 ) = { 0.12293064, 6.81546470, 0.00000000 };
Point ( 4499 ) = { 0.12491360, 6.81542864, 0.00000000 };
Point ( 4500 ) = { 0.12689564, 6.81539203, 0.00000000 };
Point ( 4501 ) = { 0.12887857, 6.81535482, 0.00000000 };
Point ( 4502 ) = { 0.13086059, 6.81531705, 0.00000000 };
Point ( 4503 ) = { 0.13284350, 6.81527869, 0.00000000 };
Point ( 4504 ) = { 0.13482550, 6.81523977, 0.00000000 };
Point ( 4505 ) = { 0.13680839, 6.81520025, 0.00000000 };
Point ( 4506 ) = { 0.13879036, 6.81516018, 0.00000000 };
Point ( 4507 ) = { 0.14077323, 6.81511951, 0.00000000 };
Point ( 4508 ) = { 0.14169247, 6.81165046, 0.00000000 };
Point ( 4509 ) = { 0.14261074, 6.80818313, 0.00000000 };
Point ( 4510 ) = { 0.14459158, 6.80814135, 0.00000000 };
Point ( 4511 ) = { 0.14657150, 6.80809902, 0.00000000 };
Point ( 4512 ) = { 0.14855231, 6.80805608, 0.00000000 };
Point ( 4513 ) = { 0.15053311, 6.80801257, 0.00000000 };
Point ( 4514 ) = { 0.15251299, 6.80796851, 0.00000000 };
Point ( 4515 ) = { 0.15449377, 6.80792385, 0.00000000 };
Point ( 4516 ) = { 0.15540506, 6.80445821, 0.00000000 };
Point ( 4517 ) = { 0.15631543, 6.80099586, 0.00000000 };
Point ( 4518 ) = { 0.15829417, 6.80095009, 0.00000000 };
Point ( 4519 ) = { 0.16027200, 6.80090377, 0.00000000 };
Point ( 4520 ) = { 0.16225072, 6.80085685, 0.00000000 };
Point ( 4521 ) = { 0.16422852, 6.80080938, 0.00000000 };
Point ( 4522 ) = { 0.16620721, 6.80076131, 0.00000000 };
Point ( 4523 ) = { 0.16818498, 6.80071268, 0.00000000 };
Point ( 4524 ) = { 0.17016364, 6.80066346, 0.00000000 };
Point ( 4525 ) = { 0.17214138, 6.80061369, 0.00000000 };
Point ( 4526 ) = { 0.17412002, 6.80056332, 0.00000000 };
Point ( 4527 ) = { 0.17609773, 6.80051239, 0.00000000 };
Point ( 4528 ) = { 0.17807633, 6.80046087, 0.00000000 };
Point ( 4529 ) = { 0.18005492, 6.80040877, 0.00000000 };
Point ( 4530 ) = { 0.18203259, 6.80035612, 0.00000000 };
Point ( 4531 ) = { 0.18401115, 6.80030287, 0.00000000 };
Point ( 4532 ) = { 0.18490650, 6.79684013, 0.00000000 };
Point ( 4533 ) = { 0.18580098, 6.79338223, 0.00000000 };
Point ( 4534 ) = { 0.18777751, 6.79332789, 0.00000000 };
Point ( 4535 ) = { 0.18975312, 6.79327299, 0.00000000 };
Point ( 4536 ) = { 0.19172961, 6.79321749, 0.00000000 };
Point ( 4537 ) = { 0.19370519, 6.79316145, 0.00000000 };
Point ( 4538 ) = { 0.19568165, 6.79310480, 0.00000000 };
Point ( 4539 ) = { 0.19765720, 6.79304761, 0.00000000 };
Point ( 4540 ) = { 0.19963363, 6.79298981, 0.00000000 };
Point ( 4541 ) = { 0.20160914, 6.79293147, 0.00000000 };
Point ( 4542 ) = { 0.20358553, 6.79287252, 0.00000000 };
Point ( 4543 ) = { 0.20556101, 6.79281303, 0.00000000 };
Point ( 4544 ) = { 0.20753737, 6.79275293, 0.00000000 };
Point ( 4545 ) = { 0.20842034, 6.78929546, 0.00000000 };
Point ( 4546 ) = { 0.20930241, 6.78584125, 0.00000000 };
Point ( 4547 ) = { 0.21127584, 6.78578010, 0.00000000 };
Point ( 4548 ) = { 0.21325015, 6.78571834, 0.00000000 };
Point ( 4549 ) = { 0.21522355, 6.78565604, 0.00000000 };
Point ( 4550 ) = { 0.21610171, 6.78220433, 0.00000000 };
Point ( 4551 ) = { 0.21697892, 6.77875432, 0.00000000 };
Point ( 4552 ) = { 0.21895029, 6.77869093, 0.00000000 };
Point ( 4553 ) = { 0.22092255, 6.77862694, 0.00000000 };
Point ( 4554 ) = { 0.22179642, 6.77517970, 0.00000000 };
Point ( 4555 ) = { 0.22266940, 6.77173571, 0.00000000 };
Point ( 4556 ) = { 0.22463963, 6.77167063, 0.00000000 };
Point ( 4557 ) = { 0.22660894, 6.77160502, 0.00000000 };
Point ( 4558 ) = { 0.22857913, 6.77153880, 0.00000000 };
Point ( 4559 ) = { 0.22944823, 6.76809730, 0.00000000 };
Point ( 4560 ) = { 0.23031649, 6.76466061, 0.00000000 };
Point ( 4561 ) = { 0.23228466, 6.76459331, 0.00000000 };
Point ( 4562 ) = { 0.23425191, 6.76452547, 0.00000000 };
Point ( 4563 ) = { 0.23622004, 6.76445703, 0.00000000 };
Point ( 4564 ) = { 0.23708488, 6.76102280, 0.00000000 };
Point ( 4565 ) = { 0.23794879, 6.75759025, 0.00000000 };
Point ( 4566 ) = { 0.23991401, 6.75752077, 0.00000000 };
Point ( 4567 ) = { 0.24188010, 6.75745068, 0.00000000 };
Point ( 4568 ) = { 0.24384527, 6.75738005, 0.00000000 };
Point ( 4569 ) = { 0.24581132, 6.75730882, 0.00000000 };
Point ( 4570 ) = { 0.24777645, 6.75723705, 0.00000000 };
Point ( 4571 ) = { 0.24974246, 6.75716467, 0.00000000 };
Point ( 4572 ) = { 0.25170755, 6.75709175, 0.00000000 };
Point ( 4573 ) = { 0.25367352, 6.75701823, 0.00000000 };
Point ( 4574 ) = { 0.25563857, 6.75694417, 0.00000000 };
Point ( 4575 ) = { 0.25760449, 6.75686951, 0.00000000 };
Point ( 4576 ) = { 0.25956949, 6.75679431, 0.00000000 };
Point ( 4577 ) = { 0.26153537, 6.75671850, 0.00000000 };
Point ( 4578 ) = { 0.26350033, 6.75664216, 0.00000000 };
Point ( 4579 ) = { 0.26546617, 6.75656521, 0.00000000 };
Point ( 4580 ) = { 0.26743198, 6.75648768, 0.00000000 };
Point ( 4581 ) = { 0.26939688, 6.75640962, 0.00000000 };
Point ( 4582 ) = { 0.27136264, 6.75633096, 0.00000000 };
Point ( 4583 ) = { 0.27332749, 6.75625175, 0.00000000 };
Point ( 4584 ) = { 0.27529321, 6.75617194, 0.00000000 };
Point ( 4585 ) = { 0.27725801, 6.75609160, 0.00000000 };
Point ( 4586 ) = { 0.27922369, 6.75601064, 0.00000000 };
Point ( 4587 ) = { 0.28118844, 6.75592915, 0.00000000 };
Point ( 4588 ) = { 0.28315407, 6.75584706, 0.00000000 };
Point ( 4589 ) = { 0.28511877, 6.75576442, 0.00000000 };
Point ( 4590 ) = { 0.28708435, 6.75568118, 0.00000000 };
Point ( 4591 ) = { 0.28904901, 6.75559741, 0.00000000 };
Point ( 4592 ) = { 0.29101454, 6.75551302, 0.00000000 };
Point ( 4593 ) = { 0.29297914, 6.75542810, 0.00000000 };
Point ( 4594 ) = { 0.29494463, 6.75534258, 0.00000000 };
Point ( 4595 ) = { 0.29577870, 6.75190610, 0.00000000 };
Point ( 4596 ) = { 0.29661200, 6.74847442, 0.00000000 };
Point ( 4597 ) = { 0.29857455, 6.74838787, 0.00000000 };
Point ( 4598 ) = { 0.30053799, 6.74830071, 0.00000000 };
Point ( 4599 ) = { 0.30250050, 6.74821303, 0.00000000 };
Point ( 4600 ) = { 0.30446388, 6.74812473, 0.00000000 };
Point ( 4601 ) = { 0.30642634, 6.74803590, 0.00000000 };
Point ( 4602 ) = { 0.30838967, 6.74794646, 0.00000000 };
Point ( 4603 ) = { 0.31035207, 6.74785649, 0.00000000 };
Point ( 4604 ) = { 0.31231535, 6.74776591, 0.00000000 };
Point ( 4605 ) = { 0.31427770, 6.74767480, 0.00000000 };
Point ( 4606 ) = { 0.31624093, 6.74758307, 0.00000000 };
Point ( 4607 ) = { 0.31820323, 6.74749082, 0.00000000 };
Point ( 4608 ) = { 0.32016640, 6.74739795, 0.00000000 };
Point ( 4609 ) = { 0.32212865, 6.74730455, 0.00000000 };
Point ( 4610 ) = { 0.32409176, 6.74721055, 0.00000000 };
Point ( 4611 ) = { 0.32605485, 6.74711597, 0.00000000 };
Point ( 4612 ) = { 0.32801702, 6.74702086, 0.00000000 };
Point ( 4613 ) = { 0.32998005, 6.74692514, 0.00000000 };
Point ( 4614 ) = { 0.33194216, 6.74682889, 0.00000000 };
Point ( 4615 ) = { 0.33390514, 6.74673202, 0.00000000 };
Point ( 4616 ) = { 0.33505432, 6.75007109, 0.00000000 };
Point ( 4617 ) = { 0.33620473, 6.75341484, 0.00000000 };
Point ( 4618 ) = { 0.33816962, 6.75331674, 0.00000000 };
Point ( 4619 ) = { 0.34013359, 6.75321811, 0.00000000 };
Point ( 4620 ) = { 0.34209842, 6.75311886, 0.00000000 };
Point ( 4621 ) = { 0.34406233, 6.75301909, 0.00000000 };
Point ( 4622 ) = { 0.34602711, 6.75291869, 0.00000000 };
Point ( 4623 ) = { 0.34799096, 6.75281778, 0.00000000 };
Point ( 4624 ) = { 0.34914880, 6.75616264, 0.00000000 };
Point ( 4625 ) = { 0.35030772, 6.75950910, 0.00000000 };
Point ( 4626 ) = { 0.35227348, 6.75940694, 0.00000000 };
Point ( 4627 ) = { 0.35424012, 6.75930416, 0.00000000 };
Point ( 4628 ) = { 0.35620673, 6.75920081, 0.00000000 };
Point ( 4629 ) = { 0.35817240, 6.75909693, 0.00000000 };
Point ( 4630 ) = { 0.36013895, 6.75899244, 0.00000000 };
Point ( 4631 ) = { 0.36210457, 6.75888741, 0.00000000 };
Point ( 4632 ) = { 0.36327048, 6.76223499, 0.00000000 };
Point ( 4633 ) = { 0.36443764, 6.76558729, 0.00000000 };
Point ( 4634 ) = { 0.36640517, 6.76548102, 0.00000000 };
Point ( 4635 ) = { 0.36837358, 6.76537412, 0.00000000 };
Point ( 4636 ) = { 0.37034105, 6.76526671, 0.00000000 };
Point ( 4637 ) = { 0.37230939, 6.76515867, 0.00000000 };
Point ( 4638 ) = { 0.37427680, 6.76505011, 0.00000000 };
Point ( 4639 ) = { 0.37624508, 6.76494093, 0.00000000 };
Point ( 4640 ) = { 0.37821242, 6.76483122, 0.00000000 };
Point ( 4641 ) = { 0.38018064, 6.76472090, 0.00000000 };
Point ( 4642 ) = { 0.38214792, 6.76461005, 0.00000000 };
Point ( 4643 ) = { 0.38411607, 6.76449858, 0.00000000 };
Point ( 4644 ) = { 0.38608418, 6.76438653, 0.00000000 };
Point ( 4645 ) = { 0.38805137, 6.76427396, 0.00000000 };
Point ( 4646 ) = { 0.39001942, 6.76416077, 0.00000000 };
Point ( 4647 ) = { 0.39080618, 6.76069953, 0.00000000 };
Point ( 4648 ) = { 0.39159224, 6.75724310, 0.00000000 };
Point ( 4649 ) = { 0.39355824, 6.75712888, 0.00000000 };
Point ( 4650 ) = { 0.39552331, 6.75701414, 0.00000000 };
Point ( 4651 ) = { 0.39748925, 6.75689878, 0.00000000 };
Point ( 4652 ) = { 0.39945426, 6.75678290, 0.00000000 };
Point ( 4653 ) = { 0.40142013, 6.75666639, 0.00000000 };
Point ( 4654 ) = { 0.40338507, 6.75654936, 0.00000000 };
Point ( 4655 ) = { 0.40535087, 6.75643171, 0.00000000 };
Point ( 4656 ) = { 0.40731574, 6.75631354, 0.00000000 };
Point ( 4657 ) = { 0.40850402, 6.75965325, 0.00000000 };
Point ( 4658 ) = { 0.40969359, 6.76299766, 0.00000000 };
Point ( 4659 ) = { 0.41166036, 6.76287822, 0.00000000 };
Point ( 4660 ) = { 0.41362801, 6.76275817, 0.00000000 };
Point ( 4661 ) = { 0.41559562, 6.76263753, 0.00000000 };
Point ( 4662 ) = { 0.41756229, 6.76251639, 0.00000000 };
Point ( 4663 ) = { 0.41952983, 6.76239461, 0.00000000 };
Point ( 4664 ) = { 0.42149643, 6.76227232, 0.00000000 };
Point ( 4665 ) = { 0.42346390, 6.76214940, 0.00000000 };
Point ( 4666 ) = { 0.42466101, 6.76549456, 0.00000000 };
Point ( 4667 ) = { 0.42585932, 6.76884287, 0.00000000 };
Point ( 4668 ) = { 0.42782870, 6.76871868, 0.00000000 };
Point ( 4669 ) = { 0.42979714, 6.76859397, 0.00000000 };
Point ( 4670 ) = { 0.43176644, 6.76846864, 0.00000000 };
Point ( 4671 ) = { 0.43373481, 6.76834279, 0.00000000 };
Point ( 4672 ) = { 0.43570405, 6.76821630, 0.00000000 };
Point ( 4673 ) = { 0.43690842, 6.77156603, 0.00000000 };
Point ( 4674 ) = { 0.43811389, 6.77491736, 0.00000000 };
Point ( 4675 ) = { 0.44008504, 6.77478960, 0.00000000 };
Point ( 4676 ) = { 0.44205524, 6.77466133, 0.00000000 };
Point ( 4677 ) = { 0.44402631, 6.77453243, 0.00000000 };
Point ( 4678 ) = { 0.44599735, 6.77440295, 0.00000000 };
Point ( 4679 ) = { 0.44796744, 6.77427296, 0.00000000 };
Point ( 4680 ) = { 0.44993840, 6.77414234, 0.00000000 };
Point ( 4681 ) = { 0.45190842, 6.77401120, 0.00000000 };
Point ( 4682 ) = { 0.45387930, 6.77387943, 0.00000000 };
Point ( 4683 ) = { 0.45584924, 6.77374715, 0.00000000 };
Point ( 4684 ) = { 0.45782005, 6.77361424, 0.00000000 };
Point ( 4685 ) = { 0.45903647, 6.77696520, 0.00000000 };
Point ( 4686 ) = { 0.46025412, 6.78031934, 0.00000000 };
Point ( 4687 ) = { 0.46222683, 6.78018514, 0.00000000 };
Point ( 4688 ) = { 0.46419861, 6.78005043, 0.00000000 };
Point ( 4689 ) = { 0.46617125, 6.77991508, 0.00000000 };
Point ( 4690 ) = { 0.46814294, 6.77977923, 0.00000000 };
Point ( 4691 ) = { 0.47011550, 6.77964273, 0.00000000 };
Point ( 4692 ) = { 0.47133924, 6.78299826, 0.00000000 };
Point ( 4693 ) = { 0.47256431, 6.78635854, 0.00000000 };
Point ( 4694 ) = { 0.47453878, 6.78622076, 0.00000000 };
Point ( 4695 ) = { 0.47576651, 6.78958382, 0.00000000 };
Point ( 4696 ) = { 0.47699546, 6.79295008, 0.00000000 };
Point ( 4697 ) = { 0.47897094, 6.79281107, 0.00000000 };
Point ( 4698 ) = { 0.48094730, 6.79267143, 0.00000000 };
Point ( 4699 ) = { 0.48292270, 6.79253127, 0.00000000 };
Point ( 4700 ) = { 0.48489897, 6.79239048, 0.00000000 };
Point ( 4701 ) = { 0.48613262, 6.79575852, 0.00000000 };
Point ( 4702 ) = { 0.48736739, 6.79912818, 0.00000000 };
Point ( 4703 ) = { 0.48934557, 6.79898610, 0.00000000 };
Point ( 4704 ) = { 0.49132282, 6.79884350, 0.00000000 };
Point ( 4705 ) = { 0.49330092, 6.79870026, 0.00000000 };
Point ( 4706 ) = { 0.49527808, 6.79855651, 0.00000000 };
Point ( 4707 ) = { 0.49725610, 6.79841212, 0.00000000 };
Point ( 4708 ) = { 0.49923317, 6.79826722, 0.00000000 };
Point ( 4709 ) = { 0.50121111, 6.79812168, 0.00000000 };
Point ( 4710 ) = { 0.50318810, 6.79797564, 0.00000000 };
Point ( 4711 ) = { 0.50516595, 6.79782895, 0.00000000 };
Point ( 4712 ) = { 0.50714376, 6.79768168, 0.00000000 };
Point ( 4713 ) = { 0.50912062, 6.79753391, 0.00000000 };
Point ( 4714 ) = { 0.51109835, 6.79738549, 0.00000000 };
Point ( 4715 ) = { 0.51307512, 6.79723657, 0.00000000 };
Point ( 4716 ) = { 0.51380382, 6.79372243, 0.00000000 };
Point ( 4717 ) = { 0.51453165, 6.79021005, 0.00000000 };
Point ( 4718 ) = { 0.51650634, 6.79006013, 0.00000000 };
Point ( 4719 ) = { 0.51848189, 6.78990957, 0.00000000 };
Point ( 4720 ) = { 0.52045649, 6.78975850, 0.00000000 };
Point ( 4721 ) = { 0.52243195, 6.78960678, 0.00000000 };
Point ( 4722 ) = { 0.52315449, 6.78609694, 0.00000000 };
Point ( 4723 ) = { 0.52387629, 6.78259042, 0.00000000 };
Point ( 4724 ) = { 0.52584966, 6.78243771, 0.00000000 };
Point ( 4725 ) = { 0.52782209, 6.78228450, 0.00000000 };
Point ( 4726 ) = { 0.52979538, 6.78213064, 0.00000000 };
Point ( 4727 ) = { 0.53051337, 6.77862683, 0.00000000 };
Point ( 4728 ) = { 0.53123074, 6.77512790, 0.00000000 };
Point ( 4729 ) = { 0.53320194, 6.77497305, 0.00000000 };
Point ( 4730 ) = { 0.53517310, 6.77481763, 0.00000000 };
Point ( 4731 ) = { 0.53588770, 6.77132160, 0.00000000 };
Point ( 4732 ) = { 0.53660156, 6.76782888, 0.00000000 };
Point ( 4733 ) = { 0.53857064, 6.76767247, 0.00000000 };
Point ( 4734 ) = { 0.54053877, 6.76751556, 0.00000000 };
Point ( 4735 ) = { 0.54250776, 6.76735800, 0.00000000 };
Point ( 4736 ) = { 0.54447580, 6.76719995, 0.00000000 };
Point ( 4737 ) = { 0.54518531, 6.76370967, 0.00000000 };
Point ( 4738 ) = { 0.54589396, 6.76022113, 0.00000000 };
Point ( 4739 ) = { 0.54785993, 6.76006209, 0.00000000 };
Point ( 4740 ) = { 0.54982675, 6.75990240, 0.00000000 };
Point ( 4741 ) = { 0.55179262, 6.75974222, 0.00000000 };
Point ( 4742 ) = { 0.55375935, 6.75958139, 0.00000000 };
Point ( 4743 ) = { 0.55572513, 6.75942006, 0.00000000 };
Point ( 4744 ) = { 0.55769176, 6.75925809, 0.00000000 };
Point ( 4745 ) = { 0.55965744, 6.75909561, 0.00000000 };
Point ( 4746 ) = { 0.56162398, 6.75893249, 0.00000000 };
Point ( 4747 ) = { 0.56359047, 6.75876880, 0.00000000 };
Point ( 4748 ) = { 0.56555601, 6.75860462, 0.00000000 };
Point ( 4749 ) = { 0.56752241, 6.75843978, 0.00000000 };
Point ( 4750 ) = { 0.56948785, 6.75827445, 0.00000000 };
Point ( 4751 ) = { 0.57145415, 6.75810847, 0.00000000 };
Point ( 4752 ) = { 0.57341950, 6.75794200, 0.00000000 };
Point ( 4753 ) = { 0.57538570, 6.75777487, 0.00000000 };
Point ( 4754 ) = { 0.57735096, 6.75760726, 0.00000000 };
Point ( 4755 ) = { 0.57931706, 6.75743899, 0.00000000 };
Point ( 4756 ) = { 0.58128221, 6.75727023, 0.00000000 };
Point ( 4757 ) = { 0.58324822, 6.75710082, 0.00000000 };
Point ( 4758 ) = { 0.58521328, 6.75693091, 0.00000000 };
Point ( 4759 ) = { 0.58717918, 6.75676036, 0.00000000 };
Point ( 4760 ) = { 0.58914414, 6.75658931, 0.00000000 };
Point ( 4761 ) = { 0.59110995, 6.75641762, 0.00000000 };
Point ( 4762 ) = { 0.59307570, 6.75624535, 0.00000000 };
Point ( 4763 ) = { 0.59504051, 6.75607258, 0.00000000 };
Point ( 4764 ) = { 0.59700617, 6.75589917, 0.00000000 };
Point ( 4765 ) = { 0.59897087, 6.75572526, 0.00000000 };
Point ( 4766 ) = { 0.60093643, 6.75555071, 0.00000000 };
Point ( 4767 ) = { 0.60161549, 6.75205986, 0.00000000 };
Point ( 4768 ) = { 0.60229385, 6.74857231, 0.00000000 };
Point ( 4769 ) = { 0.60425733, 6.74839679, 0.00000000 };
Point ( 4770 ) = { 0.60621985, 6.74822077, 0.00000000 };
Point ( 4771 ) = { 0.60818322, 6.74804411, 0.00000000 };
Point ( 4772 ) = { 0.61014564, 6.74786695, 0.00000000 };
Point ( 4773 ) = { 0.61210891, 6.74768915, 0.00000000 };
Point ( 4774 ) = { 0.61407123, 6.74751085, 0.00000000 };
Point ( 4775 ) = { 0.61603439, 6.74733190, 0.00000000 };
Point ( 4776 ) = { 0.61799661, 6.74715246, 0.00000000 };
Point ( 4777 ) = { 0.61995967, 6.74697237, 0.00000000 };
Point ( 4778 ) = { 0.62192268, 6.74679171, 0.00000000 };
Point ( 4779 ) = { 0.62388473, 6.74661055, 0.00000000 };
Point ( 4780 ) = { 0.62584764, 6.74642875, 0.00000000 };
Point ( 4781 ) = { 0.62780959, 6.74624646, 0.00000000 };
Point ( 4782 ) = { 0.62977238, 6.74606351, 0.00000000 };
Point ( 4783 ) = { 0.63173423, 6.74588008, 0.00000000 };
Point ( 4784 ) = { 0.63369692, 6.74569599, 0.00000000 };
Point ( 4785 ) = { 0.63565865, 6.74551141, 0.00000000 };
Point ( 4786 ) = { 0.63762124, 6.74532618, 0.00000000 };
Point ( 4787 ) = { 0.63958287, 6.74514046, 0.00000000 };
Point ( 4788 ) = { 0.64154534, 6.74495409, 0.00000000 };
Point ( 4789 ) = { 0.64284982, 6.74825886, 0.00000000 };
Point ( 4790 ) = { 0.64415559, 6.75156675, 0.00000000 };
Point ( 4791 ) = { 0.64611993, 6.75137904, 0.00000000 };
Point ( 4792 ) = { 0.64808332, 6.75119086, 0.00000000 };
Point ( 4793 ) = { 0.65004756, 6.75100201, 0.00000000 };
Point ( 4794 ) = { 0.65201174, 6.75081259, 0.00000000 };
Point ( 4795 ) = { 0.65397496, 6.75062269, 0.00000000 };
Point ( 4796 ) = { 0.65593903, 6.75043213, 0.00000000 };
Point ( 4797 ) = { 0.65725188, 6.75374085, 0.00000000 };
Point ( 4798 ) = { 0.65856587, 6.75705113, 0.00000000 };
Point ( 4799 ) = { 0.66053181, 6.75685924, 0.00000000 };
Point ( 4800 ) = { 0.66249680, 6.75666686, 0.00000000 };
Point ( 4801 ) = { 0.66446262, 6.75647382, 0.00000000 };
Point ( 4802 ) = { 0.66642749, 6.75628029, 0.00000000 };
Point ( 4803 ) = { 0.66839321, 6.75608611, 0.00000000 };
Point ( 4804 ) = { 0.67035796, 6.75589144, 0.00000000 };
Point ( 4805 ) = { 0.67232357, 6.75569612, 0.00000000 };
Point ( 4806 ) = { 0.67428821, 6.75550031, 0.00000000 };
Point ( 4807 ) = { 0.67625370, 6.75530384, 0.00000000 };
Point ( 4808 ) = { 0.67821823, 6.75510689, 0.00000000 };
Point ( 4809 ) = { 0.68018360, 6.75490927, 0.00000000 };
Point ( 4810 ) = { 0.68150995, 6.75821841, 0.00000000 };
Point ( 4811 ) = { 0.68283761, 6.76153067, 0.00000000 };
Point ( 4812 ) = { 0.68480395, 6.76133180, 0.00000000 };
Point ( 4813 ) = { 0.68677114, 6.76113227, 0.00000000 };
Point ( 4814 ) = { 0.68810160, 6.76444693, 0.00000000 };
Point ( 4815 ) = { 0.68879764, 6.77128940, 0.00000000 };
Point ( 4816 ) = { 0.69013127, 6.77461543, 0.00000000 };
Point ( 4817 ) = { 0.69146668, 6.77794457, 0.00000000 };
Point ( 4818 ) = { 0.69280326, 6.78127530, 0.00000000 };
Point ( 4819 ) = { 0.69477534, 6.78107353, 0.00000000 };
Point ( 4820 ) = { 0.69674827, 6.78087110, 0.00000000 };
Point ( 4821 ) = { 0.69872023, 6.78066819, 0.00000000 };
Point ( 4822 ) = { 0.70069304, 6.78046461, 0.00000000 };
Point ( 4823 ) = { 0.70266488, 6.78026055, 0.00000000 };
Point ( 4824 ) = { 0.70463757, 6.78005582, 0.00000000 };
Point ( 4825 ) = { 0.70598085, 6.78338741, 0.00000000 };
Point ( 4826 ) = { 0.70732563, 6.78672373, 0.00000000 };
Point ( 4827 ) = { 0.70930020, 6.78651765, 0.00000000 };
Point ( 4828 ) = { 0.71127381, 6.78631108, 0.00000000 };
Point ( 4829 ) = { 0.71324826, 6.78610385, 0.00000000 };
Point ( 4830 ) = { 0.71522264, 6.78589604, 0.00000000 };
Point ( 4831 ) = { 0.71719607, 6.78568776, 0.00000000 };
Point ( 4832 ) = { 0.71781928, 6.78214488, 0.00000000 };
Point ( 4833 ) = { 0.71844201, 6.77860694, 0.00000000 };
Point ( 4834 ) = { 0.72041332, 6.77839772, 0.00000000 };
Point ( 4835 ) = { 0.72238546, 6.77818783, 0.00000000 };
Point ( 4836 ) = { 0.72435665, 6.77797746, 0.00000000 };
Point ( 4837 ) = { 0.72632867, 6.77776642, 0.00000000 };
Point ( 4838 ) = { 0.72829973, 6.77755491, 0.00000000 };
Point ( 4839 ) = { 0.73027163, 6.77734272, 0.00000000 };
Point ( 4840 ) = { 0.73224257, 6.77713006, 0.00000000 };
Point ( 4841 ) = { 0.73421435, 6.77691673, 0.00000000 };
Point ( 4842 ) = { 0.73618516, 6.77670292, 0.00000000 };
Point ( 4843 ) = { 0.73815681, 6.77648844, 0.00000000 };
Point ( 4844 ) = { 0.74012750, 6.77627348, 0.00000000 };
Point ( 4845 ) = { 0.74209903, 6.77605785, 0.00000000 };
Point ( 4846 ) = { 0.74407049, 6.77584165, 0.00000000 };
Point ( 4847 ) = { 0.74604099, 6.77562498, 0.00000000 };
Point ( 4848 ) = { 0.74801233, 6.77540763, 0.00000000 };
Point ( 4849 ) = { 0.74998270, 6.77518981, 0.00000000 };
Point ( 4850 ) = { 0.75195392, 6.77497132, 0.00000000 };
Point ( 4851 ) = { 0.75392416, 6.77475235, 0.00000000 };
Point ( 4852 ) = { 0.75589525, 6.77453271, 0.00000000 };
Point ( 4853 ) = { 0.75786537, 6.77431259, 0.00000000 };
Point ( 4854 ) = { 0.75983632, 6.77409180, 0.00000000 };
Point ( 4855 ) = { 0.76180631, 6.77387054, 0.00000000 };
Point ( 4856 ) = { 0.76377714, 6.77364861, 0.00000000 };
Point ( 4857 ) = { 0.76574700, 6.77342620, 0.00000000 };
Point ( 4858 ) = { 0.76771770, 6.77320312, 0.00000000 };
Point ( 4859 ) = { 0.76968743, 6.77297957, 0.00000000 };
Point ( 4860 ) = { 0.77165800, 6.77275534, 0.00000000 };
Point ( 4861 ) = { 0.77362850, 6.77253054, 0.00000000 };
Point ( 4862 ) = { 0.77422132, 6.76899107, 0.00000000 };
Point ( 4863 ) = { 0.77481333, 6.76545340, 0.00000000 };
Point ( 4864 ) = { 0.77678171, 6.76522768, 0.00000000 };
Point ( 4865 ) = { 0.77874912, 6.76500149, 0.00000000 };
Point ( 4866 ) = { 0.78071736, 6.76477463, 0.00000000 };
Point ( 4867 ) = { 0.78268464, 6.76454730, 0.00000000 };
Point ( 4868 ) = { 0.78465276, 6.76431929, 0.00000000 };
Point ( 4869 ) = { 0.78661991, 6.76409081, 0.00000000 };
Point ( 4870 ) = { 0.78858789, 6.76386166, 0.00000000 };
Point ( 4871 ) = { 0.79055490, 6.76363204, 0.00000000 };
Point ( 4872 ) = { 0.79113851, 6.76009631, 0.00000000 };
Point ( 4873 ) = { 0.79172151, 6.75656394, 0.00000000 };
Point ( 4874 ) = { 0.79368640, 6.75633341, 0.00000000 };
Point ( 4875 ) = { 0.79565212, 6.75610220, 0.00000000 };
Point ( 4876 ) = { 0.79761688, 6.75587052, 0.00000000 };
Point ( 4877 ) = { 0.79819618, 6.75234100, 0.00000000 };
Point ( 4878 ) = { 0.79877506, 6.74881638, 0.00000000 };
Point ( 4879 ) = { 0.80073859, 6.74858369, 0.00000000 };
Point ( 4880 ) = { 0.80270116, 6.74835054, 0.00000000 };
Point ( 4881 ) = { 0.80327738, 6.74482893, 0.00000000 };
Point ( 4882 ) = { 0.80385299, 6.74131066, 0.00000000 };
Point ( 4883 ) = { 0.80581345, 6.74107660, 0.00000000 };
Point ( 4884 ) = { 0.80777473, 6.74084186, 0.00000000 };
Point ( 4885 ) = { 0.80834724, 6.73732664, 0.00000000 };
Point ( 4886 ) = { 0.80891896, 6.73381319, 0.00000000 };
Point ( 4887 ) = { 0.80949053, 6.73030301, 0.00000000 };
Point ( 4888 ) = { 0.81006150, 6.72679615, 0.00000000 };
Point ( 4889 ) = { 0.81201773, 6.72656029, 0.00000000 };
Point ( 4890 ) = { 0.81397479, 6.72632375, 0.00000000 };
Point ( 4891 ) = { 0.81454267, 6.72281993, 0.00000000 };
Point ( 4892 ) = { 0.81511014, 6.71932097, 0.00000000 };
Point ( 4893 ) = { 0.81706510, 6.71908353, 0.00000000 };
Point ( 4894 ) = { 0.81901909, 6.71884563, 0.00000000 };
Point ( 4895 ) = { 0.82097390, 6.71860705, 0.00000000 };
Point ( 4896 ) = { 0.82153773, 6.71511089, 0.00000000 };
Point ( 4897 ) = { 0.82210077, 6.71161650, 0.00000000 };
Point ( 4898 ) = { 0.82405348, 6.71137702, 0.00000000 };
Point ( 4899 ) = { 0.82600612, 6.71113698, 0.00000000 };
Point ( 4900 ) = { 0.82795780, 6.71089648, 0.00000000 };
Point ( 4901 ) = { 0.82991030, 6.71065530, 0.00000000 };
Point ( 4902 ) = { 0.83186184, 6.71041366, 0.00000000 };
Point ( 4903 ) = { 0.83381421, 6.71017135, 0.00000000 };
Point ( 4904 ) = { 0.83576560, 6.70992858, 0.00000000 };
Point ( 4905 ) = { 0.83771782, 6.70968513, 0.00000000 };
Point ( 4906 ) = { 0.83827215, 6.70619273, 0.00000000 };
Point ( 4907 ) = { 0.83882608, 6.70270516, 0.00000000 };
Point ( 4908 ) = { 0.84077620, 6.70246082, 0.00000000 };
Point ( 4909 ) = { 0.84272535, 6.70221602, 0.00000000 };
Point ( 4910 ) = { 0.84467533, 6.70197055, 0.00000000 };
Point ( 4911 ) = { 0.84662434, 6.70172462, 0.00000000 };
Point ( 4912 ) = { 0.84857418, 6.70147801, 0.00000000 };
Point ( 4913 ) = { 0.85052305, 6.70123094, 0.00000000 };
Point ( 4914 ) = { 0.85247273, 6.70098320, 0.00000000 };
Point ( 4915 ) = { 0.85301943, 6.69749774, 0.00000000 };
Point ( 4916 ) = { 0.85356536, 6.69401403, 0.00000000 };
Point ( 4917 ) = { 0.85551206, 6.69376551, 0.00000000 };
Point ( 4918 ) = { 0.85745958, 6.69351632, 0.00000000 };
Point ( 4919 ) = { 0.85940613, 6.69326667, 0.00000000 };
Point ( 4920 ) = { 0.86135350, 6.69301634, 0.00000000 };
Point ( 4921 ) = { 0.86329991, 6.69276556, 0.00000000 };
Point ( 4922 ) = { 0.86524714, 6.69251410, 0.00000000 };
Point ( 4923 ) = { 0.86719340, 6.69226219, 0.00000000 };
Point ( 4924 ) = { 0.86914048, 6.69200960, 0.00000000 };
Point ( 4925 ) = { 0.87108659, 6.69175655, 0.00000000 };
Point ( 4926 ) = { 0.87162283, 6.68827470, 0.00000000 };
Point ( 4927 ) = { 0.87215871, 6.68479766, 0.00000000 };
Point ( 4928 ) = { 0.87410273, 6.68454374, 0.00000000 };
Point ( 4929 ) = { 0.87604756, 6.68428913, 0.00000000 };
Point ( 4930 ) = { 0.87799143, 6.68403408, 0.00000000 };
Point ( 4931 ) = { 0.87993611, 6.68377835, 0.00000000 };
Point ( 4932 ) = { 0.88188072, 6.68352204, 0.00000000 };
Point ( 4933 ) = { 0.88382437, 6.68326530, 0.00000000 };
Point ( 4934 ) = { 0.88576883, 6.68300786, 0.00000000 };
Point ( 4935 ) = { 0.88771233, 6.68274998, 0.00000000 };
Point ( 4936 ) = { 0.88965664, 6.68249142, 0.00000000 };
Point ( 4937 ) = { 0.89159998, 6.68223241, 0.00000000 };
Point ( 4938 ) = { 0.89354414, 6.68197272, 0.00000000 };
Point ( 4939 ) = { 0.89406789, 6.67849731, 0.00000000 };
Point ( 4940 ) = { 0.89459088, 6.67502363, 0.00000000 };
Point ( 4941 ) = { 0.89653294, 6.67476307, 0.00000000 };
Point ( 4942 ) = { 0.89847404, 6.67450206, 0.00000000 };
Point ( 4943 ) = { 0.90041595, 6.67424037, 0.00000000 };
Point ( 4944 ) = { 0.90093536, 6.67076950, 0.00000000 };
Point ( 4945 ) = { 0.90145443, 6.66730342, 0.00000000 };
Point ( 4946 ) = { 0.90339424, 6.66704086, 0.00000000 };
Point ( 4947 ) = { 0.90533310, 6.66677785, 0.00000000 };
Point ( 4948 ) = { 0.90585005, 6.66331466, 0.00000000 };
Point ( 4949 ) = { 0.90636624, 6.65985320, 0.00000000 };
Point ( 4950 ) = { 0.90830389, 6.65958921, 0.00000000 };
Point ( 4951 ) = { 0.90881809, 6.65613090, 0.00000000 };
Point ( 4952 ) = { 0.90933196, 6.65267734, 0.00000000 };
Point ( 4953 ) = { 0.91126752, 6.65241249, 0.00000000 };
Point ( 4954 ) = { 0.91320212, 6.65214720, 0.00000000 };
Point ( 4955 ) = { 0.91371388, 6.64869652, 0.00000000 };
Point ( 4956 ) = { 0.91422489, 6.64524755, 0.00000000 };
Point ( 4957 ) = { 0.91615740, 6.64498140, 0.00000000 };
Point ( 4958 ) = { 0.91809073, 6.64471456, 0.00000000 };
Point ( 4959 ) = { 0.92002308, 6.64444729, 0.00000000 };
Point ( 4960 ) = { 0.92053055, 6.64100110, 0.00000000 };
Point ( 4961 ) = { 0.92103748, 6.63755814, 0.00000000 };
Point ( 4962 ) = { 0.92296776, 6.63729000, 0.00000000 };
Point ( 4963 ) = { 0.92489884, 6.63702119, 0.00000000 };
Point ( 4964 ) = { 0.92682896, 6.63675193, 0.00000000 };
Point ( 4965 ) = { 0.92875989, 6.63648199, 0.00000000 };
Point ( 4966 ) = { 0.93068985, 6.63621161, 0.00000000 };
Point ( 4967 ) = { 0.93262062, 6.63594054, 0.00000000 };
Point ( 4968 ) = { 0.93455131, 6.63566891, 0.00000000 };
Point ( 4969 ) = { 0.93648104, 6.63539685, 0.00000000 };
Point ( 4970 ) = { 0.93841157, 6.63512410, 0.00000000 };
Point ( 4971 ) = { 0.94034114, 6.63485091, 0.00000000 };
Point ( 4972 ) = { 0.94083753, 6.63140971, 0.00000000 };
Point ( 4973 ) = { 0.94133361, 6.62797323, 0.00000000 };
Point ( 4974 ) = { 0.94326110, 6.62769919, 0.00000000 };
Point ( 4975 ) = { 0.94518939, 6.62742447, 0.00000000 };
Point ( 4976 ) = { 0.94711672, 6.62714931, 0.00000000 };
Point ( 4977 ) = { 0.94904485, 6.62687347, 0.00000000 };
Point ( 4978 ) = { 0.95097202, 6.62659719, 0.00000000 };
Point ( 4979 ) = { 0.95289999, 6.62632022, 0.00000000 };
Point ( 4980 ) = { 0.95482700, 6.62604282, 0.00000000 };
Point ( 4981 ) = { 0.95675481, 6.62576474, 0.00000000 };
Point ( 4982 ) = { 0.95868165, 6.62548621, 0.00000000 };
Point ( 4983 ) = { 0.96060930, 6.62520701, 0.00000000 };
Point ( 4984 ) = { 0.96253686, 6.62492724, 0.00000000 };
Point ( 4985 ) = { 0.96446347, 6.62464703, 0.00000000 };
Point ( 4986 ) = { 0.96639087, 6.62436614, 0.00000000 };
Point ( 4987 ) = { 0.96831731, 6.62408482, 0.00000000 };
Point ( 4988 ) = { 0.97024455, 6.62380281, 0.00000000 };
Point ( 4989 ) = { 0.97217082, 6.62352036, 0.00000000 };
Point ( 4990 ) = { 0.97409790, 6.62323723, 0.00000000 };
Point ( 4991 ) = { 0.97602401, 6.62295366, 0.00000000 };
Point ( 4992 ) = { 0.97795091, 6.62266941, 0.00000000 };
Point ( 4993 ) = { 0.97987686, 6.62238472, 0.00000000 };
Point ( 4994 ) = { 0.98180360, 6.62209935, 0.00000000 };
Point ( 4995 ) = { 0.98372938, 6.62181354, 0.00000000 };
Point ( 4996 ) = { 0.98420296, 6.61837717, 0.00000000 };
Point ( 4997 ) = { 0.98467603, 6.61494400, 0.00000000 };
Point ( 4998 ) = { 0.98659973, 6.61465736, 0.00000000 };
Point ( 4999 ) = { 0.98852422, 6.61437003, 0.00000000 };
Point ( 5000 ) = { 0.99044864, 6.61408214, 0.00000000 };
Point ( 5001 ) = { 0.99237208, 6.61379382, 0.00000000 };
Point ( 5002 ) = { 0.99429633, 6.61350481, 0.00000000 };
Point ( 5003 ) = { 0.99621960, 6.61321537, 0.00000000 };
Point ( 5004 ) = { 0.99814368, 6.61292524, 0.00000000 };
Point ( 5005 ) = { 1.00006679, 6.61263468, 0.00000000 };
Point ( 5006 ) = { 1.00199070, 6.61234343, 0.00000000 };
Point ( 5007 ) = { 1.00391364, 6.61205175, 0.00000000 };
Point ( 5008 ) = { 1.00583737, 6.61175939, 0.00000000 };
Point ( 5009 ) = { 1.00776014, 6.61146659, 0.00000000 };
Point ( 5010 ) = { 1.00968371, 6.61117310, 0.00000000 };
Point ( 5011 ) = { 1.01160631, 6.61087919, 0.00000000 };
Point ( 5012 ) = { 1.01352970, 6.61058458, 0.00000000 };
Point ( 5013 ) = { 1.01545213, 6.61028955, 0.00000000 };
Point ( 5014 ) = { 1.01737536, 6.60999383, 0.00000000 };
Point ( 5015 ) = { 1.01929849, 6.60969754, 0.00000000 };
Point ( 5016 ) = { 1.02122066, 6.60940083, 0.00000000 };
Point ( 5017 ) = { 1.02314363, 6.60910343, 0.00000000 };
Point ( 5018 ) = { 1.02506563, 6.60880560, 0.00000000 };
Point ( 5019 ) = { 1.02698842, 6.60850708, 0.00000000 };
Point ( 5020 ) = { 1.02891024, 6.60820813, 0.00000000 };
Point ( 5021 ) = { 1.03083286, 6.60790849, 0.00000000 };
Point ( 5022 ) = { 1.03275451, 6.60760843, 0.00000000 };
Point ( 5023 ) = { 1.03467695, 6.60730767, 0.00000000 };
Point ( 5024 ) = { 1.03659842, 6.60700649, 0.00000000 };
Point ( 5025 ) = { 1.03852069, 6.60670461, 0.00000000 };
Point ( 5026 ) = { 1.04044199, 6.60640231, 0.00000000 };
Point ( 5027 ) = { 1.04236408, 6.60609931, 0.00000000 };
Point ( 5028 ) = { 1.04384355, 6.60923312, 0.00000000 };
Point ( 5029 ) = { 1.04532445, 6.61236984, 0.00000000 };
Point ( 5030 ) = { 1.04724828, 6.61206542, 0.00000000 };
Point ( 5031 ) = { 1.04917202, 6.61176044, 0.00000000 };
Point ( 5032 ) = { 1.05109479, 6.61145505, 0.00000000 };
Point ( 5033 ) = { 1.05301835, 6.61114895, 0.00000000 };
Point ( 5034 ) = { 1.05494094, 6.61084244, 0.00000000 };
Point ( 5035 ) = { 1.05686432, 6.61053522, 0.00000000 };
Point ( 5036 ) = { 1.05878674, 6.61022759, 0.00000000 };
Point ( 5037 ) = { 1.06070994, 6.60991925, 0.00000000 };
Point ( 5038 ) = { 1.06263217, 6.60961050, 0.00000000 };
Point ( 5039 ) = { 1.06455520, 6.60930105, 0.00000000 };
Point ( 5040 ) = { 1.06647725, 6.60899118, 0.00000000 };
Point ( 5041 ) = { 1.06840009, 6.60868060, 0.00000000 };
Point ( 5042 ) = { 1.07032196, 6.60836962, 0.00000000 };
Point ( 5043 ) = { 1.07224463, 6.60805793, 0.00000000 };
Point ( 5044 ) = { 1.07416632, 6.60774582, 0.00000000 };
Point ( 5045 ) = { 1.07608880, 6.60743301, 0.00000000 };
Point ( 5046 ) = { 1.07801119, 6.60711964, 0.00000000 };
Point ( 5047 ) = { 1.07993261, 6.60680586, 0.00000000 };
Point ( 5048 ) = { 1.08185481, 6.60649137, 0.00000000 };
Point ( 5049 ) = { 1.08377605, 6.60617647, 0.00000000 };
Point ( 5050 ) = { 1.08569807, 6.60586087, 0.00000000 };
Point ( 5051 ) = { 1.08761912, 6.60554485, 0.00000000 };
Point ( 5052 ) = { 1.08954096, 6.60522812, 0.00000000 };
Point ( 5053 ) = { 1.09146183, 6.60491099, 0.00000000 };
Point ( 5054 ) = { 1.09338349, 6.60459315, 0.00000000 };
Point ( 5055 ) = { 1.09530417, 6.60427489, 0.00000000 };
Point ( 5056 ) = { 1.09722564, 6.60395593, 0.00000000 };
Point ( 5057 ) = { 1.09914614, 6.60363656, 0.00000000 };
Point ( 5058 ) = { 1.09955967, 6.60019245, 0.00000000 };
Point ( 5059 ) = { 1.09997275, 6.59675154, 0.00000000 };
Point ( 5060 ) = { 1.10189115, 6.59643137, 0.00000000 };
Point ( 5061 ) = { 1.10381034, 6.59611050, 0.00000000 };
Point ( 5062 ) = { 1.10572943, 6.59578907, 0.00000000 };
Point ( 5063 ) = { 1.10764756, 6.59546722, 0.00000000 };
Point ( 5064 ) = { 1.10956646, 6.59514467, 0.00000000 };
Point ( 5065 ) = { 1.11148440, 6.59482171, 0.00000000 };
Point ( 5066 ) = { 1.11340312, 6.59449805, 0.00000000 };
Point ( 5067 ) = { 1.11532086, 6.59417397, 0.00000000 };
Point ( 5068 ) = { 1.11723939, 6.59384919, 0.00000000 };
Point ( 5069 ) = { 1.11915695, 6.59352400, 0.00000000 };
Point ( 5070 ) = { 1.12107529, 6.59319810, 0.00000000 };
Point ( 5071 ) = { 1.12299266, 6.59287179, 0.00000000 };
Point ( 5072 ) = { 1.12491081, 6.59254478, 0.00000000 };
Point ( 5073 ) = { 1.12682799, 6.59221736, 0.00000000 };
Point ( 5074 ) = { 1.12874595, 6.59188923, 0.00000000 };
Point ( 5075 ) = { 1.13066293, 6.59156069, 0.00000000 };
Point ( 5076 ) = { 1.13258070, 6.59123144, 0.00000000 };
Point ( 5077 ) = { 1.13449838, 6.59090164, 0.00000000 };
Point ( 5078 ) = { 1.13641508, 6.59057143, 0.00000000 };
Point ( 5079 ) = { 1.13833256, 6.59024051, 0.00000000 };
Point ( 5080 ) = { 1.14024906, 6.58990919, 0.00000000 };
Point ( 5081 ) = { 1.14216635, 6.58957715, 0.00000000 };
Point ( 5082 ) = { 1.14408267, 6.58924471, 0.00000000 };
Point ( 5083 ) = { 1.14599976, 6.58891156, 0.00000000 };
Point ( 5084 ) = { 1.14791588, 6.58857800, 0.00000000 };
Point ( 5085 ) = { 1.14983278, 6.58824374, 0.00000000 };
Point ( 5086 ) = { 1.15136310, 6.59135303, 0.00000000 };
Point ( 5087 ) = { 1.15289490, 6.59446521, 0.00000000 };
Point ( 5088 ) = { 1.15481352, 6.59412950, 0.00000000 };
Point ( 5089 ) = { 1.15673115, 6.59379338, 0.00000000 };
Point ( 5090 ) = { 1.15864957, 6.59345655, 0.00000000 };
Point ( 5091 ) = { 1.16056701, 6.59311931, 0.00000000 };
Point ( 5092 ) = { 1.16248523, 6.59278137, 0.00000000 };
Point ( 5093 ) = { 1.16440336, 6.59244286, 0.00000000 };
Point ( 5094 ) = { 1.16632050, 6.59210396, 0.00000000 };
Point ( 5095 ) = { 1.16823843, 6.59176434, 0.00000000 };
Point ( 5096 ) = { 1.17015538, 6.59142431, 0.00000000 };
Point ( 5097 ) = { 1.17207310, 6.59108358, 0.00000000 };
Point ( 5098 ) = { 1.17398986, 6.59074244, 0.00000000 };
Point ( 5099 ) = { 1.17590738, 6.59040059, 0.00000000 };
Point ( 5100 ) = { 1.17745154, 6.59351028, 0.00000000 };
Point ( 5101 ) = { 1.17899747, 6.59662437, 0.00000000 };
Point ( 5102 ) = { 1.18091671, 6.59628106, 0.00000000 };
Point ( 5103 ) = { 1.18283497, 6.59593735, 0.00000000 };
Point ( 5104 ) = { 1.18475401, 6.59559292, 0.00000000 };
Point ( 5105 ) = { 1.18667207, 6.59524810, 0.00000000 };
Point ( 5106 ) = { 1.18859091, 6.59490256, 0.00000000 };
Point ( 5107 ) = { 1.19050877, 6.59455662, 0.00000000 };
Point ( 5108 ) = { 1.19242741, 6.59420996, 0.00000000 };
Point ( 5109 ) = { 1.19434595, 6.59386274, 0.00000000 };
Point ( 5110 ) = { 1.19590063, 6.59697611, 0.00000000 };
Point ( 5111 ) = { 1.19745682, 6.60009238, 0.00000000 };
Point ( 5112 ) = { 1.19937707, 6.59974370, 0.00000000 };
Point ( 5113 ) = { 1.20129633, 6.59939462, 0.00000000 };
Point ( 5114 ) = { 1.20321638, 6.59904482, 0.00000000 };
Point ( 5115 ) = { 1.20513544, 6.59869463, 0.00000000 };
Point ( 5116 ) = { 1.20705529, 6.59834371, 0.00000000 };
Point ( 5117 ) = { 1.20897415, 6.59799240, 0.00000000 };
Point ( 5118 ) = { 1.21089378, 6.59764037, 0.00000000 };
Point ( 5119 ) = { 1.21281244, 6.59728794, 0.00000000 };
Point ( 5120 ) = { 1.21473187, 6.59693479, 0.00000000 };
Point ( 5121 ) = { 1.21665032, 6.59658125, 0.00000000 };
Point ( 5122 ) = { 1.21856955, 6.59622699, 0.00000000 };
Point ( 5123 ) = { 1.22048779, 6.59587233, 0.00000000 };
Point ( 5124 ) = { 1.22240681, 6.59551695, 0.00000000 };
Point ( 5125 ) = { 1.22432573, 6.59516101, 0.00000000 };
Point ( 5126 ) = { 1.22467389, 6.59169523, 0.00000000 };
Point ( 5127 ) = { 1.22502166, 6.58823269, 0.00000000 };
Point ( 5128 ) = { 1.22693846, 6.58787599, 0.00000000 };
Point ( 5129 ) = { 1.22885427, 6.58751890, 0.00000000 };
Point ( 5130 ) = { 1.23077086, 6.58716109, 0.00000000 };
Point ( 5131 ) = { 1.23268647, 6.58680288, 0.00000000 };
Point ( 5132 ) = { 1.23460285, 6.58644395, 0.00000000 };
Point ( 5133 ) = { 1.23494521, 6.58298415, 0.00000000 };
Point ( 5134 ) = { 1.23528747, 6.57952908, 0.00000000 };
Point ( 5135 ) = { 1.23720173, 6.57916940, 0.00000000 };
Point ( 5136 ) = { 1.23911501, 6.57880932, 0.00000000 };
Point ( 5137 ) = { 1.24102907, 6.57844852, 0.00000000 };
Point ( 5138 ) = { 1.24294214, 6.57808733, 0.00000000 };
Point ( 5139 ) = { 1.24328044, 6.57463501, 0.00000000 };
Point ( 5140 ) = { 1.24361836, 6.57118592, 0.00000000 };
Point ( 5141 ) = { 1.24552933, 6.57082397, 0.00000000 };
Point ( 5142 ) = { 1.24744106, 6.57046131, 0.00000000 };
Point ( 5143 ) = { 1.24935268, 6.57009809, 0.00000000 };
Point ( 5144 ) = { 1.25126333, 6.56973448, 0.00000000 };
Point ( 5145 ) = { 1.25159686, 6.56628821, 0.00000000 };
Point ( 5146 ) = { 1.25192975, 6.56284366, 0.00000000 };
Point ( 5147 ) = { 1.25383828, 6.56247930, 0.00000000 };
Point ( 5148 ) = { 1.25574758, 6.56211422, 0.00000000 };
Point ( 5149 ) = { 1.25765591, 6.56174875, 0.00000000 };
Point ( 5150 ) = { 1.25956500, 6.56138255, 0.00000000 };
Point ( 5151 ) = { 1.26147311, 6.56101597, 0.00000000 };
Point ( 5152 ) = { 1.26338198, 6.56064867, 0.00000000 };
Point ( 5153 ) = { 1.26528988, 6.56028098, 0.00000000 };
Point ( 5154 ) = { 1.26719854, 6.55991256, 0.00000000 };
Point ( 5155 ) = { 1.26910622, 6.55954376, 0.00000000 };
Point ( 5156 ) = { 1.26942972, 6.55610157, 0.00000000 };
Point ( 5157 ) = { 1.26975286, 6.55266258, 0.00000000 };
Point ( 5158 ) = { 1.27165844, 6.55229304, 0.00000000 };
Point ( 5159 ) = { 1.27356477, 6.55192277, 0.00000000 };
Point ( 5160 ) = { 1.27547100, 6.55155195, 0.00000000 };
Point ( 5161 ) = { 1.27705755, 6.55462002, 0.00000000 };
Point ( 5162 ) = { 1.27864564, 6.55769093, 0.00000000 };
Point ( 5163 ) = { 1.28055355, 6.55731863, 0.00000000 };
Point ( 5164 ) = { 1.28246047, 6.55694595, 0.00000000 };
Point ( 5165 ) = { 1.28436816, 6.55657254, 0.00000000 };
Point ( 5166 ) = { 1.28627487, 6.55619874, 0.00000000 };
Point ( 5167 ) = { 1.28818235, 6.55582422, 0.00000000 };
Point ( 5168 ) = { 1.29008884, 6.55544932, 0.00000000 };
Point ( 5169 ) = { 1.29199609, 6.55507369, 0.00000000 };
Point ( 5170 ) = { 1.29390237, 6.55469768, 0.00000000 };
Point ( 5171 ) = { 1.29549958, 6.55776764, 0.00000000 };
Point ( 5172 ) = { 1.29709803, 6.56083895, 0.00000000 };
Point ( 5173 ) = { 1.29900598, 6.56046145, 0.00000000 };
Point ( 5174 ) = { 1.30091470, 6.56008323, 0.00000000 };
Point ( 5175 ) = { 1.30282243, 6.55970462, 0.00000000 };
Point ( 5176 ) = { 1.30442512, 6.56277738, 0.00000000 };
Point ( 5177 ) = { 1.30602936, 6.56585298, 0.00000000 };
Point ( 5178 ) = { 1.30793964, 6.56547272, 0.00000000 };
Point ( 5179 ) = { 1.30984894, 6.56509207, 0.00000000 };
Point ( 5180 ) = { 1.31175900, 6.56471069, 0.00000000 };
Point ( 5181 ) = { 1.31366808, 6.56432893, 0.00000000 };
Point ( 5182 ) = { 1.31557791, 6.56394644, 0.00000000 };
Point ( 5183 ) = { 1.31718775, 6.56702264, 0.00000000 };
Point ( 5184 ) = { 1.31879945, 6.57010320, 0.00000000 };
Point ( 5185 ) = { 1.32071097, 6.56971922, 0.00000000 };
Point ( 5186 ) = { 1.32262150, 6.56933486, 0.00000000 };
Point ( 5187 ) = { 1.32453279, 6.56894976, 0.00000000 };
Point ( 5188 ) = { 1.32644310, 6.56856429, 0.00000000 };
Point ( 5189 ) = { 1.32835417, 6.56817808, 0.00000000 };
Point ( 5190 ) = { 1.33026425, 6.56779149, 0.00000000 };
Point ( 5191 ) = { 1.33217510, 6.56740417, 0.00000000 };
Point ( 5192 ) = { 1.33408496, 6.56701648, 0.00000000 };
Point ( 5193 ) = { 1.33599558, 6.56662805, 0.00000000 };
Point ( 5194 ) = { 1.33790608, 6.56623906, 0.00000000 };
Point ( 5195 ) = { 1.33981560, 6.56584970, 0.00000000 };
Point ( 5196 ) = { 1.34172588, 6.56545960, 0.00000000 };
Point ( 5197 ) = { 1.34363517, 6.56506912, 0.00000000 };
Point ( 5198 ) = { 1.34554522, 6.56467792, 0.00000000 };
Point ( 5199 ) = { 1.34745429, 6.56428633, 0.00000000 };
Point ( 5200 ) = { 1.34936411, 6.56389401, 0.00000000 };
Point ( 5201 ) = { 1.35127295, 6.56350131, 0.00000000 };
Point ( 5202 ) = { 1.35318254, 6.56310788, 0.00000000 };
Point ( 5203 ) = { 1.35509115, 6.56271408, 0.00000000 };
Point ( 5204 ) = { 1.35700052, 6.56231954, 0.00000000 };
Point ( 5205 ) = { 1.35890890, 6.56192462, 0.00000000 };
Point ( 5206 ) = { 1.36081803, 6.56152897, 0.00000000 };
Point ( 5207 ) = { 1.36272618, 6.56113294, 0.00000000 };
Point ( 5208 ) = { 1.36463509, 6.56073618, 0.00000000 };
Point ( 5209 ) = { 1.36654388, 6.56033886, 0.00000000 };
Point ( 5210 ) = { 1.36845168, 6.55994117, 0.00000000 };
Point ( 5211 ) = { 1.37036024, 6.55954274, 0.00000000 };
Point ( 5212 ) = { 1.37226781, 6.55914393, 0.00000000 };
Point ( 5213 ) = { 1.37417614, 6.55874439, 0.00000000 };
Point ( 5214 ) = { 1.37608347, 6.55834448, 0.00000000 };
Point ( 5215 ) = { 1.37799157, 6.55794383, 0.00000000 };
Point ( 5216 ) = { 1.37989867, 6.55754281, 0.00000000 };
Point ( 5217 ) = { 1.38180653, 6.55714105, 0.00000000 };
Point ( 5218 ) = { 1.38371340, 6.55673892, 0.00000000 };
Point ( 5219 ) = { 1.38562103, 6.55633605, 0.00000000 };
Point ( 5220 ) = { 1.38752767, 6.55593281, 0.00000000 };
Point ( 5221 ) = { 1.38943506, 6.55552883, 0.00000000 };
Point ( 5222 ) = { 1.38969581, 6.55206193, 0.00000000 };
Point ( 5223 ) = { 1.38995657, 6.54859976, 0.00000000 };
Point ( 5224 ) = { 1.39186183, 6.54819507, 0.00000000 };
Point ( 5225 ) = { 1.39376697, 6.54778983, 0.00000000 };
Point ( 5226 ) = { 1.39567112, 6.54738423, 0.00000000 };
Point ( 5227 ) = { 1.39757603, 6.54697788, 0.00000000 };
Point ( 5228 ) = { 1.39783246, 6.54351864, 0.00000000 };
Point ( 5229 ) = { 1.39808859, 6.54006264, 0.00000000 };
Point ( 5230 ) = { 1.39999137, 6.53965558, 0.00000000 };
Point ( 5231 ) = { 1.40189315, 6.53924817, 0.00000000 };
Point ( 5232 ) = { 1.40379569, 6.53884001, 0.00000000 };
Point ( 5233 ) = { 1.40569724, 6.53843148, 0.00000000 };
Point ( 5234 ) = { 1.40759954, 6.53802222, 0.00000000 };
Point ( 5235 ) = { 1.40950085, 6.53761259, 0.00000000 };
Point ( 5236 ) = { 1.40975109, 6.53415927, 0.00000000 };
Point ( 5237 ) = { 1.41000072, 6.53070769, 0.00000000 };
Point ( 5238 ) = { 1.41189990, 6.53029736, 0.00000000 };
Point ( 5239 ) = { 1.41379983, 6.52988630, 0.00000000 };
Point ( 5240 ) = { 1.41569878, 6.52947486, 0.00000000 };
Point ( 5241 ) = { 1.41759847, 6.52906269, 0.00000000 };
Point ( 5242 ) = { 1.41784379, 6.52561404, 0.00000000 };
Point ( 5243 ) = { 1.41808883, 6.52216861, 0.00000000 };
Point ( 5244 ) = { 1.41998553, 6.52175593, 0.00000000 };
Point ( 5245 ) = { 1.42188298, 6.52134250, 0.00000000 };
Point ( 5246 ) = { 1.42212528, 6.51790023, 0.00000000 };
Point ( 5247 ) = { 1.42236763, 6.51446265, 0.00000000 };
Point ( 5248 ) = { 1.42426296, 6.51404854, 0.00000000 };
Point ( 5249 ) = { 1.42450402, 6.51061408, 0.00000000 };
Point ( 5250 ) = { 1.42474447, 6.50718134, 0.00000000 };
Point ( 5251 ) = { 1.42498508, 6.50375170, 0.00000000 };
Point ( 5252 ) = { 1.42333439, 6.50074111, 0.00000000 };
Point ( 5253 ) = { 1.42144380, 6.50115476, 0.00000000 };
Point ( 5254 ) = { 1.41955223, 6.50156806, 0.00000000 };
Point ( 5255 ) = { 1.41790531, 6.49855919, 0.00000000 };
Point ( 5256 ) = { 1.41625965, 6.49555161, 0.00000000 };
Point ( 5257 ) = { 1.41436971, 6.49596340, 0.00000000 };
Point ( 5258 ) = { 1.41248051, 6.49637445, 0.00000000 };
Point ( 5259 ) = { 1.41059033, 6.49678513, 0.00000000 };
Point ( 5260 ) = { 1.40894844, 6.49377898, 0.00000000 };
Point ( 5261 ) = { 1.40730845, 6.49077707, 0.00000000 };
Point ( 5262 ) = { 1.40542076, 6.49118606, 0.00000000 };
Point ( 5263 ) = { 1.40353209, 6.49159469, 0.00000000 };
Point ( 5264 ) = { 1.40164416, 6.49200259, 0.00000000 };
Point ( 5265 ) = { 1.40000837, 6.48900200, 0.00000000 };
Point ( 5266 ) = { 1.39837382, 6.48600270, 0.00000000 };
Point ( 5267 ) = { 1.39648752, 6.48640909, 0.00000000 };
Point ( 5268 ) = { 1.39485542, 6.48341207, 0.00000000 };
Point ( 5269 ) = { 1.39348108, 6.47702402, 0.00000000 };
Point ( 5270 ) = { 1.39185279, 6.47403570, 0.00000000 };
Point ( 5271 ) = { 1.39022649, 6.47105002, 0.00000000 };
Point ( 5272 ) = { 1.39048303, 6.46766443, 0.00000000 };
Point ( 5273 ) = { 1.39073970, 6.46428187, 0.00000000 };
Point ( 5274 ) = { 1.39099576, 6.46090097, 0.00000000 };
Point ( 5275 ) = { 1.39125110, 6.45752328, 0.00000000 };
Point ( 5276 ) = { 1.39150614, 6.45414871, 0.00000000 };
Point ( 5277 ) = { 1.39338392, 6.45374357, 0.00000000 };
Point ( 5278 ) = { 1.39526072, 6.45333808, 0.00000000 };
Point ( 5279 ) = { 1.39551393, 6.44996637, 0.00000000 };
Point ( 5280 ) = { 1.39576717, 6.44659922, 0.00000000 };
Point ( 5281 ) = { 1.39764189, 6.44619303, 0.00000000 };
Point ( 5282 ) = { 1.39951735, 6.44578611, 0.00000000 };
Point ( 5283 ) = { 1.40139270, 6.44537865, 0.00000000 };
Point ( 5284 ) = { 1.40326707, 6.44497083, 0.00000000 };
Point ( 5285 ) = { 1.40351609, 6.44160648, 0.00000000 };
Point ( 5286 ) = { 1.40376483, 6.43824521, 0.00000000 };
Point ( 5287 ) = { 1.40563712, 6.43783670, 0.00000000 };
Point ( 5288 ) = { 1.40751016, 6.43742746, 0.00000000 };
Point ( 5289 ) = { 1.40938221, 6.43701786, 0.00000000 };
Point ( 5290 ) = { 1.41125500, 6.43660753, 0.00000000 };
Point ( 5291 ) = { 1.41312682, 6.43619684, 0.00000000 };
Point ( 5292 ) = { 1.41499937, 6.43578542, 0.00000000 };
Point ( 5293 ) = { 1.41687095, 6.43537364, 0.00000000 };
Point ( 5294 ) = { 1.41874327, 6.43496113, 0.00000000 };
Point ( 5295 ) = { 1.42061460, 6.43454826, 0.00000000 };
Point ( 5296 ) = { 1.42248668, 6.43413466, 0.00000000 };
Point ( 5297 ) = { 1.42435777, 6.43372070, 0.00000000 };
Point ( 5298 ) = { 1.42622961, 6.43330601, 0.00000000 };
Point ( 5299 ) = { 1.42646633, 6.42994699, 0.00000000 };
Point ( 5300 ) = { 1.42670246, 6.42658962, 0.00000000 };
Point ( 5301 ) = { 1.42857136, 6.42617443, 0.00000000 };
Point ( 5302 ) = { 1.43044100, 6.42575852, 0.00000000 };
Point ( 5303 ) = { 1.43230966, 6.42534225, 0.00000000 };
Point ( 5304 ) = { 1.43417906, 6.42492525, 0.00000000 };
Point ( 5305 ) = { 1.43604747, 6.42450789, 0.00000000 };
Point ( 5306 ) = { 1.43791663, 6.42408980, 0.00000000 };
Point ( 5307 ) = { 1.43978480, 6.42367136, 0.00000000 };
Point ( 5308 ) = { 1.44165371, 6.42325218, 0.00000000 };
Point ( 5309 ) = { 1.44352164, 6.42283265, 0.00000000 };
Point ( 5310 ) = { 1.44539030, 6.42241239, 0.00000000 };
Point ( 5311 ) = { 1.44725799, 6.42199177, 0.00000000 };
Point ( 5312 ) = { 1.44912641, 6.42157042, 0.00000000 };
Point ( 5313 ) = { 1.45099385, 6.42114872, 0.00000000 };
Point ( 5314 ) = { 1.45286203, 6.42072628, 0.00000000 };
Point ( 5315 ) = { 1.45308422, 6.41737105, 0.00000000 };
Point ( 5316 ) = { 1.45330614, 6.41401890, 0.00000000 };
Point ( 5317 ) = { 1.45517139, 6.41359598, 0.00000000 };
Point ( 5318 ) = { 1.45703736, 6.41317233, 0.00000000 };
Point ( 5319 ) = { 1.45890236, 6.41274833, 0.00000000 };
Point ( 5320 ) = { 1.46076809, 6.41232359, 0.00000000 };
Point ( 5321 ) = { 1.46098543, 6.40897435, 0.00000000 };
Point ( 5322 ) = { 1.46120284, 6.40562963, 0.00000000 };
Point ( 5323 ) = { 1.46306650, 6.40520422, 0.00000000 };
Point ( 5324 ) = { 1.46492918, 6.40477846, 0.00000000 };
Point ( 5325 ) = { 1.46657767, 6.40769698, 0.00000000 };
Point ( 5326 ) = { 1.46822807, 6.41061959, 0.00000000 };
Point ( 5327 ) = { 1.47009232, 6.41019233, 0.00000000 };
Point ( 5328 ) = { 1.47195731, 6.40976434, 0.00000000 };
Point ( 5329 ) = { 1.47382131, 6.40933600, 0.00000000 };
Point ( 5330 ) = { 1.47568605, 6.40890692, 0.00000000 };
Point ( 5331 ) = { 1.47754981, 6.40847749, 0.00000000 };
Point ( 5332 ) = { 1.47941430, 6.40804733, 0.00000000 };
Point ( 5333 ) = { 1.48127866, 6.40761662, 0.00000000 };
Point ( 5334 ) = { 1.48314204, 6.40718557, 0.00000000 };
Point ( 5335 ) = { 1.48500615, 6.40675378, 0.00000000 };
Point ( 5336 ) = { 1.48686928, 6.40632164, 0.00000000 };
Point ( 5337 ) = { 1.48873314, 6.40588876, 0.00000000 };
Point ( 5338 ) = { 1.49059602, 6.40545554, 0.00000000 };
Point ( 5339 ) = { 1.49245962, 6.40502158, 0.00000000 };
Point ( 5340 ) = { 1.49432225, 6.40458728, 0.00000000 };
Point ( 5341 ) = { 1.49618561, 6.40415223, 0.00000000 };
Point ( 5342 ) = { 1.49784989, 6.40707036, 0.00000000 };
Point ( 5343 ) = { 1.49951575, 6.40999115, 0.00000000 };
Point ( 5344 ) = { 1.50138068, 6.40955459, 0.00000000 };
Point ( 5345 ) = { 1.50324462, 6.40911769, 0.00000000 };
Point ( 5346 ) = { 1.50510929, 6.40868005, 0.00000000 };
Point ( 5347 ) = { 1.50697299, 6.40824207, 0.00000000 };
Point ( 5348 ) = { 1.50864426, 6.41116347, 0.00000000 };
Point ( 5349 ) = { 1.51031679, 6.41408609, 0.00000000 };
Point ( 5350 ) = { 1.51218291, 6.41364639, 0.00000000 };
Point ( 5351 ) = { 1.51404804, 6.41320635, 0.00000000 };
Point ( 5352 ) = { 1.51591390, 6.41276556, 0.00000000 };
Point ( 5353 ) = { 1.51759015, 6.41568948, 0.00000000 };
Point ( 5354 ) = { 1.51926799, 6.41861607, 0.00000000 };
Point ( 5355 ) = { 1.52113543, 6.41817376, 0.00000000 };
Point ( 5356 ) = { 1.52281572, 6.42110252, 0.00000000 };
Point ( 5357 ) = { 1.52431266, 6.42741452, 0.00000000 };
Point ( 5358 ) = { 1.52599725, 6.43035325, 0.00000000 };
Point ( 5359 ) = { 1.52768389, 6.43329456, 0.00000000 };
Point ( 5360 ) = { 1.52937179, 6.43623711, 0.00000000 };
Point ( 5361 ) = { 1.53106087, 6.43918245, 0.00000000 };
Point ( 5362 ) = { 1.53275191, 6.44213194, 0.00000000 };
Point ( 5363 ) = { 1.53444500, 6.44508403, 0.00000000 };
Point ( 5364 ) = { 1.53595837, 6.45144058, 0.00000000 };
Point ( 5365 ) = { 1.53747535, 6.45781232, 0.00000000 };
Point ( 5366 ) = { 1.53899457, 6.46419345, 0.00000000 };
Point ( 5367 ) = { 1.53881477, 6.46761403, 0.00000000 };
Point ( 5368 ) = { 1.53863517, 6.47103769, 0.00000000 };
Point ( 5369 ) = { 1.53845500, 6.47446306, 0.00000000 };
Point ( 5370 ) = { 1.53827416, 6.47789172, 0.00000000 };
Point ( 5371 ) = { 1.53809345, 6.48132504, 0.00000000 };
Point ( 5372 ) = { 1.53791294, 6.48476146, 0.00000000 };
Point ( 5373 ) = { 1.53773186, 6.48819960, 0.00000000 };
Point ( 5374 ) = { 1.53755011, 6.49164104, 0.00000000 };
Point ( 5375 ) = { 1.53907731, 6.49808900, 0.00000000 };
Point ( 5376 ) = { 1.53889623, 6.50154162, 0.00000000 };
Point ( 5377 ) = { 1.53871535, 6.50499736, 0.00000000 };
Point ( 5378 ) = { 1.53853390, 6.50845484, 0.00000000 };
Point ( 5379 ) = { 1.53835178, 6.51191566, 0.00000000 };
Point ( 5380 ) = { 1.53816942, 6.51537972, 0.00000000 };
Point ( 5381 ) = { 1.53798728, 6.51884692, 0.00000000 };
Point ( 5382 ) = { 1.53780525, 6.52231884, 0.00000000 };
Point ( 5383 ) = { 1.53762256, 6.52579413, 0.00000000 };
Point ( 5384 ) = { 1.53915712, 6.53230693, 0.00000000 };
Point ( 5385 ) = { 1.54069397, 6.53882947, 0.00000000 };
Point ( 5386 ) = { 1.54241558, 6.54187271, 0.00000000 };
Point ( 5387 ) = { 1.54413842, 6.54491888, 0.00000000 };
Point ( 5388 ) = { 1.54586258, 6.54796639, 0.00000000 };
Point ( 5389 ) = { 1.54758885, 6.55101664, 0.00000000 };
Point ( 5390 ) = { 1.54931716, 6.55407123, 0.00000000 };
Point ( 5391 ) = { 1.55104671, 6.55712878, 0.00000000 };
Point ( 5392 ) = { 1.55260138, 6.56370123, 0.00000000 };
Point ( 5393 ) = { 1.55242530, 6.56721960, 0.00000000 };
Point ( 5394 ) = { 1.55224856, 6.57074140, 0.00000000 };
Point ( 5395 ) = { 1.55207123, 6.57426502, 0.00000000 };
Point ( 5396 ) = { 1.55189412, 6.57779186, 0.00000000 };
Point ( 5397 ) = { 1.55171713, 6.58132354, 0.00000000 };
Point ( 5398 ) = { 1.54980223, 6.58177474, 0.00000000 };
Point ( 5399 ) = { 1.54788719, 6.58222538, 0.00000000 };
Point ( 5400 ) = { 1.54770792, 6.58576030, 0.00000000 };
Point ( 5401 ) = { 1.54752807, 6.58929706, 0.00000000 };
Point ( 5402 ) = { 1.54561084, 6.58974703, 0.00000000 };
Point ( 5403 ) = { 1.54369436, 6.59019624, 0.00000000 };
Point ( 5404 ) = { 1.54351178, 6.59373634, 0.00000000 };
Point ( 5405 ) = { 1.54332932, 6.59728132, 0.00000000 };
Point ( 5406 ) = { 1.54141065, 6.59772986, 0.00000000 };
Point ( 5407 ) = { 1.53949097, 6.59817806, 0.00000000 };
Point ( 5408 ) = { 1.53930665, 6.60172618, 0.00000000 };
Point ( 5409 ) = { 1.53912209, 6.60527767, 0.00000000 };
Point ( 5410 ) = { 1.53720022, 6.60572520, 0.00000000 };
Point ( 5411 ) = { 1.53527910, 6.60617197, 0.00000000 };
Point ( 5412 ) = { 1.53509180, 6.60972682, 0.00000000 };
Point ( 5413 ) = { 1.53490391, 6.61328353, 0.00000000 };
Point ( 5414 ) = { 1.53298059, 6.61372962, 0.00000000 };
Point ( 5415 ) = { 1.53105625, 6.61417536, 0.00000000 };
Point ( 5416 ) = { 1.53086649, 6.61773523, 0.00000000 };
Point ( 5417 ) = { 1.53067649, 6.62129849, 0.00000000 };
Point ( 5418 ) = { 1.52874996, 6.62174356, 0.00000000 };
Point ( 5419 ) = { 1.52682329, 6.62218807, 0.00000000 };
Point ( 5420 ) = { 1.52663098, 6.62575460, 0.00000000 };
Point ( 5421 ) = { 1.52643877, 6.62932605, 0.00000000 };
Point ( 5422 ) = { 1.52450990, 6.62976989, 0.00000000 };
Point ( 5423 ) = { 1.52258178, 6.63021296, 0.00000000 };
Point ( 5424 ) = { 1.52238681, 6.63378781, 0.00000000 };
Point ( 5425 ) = { 1.52219159, 6.63736606, 0.00000000 };
Point ( 5426 ) = { 1.52026127, 6.63780846, 0.00000000 };
Point ( 5427 ) = { 1.51832993, 6.63825049, 0.00000000 };
Point ( 5428 ) = { 1.51639935, 6.63869177, 0.00000000 };
Point ( 5429 ) = { 1.51620076, 6.64227326, 0.00000000 };
Point ( 5430 ) = { 1.51600157, 6.64585662, 0.00000000 };
Point ( 5431 ) = { 1.51406877, 6.64629722, 0.00000000 };
Point ( 5432 ) = { 1.51213497, 6.64673746, 0.00000000 };
Point ( 5433 ) = { 1.51020192, 6.64717693, 0.00000000 };
Point ( 5434 ) = { 1.50826786, 6.64761605, 0.00000000 };
Point ( 5435 ) = { 1.50633455, 6.64805439, 0.00000000 };
Point ( 5436 ) = { 1.50612989, 6.65164088, 0.00000000 };
Point ( 5437 ) = { 1.50592533, 6.65523234, 0.00000000 };
Point ( 5438 ) = { 1.50398892, 6.65567020, 0.00000000 };
Point ( 5439 ) = { 1.50205328, 6.65610731, 0.00000000 };
Point ( 5440 ) = { 1.50011662, 6.65654405, 0.00000000 };
Point ( 5441 ) = { 1.49818072, 6.65698003, 0.00000000 };
Point ( 5442 ) = { 1.49624380, 6.65741564, 0.00000000 };
Point ( 5443 ) = { 1.49430765, 6.65785049, 0.00000000 };
Point ( 5444 ) = { 1.49237048, 6.65828498, 0.00000000 };
Point ( 5445 ) = { 1.49043407, 6.65871871, 0.00000000 };
Point ( 5446 ) = { 1.48849665, 6.65915207, 0.00000000 };
Point ( 5447 ) = { 1.48656000, 6.65958467, 0.00000000 };
Point ( 5448 ) = { 1.48462232, 6.66001690, 0.00000000 };
Point ( 5449 ) = { 1.48268541, 6.66044837, 0.00000000 };
Point ( 5450 ) = { 1.48074749, 6.66087948, 0.00000000 };
Point ( 5451 ) = { 1.47881033, 6.66130982, 0.00000000 };
Point ( 5452 ) = { 1.47687216, 6.66173980, 0.00000000 };
Point ( 5453 ) = { 1.47493386, 6.66216922, 0.00000000 };
Point ( 5454 ) = { 1.47299632, 6.66259787, 0.00000000 };
Point ( 5455 ) = { 1.47105778, 6.66302616, 0.00000000 };
Point ( 5456 ) = { 1.46911999, 6.66345368, 0.00000000 };
Point ( 5457 ) = { 1.46718120, 6.66388084, 0.00000000 };
Point ( 5458 ) = { 1.46524316, 6.66430724, 0.00000000 };
Point ( 5459 ) = { 1.46330412, 6.66473327, 0.00000000 };
Point ( 5460 ) = { 1.46136584, 6.66515855, 0.00000000 };
Point ( 5461 ) = { 1.45942655, 6.66558345, 0.00000000 };
Point ( 5462 ) = { 1.45748802, 6.66600759, 0.00000000 };
Point ( 5463 ) = { 1.45554848, 6.66643137, 0.00000000 };
Point ( 5464 ) = { 1.45384202, 6.66326474, 0.00000000 };
Point ( 5465 ) = { 1.45213759, 6.66010266, 0.00000000 };
Point ( 5466 ) = { 1.45019977, 6.66052488, 0.00000000 };
Point ( 5467 ) = { 1.44826271, 6.66094634, 0.00000000 };
Point ( 5468 ) = { 1.44632465, 6.66136743, 0.00000000 };
Point ( 5469 ) = { 1.44438646, 6.66178796, 0.00000000 };
Point ( 5470 ) = { 1.44244903, 6.66220773, 0.00000000 };
Point ( 5471 ) = { 1.44051060, 6.66262713, 0.00000000 };
Point ( 5472 ) = { 1.43857293, 6.66304577, 0.00000000 };
Point ( 5473 ) = { 1.43663426, 6.66346404, 0.00000000 };
Point ( 5474 ) = { 1.43469635, 6.66388156, 0.00000000 };
Point ( 5475 ) = { 1.43275743, 6.66429870, 0.00000000 };
Point ( 5476 ) = { 1.43081927, 6.66471509, 0.00000000 };
Point ( 5477 ) = { 1.42888011, 6.66513110, 0.00000000 };
Point ( 5478 ) = { 1.42694172, 6.66554637, 0.00000000 };
Point ( 5479 ) = { 1.42500231, 6.66596125, 0.00000000 };
Point ( 5480 ) = { 1.42306368, 6.66637539, 0.00000000 };
Point ( 5481 ) = { 1.42281418, 6.66995903, 0.00000000 };
Point ( 5482 ) = { 1.42256471, 6.67354765, 0.00000000 };
Point ( 5483 ) = { 1.42062387, 6.67396107, 0.00000000 };
Point ( 5484 ) = { 1.41868201, 6.67437412, 0.00000000 };
Point ( 5485 ) = { 1.41674004, 6.67478660, 0.00000000 };
Point ( 5486 ) = { 1.41479884, 6.67519833, 0.00000000 };
Point ( 5487 ) = { 1.41285663, 6.67560969, 0.00000000 };
Point ( 5488 ) = { 1.41091519, 6.67602029, 0.00000000 };
Point ( 5489 ) = { 1.40897274, 6.67643051, 0.00000000 };
Point ( 5490 ) = { 1.40703106, 6.67683998, 0.00000000 };
Point ( 5491 ) = { 1.40508837, 6.67724908, 0.00000000 };
Point ( 5492 ) = { 1.40314645, 6.67765742, 0.00000000 };
Point ( 5493 ) = { 1.40288623, 6.68124872, 0.00000000 };
Point ( 5494 ) = { 1.40262538, 6.68484190, 0.00000000 };
Point ( 5495 ) = { 1.40068126, 6.68524952, 0.00000000 };
Point ( 5496 ) = { 1.39873612, 6.68565677, 0.00000000 };
Point ( 5497 ) = { 1.39679176, 6.68606326, 0.00000000 };
Point ( 5498 ) = { 1.39484639, 6.68646937, 0.00000000 };
Point ( 5499 ) = { 1.39316742, 6.68328203, 0.00000000 };
Point ( 5500 ) = { 1.39148979, 6.68009616, 0.00000000 };
Point ( 5501 ) = { 1.39122330, 6.68368700, 0.00000000 };
Point ( 5502 ) = { 1.39095618, 6.68727972, 0.00000000 };
Point ( 5503 ) = { 1.38901046, 6.68768414, 0.00000000 };
Point ( 5504 ) = { 1.38706550, 6.68808780, 0.00000000 };
Point ( 5505 ) = { 1.38511954, 6.68849109, 0.00000000 };
Point ( 5506 ) = { 1.38317436, 6.68889362, 0.00000000 };
Point ( 5507 ) = { 1.38122816, 6.68929577, 0.00000000 };
Point ( 5508 ) = { 1.37928274, 6.68969717, 0.00000000 };
Point ( 5509 ) = { 1.37733631, 6.69009819, 0.00000000 };
Point ( 5510 ) = { 1.37539066, 6.69049846, 0.00000000 };
Point ( 5511 ) = { 1.37344400, 6.69089835, 0.00000000 };
Point ( 5512 ) = { 1.37149811, 6.69129749, 0.00000000 };
Point ( 5513 ) = { 1.36955122, 6.69169624, 0.00000000 };
Point ( 5514 ) = { 1.36760510, 6.69209425, 0.00000000 };
Point ( 5515 ) = { 1.36565798, 6.69249187, 0.00000000 };
Point ( 5516 ) = { 1.36371163, 6.69288874, 0.00000000 };
Point ( 5517 ) = { 1.36176427, 6.69328523, 0.00000000 };
Point ( 5518 ) = { 1.35981680, 6.69368116, 0.00000000 };
Point ( 5519 ) = { 1.35787011, 6.69407633, 0.00000000 };
Point ( 5520 ) = { 1.35592240, 6.69447112, 0.00000000 };
Point ( 5521 ) = { 1.35397548, 6.69486516, 0.00000000 };
Point ( 5522 ) = { 1.35202755, 6.69525882, 0.00000000 };
Point ( 5523 ) = { 1.35008040, 6.69565173, 0.00000000 };
Point ( 5524 ) = { 1.34842234, 6.69245332, 0.00000000 };
Point ( 5525 ) = { 1.34676562, 6.68925638, 0.00000000 };
Point ( 5526 ) = { 1.34482021, 6.68964776, 0.00000000 };
Point ( 5527 ) = { 1.34287380, 6.69003875, 0.00000000 };
Point ( 5528 ) = { 1.34092816, 6.69042900, 0.00000000 };
Point ( 5529 ) = { 1.33898152, 6.69081886, 0.00000000 };
Point ( 5530 ) = { 1.33703566, 6.69120798, 0.00000000 };
Point ( 5531 ) = { 1.33508879, 6.69159670, 0.00000000 };
Point ( 5532 ) = { 1.33314271, 6.69198469, 0.00000000 };
Point ( 5533 ) = { 1.33119561, 6.69237228, 0.00000000 };
Point ( 5534 ) = { 1.32924841, 6.69275931, 0.00000000 };
Point ( 5535 ) = { 1.32730198, 6.69314560, 0.00000000 };
Point ( 5536 ) = { 1.32535456, 6.69353149, 0.00000000 };
Point ( 5537 ) = { 1.32340791, 6.69391665, 0.00000000 };
Point ( 5538 ) = { 1.32146025, 6.69430141, 0.00000000 };
Point ( 5539 ) = { 1.31951338, 6.69468543, 0.00000000 };
Point ( 5540 ) = { 1.31756550, 6.69506906, 0.00000000 };
Point ( 5541 ) = { 1.31561840, 6.69545195, 0.00000000 };
Point ( 5542 ) = { 1.31367030, 6.69583444, 0.00000000 };
Point ( 5543 ) = { 1.31172299, 6.69621620, 0.00000000 };
Point ( 5544 ) = { 1.30977466, 6.69659756, 0.00000000 };
Point ( 5545 ) = { 1.30782712, 6.69697818, 0.00000000 };
Point ( 5546 ) = { 1.30587858, 6.69735841, 0.00000000 };
Point ( 5547 ) = { 1.30393082, 6.69773790, 0.00000000 };
Point ( 5548 ) = { 1.30198205, 6.69811700, 0.00000000 };
Point ( 5549 ) = { 1.30003318, 6.69849552, 0.00000000 };
Point ( 5550 ) = { 1.29808509, 6.69887331, 0.00000000 };
Point ( 5551 ) = { 1.29776849, 6.70246008, 0.00000000 };
Point ( 5552 ) = { 1.29745123, 6.70604872, 0.00000000 };
Point ( 5553 ) = { 1.29550095, 6.70642576, 0.00000000 };
Point ( 5554 ) = { 1.29354965, 6.70680240, 0.00000000 };
Point ( 5555 ) = { 1.29159915, 6.70717830, 0.00000000 };
Point ( 5556 ) = { 1.28964764, 6.70755381, 0.00000000 };
Point ( 5557 ) = { 1.28769691, 6.70792858, 0.00000000 };
Point ( 5558 ) = { 1.28574518, 6.70830295, 0.00000000 };
Point ( 5559 ) = { 1.28379424, 6.70867658, 0.00000000 };
Point ( 5560 ) = { 1.28216790, 6.70546193, 0.00000000 };
Point ( 5561 ) = { 1.28054287, 6.70224877, 0.00000000 };
Point ( 5562 ) = { 1.27859369, 6.70262089, 0.00000000 };
Point ( 5563 ) = { 1.27664350, 6.70299261, 0.00000000 };
Point ( 5564 ) = { 1.27469410, 6.70336360, 0.00000000 };
Point ( 5565 ) = { 1.27274370, 6.70373418, 0.00000000 };
Point ( 5566 ) = { 1.27079319, 6.70410421, 0.00000000 };
Point ( 5567 ) = { 1.26884347, 6.70447349, 0.00000000 };
Point ( 5568 ) = { 1.26689275, 6.70484238, 0.00000000 };
Point ( 5569 ) = { 1.26527631, 6.70162887, 0.00000000 };
Point ( 5570 ) = { 1.26366177, 6.69841996, 0.00000000 };
Point ( 5571 ) = { 1.26171281, 6.69878734, 0.00000000 };
Point ( 5572 ) = { 1.25976463, 6.69915398, 0.00000000 };
Point ( 5573 ) = { 1.25781546, 6.69952023, 0.00000000 };
Point ( 5574 ) = { 1.25586707, 6.69988574, 0.00000000 };
Point ( 5575 ) = { 1.25391768, 6.70025085, 0.00000000 };
Point ( 5576 ) = { 1.25196908, 6.70061523, 0.00000000 };
Point ( 5577 ) = { 1.25001948, 6.70097921, 0.00000000 };
Point ( 5578 ) = { 1.24807067, 6.70134245, 0.00000000 };
Point ( 5579 ) = { 1.24612086, 6.70170529, 0.00000000 };
Point ( 5580 ) = { 1.24417183, 6.70206740, 0.00000000 };
Point ( 5581 ) = { 1.24222181, 6.70242911, 0.00000000 };
Point ( 5582 ) = { 1.24027168, 6.70279025, 0.00000000 };
Point ( 5583 ) = { 1.23832234, 6.70315066, 0.00000000 };
Point ( 5584 ) = { 1.23637201, 6.70351067, 0.00000000 };
Point ( 5585 ) = { 1.23442246, 6.70386994, 0.00000000 };
Point ( 5586 ) = { 1.23407195, 6.70744512, 0.00000000 };
Point ( 5587 ) = { 1.23372134, 6.71102527, 0.00000000 };
Point ( 5588 ) = { 1.23176961, 6.71138378, 0.00000000 };
Point ( 5589 ) = { 1.22981688, 6.71174188, 0.00000000 };
Point ( 5590 ) = { 1.22786493, 6.71209924, 0.00000000 };
Point ( 5591 ) = { 1.22591199, 6.71245621, 0.00000000 };
Point ( 5592 ) = { 1.22395984, 6.71281244, 0.00000000 };
Point ( 5593 ) = { 1.22200670, 6.71316827, 0.00000000 };
Point ( 5594 ) = { 1.22005434, 6.71352336, 0.00000000 };
Point ( 5595 ) = { 1.21810099, 6.71387805, 0.00000000 };
Point ( 5596 ) = { 1.21614843, 6.71423202, 0.00000000 };
Point ( 5597 ) = { 1.21419487, 6.71458557, 0.00000000 };
Point ( 5598 ) = { 1.21224120, 6.71493856, 0.00000000 };
Point ( 5599 ) = { 1.21028833, 6.71529081, 0.00000000 };
Point ( 5600 ) = { 1.20833447, 6.71564266, 0.00000000 };
Point ( 5601 ) = { 1.20638139, 6.71599378, 0.00000000 };
Point ( 5602 ) = { 1.20442732, 6.71634450, 0.00000000 };
Point ( 5603 ) = { 1.20247404, 6.71669448, 0.00000000 };
Point ( 5604 ) = { 1.20210636, 6.72027637, 0.00000000 };
Point ( 5605 ) = { 1.20173798, 6.72386012, 0.00000000 };
Point ( 5606 ) = { 1.19978252, 6.72420933, 0.00000000 };
Point ( 5607 ) = { 1.19782605, 6.72455812, 0.00000000 };
Point ( 5608 ) = { 1.19587039, 6.72490618, 0.00000000 };
Point ( 5609 ) = { 1.19391372, 6.72525384, 0.00000000 };
Point ( 5610 ) = { 1.19195785, 6.72560076, 0.00000000 };
Point ( 5611 ) = { 1.19000099, 6.72594728, 0.00000000 };
Point ( 5612 ) = { 1.18962639, 6.72953373, 0.00000000 };
Point ( 5613 ) = { 1.18925165, 6.73312516, 0.00000000 };
Point ( 5614 ) = { 1.18729259, 6.73347089, 0.00000000 };
Point ( 5615 ) = { 1.18533344, 6.73381605, 0.00000000 };
Point ( 5616 ) = { 1.18337508, 6.73416048, 0.00000000 };
Point ( 5617 ) = { 1.18299633, 6.73775510, 0.00000000 };
Point ( 5618 ) = { 1.18261689, 6.74135160, 0.00000000 };
Point ( 5619 ) = { 1.18065634, 6.74169524, 0.00000000 };
Point ( 5620 ) = { 1.17869479, 6.74203847, 0.00000000 };
Point ( 5621 ) = { 1.17673404, 6.74238097, 0.00000000 };
Point ( 5622 ) = { 1.17477229, 6.74272305, 0.00000000 };
Point ( 5623 ) = { 1.17438868, 6.74632247, 0.00000000 };
Point ( 5624 ) = { 1.17400492, 6.74992690, 0.00000000 };
Point ( 5625 ) = { 1.17204098, 6.75026819, 0.00000000 };
Point ( 5626 ) = { 1.17007784, 6.75060875, 0.00000000 };
Point ( 5627 ) = { 1.16811370, 6.75094890, 0.00000000 };
Point ( 5628 ) = { 1.16615035, 6.75128832, 0.00000000 };
Point ( 5629 ) = { 1.16576152, 6.75489584, 0.00000000 };
Point ( 5630 ) = { 1.16537198, 6.75850524, 0.00000000 };
Point ( 5631 ) = { 1.16340644, 6.75884387, 0.00000000 };
Point ( 5632 ) = { 1.16143990, 6.75918207, 0.00000000 };
Point ( 5633 ) = { 1.15947326, 6.75951971, 0.00000000 };
Point ( 5634 ) = { 1.15908059, 6.76313215, 0.00000000 };
Point ( 5635 ) = { 1.15868774, 6.76674964, 0.00000000 };
Point ( 5636 ) = { 1.15671890, 6.76708648, 0.00000000 };
Point ( 5637 ) = { 1.15475087, 6.76742258, 0.00000000 };
Point ( 5638 ) = { 1.15435503, 6.77104339, 0.00000000 };
Point ( 5639 ) = { 1.15395848, 6.77466610, 0.00000000 };
Point ( 5640 ) = { 1.15198824, 6.77500141, 0.00000000 };
Point ( 5641 ) = { 1.15001700, 6.77533629, 0.00000000 };
Point ( 5642 ) = { 1.14961835, 6.77896218, 0.00000000 };
Point ( 5643 ) = { 1.14921952, 6.78259313, 0.00000000 };
Point ( 5644 ) = { 1.14724608, 6.78292721, 0.00000000 };
Point ( 5645 ) = { 1.14684575, 6.78656155, 0.00000000 };
Point ( 5646 ) = { 1.14644498, 6.79019938, 0.00000000 };
Point ( 5647 ) = { 1.14604330, 6.79384080, 0.00000000 };
Point ( 5648 ) = { 1.14564091, 6.79748414, 0.00000000 };
Point ( 5649 ) = { 1.14523853, 6.80113091, 0.00000000 };
Point ( 5650 ) = { 1.14483569, 6.80478121, 0.00000000 };
Point ( 5651 ) = { 1.14285579, 6.80511401, 0.00000000 };
Point ( 5652 ) = { 1.14245144, 6.80876771, 0.00000000 };
Point ( 5653 ) = { 1.14204691, 6.81242654, 0.00000000 };
Point ( 5654 ) = { 1.14006479, 6.81275853, 0.00000000 };
Point ( 5655 ) = { 1.13808256, 6.81308994, 0.00000000 };
Point ( 5656 ) = { 1.13767545, 6.81675207, 0.00000000 };
Point ( 5657 ) = { 1.13726788, 6.82041774, 0.00000000 };
Point ( 5658 ) = { 1.13528343, 6.82074834, 0.00000000 };
Point ( 5659 ) = { 1.13487434, 6.82441744, 0.00000000 };
Point ( 5660 ) = { 1.13446453, 6.82808849, 0.00000000 };
Point ( 5661 ) = { 1.13247785, 6.82841828, 0.00000000 };
Point ( 5662 ) = { 1.13049198, 6.82874733, 0.00000000 };
Point ( 5663 ) = { 1.13007911, 6.83242177, 0.00000000 };
Point ( 5664 ) = { 1.12966605, 6.83610139, 0.00000000 };
Point ( 5665 ) = { 1.12767795, 6.83642962, 0.00000000 };
Point ( 5666 ) = { 1.12568884, 6.83675743, 0.00000000 };
Point ( 5667 ) = { 1.12527363, 6.84044030, 0.00000000 };
Point ( 5668 ) = { 1.12485770, 6.84412512, 0.00000000 };
Point ( 5669 ) = { 1.12444084, 6.84781360, 0.00000000 };
Point ( 5670 ) = { 1.12560074, 6.85487734, 0.00000000 };
Point ( 5671 ) = { 1.12717902, 6.85824905, 0.00000000 };
Point ( 5672 ) = { 1.12917347, 6.85792095, 0.00000000 };
Point ( 5673 ) = { 1.13116873, 6.85759213, 0.00000000 };
Point ( 5674 ) = { 1.13275011, 6.86096625, 0.00000000 };
Point ( 5675 ) = { 1.13433336, 6.86434526, 0.00000000 };
Point ( 5676 ) = { 1.13633049, 6.86401493, 0.00000000 };
Point ( 5677 ) = { 1.13832662, 6.86368418, 0.00000000 };
Point ( 5678 ) = { 1.14032356, 6.86335269, 0.00000000 };
Point ( 5679 ) = { 1.14191135, 6.86673359, 0.00000000 };
Point ( 5680 ) = { 1.14350048, 6.87011613, 0.00000000 };
Point ( 5681 ) = { 1.14549930, 6.86978314, 0.00000000 };
Point ( 5682 ) = { 1.14749710, 6.86944972, 0.00000000 };
Point ( 5683 ) = { 1.14949572, 6.86911556, 0.00000000 };
Point ( 5684 ) = { 1.15149424, 6.86878083, 0.00000000 };
Point ( 5685 ) = { 1.15349175, 6.86844566, 0.00000000 };
Point ( 5686 ) = { 1.15508787, 6.87182909, 0.00000000 };
Point ( 5687 ) = { 1.15668588, 6.87521743, 0.00000000 };
Point ( 5688 ) = { 1.15868526, 6.87488076, 0.00000000 };
Point ( 5689 ) = { 1.16068546, 6.87454335, 0.00000000 };
Point ( 5690 ) = { 1.16268464, 6.87420551, 0.00000000 };
Point ( 5691 ) = { 1.16428723, 6.87759574, 0.00000000 };
Point ( 5692 ) = { 1.16589116, 6.88098764, 0.00000000 };
Point ( 5693 ) = { 1.16789222, 6.88064828, 0.00000000 };
Point ( 5694 ) = { 1.16989409, 6.88030819, 0.00000000 };
Point ( 5695 ) = { 1.17189496, 6.87996768, 0.00000000 };
Point ( 5696 ) = { 1.17389663, 6.87962642, 0.00000000 };
Point ( 5697 ) = { 1.17589730, 6.87928474, 0.00000000 };
Point ( 5698 ) = { 1.17750779, 6.88267759, 0.00000000 };
Point ( 5699 ) = { 1.17912019, 6.88607538, 0.00000000 };
Point ( 5700 ) = { 1.18112273, 6.88573218, 0.00000000 };
Point ( 5701 ) = { 1.18312608, 6.88538824, 0.00000000 };
Point ( 5702 ) = { 1.18512934, 6.88504371, 0.00000000 };
Point ( 5703 ) = { 1.18674589, 6.88844347, 0.00000000 };
Point ( 5704 ) = { 1.18836407, 6.89184654, 0.00000000 };
Point ( 5705 ) = { 1.19036921, 6.89150049, 0.00000000 };
Point ( 5706 ) = { 1.19237332, 6.89115402, 0.00000000 };
Point ( 5707 ) = { 1.19437826, 6.89080681, 0.00000000 };
Point ( 5708 ) = { 1.19638217, 6.89045917, 0.00000000 };
Point ( 5709 ) = { 1.19800642, 6.89386358, 0.00000000 };
Point ( 5710 ) = { 1.19963204, 6.89726967, 0.00000000 };
Point ( 5711 ) = { 1.20163783, 6.89692051, 0.00000000 };
Point ( 5712 ) = { 1.20364444, 6.89657060, 0.00000000 };
Point ( 5713 ) = { 1.20565003, 6.89622027, 0.00000000 };
Point ( 5714 ) = { 1.20765644, 6.89586919, 0.00000000 };
Point ( 5715 ) = { 1.20966182, 6.89551769, 0.00000000 };
Point ( 5716 ) = { 1.21166803, 6.89516545, 0.00000000 };
Point ( 5717 ) = { 1.21367321, 6.89481278, 0.00000000 };
Point ( 5718 ) = { 1.21567920, 6.89445937, 0.00000000 };
Point ( 5719 ) = { 1.21768510, 6.89410538, 0.00000000 };
Point ( 5720 ) = { 1.21968997, 6.89375096, 0.00000000 };
Point ( 5721 ) = { 1.22169566, 6.89339580, 0.00000000 };
Point ( 5722 ) = { 1.22370033, 6.89304022, 0.00000000 };
Point ( 5723 ) = { 1.22570581, 6.89268389, 0.00000000 };
Point ( 5724 ) = { 1.22771027, 6.89232715, 0.00000000 };
Point ( 5725 ) = { 1.22971554, 6.89196965, 0.00000000 };
Point ( 5726 ) = { 1.23171979, 6.89161174, 0.00000000 };
Point ( 5727 ) = { 1.23372485, 6.89125308, 0.00000000 };
Point ( 5728 ) = { 1.23572890, 6.89089400, 0.00000000 };
Point ( 5729 ) = { 1.23773375, 6.89053417, 0.00000000 };
Point ( 5730 ) = { 1.23973759, 6.89017392, 0.00000000 };
Point ( 5731 ) = { 1.24174223, 6.88981293, 0.00000000 };
Point ( 5732 ) = { 1.24374586, 6.88945152, 0.00000000 };
Point ( 5733 ) = { 1.24575029, 6.88908936, 0.00000000 };
Point ( 5734 ) = { 1.24775462, 6.88872662, 0.00000000 };
Point ( 5735 ) = { 1.24975793, 6.88836346, 0.00000000 };
Point ( 5736 ) = { 1.25176205, 6.88799955, 0.00000000 };
Point ( 5737 ) = { 1.25376514, 6.88763522, 0.00000000 };
Point ( 5738 ) = { 1.25576905, 6.88727015, 0.00000000 };
Point ( 5739 ) = { 1.25777193, 6.88690466, 0.00000000 };
Point ( 5740 ) = { 1.25977563, 6.88653842, 0.00000000 };
Point ( 5741 ) = { 1.26177830, 6.88617176, 0.00000000 };
Point ( 5742 ) = { 1.26378178, 6.88580435, 0.00000000 };
Point ( 5743 ) = { 1.26578424, 6.88543653, 0.00000000 };
Point ( 5744 ) = { 1.26778750, 6.88506796, 0.00000000 };
Point ( 5745 ) = { 1.26978974, 6.88469898, 0.00000000 };
Point ( 5746 ) = { 1.27179280, 6.88432924, 0.00000000 };
Point ( 5747 ) = { 1.27379482, 6.88395909, 0.00000000 };
Point ( 5748 ) = { 1.27579766, 6.88358819, 0.00000000 };
Point ( 5749 ) = { 1.27780039, 6.88321670, 0.00000000 };
Point ( 5750 ) = { 1.27980209, 6.88284480, 0.00000000 };
Point ( 5751 ) = { 1.28180460, 6.88247215, 0.00000000 };
Point ( 5752 ) = { 1.28347196, 6.88586200, 0.00000000 };
Point ( 5753 ) = { 1.28514100, 6.88925515, 0.00000000 };
Point ( 5754 ) = { 1.28714538, 6.88888095, 0.00000000 };
Point ( 5755 ) = { 1.28914873, 6.88850633, 0.00000000 };
Point ( 5756 ) = { 1.29115289, 6.88813096, 0.00000000 };
Point ( 5757 ) = { 1.29315602, 6.88775518, 0.00000000 };
Point ( 5758 ) = { 1.29515996, 6.88737865, 0.00000000 };
Point ( 5759 ) = { 1.29716287, 6.88700170, 0.00000000 };
Point ( 5760 ) = { 1.29916659, 6.88662400, 0.00000000 };
Point ( 5761 ) = { 1.30116929, 6.88624589, 0.00000000 };
Point ( 5762 ) = { 1.30317279, 6.88586702, 0.00000000 };
Point ( 5763 ) = { 1.30517526, 6.88548774, 0.00000000 };
Point ( 5764 ) = { 1.30717854, 6.88510771, 0.00000000 };
Point ( 5765 ) = { 1.30918171, 6.88472710, 0.00000000 };
Point ( 5766 ) = { 1.31118385, 6.88434607, 0.00000000 };
Point ( 5767 ) = { 1.31318680, 6.88396429, 0.00000000 };
Point ( 5768 ) = { 1.31518872, 6.88358210, 0.00000000 };
Point ( 5769 ) = { 1.31719144, 6.88319916, 0.00000000 };
Point ( 5770 ) = { 1.31919314, 6.88281580, 0.00000000 };
Point ( 5771 ) = { 1.32119564, 6.88243169, 0.00000000 };
Point ( 5772 ) = { 1.32319712, 6.88204718, 0.00000000 };
Point ( 5773 ) = { 1.32519940, 6.88166190, 0.00000000 };
Point ( 5774 ) = { 1.32551090, 6.87789333, 0.00000000 };
Point ( 5775 ) = { 1.32582204, 6.87412845, 0.00000000 };
Point ( 5776 ) = { 1.32782202, 6.87374241, 0.00000000 };
Point ( 5777 ) = { 1.32982096, 6.87335596, 0.00000000 };
Point ( 5778 ) = { 1.33182071, 6.87296876, 0.00000000 };
Point ( 5779 ) = { 1.33381943, 6.87258115, 0.00000000 };
Point ( 5780 ) = { 1.33581896, 6.87219279, 0.00000000 };
Point ( 5781 ) = { 1.33781837, 6.87180384, 0.00000000 };
Point ( 5782 ) = { 1.33981675, 6.87141449, 0.00000000 };
Point ( 5783 ) = { 1.34181593, 6.87102438, 0.00000000 };
Point ( 5784 ) = { 1.34211796, 6.86726247, 0.00000000 };
Point ( 5785 ) = { 1.34241930, 6.86350262, 0.00000000 };
Point ( 5786 ) = { 1.34441619, 6.86311176, 0.00000000 };
Point ( 5787 ) = { 1.34641204, 6.86272049, 0.00000000 };
Point ( 5788 ) = { 1.34840869, 6.86232846, 0.00000000 };
Point ( 5789 ) = { 1.35040432, 6.86193603, 0.00000000 };
Point ( 5790 ) = { 1.35070140, 6.85817942, 0.00000000 };
Point ( 5791 ) = { 1.35099812, 6.85442649, 0.00000000 };
Point ( 5792 ) = { 1.35299145, 6.85403331, 0.00000000 };
Point ( 5793 ) = { 1.35498558, 6.85363937, 0.00000000 };
Point ( 5794 ) = { 1.35697868, 6.85324502, 0.00000000 };
Point ( 5795 ) = { 1.35897257, 6.85284992, 0.00000000 };
Point ( 5796 ) = { 1.35926413, 6.84910041, 0.00000000 };
Point ( 5797 ) = { 1.35955566, 6.84535619, 0.00000000 };
Point ( 5798 ) = { 1.36154727, 6.84496034, 0.00000000 };
Point ( 5799 ) = { 1.36353875, 6.84456391, 0.00000000 };
Point ( 5800 ) = { 1.36552921, 6.84416708, 0.00000000 };
Point ( 5801 ) = { 1.36752047, 6.84376949, 0.00000000 };
Point ( 5802 ) = { 1.36951069, 6.84337150, 0.00000000 };
Point ( 5803 ) = { 1.37150172, 6.84297275, 0.00000000 };
Point ( 5804 ) = { 1.37178638, 6.83923169, 0.00000000 };
Point ( 5805 ) = { 1.37207037, 6.83549266, 0.00000000 };
Point ( 5806 ) = { 1.37405910, 6.83509316, 0.00000000 };
Point ( 5807 ) = { 1.37604681, 6.83469327, 0.00000000 };
Point ( 5808 ) = { 1.37803531, 6.83429262, 0.00000000 };
Point ( 5809 ) = { 1.38002278, 6.83389158, 0.00000000 };
Point ( 5810 ) = { 1.38201104, 6.83348977, 0.00000000 };
Point ( 5811 ) = { 1.38399828, 6.83308757, 0.00000000 };
Point ( 5812 ) = { 1.38598631, 6.83268460, 0.00000000 };
Point ( 5813 ) = { 1.38797331, 6.83228125, 0.00000000 };
Point ( 5814 ) = { 1.38996111, 6.83187713, 0.00000000 };
Point ( 5815 ) = { 1.39194879, 6.83147243, 0.00000000 };
Point ( 5816 ) = { 1.39393544, 6.83106734, 0.00000000 };
Point ( 5817 ) = { 1.39592288, 6.83066148, 0.00000000 };
Point ( 5818 ) = { 1.39790930, 6.83025523, 0.00000000 };
Point ( 5819 ) = { 1.39817928, 6.82651871, 0.00000000 };
Point ( 5820 ) = { 1.39844928, 6.82278745, 0.00000000 };
Point ( 5821 ) = { 1.40043340, 6.82238047, 0.00000000 };
Point ( 5822 ) = { 1.40241831, 6.82197273, 0.00000000 };
Point ( 5823 ) = { 1.40440220, 6.82156459, 0.00000000 };
Point ( 5824 ) = { 1.40638688, 6.82115569, 0.00000000 };
Point ( 5825 ) = { 1.40837053, 6.82074640, 0.00000000 };
Point ( 5826 ) = { 1.41035497, 6.82033635, 0.00000000 };
Point ( 5827 ) = { 1.41233838, 6.81992590, 0.00000000 };
Point ( 5828 ) = { 1.41432258, 6.81951469, 0.00000000 };
Point ( 5829 ) = { 1.41630575, 6.81910310, 0.00000000 };
Point ( 5830 ) = { 1.41828971, 6.81869073, 0.00000000 };
Point ( 5831 ) = { 1.42027355, 6.81827779, 0.00000000 };
Point ( 5832 ) = { 1.42225636, 6.81786446, 0.00000000 };
Point ( 5833 ) = { 1.42423996, 6.81745037, 0.00000000 };
Point ( 5834 ) = { 1.42622254, 6.81703589, 0.00000000 };
Point ( 5835 ) = { 1.42820589, 6.81662064, 0.00000000 };
Point ( 5836 ) = { 1.43018822, 6.81620500, 0.00000000 };
Point ( 5837 ) = { 1.43044054, 6.81247617, 0.00000000 };
Point ( 5838 ) = { 1.43069222, 6.80874935, 0.00000000 };
Point ( 5839 ) = { 1.43267226, 6.80833299, 0.00000000 };
Point ( 5840 ) = { 1.43465308, 6.80791587, 0.00000000 };
Point ( 5841 ) = { 1.43663288, 6.80749836, 0.00000000 };
Point ( 5842 ) = { 1.43861346, 6.80708008, 0.00000000 };
Point ( 5843 ) = { 1.44059302, 6.80666142, 0.00000000 };
Point ( 5844 ) = { 1.44257336, 6.80624199, 0.00000000 };
Point ( 5845 ) = { 1.44455267, 6.80582218, 0.00000000 };
Point ( 5846 ) = { 1.44653276, 6.80540160, 0.00000000 };
Point ( 5847 ) = { 1.44851274, 6.80498044, 0.00000000 };
Point ( 5848 ) = { 1.45049168, 6.80455890, 0.00000000 };
Point ( 5849 ) = { 1.45247141, 6.80413659, 0.00000000 };
Point ( 5850 ) = { 1.45445011, 6.80371390, 0.00000000 };
Point ( 5851 ) = { 1.45642959, 6.80329044, 0.00000000 };
Point ( 5852 ) = { 1.45840804, 6.80286660, 0.00000000 };
Point ( 5853 ) = { 1.46038728, 6.80244199, 0.00000000 };
Point ( 5854 ) = { 1.46236548, 6.80201699, 0.00000000 };
Point ( 5855 ) = { 1.46259952, 6.79829268, 0.00000000 };
Point ( 5856 ) = { 1.46283361, 6.79457360, 0.00000000 };
Point ( 5857 ) = { 1.46480953, 6.79414789, 0.00000000 };
Point ( 5858 ) = { 1.46678623, 6.79372142, 0.00000000 };
Point ( 5859 ) = { 1.46876189, 6.79329456, 0.00000000 };
Point ( 5860 ) = { 1.47073834, 6.79286694, 0.00000000 };
Point ( 5861 ) = { 1.47271376, 6.79243893, 0.00000000 };
Point ( 5862 ) = { 1.47468996, 6.79201016, 0.00000000 };
Point ( 5863 ) = { 1.47666604, 6.79158081, 0.00000000 };
Point ( 5864 ) = { 1.47864109, 6.79115108, 0.00000000 };
Point ( 5865 ) = { 1.48061691, 6.79072059, 0.00000000 };
Point ( 5866 ) = { 1.48259171, 6.79028971, 0.00000000 };
Point ( 5867 ) = { 1.48456728, 6.78985806, 0.00000000 };
Point ( 5868 ) = { 1.48654183, 6.78942604, 0.00000000 };
Point ( 5869 ) = { 1.48851715, 6.78899324, 0.00000000 };
Point ( 5870 ) = { 1.49049144, 6.78856007, 0.00000000 };
Point ( 5871 ) = { 1.49246651, 6.78812612, 0.00000000 };
Point ( 5872 ) = { 1.49268365, 6.78440977, 0.00000000 };
Point ( 5873 ) = { 1.49290017, 6.78069543, 0.00000000 };
Point ( 5874 ) = { 1.49487295, 6.78026078, 0.00000000 };
Point ( 5875 ) = { 1.49684470, 6.77982576, 0.00000000 };
Point ( 5876 ) = { 1.49881723, 6.77938997, 0.00000000 };
Point ( 5877 ) = { 1.50078873, 6.77895380, 0.00000000 };
Point ( 5878 ) = { 1.50276101, 6.77851686, 0.00000000 };
Point ( 5879 ) = { 1.50473316, 6.77807934, 0.00000000 };
Point ( 5880 ) = { 1.50670427, 6.77764145, 0.00000000 };
Point ( 5881 ) = { 1.50867617, 6.77720279, 0.00000000 };
Point ( 5882 ) = { 1.51064703, 6.77676376, 0.00000000 };
Point ( 5883 ) = { 1.51261867, 6.77632395, 0.00000000 };
Point ( 5884 ) = { 1.51458928, 6.77588376, 0.00000000 };
Point ( 5885 ) = { 1.51656066, 6.77544281, 0.00000000 };
Point ( 5886 ) = { 1.51853101, 6.77500148, 0.00000000 };
Point ( 5887 ) = { 1.52050213, 6.77455937, 0.00000000 };
Point ( 5888 ) = { 1.52247223, 6.77411690, 0.00000000 };
Point ( 5889 ) = { 1.52267273, 6.77040516, 0.00000000 };
Point ( 5890 ) = { 1.52287334, 6.76669863, 0.00000000 };
Point ( 5891 ) = { 1.52484115, 6.76625546, 0.00000000 };
Point ( 5892 ) = { 1.52680973, 6.76581153, 0.00000000 };
Point ( 5893 ) = { 1.52877728, 6.76536722, 0.00000000 };
Point ( 5894 ) = { 1.53074560, 6.76492213, 0.00000000 };
Point ( 5895 ) = { 1.53271379, 6.76447647, 0.00000000 };
Point ( 5896 ) = { 1.53468095, 6.76403045, 0.00000000 };
Point ( 5897 ) = { 1.53664888, 6.76358365, 0.00000000 };
Point ( 5898 ) = { 1.53861578, 6.76313648, 0.00000000 };
Point ( 5899 ) = { 1.54058346, 6.76268853, 0.00000000 };
Point ( 5900 ) = { 1.54255010, 6.76224022, 0.00000000 };
Point ( 5901 ) = { 1.54451751, 6.76179112, 0.00000000 };
Point ( 5902 ) = { 1.54648389, 6.76134167, 0.00000000 };
Point ( 5903 ) = { 1.54845104, 6.76089143, 0.00000000 };
Point ( 5904 ) = { 1.55041715, 6.76044083, 0.00000000 };
Point ( 5905 ) = { 1.55238404, 6.75998945, 0.00000000 };
Point ( 5906 ) = { 1.55434990, 6.75953770, 0.00000000 };
Point ( 5907 ) = { 1.55631652, 6.75908518, 0.00000000 };
Point ( 5908 ) = { 1.55810137, 6.76233972, 0.00000000 };
Point ( 5909 ) = { 1.55988837, 6.76559899, 0.00000000 };
Point ( 5910 ) = { 1.56167762, 6.76886131, 0.00000000 };
Point ( 5911 ) = { 1.56149787, 6.77257978, 0.00000000 };
Point ( 5912 ) = { 1.56131834, 6.77630177, 0.00000000 };
Point ( 5913 ) = { 1.56113895, 6.78002899, 0.00000000 };
Point ( 5914 ) = { 1.55916623, 6.78048292, 0.00000000 };
Point ( 5915 ) = { 1.55898552, 6.78421372, 0.00000000 };
Point ( 5916 ) = { 1.55880420, 6.78794656, 0.00000000 };
Point ( 5917 ) = { 1.55682917, 6.78839981, 0.00000000 };
Point ( 5918 ) = { 1.55485492, 6.78885227, 0.00000000 };
Point ( 5919 ) = { 1.55467074, 6.79258875, 0.00000000 };
Point ( 5920 ) = { 1.55448668, 6.79633049, 0.00000000 };
Point ( 5921 ) = { 1.55430284, 6.80007578, 0.00000000 };
Point ( 5922 ) = { 1.55411839, 6.80382312, 0.00000000 };
Point ( 5923 ) = { 1.55213875, 6.80427501, 0.00000000 };
Point ( 5924 ) = { 1.55195296, 6.80802596, 0.00000000 };
Point ( 5925 ) = { 1.55356342, 6.81509061, 0.00000000 };
Point ( 5926 ) = { 1.55517715, 6.82216964, 0.00000000 };
Point ( 5927 ) = { 1.55679343, 6.82925984, 0.00000000 };
Point ( 5928 ) = { 1.55859633, 6.83258380, 0.00000000 };
Point ( 5929 ) = { 1.56040152, 6.83591090, 0.00000000 };
Point ( 5930 ) = { 1.56220891, 6.83924287, 0.00000000 };
Point ( 5931 ) = { 1.56401768, 6.84257820, 0.00000000 };
Point ( 5932 ) = { 1.56564877, 6.84971424, 0.00000000 };
Point ( 5933 ) = { 1.56746171, 6.85305825, 0.00000000 };
Point ( 5934 ) = { 1.56927694, 6.85640542, 0.00000000 };
Point ( 5935 ) = { 1.57109439, 6.85975751, 0.00000000 };
Point ( 5936 ) = { 1.57291324, 6.86311299, 0.00000000 };
Point ( 5937 ) = { 1.57473356, 6.86647011, 0.00000000 };
Point ( 5938 ) = { 1.57655619, 6.86983042, 0.00000000 };
Point ( 5939 ) = { 1.57638123, 6.87365461, 0.00000000 };
Point ( 5940 ) = { 1.57620649, 6.87748248, 0.00000000 };
Point ( 5941 ) = { 1.57603114, 6.88131249, 0.00000000 };
Point ( 5942 ) = { 1.57585510, 6.88514639, 0.00000000 };
Point ( 5943 ) = { 1.57567921, 6.88898575, 0.00000000 };
Point ( 5944 ) = { 1.57367570, 6.88944370, 0.00000000 };
Point ( 5945 ) = { 1.57167115, 6.88990127, 0.00000000 };
Point ( 5946 ) = { 1.57149324, 6.89374423, 0.00000000 };
Point ( 5947 ) = { 1.57131472, 6.89758934, 0.00000000 };
Point ( 5948 ) = { 1.56930780, 6.89804623, 0.00000000 };
Point ( 5949 ) = { 1.56730166, 6.89850232, 0.00000000 };
Point ( 5950 ) = { 1.56529447, 6.89895803, 0.00000000 };
Point ( 5951 ) = { 1.56328807, 6.89941295, 0.00000000 };
Point ( 5952 ) = { 1.56128062, 6.89986750, 0.00000000 };
Point ( 5953 ) = { 1.56109580, 6.90371627, 0.00000000 };
Point ( 5954 ) = { 1.56091111, 6.90757053, 0.00000000 };
Point ( 5955 ) = { 1.55890220, 6.90802418, 0.00000000 };
Point ( 5956 ) = { 1.55689225, 6.90847745, 0.00000000 };
Point ( 5957 ) = { 1.55488308, 6.90892993, 0.00000000 };
Point ( 5958 ) = { 1.55287285, 6.90938203, 0.00000000 };
Point ( 5959 ) = { 1.55086342, 6.90983334, 0.00000000 };
Point ( 5960 ) = { 1.54885294, 6.91028427, 0.00000000 };
Point ( 5961 ) = { 1.54684324, 6.91073441, 0.00000000 };
Point ( 5962 ) = { 1.54483250, 6.91118417, 0.00000000 };
Point ( 5963 ) = { 1.54282254, 6.91163314, 0.00000000 };
Point ( 5964 ) = { 1.54081153, 6.91208174, 0.00000000 };
Point ( 5965 ) = { 1.53880132, 6.91252954, 0.00000000 };
Point ( 5966 ) = { 1.53679005, 6.91297696, 0.00000000 };
Point ( 5967 ) = { 1.53659211, 6.91683427, 0.00000000 };
Point ( 5968 ) = { 1.53639355, 6.92069376, 0.00000000 };
Point ( 5969 ) = { 1.53437990, 6.92114048, 0.00000000 };
Point ( 5970 ) = { 1.53236613, 6.92158662, 0.00000000 };
Point ( 5971 ) = { 1.53035315, 6.92203196, 0.00000000 };
Point ( 5972 ) = { 1.52833912, 6.92247693, 0.00000000 };
Point ( 5973 ) = { 1.52632588, 6.92292110, 0.00000000 };
Point ( 5974 ) = { 1.52431159, 6.92336489, 0.00000000 };
Point ( 5975 ) = { 1.52229809, 6.92380790, 0.00000000 };
Point ( 5976 ) = { 1.52028354, 6.92425052, 0.00000000 };
Point ( 5977 ) = { 1.51826978, 6.92469235, 0.00000000 };
Point ( 5978 ) = { 1.51625498, 6.92513380, 0.00000000 };
Point ( 5979 ) = { 1.51424097, 6.92557446, 0.00000000 };
Point ( 5980 ) = { 1.51222590, 6.92601473, 0.00000000 };
Point ( 5981 ) = { 1.51021164, 6.92645422, 0.00000000 };
Point ( 5982 ) = { 1.50819632, 6.92689332, 0.00000000 };
Point ( 5983 ) = { 1.50618179, 6.92733164, 0.00000000 };
Point ( 5984 ) = { 1.50416622, 6.92776957, 0.00000000 };
Point ( 5985 ) = { 1.50394896, 6.93163203, 0.00000000 };
Point ( 5986 ) = { 1.50373178, 6.93550000, 0.00000000 };
Point ( 5987 ) = { 1.50171476, 6.93593702, 0.00000000 };
Point ( 5988 ) = { 1.49969668, 6.93637365, 0.00000000 };
Point ( 5989 ) = { 1.49767940, 6.93680949, 0.00000000 };
Point ( 5990 ) = { 1.49566107, 6.93724495, 0.00000000 };
Point ( 5991 ) = { 1.49364354, 6.93767962, 0.00000000 };
Point ( 5992 ) = { 1.49162495, 6.93811390, 0.00000000 };
Point ( 5993 ) = { 1.48960717, 6.93854740, 0.00000000 };
Point ( 5994 ) = { 1.48758833, 6.93898051, 0.00000000 };
Point ( 5995 ) = { 1.48557029, 6.93941283, 0.00000000 };
Point ( 5996 ) = { 1.48355121, 6.93984476, 0.00000000 };
Point ( 5997 ) = { 1.48153292, 6.94027591, 0.00000000 };
Point ( 5998 ) = { 1.48130308, 6.94414702, 0.00000000 };
Point ( 5999 ) = { 1.48107295, 6.94802199, 0.00000000 };
Point ( 6000 ) = { 1.47905228, 6.94845242, 0.00000000 };
Point ( 6001 ) = { 1.47703056, 6.94888245, 0.00000000 };
Point ( 6002 ) = { 1.47500872, 6.94931190, 0.00000000 };
Point ( 6003 ) = { 1.47298768, 6.94974056, 0.00000000 };
Point ( 6004 ) = { 1.47096559, 6.95016884, 0.00000000 };
Point ( 6005 ) = { 1.46894429, 6.95059632, 0.00000000 };
Point ( 6006 ) = { 1.46870711, 6.95447475, 0.00000000 };
Point ( 6007 ) = { 1.46846926, 6.95835536, 0.00000000 };
Point ( 6008 ) = { 1.46644559, 6.95878212, 0.00000000 };
Point ( 6009 ) = { 1.46442087, 6.95920849, 0.00000000 };
Point ( 6010 ) = { 1.46239695, 6.95963407, 0.00000000 };
Point ( 6011 ) = { 1.46037198, 6.96005926, 0.00000000 };
Point ( 6012 ) = { 1.45834781, 6.96048367, 0.00000000 };
Point ( 6013 ) = { 1.45632260, 6.96090768, 0.00000000 };
Point ( 6014 ) = { 1.45607814, 6.96479165, 0.00000000 };
Point ( 6015 ) = { 1.45583338, 6.96867949, 0.00000000 };
Point ( 6016 ) = { 1.45380578, 6.96910277, 0.00000000 };
Point ( 6017 ) = { 1.45177899, 6.96952527, 0.00000000 };
Point ( 6018 ) = { 1.44975114, 6.96994737, 0.00000000 };
Point ( 6019 ) = { 1.44772317, 6.97036888, 0.00000000 };
Point ( 6020 ) = { 1.44569600, 6.97078961, 0.00000000 };
Point ( 6021 ) = { 1.44366779, 6.97120994, 0.00000000 };
Point ( 6022 ) = { 1.44164038, 6.97162949, 0.00000000 };
Point ( 6023 ) = { 1.44138693, 6.97552081, 0.00000000 };
Point ( 6024 ) = { 1.44113351, 6.97941770, 0.00000000 };
Point ( 6025 ) = { 1.43910371, 6.97983651, 0.00000000 };
Point ( 6026 ) = { 1.43707287, 6.98025492, 0.00000000 };
Point ( 6027 ) = { 1.43504283, 6.98067255, 0.00000000 };
Point ( 6028 ) = { 1.43478569, 6.98457312, 0.00000000 };
Point ( 6029 ) = { 1.43452824, 6.98847760, 0.00000000 };
Point ( 6030 ) = { 1.43249581, 6.98889449, 0.00000000 };
Point ( 6031 ) = { 1.43223690, 6.99280280, 0.00000000 };
Point ( 6032 ) = { 1.43197732, 6.99671333, 0.00000000 };
Point ( 6033 ) = { 1.42994250, 6.99712947, 0.00000000 };
Point ( 6034 ) = { 1.42968146, 7.00104385, 0.00000000 };
Point ( 6035 ) = { 1.42942045, 7.00496384, 0.00000000 };
Point ( 6036 ) = { 1.42915958, 7.00888768, 0.00000000 };
Point ( 6037 ) = { 1.42889805, 7.01281376, 0.00000000 };
Point ( 6038 ) = { 1.42685761, 7.01322920, 0.00000000 };
Point ( 6039 ) = { 1.42481705, 7.01364405, 0.00000000 };
Point ( 6040 ) = { 1.42455290, 7.01757392, 0.00000000 };
Point ( 6041 ) = { 1.42428877, 7.02150944, 0.00000000 };
Point ( 6042 ) = { 1.42224580, 7.02192354, 0.00000000 };
Point ( 6043 ) = { 1.42198020, 7.02586295, 0.00000000 };
Point ( 6044 ) = { 1.42171393, 7.02980461, 0.00000000 };
Point ( 6045 ) = { 1.41966855, 7.03021796, 0.00000000 };
Point ( 6046 ) = { 1.41940080, 7.03416351, 0.00000000 };
Point ( 6047 ) = { 1.41913306, 7.03811475, 0.00000000 };
Point ( 6048 ) = { 1.41708526, 7.03852735, 0.00000000 };
Point ( 6049 ) = { 1.41681605, 7.04248250, 0.00000000 };
Point ( 6050 ) = { 1.41654615, 7.04643992, 0.00000000 };
Point ( 6051 ) = { 1.41627546, 7.05040142, 0.00000000 };
Point ( 6052 ) = { 1.41778732, 7.05792768, 0.00000000 };
Point ( 6053 ) = { 1.41930166, 7.06546627, 0.00000000 };
Point ( 6054 ) = { 1.42081988, 7.07302413, 0.00000000 };
Point ( 6055 ) = { 1.42260966, 7.07660214, 0.00000000 };
Point ( 6056 ) = { 1.42440085, 7.08018384, 0.00000000 };
Point ( 6057 ) = { 1.42413342, 7.08418188, 0.00000000 };
Point ( 6058 ) = { 1.42386519, 7.08818407, 0.00000000 };
Point ( 6059 ) = { 1.42359662, 7.09219033, 0.00000000 };
Point ( 6060 ) = { 1.42332819, 7.09620056, 0.00000000 };
Point ( 6061 ) = { 1.42305978, 7.10021661, 0.00000000 };
Point ( 6062 ) = { 1.42279056, 7.10423685, 0.00000000 };
Point ( 6063 ) = { 1.42432038, 7.11187550, 0.00000000 };
Point ( 6064 ) = { 1.42612129, 7.11549173, 0.00000000 };
Point ( 6065 ) = { 1.42792362, 7.11911172, 0.00000000 };
Point ( 6066 ) = { 1.42972820, 7.12273713, 0.00000000 };
Point ( 6067 ) = { 1.43180050, 7.12232085, 0.00000000 };
Point ( 6068 ) = { 1.43387173, 7.12190416, 0.00000000 };
Point ( 6069 ) = { 1.43594379, 7.12148667, 0.00000000 };
Point ( 6070 ) = { 1.43775344, 7.12511419, 0.00000000 };
Point ( 6071 ) = { 1.43956463, 7.12874363, 0.00000000 };
Point ( 6072 ) = { 1.44163868, 7.12832448, 0.00000000 };
Point ( 6073 ) = { 1.44371166, 7.12790493, 0.00000000 };
Point ( 6074 ) = { 1.44552734, 7.13153690, 0.00000000 };
Point ( 6075 ) = { 1.44708807, 7.13923678, 0.00000000 };
Point ( 6076 ) = { 1.44865139, 7.14694946, 0.00000000 };
Point ( 6077 ) = { 1.44839438, 7.15102449, 0.00000000 };
Point ( 6078 ) = { 1.44813751, 7.15510361, 0.00000000 };
Point ( 6079 ) = { 1.44787996, 7.15918513, 0.00000000 };
Point ( 6080 ) = { 1.44762161, 7.16327094, 0.00000000 };
Point ( 6081 ) = { 1.44736329, 7.16736273, 0.00000000 };
Point ( 6082 ) = { 1.44710513, 7.17145863, 0.00000000 };
Point ( 6083 ) = { 1.44684628, 7.17555696, 0.00000000 };
Point ( 6084 ) = { 1.44658662, 7.17965960, 0.00000000 };
Point ( 6085 ) = { 1.44632699, 7.18376825, 0.00000000 };
Point ( 6086 ) = { 1.44423777, 7.18418857, 0.00000000 };
Point ( 6087 ) = { 1.44397662, 7.18830138, 0.00000000 };
Point ( 6088 ) = { 1.44371514, 7.19241843, 0.00000000 };
Point ( 6089 ) = { 1.44162340, 7.19283798, 0.00000000 };
Point ( 6090 ) = { 1.44136039, 7.19695921, 0.00000000 };
Point ( 6091 ) = { 1.44109669, 7.20108289, 0.00000000 };
Point ( 6092 ) = { 1.43900243, 7.20150168, 0.00000000 };
Point ( 6093 ) = { 1.43690709, 7.20192006, 0.00000000 };
Point ( 6094 ) = { 1.43664114, 7.20604775, 0.00000000 };
Point ( 6095 ) = { 1.43637485, 7.21017971, 0.00000000 };
Point ( 6096 ) = { 1.43427698, 7.21059732, 0.00000000 };
Point ( 6097 ) = { 1.43217900, 7.21101431, 0.00000000 };
Point ( 6098 ) = { 1.43008185, 7.21143051, 0.00000000 };
Point ( 6099 ) = { 1.42798362, 7.21184629, 0.00000000 };
Point ( 6100 ) = { 1.42588623, 7.21226127, 0.00000000 };
Point ( 6101 ) = { 1.42378776, 7.21267582, 0.00000000 };
Point ( 6102 ) = { 1.42351391, 7.21681158, 0.00000000 };
Point ( 6103 ) = { 1.42324008, 7.22095341, 0.00000000 };
Point ( 6104 ) = { 1.42113908, 7.22136720, 0.00000000 };
Point ( 6105 ) = { 1.41903892, 7.22178019, 0.00000000 };
Point ( 6106 ) = { 1.41693768, 7.22219275, 0.00000000 };
Point ( 6107 ) = { 1.41483729, 7.22260452, 0.00000000 };
Point ( 6108 ) = { 1.41273581, 7.22301586, 0.00000000 };
Point ( 6109 ) = { 1.41063517, 7.22342640, 0.00000000 };
Point ( 6110 ) = { 1.40853345, 7.22383652, 0.00000000 };
Point ( 6111 ) = { 1.40643258, 7.22424584, 0.00000000 };
Point ( 6112 ) = { 1.40433062, 7.22465474, 0.00000000 };
Point ( 6113 ) = { 1.40222855, 7.22506302, 0.00000000 };
Point ( 6114 ) = { 1.40012731, 7.22547051, 0.00000000 };
Point ( 6115 ) = { 1.39802500, 7.22587757, 0.00000000 };
Point ( 6116 ) = { 1.39592353, 7.22628383, 0.00000000 };
Point ( 6117 ) = { 1.39382098, 7.22668967, 0.00000000 };
Point ( 6118 ) = { 1.39171928, 7.22709471, 0.00000000 };
Point ( 6119 ) = { 1.38961650, 7.22749933, 0.00000000 };
Point ( 6120 ) = { 1.38751456, 7.22790315, 0.00000000 };
Point ( 6121 ) = { 1.38541154, 7.22830654, 0.00000000 };
Point ( 6122 ) = { 1.38330936, 7.22870913, 0.00000000 };
Point ( 6123 ) = { 1.38120611, 7.22911130, 0.00000000 };
Point ( 6124 ) = { 1.37910370, 7.22951268, 0.00000000 };
Point ( 6125 ) = { 1.37700021, 7.22991362, 0.00000000 };
Point ( 6126 ) = { 1.37489757, 7.23031377, 0.00000000 };
Point ( 6127 ) = { 1.37279385, 7.23071349, 0.00000000 };
Point ( 6128 ) = { 1.37069001, 7.23111260, 0.00000000 };
Point ( 6129 ) = { 1.36889217, 7.22737127, 0.00000000 };
Point ( 6130 ) = { 1.36709659, 7.22363558, 0.00000000 };
Point ( 6131 ) = { 1.36499481, 7.22403303, 0.00000000 };
Point ( 6132 ) = { 1.36289388, 7.22442969, 0.00000000 };
Point ( 6133 ) = { 1.36079187, 7.22482592, 0.00000000 };
Point ( 6134 ) = { 1.35869071, 7.22522136, 0.00000000 };
Point ( 6135 ) = { 1.35658848, 7.22561636, 0.00000000 };
Point ( 6136 ) = { 1.35448708, 7.22601058, 0.00000000 };
Point ( 6137 ) = { 1.35238462, 7.22640436, 0.00000000 };
Point ( 6138 ) = { 1.35028300, 7.22679735, 0.00000000 };
Point ( 6139 ) = { 1.34818030, 7.22718991, 0.00000000 };
Point ( 6140 ) = { 1.34607845, 7.22758168, 0.00000000 };
Point ( 6141 ) = { 1.34397553, 7.22797301, 0.00000000 };
Point ( 6142 ) = { 1.34187345, 7.22836356, 0.00000000 };
Point ( 6143 ) = { 1.33977030, 7.22875367, 0.00000000 };
Point ( 6144 ) = { 1.33766704, 7.22914317, 0.00000000 };
Point ( 6145 ) = { 1.33556462, 7.22953188, 0.00000000 };
Point ( 6146 ) = { 1.33346113, 7.22992016, 0.00000000 };
Point ( 6147 ) = { 1.33135849, 7.23030765, 0.00000000 };
Point ( 6148 ) = { 1.32925477, 7.23069470, 0.00000000 };
Point ( 6149 ) = { 1.32715190, 7.23108097, 0.00000000 };
Point ( 6150 ) = { 1.32504796, 7.23146679, 0.00000000 };
Point ( 6151 ) = { 1.32294487, 7.23185184, 0.00000000 };
Point ( 6152 ) = { 1.32084071, 7.23223644, 0.00000000 };
Point ( 6153 ) = { 1.31873739, 7.23262026, 0.00000000 };
Point ( 6154 ) = { 1.31663300, 7.23300364, 0.00000000 };
Point ( 6155 ) = { 1.31629783, 7.23713488, 0.00000000 };
Point ( 6156 ) = { 1.31596259, 7.24127220, 0.00000000 };
Point ( 6157 ) = { 1.31385568, 7.24165477, 0.00000000 };
Point ( 6158 ) = { 1.31174963, 7.24203655, 0.00000000 };
Point ( 6159 ) = { 1.30964250, 7.24241790, 0.00000000 };
Point ( 6160 ) = { 1.30753526, 7.24279864, 0.00000000 };
Point ( 6161 ) = { 1.30542887, 7.24317858, 0.00000000 };
Point ( 6162 ) = { 1.30332141, 7.24355809, 0.00000000 };
Point ( 6163 ) = { 1.30121481, 7.24393681, 0.00000000 };
Point ( 6164 ) = { 1.29910713, 7.24431510, 0.00000000 };
Point ( 6165 ) = { 1.29700030, 7.24469259, 0.00000000 };
Point ( 6166 ) = { 1.29489240, 7.24506965, 0.00000000 };
Point ( 6167 ) = { 1.29278535, 7.24544592, 0.00000000 };
Point ( 6168 ) = { 1.29243597, 7.24958651, 0.00000000 };
Point ( 6169 ) = { 1.29208616, 7.25373139, 0.00000000 };
Point ( 6170 ) = { 1.28997659, 7.25410684, 0.00000000 };
Point ( 6171 ) = { 1.28786595, 7.25448186, 0.00000000 };
Point ( 6172 ) = { 1.28575617, 7.25485608, 0.00000000 };
Point ( 6173 ) = { 1.28540232, 7.25900495, 0.00000000 };
Point ( 6174 ) = { 1.28504771, 7.26315630, 0.00000000 };
Point ( 6175 ) = { 1.28469316, 7.26731188, 0.00000000 };
Point ( 6176 ) = { 1.28433851, 7.27147358, 0.00000000 };
Point ( 6177 ) = { 1.28398294, 7.27563969, 0.00000000 };
Point ( 6178 ) = { 1.28574463, 7.27943453, 0.00000000 };
Point ( 6179 ) = { 1.28750772, 7.28323338, 0.00000000 };
Point ( 6180 ) = { 1.28891987, 7.29122168, 0.00000000 };
Point ( 6181 ) = { 1.28856596, 7.29540790, 0.00000000 };
Point ( 6182 ) = { 1.28821113, 7.29959856, 0.00000000 };
Point ( 6183 ) = { 1.28785620, 7.30379543, 0.00000000 };
Point ( 6184 ) = { 1.28750083, 7.30799668, 0.00000000 };
Point ( 6185 ) = { 1.28714471, 7.31220048, 0.00000000 };
Point ( 6186 ) = { 1.28678865, 7.31640858, 0.00000000 };
Point ( 6187 ) = { 1.28820600, 7.32446735, 0.00000000 };
Point ( 6188 ) = { 1.28998112, 7.32831394, 0.00000000 };
Point ( 6189 ) = { 1.29175863, 7.33216444, 0.00000000 };
Point ( 6190 ) = { 1.29318449, 7.34025776, 0.00000000 };
Point ( 6191 ) = { 1.29496698, 7.34412269, 0.00000000 };
Point ( 6192 ) = { 1.29675140, 7.34799167, 0.00000000 };
Point ( 6193 ) = { 1.29853742, 7.35186282, 0.00000000 };
Point ( 6194 ) = { 1.30032488, 7.35573811, 0.00000000 };
Point ( 6195 ) = { 1.30176413, 7.36387973, 0.00000000 };
Point ( 6196 ) = { 1.30355662, 7.36776958, 0.00000000 };
Point ( 6197 ) = { 1.30570022, 7.36739000, 0.00000000 };
Point ( 6198 ) = { 1.30784272, 7.36700997, 0.00000000 };
Point ( 6199 ) = { 1.30963991, 7.37090277, 0.00000000 };
Point ( 6200 ) = { 1.31143904, 7.37479965, 0.00000000 };
Point ( 6201 ) = { 1.31358370, 7.37441795, 0.00000000 };
Point ( 6202 ) = { 1.31572924, 7.37403545, 0.00000000 };
Point ( 6203 ) = { 1.31787368, 7.37365250, 0.00000000 };
Point ( 6204 ) = { 1.31967817, 7.37755189, 0.00000000 };
Point ( 6205 ) = { 1.32148429, 7.38145351, 0.00000000 };
Point ( 6206 ) = { 1.32363088, 7.38106888, 0.00000000 };
Point ( 6207 ) = { 1.32577835, 7.38068346, 0.00000000 };
Point ( 6208 ) = { 1.32792473, 7.38029759, 0.00000000 };
Point ( 6209 ) = { 1.33007197, 7.37991092, 0.00000000 };
Point ( 6210 ) = { 1.33221812, 7.37952380, 0.00000000 };
Point ( 6211 ) = { 1.33403188, 7.38342687, 0.00000000 };
Point ( 6212 ) = { 1.33584795, 7.38733593, 0.00000000 };
Point ( 6213 ) = { 1.33799724, 7.38694695, 0.00000000 };
Point ( 6214 ) = { 1.34014543, 7.38655753, 0.00000000 };
Point ( 6215 ) = { 1.34229450, 7.38616730, 0.00000000 };
Point ( 6216 ) = { 1.34444247, 7.38577662, 0.00000000 };
Point ( 6217 ) = { 1.34626507, 7.38968767, 0.00000000 };
Point ( 6218 ) = { 1.34808931, 7.39360096, 0.00000000 };
Point ( 6219 ) = { 1.35023944, 7.39320860, 0.00000000 };
Point ( 6220 ) = { 1.35239044, 7.39281543, 0.00000000 };
Point ( 6221 ) = { 1.35454034, 7.39242182, 0.00000000 };
Point ( 6222 ) = { 1.35669111, 7.39202740, 0.00000000 };
Point ( 6223 ) = { 1.35852140, 7.39594277, 0.00000000 };
Point ( 6224 ) = { 1.36035404, 7.39986414, 0.00000000 };
Point ( 6225 ) = { 1.36250697, 7.39946803, 0.00000000 };
Point ( 6226 ) = { 1.36434275, 7.40339300, 0.00000000 };
Point ( 6227 ) = { 1.36586423, 7.41164913, 0.00000000 };
Point ( 6228 ) = { 1.36554825, 7.41598451, 0.00000000 };
Point ( 6229 ) = { 1.36339050, 7.41638150, 0.00000000 };
Point ( 6230 ) = { 1.36307286, 7.42072140, 0.00000000 };
Point ( 6231 ) = { 1.36275446, 7.42506401, 0.00000000 };
Point ( 6232 ) = { 1.36059408, 7.42546019, 0.00000000 };
Point ( 6233 ) = { 1.35843457, 7.42585556, 0.00000000 };
Point ( 6234 ) = { 1.35627396, 7.42625049, 0.00000000 };
Point ( 6235 ) = { 1.35595137, 7.43059743, 0.00000000 };
Point ( 6236 ) = { 1.35562872, 7.43495091, 0.00000000 };
Point ( 6237 ) = { 1.35346547, 7.43534502, 0.00000000 };
Point ( 6238 ) = { 1.35130308, 7.43573831, 0.00000000 };
Point ( 6239 ) = { 1.34913959, 7.43613116, 0.00000000 };
Point ( 6240 ) = { 1.34697698, 7.43652320, 0.00000000 };
Point ( 6241 ) = { 1.34481327, 7.43691479, 0.00000000 };
Point ( 6242 ) = { 1.34264944, 7.43730575, 0.00000000 };
Point ( 6243 ) = { 1.34048648, 7.43769590, 0.00000000 };
Point ( 6244 ) = { 1.34015406, 7.44205343, 0.00000000 };
Point ( 6245 ) = { 1.33982089, 7.44641370, 0.00000000 };
Point ( 6246 ) = { 1.33765529, 7.44680303, 0.00000000 };
Point ( 6247 ) = { 1.33548858, 7.44719190, 0.00000000 };
Point ( 6248 ) = { 1.33332275, 7.44757997, 0.00000000 };
Point ( 6249 ) = { 1.33115582, 7.44796759, 0.00000000 };
Point ( 6250 ) = { 1.32898977, 7.44835439, 0.00000000 };
Point ( 6251 ) = { 1.32682261, 7.44874075, 0.00000000 };
Point ( 6252 ) = { 1.32465633, 7.44912630, 0.00000000 };
Point ( 6253 ) = { 1.32248895, 7.44951139, 0.00000000 };
Point ( 6254 ) = { 1.32032245, 7.44989568, 0.00000000 };
Point ( 6255 ) = { 1.31815484, 7.45027951, 0.00000000 };
Point ( 6256 ) = { 1.31598812, 7.45066254, 0.00000000 };
Point ( 6257 ) = { 1.31382029, 7.45104511, 0.00000000 };
Point ( 6258 ) = { 1.31165235, 7.45142705, 0.00000000 };
Point ( 6259 ) = { 1.30948529, 7.45180819, 0.00000000 };
Point ( 6260 ) = { 1.30731713, 7.45218887, 0.00000000 };
Point ( 6261 ) = { 1.30514985, 7.45256874, 0.00000000 };
Point ( 6262 ) = { 1.30298146, 7.45294816, 0.00000000 };
Point ( 6263 ) = { 1.30081396, 7.45332677, 0.00000000 };
Point ( 6264 ) = { 1.30045752, 7.45768988, 0.00000000 };
Point ( 6265 ) = { 1.30010097, 7.46205955, 0.00000000 };
Point ( 6266 ) = { 1.29793082, 7.46243733, 0.00000000 };
Point ( 6267 ) = { 1.29575957, 7.46281465, 0.00000000 };
Point ( 6268 ) = { 1.29358920, 7.46319116, 0.00000000 };
Point ( 6269 ) = { 1.29141773, 7.46356721, 0.00000000 };
Point ( 6270 ) = { 1.28924714, 7.46394246, 0.00000000 };
Point ( 6271 ) = { 1.28707545, 7.46431726, 0.00000000 };
Point ( 6272 ) = { 1.28490464, 7.46469124, 0.00000000 };
Point ( 6273 ) = { 1.28273273, 7.46506477, 0.00000000 };
Point ( 6274 ) = { 1.28236556, 7.46943826, 0.00000000 };
Point ( 6275 ) = { 1.28199794, 7.47381643, 0.00000000 };
Point ( 6276 ) = { 1.27982437, 7.47418894, 0.00000000 };
Point ( 6277 ) = { 1.27764970, 7.47456099, 0.00000000 };
Point ( 6278 ) = { 1.27547591, 7.47493223, 0.00000000 };
Point ( 6279 ) = { 1.27510401, 7.47931475, 0.00000000 };
Point ( 6280 ) = { 1.27473132, 7.48370003, 0.00000000 };
Point ( 6281 ) = { 1.27255488, 7.48407043, 0.00000000 };
Point ( 6282 ) = { 1.27037734, 7.48444036, 0.00000000 };
Point ( 6283 ) = { 1.26820068, 7.48480949, 0.00000000 };
Point ( 6284 ) = { 1.26782370, 7.48919913, 0.00000000 };
Point ( 6285 ) = { 1.26744626, 7.49359347, 0.00000000 };
Point ( 6286 ) = { 1.26526694, 7.49396174, 0.00000000 };
Point ( 6287 ) = { 1.26308651, 7.49432956, 0.00000000 };
Point ( 6288 ) = { 1.26270655, 7.49872829, 0.00000000 };
Point ( 6289 ) = { 1.26232644, 7.50313367, 0.00000000 };
Point ( 6290 ) = { 1.26014335, 7.50350063, 0.00000000 };
Point ( 6291 ) = { 1.25796115, 7.50386678, 0.00000000 };
Point ( 6292 ) = { 1.25757750, 7.50827675, 0.00000000 };
Point ( 6293 ) = { 1.25719339, 7.51269144, 0.00000000 };
Point ( 6294 ) = { 1.25500751, 7.51305690, 0.00000000 };
Point ( 6295 ) = { 1.25282253, 7.51342156, 0.00000000 };
Point ( 6296 ) = { 1.25243537, 7.51784077, 0.00000000 };
Point ( 6297 ) = { 1.25204741, 7.52226279, 0.00000000 };
Point ( 6298 ) = { 1.24985976, 7.52262659, 0.00000000 };
Point ( 6299 ) = { 1.24947003, 7.52705324, 0.00000000 };
Point ( 6300 ) = { 1.24908015, 7.53148660, 0.00000000 };
Point ( 6301 ) = { 1.24869029, 7.53592464, 0.00000000 };
Point ( 6302 ) = { 1.24829962, 7.54036551, 0.00000000 };
Point ( 6303 ) = { 1.24790797, 7.54481125, 0.00000000 };
Point ( 6304 ) = { 1.24751616, 7.54926373, 0.00000000 };
Point ( 6305 ) = { 1.24712437, 7.55372093, 0.00000000 };
Point ( 6306 ) = { 1.24892977, 7.55781809, 0.00000000 };
Point ( 6307 ) = { 1.25112867, 7.55745440, 0.00000000 };
Point ( 6308 ) = { 1.25293727, 7.56155543, 0.00000000 };
Point ( 6309 ) = { 1.25474820, 7.56566285, 0.00000000 };
Point ( 6310 ) = { 1.25694938, 7.56529746, 0.00000000 };
Point ( 6311 ) = { 1.25914945, 7.56493160, 0.00000000 };
Point ( 6312 ) = { 1.26135041, 7.56456492, 0.00000000 };
Point ( 6313 ) = { 1.26355027, 7.56419778, 0.00000000 };
Point ( 6314 ) = { 1.26536850, 7.56830742, 0.00000000 };
Point ( 6315 ) = { 1.26718844, 7.57241952, 0.00000000 };
Point ( 6316 ) = { 1.26939158, 7.57205051, 0.00000000 };
Point ( 6317 ) = { 1.27159361, 7.57168102, 0.00000000 };
Point ( 6318 ) = { 1.27379654, 7.57131073, 0.00000000 };
Point ( 6319 ) = { 1.27562159, 7.57542575, 0.00000000 };
Point ( 6320 ) = { 1.27744900, 7.57954718, 0.00000000 };
Point ( 6321 ) = { 1.27965422, 7.57917518, 0.00000000 };
Point ( 6322 ) = { 1.28185832, 7.57880272, 0.00000000 };
Point ( 6323 ) = { 1.28369068, 7.58292744, 0.00000000 };
Point ( 6324 ) = { 1.28331724, 7.58742834, 0.00000000 };
Point ( 6325 ) = { 1.28294383, 7.59193404, 0.00000000 };
Point ( 6326 ) = { 1.28257030, 7.59644661, 0.00000000 };
Point ( 6327 ) = { 1.28219579, 7.60096417, 0.00000000 };
Point ( 6328 ) = { 1.28182081, 7.60548664, 0.00000000 };
Point ( 6329 ) = { 1.28144588, 7.61001394, 0.00000000 };
Point ( 6330 ) = { 1.28107013, 7.61454419, 0.00000000 };
Point ( 6331 ) = { 1.28069341, 7.61907944, 0.00000000 };
Point ( 6332 ) = { 1.28031622, 7.62361964, 0.00000000 };
Point ( 6333 ) = { 1.27809909, 7.62399166, 0.00000000 };
Point ( 6334 ) = { 1.27772010, 7.62853670, 0.00000000 };
Point ( 6335 ) = { 1.27918350, 7.63727380, 0.00000000 };
Point ( 6336 ) = { 1.28065019, 7.64603061, 0.00000000 };
Point ( 6337 ) = { 1.28249738, 7.65022792, 0.00000000 };
Point ( 6338 ) = { 1.28472214, 7.64985463, 0.00000000 };
Point ( 6339 ) = { 1.28694782, 7.64948051, 0.00000000 };
Point ( 6340 ) = { 1.28879902, 7.65368141, 0.00000000 };
Point ( 6341 ) = { 1.29065264, 7.65788890, 0.00000000 };
Point ( 6342 ) = { 1.29288065, 7.65751306, 0.00000000 };
Point ( 6343 ) = { 1.29510753, 7.65713674, 0.00000000 };
Point ( 6344 ) = { 1.29733532, 7.65675961, 0.00000000 };
Point ( 6345 ) = { 1.29956198, 7.65638199, 0.00000000 };
Point ( 6346 ) = { 1.30178956, 7.65600356, 0.00000000 };
Point ( 6347 ) = { 1.30401600, 7.65562466, 0.00000000 };
Point ( 6348 ) = { 1.30624335, 7.65524493, 0.00000000 };
Point ( 6349 ) = { 1.30846957, 7.65486473, 0.00000000 };
Point ( 6350 ) = { 1.31069670, 7.65448370, 0.00000000 };
Point ( 6351 ) = { 1.31292270, 7.65410221, 0.00000000 };
Point ( 6352 ) = { 1.31514961, 7.65371989, 0.00000000 };
Point ( 6353 ) = { 1.31737641, 7.65333692, 0.00000000 };
Point ( 6354 ) = { 1.31960207, 7.65295348, 0.00000000 };
Point ( 6355 ) = { 1.32182865, 7.65256922, 0.00000000 };
Point ( 6356 ) = { 1.32405409, 7.65218448, 0.00000000 };
Point ( 6357 ) = { 1.32628044, 7.65179893, 0.00000000 };
Point ( 6358 ) = { 1.32850566, 7.65141290, 0.00000000 };
Point ( 6359 ) = { 1.33073178, 7.65102604, 0.00000000 };
Point ( 6360 ) = { 1.33295677, 7.65063872, 0.00000000 };
Point ( 6361 ) = { 1.33330410, 7.64605403, 0.00000000 };
Point ( 6362 ) = { 1.33365133, 7.64147636, 0.00000000 };
Point ( 6363 ) = { 1.33587354, 7.64108819, 0.00000000 };
Point ( 6364 ) = { 1.33809667, 7.64069919, 0.00000000 };
Point ( 6365 ) = { 1.34031866, 7.64030973, 0.00000000 };
Point ( 6366 ) = { 1.34254155, 7.63991944, 0.00000000 };
Point ( 6367 ) = { 1.34476331, 7.63952868, 0.00000000 };
Point ( 6368 ) = { 1.34698598, 7.63913710, 0.00000000 };
Point ( 6369 ) = { 1.34920853, 7.63874487, 0.00000000 };
Point ( 6370 ) = { 1.35142995, 7.63835217, 0.00000000 };
Point ( 6371 ) = { 1.35365228, 7.63795865, 0.00000000 };
Point ( 6372 ) = { 1.35587347, 7.63756466, 0.00000000 };
Point ( 6373 ) = { 1.35809556, 7.63716984, 0.00000000 };
Point ( 6374 ) = { 1.36031653, 7.63677456, 0.00000000 };
Point ( 6375 ) = { 1.36253839, 7.63637846, 0.00000000 };
Point ( 6376 ) = { 1.36475912, 7.63598188, 0.00000000 };
Point ( 6377 ) = { 1.36698076, 7.63558448, 0.00000000 };
Point ( 6378 ) = { 1.36920126, 7.63518662, 0.00000000 };
Point ( 6379 ) = { 1.37109807, 7.63936726, 0.00000000 };
Point ( 6380 ) = { 1.37299738, 7.64355446, 0.00000000 };
Point ( 6381 ) = { 1.37522020, 7.64315485, 0.00000000 };
Point ( 6382 ) = { 1.37744392, 7.64275440, 0.00000000 };
Point ( 6383 ) = { 1.37966650, 7.64235349, 0.00000000 };
Point ( 6384 ) = { 1.38188999, 7.64195176, 0.00000000 };
Point ( 6385 ) = { 1.38411336, 7.64154937, 0.00000000 };
Point ( 6386 ) = { 1.38633560, 7.64114652, 0.00000000 };
Point ( 6387 ) = { 1.38855873, 7.64074285, 0.00000000 };
Point ( 6388 ) = { 1.39078073, 7.64033871, 0.00000000 };
Point ( 6389 ) = { 1.39269193, 7.64452604, 0.00000000 };
Point ( 6390 ) = { 1.39460491, 7.64871593, 0.00000000 };
Point ( 6391 ) = { 1.39682923, 7.64831003, 0.00000000 };
Point ( 6392 ) = { 1.39905445, 7.64790330, 0.00000000 };
Point ( 6393 ) = { 1.40127853, 7.64749611, 0.00000000 };
Point ( 6394 ) = { 1.40350351, 7.64708808, 0.00000000 };
Point ( 6395 ) = { 1.40572736, 7.64667960, 0.00000000 };
Point ( 6396 ) = { 1.40795210, 7.64627028, 0.00000000 };
Point ( 6397 ) = { 1.41017571, 7.64586050, 0.00000000 };
Point ( 6398 ) = { 1.41240021, 7.64544988, 0.00000000 };
Point ( 6399 ) = { 1.41462358, 7.64503881, 0.00000000 };
Point ( 6400 ) = { 1.41684785, 7.64462690, 0.00000000 };
Point ( 6401 ) = { 1.41907200, 7.64421434, 0.00000000 };
Point ( 6402 ) = { 1.42129500, 7.64380133, 0.00000000 };
Point ( 6403 ) = { 1.42351891, 7.64338748, 0.00000000 };
Point ( 6404 ) = { 1.42574168, 7.64297317, 0.00000000 };
Point ( 6405 ) = { 1.42796534, 7.64255803, 0.00000000 };
Point ( 6406 ) = { 1.43018787, 7.64214243, 0.00000000 };
Point ( 6407 ) = { 1.43212251, 7.64632794, 0.00000000 };
Point ( 6408 ) = { 1.43405970, 7.65052003, 0.00000000 };
Point ( 6409 ) = { 1.43628454, 7.65010266, 0.00000000 };
Point ( 6410 ) = { 1.43851028, 7.64968445, 0.00000000 };
Point ( 6411 ) = { 1.44073488, 7.64926578, 0.00000000 };
Point ( 6412 ) = { 1.44296038, 7.64884627, 0.00000000 };
Point ( 6413 ) = { 1.44518473, 7.64842631, 0.00000000 };
Point ( 6414 ) = { 1.44713021, 7.65262017, 0.00000000 };
Point ( 6415 ) = { 1.44907751, 7.65681659, 0.00000000 };
Point ( 6416 ) = { 1.45130418, 7.65639485, 0.00000000 };
Point ( 6417 ) = { 1.45353175, 7.65597227, 0.00000000 };
Point ( 6418 ) = { 1.45575920, 7.65554904, 0.00000000 };
Point ( 6419 ) = { 1.45798550, 7.65512535, 0.00000000 };
Point ( 6420 ) = { 1.45993988, 7.65932409, 0.00000000 };
Point ( 6421 ) = { 1.46189685, 7.66352946, 0.00000000 };
Point ( 6422 ) = { 1.46412548, 7.66310399, 0.00000000 };
Point ( 6423 ) = { 1.46635500, 7.66267768, 0.00000000 };
Point ( 6424 ) = { 1.46858337, 7.66225091, 0.00000000 };
Point ( 6425 ) = { 1.47081265, 7.66182330, 0.00000000 };
Point ( 6426 ) = { 1.47304077, 7.66139524, 0.00000000 };
Point ( 6427 ) = { 1.47526980, 7.66096633, 0.00000000 };
Point ( 6428 ) = { 1.47749767, 7.66053698, 0.00000000 };
Point ( 6429 ) = { 1.47972645, 7.66010677, 0.00000000 };
Point ( 6430 ) = { 1.48195408, 7.65967612, 0.00000000 };
Point ( 6431 ) = { 1.48418260, 7.65924462, 0.00000000 };
Point ( 6432 ) = { 1.48640998, 7.65881267, 0.00000000 };
Point ( 6433 ) = { 1.48863825, 7.65837988, 0.00000000 };
Point ( 6434 ) = { 1.49086639, 7.65794643, 0.00000000 };
Point ( 6435 ) = { 1.49309339, 7.65751254, 0.00000000 };
Point ( 6436 ) = { 1.49532128, 7.65707780, 0.00000000 };
Point ( 6437 ) = { 1.49754803, 7.65664261, 0.00000000 };
Point ( 6438 ) = { 1.49977567, 7.65620657, 0.00000000 };
Point ( 6439 ) = { 1.50200216, 7.65577009, 0.00000000 };
Point ( 6440 ) = { 1.50422955, 7.65533276, 0.00000000 };
Point ( 6441 ) = { 1.50447489, 7.65070097, 0.00000000 };
Point ( 6442 ) = { 1.50472030, 7.64607629, 0.00000000 };
Point ( 6443 ) = { 1.50694487, 7.64563817, 0.00000000 };
Point ( 6444 ) = { 1.50916829, 7.64519960, 0.00000000 };
Point ( 6445 ) = { 1.51139260, 7.64476019, 0.00000000 };
Point ( 6446 ) = { 1.51361576, 7.64432032, 0.00000000 };
Point ( 6447 ) = { 1.51385597, 7.63970034, 0.00000000 };
Point ( 6448 ) = { 1.51409546, 7.63508343, 0.00000000 };
Point ( 6449 ) = { 1.51631581, 7.63464278, 0.00000000 };
Point ( 6450 ) = { 1.51853705, 7.63420128, 0.00000000 };
Point ( 6451 ) = { 1.52075816, 7.63375914, 0.00000000 };
Point ( 6452 ) = { 1.52297812, 7.63331655, 0.00000000 };
Point ( 6453 ) = { 1.52519897, 7.63287312, 0.00000000 };
Point ( 6454 ) = { 1.52543092, 7.62826103, 0.00000000 };
Point ( 6455 ) = { 1.52566296, 7.62365600, 0.00000000 };
Point ( 6456 ) = { 1.52788100, 7.62321178, 0.00000000 };
Point ( 6457 ) = { 1.53009790, 7.62276713, 0.00000000 };
Point ( 6458 ) = { 1.53231568, 7.62232162, 0.00000000 };
Point ( 6459 ) = { 1.53453232, 7.62187568, 0.00000000 };
Point ( 6460 ) = { 1.53674984, 7.62142888, 0.00000000 };
Point ( 6461 ) = { 1.53896622, 7.62098165, 0.00000000 };
Point ( 6462 ) = { 1.54118348, 7.62053356, 0.00000000 };
Point ( 6463 ) = { 1.54140583, 7.61593312, 0.00000000 };
Point ( 6464 ) = { 1.54162748, 7.61133571, 0.00000000 };
Point ( 6465 ) = { 1.54384193, 7.61088685, 0.00000000 };
Point ( 6466 ) = { 1.54605524, 7.61043756, 0.00000000 };
Point ( 6467 ) = { 1.54826944, 7.60998741, 0.00000000 };
Point ( 6468 ) = { 1.55048350, 7.60953662, 0.00000000 };
Point ( 6469 ) = { 1.55269642, 7.60908539, 0.00000000 };
Point ( 6470 ) = { 1.55291158, 7.60449260, 0.00000000 };
Point ( 6471 ) = { 1.55312686, 7.59990682, 0.00000000 };
Point ( 6472 ) = { 1.55533698, 7.59945483, 0.00000000 };
Point ( 6473 ) = { 1.55754798, 7.59900198, 0.00000000 };
Point ( 6474 ) = { 1.55975783, 7.59854870, 0.00000000 };
Point ( 6475 ) = { 1.55996882, 7.59396775, 0.00000000 };
Point ( 6476 ) = { 1.56017910, 7.58938982, 0.00000000 };
Point ( 6477 ) = { 1.56238616, 7.58893578, 0.00000000 };
Point ( 6478 ) = { 1.56259483, 7.58436279, 0.00000000 };
Point ( 6479 ) = { 1.56080720, 7.57568622, 0.00000000 };
Point ( 6480 ) = { 1.55902442, 7.56703311, 0.00000000 };
Point ( 6481 ) = { 1.55703432, 7.56294043, 0.00000000 };
Point ( 6482 ) = { 1.55504695, 7.55885208, 0.00000000 };
Point ( 6483 ) = { 1.55306139, 7.55476617, 0.00000000 };
Point ( 6484 ) = { 1.55107754, 7.55068479, 0.00000000 };
Point ( 6485 ) = { 1.54909590, 7.54660782, 0.00000000 };
Point ( 6486 ) = { 1.54711698, 7.54253515, 0.00000000 };
Point ( 6487 ) = { 1.54535760, 7.53395780, 0.00000000 };
Point ( 6488 ) = { 1.54557385, 7.52944970, 0.00000000 };
Point ( 6489 ) = { 1.54579030, 7.52494639, 0.00000000 };
Point ( 6490 ) = { 1.54600686, 7.52044990, 0.00000000 };
Point ( 6491 ) = { 1.54622263, 7.51595837, 0.00000000 };
Point ( 6492 ) = { 1.54643770, 7.51146975, 0.00000000 };
Point ( 6493 ) = { 1.54862310, 7.51101950, 0.00000000 };
Point ( 6494 ) = { 1.55080737, 7.51056881, 0.00000000 };
Point ( 6495 ) = { 1.55102004, 7.50608481, 0.00000000 };
Point ( 6496 ) = { 1.55123282, 7.50160760, 0.00000000 };
Point ( 6497 ) = { 1.55341435, 7.50115616, 0.00000000 };
Point ( 6498 ) = { 1.55559674, 7.50070388, 0.00000000 };
Point ( 6499 ) = { 1.55777801, 7.50025117, 0.00000000 };
Point ( 6500 ) = { 1.55798660, 7.49577860, 0.00000000 };
Point ( 6501 ) = { 1.55819450, 7.49130892, 0.00000000 };
Point ( 6502 ) = { 1.56037403, 7.49085525, 0.00000000 };
Point ( 6503 ) = { 1.56255243, 7.49040115, 0.00000000 };
Point ( 6504 ) = { 1.56473170, 7.48994620, 0.00000000 };
Point ( 6505 ) = { 1.56690984, 7.48949084, 0.00000000 };
Point ( 6506 ) = { 1.56908884, 7.48903463, 0.00000000 };
Point ( 6507 ) = { 1.57126672, 7.48857799, 0.00000000 };
Point ( 6508 ) = { 1.57344546, 7.48812051, 0.00000000 };
Point ( 6509 ) = { 1.57562306, 7.48766261, 0.00000000 };
Point ( 6510 ) = { 1.57780153, 7.48720387, 0.00000000 };
Point ( 6511 ) = { 1.57997888, 7.48674470, 0.00000000 };
Point ( 6512 ) = { 1.58215708, 7.48628469, 0.00000000 };
Point ( 6513 ) = { 1.58433415, 7.48582425, 0.00000000 };
Point ( 6514 ) = { 1.58651209, 7.48536297, 0.00000000 };
Point ( 6515 ) = { 1.58868889, 7.48490127, 0.00000000 };
Point ( 6516 ) = { 1.59086656, 7.48443872, 0.00000000 };
Point ( 6517 ) = { 1.59304409, 7.48397554, 0.00000000 };
Point ( 6518 ) = { 1.59522050, 7.48351194, 0.00000000 };
Point ( 6519 ) = { 1.59739776, 7.48304750, 0.00000000 };
Point ( 6520 ) = { 1.59957389, 7.48258263, 0.00000000 };
Point ( 6521 ) = { 1.60156899, 7.48658773, 0.00000000 };
Point ( 6522 ) = { 1.60356589, 7.49059519, 0.00000000 };
Point ( 6523 ) = { 1.60574421, 7.49012853, 0.00000000 };
Point ( 6524 ) = { 1.60792340, 7.48966102, 0.00000000 };
Point ( 6525 ) = { 1.61010146, 7.48919309, 0.00000000 };
Point ( 6526 ) = { 1.61228037, 7.48872432, 0.00000000 };
Point ( 6527 ) = { 1.61445815, 7.48825512, 0.00000000 };
Point ( 6528 ) = { 1.61663679, 7.48778508, 0.00000000 };
Point ( 6529 ) = { 1.61881430, 7.48731462, 0.00000000 };
Point ( 6530 ) = { 1.62099267, 7.48684330, 0.00000000 };
Point ( 6531 ) = { 1.62316990, 7.48637158, 0.00000000 };
Point ( 6532 ) = { 1.62534800, 7.48589900, 0.00000000 };
Point ( 6533 ) = { 1.62752595, 7.48542578, 0.00000000 };
Point ( 6534 ) = { 1.62970278, 7.48495215, 0.00000000 };
Point ( 6535 ) = { 1.63171588, 7.48895692, 0.00000000 };
Point ( 6536 ) = { 1.63373163, 7.49296793, 0.00000000 };
Point ( 6537 ) = { 1.63591065, 7.49249249, 0.00000000 };
Point ( 6538 ) = { 1.63809052, 7.49201621, 0.00000000 };
Point ( 6539 ) = { 1.64026926, 7.49153950, 0.00000000 };
Point ( 6540 ) = { 1.64244885, 7.49106195, 0.00000000 };
Point ( 6541 ) = { 1.64462731, 7.49058398, 0.00000000 };
Point ( 6542 ) = { 1.64680663, 7.49010516, 0.00000000 };
Point ( 6543 ) = { 1.64898481, 7.48962592, 0.00000000 };
Point ( 6544 ) = { 1.65116385, 7.48914583, 0.00000000 };
Point ( 6545 ) = { 1.65334176, 7.48866533, 0.00000000 };
Point ( 6546 ) = { 1.65552052, 7.48818397, 0.00000000 };
Point ( 6547 ) = { 1.65769814, 7.48770220, 0.00000000 };
Point ( 6548 ) = { 1.65987662, 7.48721958, 0.00000000 };
Point ( 6549 ) = { 1.66205496, 7.48673632, 0.00000000 };
Point ( 6550 ) = { 1.66423216, 7.48625265, 0.00000000 };
Point ( 6551 ) = { 1.66641022, 7.48576812, 0.00000000 };
Point ( 6552 ) = { 1.66858714, 7.48528318, 0.00000000 };
Point ( 6553 ) = { 1.67076491, 7.48479739, 0.00000000 };
Point ( 6554 ) = { 1.67090532, 7.48031068, 0.00000000 };
Point ( 6555 ) = { 1.67104594, 7.47583075, 0.00000000 };
Point ( 6556 ) = { 1.67322097, 7.47534424, 0.00000000 };
Point ( 6557 ) = { 1.67539486, 7.47485732, 0.00000000 };
Point ( 6558 ) = { 1.67756960, 7.47436955, 0.00000000 };
Point ( 6559 ) = { 1.67974320, 7.47388137, 0.00000000 };
Point ( 6560 ) = { 1.68191766, 7.47339233, 0.00000000 };
Point ( 6561 ) = { 1.68409098, 7.47290288, 0.00000000 };
Point ( 6562 ) = { 1.68626515, 7.47241258, 0.00000000 };
Point ( 6563 ) = { 1.68843819, 7.47192187, 0.00000000 };
Point ( 6564 ) = { 1.69061207, 7.47143030, 0.00000000 };
Point ( 6565 ) = { 1.69278582, 7.47093810, 0.00000000 };
Point ( 6566 ) = { 1.69495842, 7.47044549, 0.00000000 };
Point ( 6567 ) = { 1.69713188, 7.46995203, 0.00000000 };
Point ( 6568 ) = { 1.69930420, 7.46945816, 0.00000000 };
Point ( 6569 ) = { 1.70147737, 7.46896343, 0.00000000 };
Point ( 6570 ) = { 1.70364940, 7.46846829, 0.00000000 };
Point ( 6571 ) = { 1.70582228, 7.46797230, 0.00000000 };
Point ( 6572 ) = { 1.70594187, 7.46349660, 0.00000000 };
Point ( 6573 ) = { 1.70606082, 7.45902379, 0.00000000 };
Point ( 6574 ) = { 1.70823095, 7.45852710, 0.00000000 };
Point ( 6575 ) = { 1.71039995, 7.45803000, 0.00000000 };
Point ( 6576 ) = { 1.71256979, 7.45753204, 0.00000000 };
Point ( 6577 ) = { 1.71473850, 7.45703368, 0.00000000 };
Point ( 6578 ) = { 1.71690805, 7.45653446, 0.00000000 };
Point ( 6579 ) = { 1.71907647, 7.45603484, 0.00000000 };
Point ( 6580 ) = { 1.72124573, 7.45553436, 0.00000000 };
Point ( 6581 ) = { 1.72341485, 7.45503325, 0.00000000 };
Point ( 6582 ) = { 1.72558283, 7.45453173, 0.00000000 };
Point ( 6583 ) = { 1.72775165, 7.45402936, 0.00000000 };
Point ( 6584 ) = { 1.72991934, 7.45352658, 0.00000000 };
Point ( 6585 ) = { 1.73208787, 7.45302295, 0.00000000 };
Point ( 6586 ) = { 1.73425527, 7.45251891, 0.00000000 };
Point ( 6587 ) = { 1.73642351, 7.45201401, 0.00000000 };
Point ( 6588 ) = { 1.73859061, 7.45150872, 0.00000000 };
Point ( 6589 ) = { 1.74075855, 7.45100256, 0.00000000 };
Point ( 6590 ) = { 1.74085652, 7.44653407, 0.00000000 };
Point ( 6591 ) = { 1.74095477, 7.44207232, 0.00000000 };
Point ( 6592 ) = { 1.74311997, 7.44156548, 0.00000000 };
Point ( 6593 ) = { 1.74528403, 7.44105823, 0.00000000 };
Point ( 6594 ) = { 1.74744894, 7.44055013, 0.00000000 };
Point ( 6595 ) = { 1.74961270, 7.44004162, 0.00000000 };
Point ( 6596 ) = { 1.75177731, 7.43953226, 0.00000000 };
Point ( 6597 ) = { 1.75394177, 7.43902226, 0.00000000 };
Point ( 6598 ) = { 1.75610509, 7.43851187, 0.00000000 };
Point ( 6599 ) = { 1.75826926, 7.43800062, 0.00000000 };
Point ( 6600 ) = { 1.76043228, 7.43748897, 0.00000000 };
Point ( 6601 ) = { 1.76259615, 7.43697646, 0.00000000 };
Point ( 6602 ) = { 1.76475887, 7.43646355, 0.00000000 };
Point ( 6603 ) = { 1.76692244, 7.43594978, 0.00000000 };
Point ( 6604 ) = { 1.76908487, 7.43543561, 0.00000000 };
Point ( 6605 ) = { 1.77124814, 7.43492058, 0.00000000 };
Point ( 6606 ) = { 1.77341026, 7.43440516, 0.00000000 };
Point ( 6607 ) = { 1.77557323, 7.43388887, 0.00000000 };
Point ( 6608 ) = { 1.77773506, 7.43337219, 0.00000000 };
Point ( 6609 ) = { 1.77989773, 7.43285464, 0.00000000 };
Point ( 6610 ) = { 1.78198566, 7.43679892, 0.00000000 };
Point ( 6611 ) = { 1.78407636, 7.44074936, 0.00000000 };
Point ( 6612 ) = { 1.78624118, 7.44022996, 0.00000000 };
Point ( 6613 ) = { 1.78840584, 7.43970994, 0.00000000 };
Point ( 6614 ) = { 1.79056936, 7.43918953, 0.00000000 };
Point ( 6615 ) = { 1.79273372, 7.43866824, 0.00000000 };
Point ( 6616 ) = { 1.79489693, 7.43814657, 0.00000000 };
Point ( 6617 ) = { 1.79706099, 7.43762403, 0.00000000 };
Point ( 6618 ) = { 1.79916090, 7.44157505, 0.00000000 };
Point ( 6619 ) = { 1.80126267, 7.44552837, 0.00000000 };
Point ( 6620 ) = { 1.80342888, 7.44500398, 0.00000000 };
Point ( 6621 ) = { 1.80559393, 7.44447919, 0.00000000 };
Point ( 6622 ) = { 1.80775983, 7.44395354, 0.00000000 };
Point ( 6623 ) = { 1.80992458, 7.44342750, 0.00000000 };
Point ( 6624 ) = { 1.81209018, 7.44290058, 0.00000000 };
Point ( 6625 ) = { 1.81420002, 7.44685509, 0.00000000 };
Point ( 6626 ) = { 1.81631268, 7.45081577, 0.00000000 };
Point ( 6627 ) = { 1.81848042, 7.45028700, 0.00000000 };
Point ( 6628 ) = { 1.82064701, 7.44975784, 0.00000000 };
Point ( 6629 ) = { 1.82281445, 7.44922780, 0.00000000 };
Point ( 6630 ) = { 1.82498172, 7.44869714, 0.00000000 };
Point ( 6631 ) = { 1.82714786, 7.44816609, 0.00000000 };
Point ( 6632 ) = { 1.82931483, 7.44763416, 0.00000000 };
Point ( 6633 ) = { 1.83148065, 7.44710185, 0.00000000 };
Point ( 6634 ) = { 1.83364731, 7.44656867, 0.00000000 };
Point ( 6635 ) = { 1.83581282, 7.44603510, 0.00000000 };
Point ( 6636 ) = { 1.83797917, 7.44550065, 0.00000000 };
Point ( 6637 ) = { 1.84014437, 7.44496582, 0.00000000 };
Point ( 6638 ) = { 1.84231041, 7.44443011, 0.00000000 };
Point ( 6639 ) = { 1.84447530, 7.44389402, 0.00000000 };
Point ( 6640 ) = { 1.84664102, 7.44335706, 0.00000000 };
Point ( 6641 ) = { 1.84880560, 7.44281971, 0.00000000 };
Point ( 6642 ) = { 1.85097102, 7.44228148, 0.00000000 };
Point ( 6643 ) = { 1.85313528, 7.44174287, 0.00000000 };
Point ( 6644 ) = { 1.85530038, 7.44120339, 0.00000000 };
Point ( 6645 ) = { 1.85746532, 7.44066327, 0.00000000 };
Point ( 6646 ) = { 1.85962912, 7.44012278, 0.00000000 };
Point ( 6647 ) = { 1.86179374, 7.43958140, 0.00000000 };
Point ( 6648 ) = { 1.86395722, 7.43903965, 0.00000000 };
Point ( 6649 ) = { 1.86612154, 7.43849701, 0.00000000 };
Point ( 6650 ) = { 1.86828470, 7.43795400, 0.00000000 };
Point ( 6651 ) = { 1.87044870, 7.43741010, 0.00000000 };
Point ( 6652 ) = { 1.87046899, 7.43292124, 0.00000000 };
Point ( 6653 ) = { 1.87048969, 7.42843915, 0.00000000 };
Point ( 6654 ) = { 1.87265092, 7.42789462, 0.00000000 };
Point ( 6655 ) = { 1.87481100, 7.42734970, 0.00000000 };
Point ( 6656 ) = { 1.87697191, 7.42680391, 0.00000000 };
Point ( 6657 ) = { 1.87913168, 7.42625774, 0.00000000 };
Point ( 6658 ) = { 1.88129227, 7.42571069, 0.00000000 };
Point ( 6659 ) = { 1.88345171, 7.42516327, 0.00000000 };
Point ( 6660 ) = { 1.88561199, 7.42461496, 0.00000000 };
Point ( 6661 ) = { 1.88777210, 7.42406603, 0.00000000 };
Point ( 6662 ) = { 1.88993107, 7.42351672, 0.00000000 };
Point ( 6663 ) = { 1.89209086, 7.42296653, 0.00000000 };
Point ( 6664 ) = { 1.89424951, 7.42241596, 0.00000000 };
Point ( 6665 ) = { 1.89640898, 7.42186451, 0.00000000 };
Point ( 6666 ) = { 1.89856731, 7.42131269, 0.00000000 };
Point ( 6667 ) = { 1.90072646, 7.42075999, 0.00000000 };
Point ( 6668 ) = { 1.90288447, 7.42020691, 0.00000000 };
Point ( 6669 ) = { 1.90504330, 7.41965295, 0.00000000 };
Point ( 6670 ) = { 1.90720098, 7.41909862, 0.00000000 };
Point ( 6671 ) = { 1.90936176, 7.42302567, 0.00000000 };
Point ( 6672 ) = { 1.91152543, 7.42695886, 0.00000000 };
Point ( 6673 ) = { 1.91368524, 7.42640264, 0.00000000 };
Point ( 6674 ) = { 1.91584587, 7.42584554, 0.00000000 };
Point ( 6675 ) = { 1.91800535, 7.42528806, 0.00000000 };
Point ( 6676 ) = { 1.92016566, 7.42472971, 0.00000000 };
Point ( 6677 ) = { 1.92232581, 7.42417072, 0.00000000 };
Point ( 6678 ) = { 1.92448480, 7.42361136, 0.00000000 };
Point ( 6679 ) = { 1.92664462, 7.42305112, 0.00000000 };
Point ( 6680 ) = { 1.92880329, 7.42249050, 0.00000000 };
Point ( 6681 ) = { 1.93096279, 7.42192900, 0.00000000 };
Point ( 6682 ) = { 1.93312113, 7.42136713, 0.00000000 };
Point ( 6683 ) = { 1.93528030, 7.42080437, 0.00000000 };
Point ( 6684 ) = { 1.93743831, 7.42024125, 0.00000000 };
Point ( 6685 ) = { 1.93959715, 7.41967723, 0.00000000 };
Point ( 6686 ) = { 1.94175484, 7.41911285, 0.00000000 };
Point ( 6687 ) = { 1.94391335, 7.41854758, 0.00000000 };
Point ( 6688 ) = { 1.94607071, 7.41798195, 0.00000000 };
Point ( 6689 ) = { 1.94822889, 7.41741542, 0.00000000 };
Point ( 6690 ) = { 1.95038592, 7.41684853, 0.00000000 };
Point ( 6691 ) = { 1.95254377, 7.41628075, 0.00000000 };
Point ( 6692 ) = { 1.95470146, 7.41571234, 0.00000000 };
Point ( 6693 ) = { 1.95685800, 7.41514357, 0.00000000 };
Point ( 6694 ) = { 1.95901535, 7.41457391, 0.00000000 };
Point ( 6695 ) = { 1.96117155, 7.41400388, 0.00000000 };
Point ( 6696 ) = { 1.96113750, 7.40951497, 0.00000000 };
Point ( 6697 ) = { 1.96110394, 7.40503283, 0.00000000 };
Point ( 6698 ) = { 1.96325737, 7.40446220, 0.00000000 };
Point ( 6699 ) = { 1.96541161, 7.40389067, 0.00000000 };
Point ( 6700 ) = { 1.96756471, 7.40331878, 0.00000000 };
Point ( 6701 ) = { 1.96971862, 7.40274601, 0.00000000 };
Point ( 6702 ) = { 1.97187139, 7.40217287, 0.00000000 };
Point ( 6703 ) = { 1.97402497, 7.40159884, 0.00000000 };
Point ( 6704 ) = { 1.97617740, 7.40102444, 0.00000000 };
Point ( 6705 ) = { 1.97833064, 7.40044916, 0.00000000 };
Point ( 6706 ) = { 1.98048274, 7.39987351, 0.00000000 };
Point ( 6707 ) = { 1.98263565, 7.39929698, 0.00000000 };
Point ( 6708 ) = { 1.98478839, 7.39871982, 0.00000000 };
Point ( 6709 ) = { 1.98693999, 7.39814229, 0.00000000 };
Point ( 6710 ) = { 1.98909239, 7.39756388, 0.00000000 };
Point ( 6711 ) = { 1.99124365, 7.39698510, 0.00000000 };
Point ( 6712 ) = { 1.99339572, 7.39640544, 0.00000000 };
Point ( 6713 ) = { 1.99554664, 7.39582541, 0.00000000 };
Point ( 6714 ) = { 1.99769837, 7.39524449, 0.00000000 };
Point ( 6715 ) = { 1.99984895, 7.39466322, 0.00000000 };
Point ( 6716 ) = { 2.00200034, 7.39408105, 0.00000000 };
Point ( 6717 ) = { 2.00421072, 7.39798025, 0.00000000 };
Point ( 6718 ) = { 2.00642406, 7.40188556, 0.00000000 };
Point ( 6719 ) = { 2.00857755, 7.40130148, 0.00000000 };
Point ( 6720 ) = { 2.01079448, 7.40521034, 0.00000000 };
Point ( 6721 ) = { 2.01301333, 7.40912149, 0.00000000 };
Point ( 6722 ) = { 2.01523514, 7.41303670, 0.00000000 };
Point ( 6723 ) = { 2.01745993, 7.41695806, 0.00000000 };
Point ( 6724 ) = { 2.01961682, 7.41637103, 0.00000000 };
Point ( 6725 ) = { 2.02177453, 7.41578311, 0.00000000 };
Point ( 6726 ) = { 2.02400407, 7.41970740, 0.00000000 };
Point ( 6727 ) = { 2.02623556, 7.42363398, 0.00000000 };
Point ( 6728 ) = { 2.02839439, 7.42304440, 0.00000000 };
Point ( 6729 ) = { 2.03055404, 7.42245392, 0.00000000 };
Point ( 6730 ) = { 2.03271253, 7.42186309, 0.00000000 };
Point ( 6731 ) = { 2.03487184, 7.42127136, 0.00000000 };
Point ( 6732 ) = { 2.03702999, 7.42067927, 0.00000000 };
Point ( 6733 ) = { 2.03926966, 7.42460683, 0.00000000 };
Point ( 6734 ) = { 2.04151236, 7.42854057, 0.00000000 };
Point ( 6735 ) = { 2.04367262, 7.42794655, 0.00000000 };
Point ( 6736 ) = { 2.04583370, 7.42735163, 0.00000000 };
Point ( 6737 ) = { 2.04799361, 7.42675635, 0.00000000 };
Point ( 6738 ) = { 2.05015434, 7.42616017, 0.00000000 };
Point ( 6739 ) = { 2.05231391, 7.42556363, 0.00000000 };
Point ( 6740 ) = { 2.05447430, 7.42496620, 0.00000000 };
Point ( 6741 ) = { 2.05663352, 7.42436841, 0.00000000 };
Point ( 6742 ) = { 2.05888672, 7.42830181, 0.00000000 };
Point ( 6743 ) = { 2.06114242, 7.43223947, 0.00000000 };
Point ( 6744 ) = { 2.06330475, 7.43163947, 0.00000000 };
Point ( 6745 ) = { 2.06546591, 7.43103911, 0.00000000 };
Point ( 6746 ) = { 2.06762789, 7.43043784, 0.00000000 };
Point ( 6747 ) = { 2.06978870, 7.42983623, 0.00000000 };
Point ( 6748 ) = { 2.07195032, 7.42923371, 0.00000000 };
Point ( 6749 ) = { 2.07421377, 7.43317247, 0.00000000 };
Point ( 6750 ) = { 2.07647920, 7.43711355, 0.00000000 };
Point ( 6751 ) = { 2.07864294, 7.43650908, 0.00000000 };
Point ( 6752 ) = { 2.08080552, 7.43590426, 0.00000000 };
Point ( 6753 ) = { 2.08296891, 7.43529854, 0.00000000 };
Point ( 6754 ) = { 2.08513114, 7.43469246, 0.00000000 };
Point ( 6755 ) = { 2.08729417, 7.43408548, 0.00000000 };
Point ( 6756 ) = { 2.08945604, 7.43347814, 0.00000000 };
Point ( 6757 ) = { 2.09161873, 7.43286990, 0.00000000 };
Point ( 6758 ) = { 2.09389471, 7.43681062, 0.00000000 };
Point ( 6759 ) = { 2.09617322, 7.44075560, 0.00000000 };
Point ( 6760 ) = { 2.09833802, 7.44014541, 0.00000000 };
Point ( 6761 ) = { 2.10050264, 7.43953458, 0.00000000 };
Point ( 6762 ) = { 2.10266610, 7.43892340, 0.00000000 };
Point ( 6763 ) = { 2.10483037, 7.43831132, 0.00000000 };
Point ( 6764 ) = { 2.10699347, 7.43769888, 0.00000000 };
Point ( 6765 ) = { 2.10928076, 7.44164468, 0.00000000 };
Point ( 6766 ) = { 2.11157115, 7.44559670, 0.00000000 };
Point ( 6767 ) = { 2.11373637, 7.44498230, 0.00000000 };
Point ( 6768 ) = { 2.11590240, 7.44436700, 0.00000000 };
Point ( 6769 ) = { 2.11806726, 7.44375134, 0.00000000 };
Point ( 6770 ) = { 2.12023293, 7.44313477, 0.00000000 };
Point ( 6771 ) = { 2.12239743, 7.44251786, 0.00000000 };
Point ( 6772 ) = { 2.12456274, 7.44190003, 0.00000000 };
Point ( 6773 ) = { 2.12672689, 7.44128186, 0.00000000 };
Point ( 6774 ) = { 2.12902788, 7.44523349, 0.00000000 };
Point ( 6775 ) = { 2.13133145, 7.44918942, 0.00000000 };
Point ( 6776 ) = { 2.13349771, 7.44856928, 0.00000000 };
Point ( 6777 ) = { 2.13566479, 7.44794822, 0.00000000 };
Point ( 6778 ) = { 2.13783168, 7.44732653, 0.00000000 };
Point ( 6779 ) = { 2.13999740, 7.44670450, 0.00000000 };
Point ( 6780 ) = { 2.14216393, 7.44608155, 0.00000000 };
Point ( 6781 ) = { 2.14432929, 7.44545826, 0.00000000 };
Point ( 6782 ) = { 2.14664233, 7.44941445, 0.00000000 };
Point ( 6783 ) = { 2.14895740, 7.45337299, 0.00000000 };
Point ( 6784 ) = { 2.15112488, 7.45274772, 0.00000000 };
Point ( 6785 ) = { 2.15329317, 7.45212153, 0.00000000 };
Point ( 6786 ) = { 2.15546028, 7.45149500, 0.00000000 };
Point ( 6787 ) = { 2.15762821, 7.45086755, 0.00000000 };
Point ( 6788 ) = { 2.15979496, 7.45023976, 0.00000000 };
Point ( 6789 ) = { 2.16196251, 7.44961106, 0.00000000 };
Point ( 6790 ) = { 2.16412890, 7.44898201, 0.00000000 };
Point ( 6791 ) = { 2.16629609, 7.44835204, 0.00000000 };
Point ( 6792 ) = { 2.16846211, 7.44772172, 0.00000000 };
Point ( 6793 ) = { 2.17062893, 7.44709049, 0.00000000 };
Point ( 6794 ) = { 2.17279557, 7.44645863, 0.00000000 };
Point ( 6795 ) = { 2.17496104, 7.44582643, 0.00000000 };
Point ( 6796 ) = { 2.17712731, 7.44519331, 0.00000000 };
Point ( 6797 ) = { 2.17929241, 7.44455985, 0.00000000 };
Point ( 6798 ) = { 2.18145832, 7.44392547, 0.00000000 };
Point ( 6799 ) = { 2.18362305, 7.44329075, 0.00000000 };
Point ( 6800 ) = { 2.18578858, 7.44265511, 0.00000000 };
Point ( 6801 ) = { 2.18795294, 7.44201913, 0.00000000 };
Point ( 6802 ) = { 2.19011811, 7.44138223, 0.00000000 };
Point ( 6803 ) = { 2.19228210, 7.44074499, 0.00000000 };
Point ( 6804 ) = { 2.19444689, 7.44010683, 0.00000000 };
Point ( 6805 ) = { 2.19678822, 7.44405559, 0.00000000 };
Point ( 6806 ) = { 2.19913274, 7.44801059, 0.00000000 };
Point ( 6807 ) = { 2.20129964, 7.44737044, 0.00000000 };
Point ( 6808 ) = { 2.20346537, 7.44672995, 0.00000000 };
Point ( 6809 ) = { 2.20581532, 7.45068775, 0.00000000 };
Point ( 6810 ) = { 2.20816731, 7.45464791, 0.00000000 };
Point ( 6811 ) = { 2.21033615, 7.45400512, 0.00000000 };
Point ( 6812 ) = { 2.21269143, 7.45796906, 0.00000000 };
Point ( 6813 ) = { 2.21504994, 7.46193927, 0.00000000 };
Point ( 6814 ) = { 2.21722090, 7.46129449, 0.00000000 };
Point ( 6815 ) = { 2.21939068, 7.46064937, 0.00000000 };
Point ( 6816 ) = { 2.22156126, 7.46000332, 0.00000000 };
Point ( 6817 ) = { 2.22373067, 7.45935694, 0.00000000 };
Point ( 6818 ) = { 2.22590088, 7.45870963, 0.00000000 };
Point ( 6819 ) = { 2.22806990, 7.45806198, 0.00000000 };
Point ( 6820 ) = { 2.23023973, 7.45741341, 0.00000000 };
Point ( 6821 ) = { 2.23240838, 7.45676450, 0.00000000 };
Point ( 6822 ) = { 2.23457784, 7.45611466, 0.00000000 };
Point ( 6823 ) = { 2.23437606, 7.45150115, 0.00000000 };
Point ( 6824 ) = { 2.23417504, 7.44689467, 0.00000000 };
Point ( 6825 ) = { 2.23634162, 7.44624432, 0.00000000 };
Point ( 6826 ) = { 2.23850702, 7.44559364, 0.00000000 };
Point ( 6827 ) = { 2.24067322, 7.44494203, 0.00000000 };
Point ( 6828 ) = { 2.24283924, 7.44428979, 0.00000000 };
Point ( 6829 ) = { 2.24500407, 7.44363722, 0.00000000 };
Point ( 6830 ) = { 2.24479701, 7.43903593, 0.00000000 };
Point ( 6831 ) = { 2.24458952, 7.43443774, 0.00000000 };
Point ( 6832 ) = { 2.24675149, 7.43378466, 0.00000000 };
Point ( 6833 ) = { 2.24891426, 7.43313065, 0.00000000 };
Point ( 6834 ) = { 2.25107584, 7.43247631, 0.00000000 };
Point ( 6835 ) = { 2.25323823, 7.43182105, 0.00000000 };
Point ( 6836 ) = { 2.25539943, 7.43116545, 0.00000000 };
Point ( 6837 ) = { 2.25518543, 7.42657261, 0.00000000 };
Point ( 6838 ) = { 2.25497220, 7.42198674, 0.00000000 };
Point ( 6839 ) = { 2.25713055, 7.42133064, 0.00000000 };
Point ( 6840 ) = { 2.25928969, 7.42067361, 0.00000000 };
Point ( 6841 ) = { 2.26144765, 7.42001626, 0.00000000 };
Point ( 6842 ) = { 2.26360641, 7.41935798, 0.00000000 };
Point ( 6843 ) = { 2.26576399, 7.41869937, 0.00000000 };
Point ( 6844 ) = { 2.26792237, 7.41803983, 0.00000000 };
Point ( 6845 ) = { 2.27008056, 7.41737966, 0.00000000 };
Point ( 6846 ) = { 2.27223756, 7.41671917, 0.00000000 };
Point ( 6847 ) = { 2.27439536, 7.41605775, 0.00000000 };
Point ( 6848 ) = { 2.27416982, 7.41147763, 0.00000000 };
Point ( 6849 ) = { 2.27394386, 7.40690057, 0.00000000 };
Point ( 6850 ) = { 2.27609880, 7.40623865, 0.00000000 };
Point ( 6851 ) = { 2.27825257, 7.40557641, 0.00000000 };
Point ( 6852 ) = { 2.28040713, 7.40491324, 0.00000000 };
Point ( 6853 ) = { 2.28256051, 7.40424974, 0.00000000 };
Point ( 6854 ) = { 2.28471468, 7.40358532, 0.00000000 };
Point ( 6855 ) = { 2.28686767, 7.40292057, 0.00000000 };
Point ( 6856 ) = { 2.28902146, 7.40225489, 0.00000000 };
Point ( 6857 ) = { 2.29117406, 7.40158889, 0.00000000 };
Point ( 6858 ) = { 2.29332746, 7.40092196, 0.00000000 };
Point ( 6859 ) = { 2.29547968, 7.40025471, 0.00000000 };
Point ( 6860 ) = { 2.29763269, 7.39958653, 0.00000000 };
Point ( 6861 ) = { 2.29978550, 7.39891772, 0.00000000 };
Point ( 6862 ) = { 2.30193714, 7.39824859, 0.00000000 };
Point ( 6863 ) = { 2.30408956, 7.39757852, 0.00000000 };
Point ( 6864 ) = { 2.30624081, 7.39690814, 0.00000000 };
Point ( 6865 ) = { 2.30839285, 7.39623683, 0.00000000 };
Point ( 6866 ) = { 2.31054370, 7.39556519, 0.00000000 };
Point ( 6867 ) = { 2.31269535, 7.39489263, 0.00000000 };
Point ( 6868 ) = { 2.31484581, 7.39421974, 0.00000000 };
Point ( 6869 ) = { 2.31699706, 7.39354593, 0.00000000 };
Point ( 6870 ) = { 2.31940105, 7.39744738, 0.00000000 };
Point ( 6871 ) = { 2.32180711, 7.40135113, 0.00000000 };
Point ( 6872 ) = { 2.32396043, 7.40067529, 0.00000000 };
Point ( 6873 ) = { 2.32611258, 7.39999913, 0.00000000 };
Point ( 6874 ) = { 2.32826551, 7.39932203, 0.00000000 };
Point ( 6875 ) = { 2.33041726, 7.39864462, 0.00000000 };
Point ( 6876 ) = { 2.33256980, 7.39796627, 0.00000000 };
Point ( 6877 ) = { 2.33472215, 7.39728729, 0.00000000 };
Point ( 6878 ) = { 2.33687331, 7.39660800, 0.00000000 };
Point ( 6879 ) = { 2.33902525, 7.39592778, 0.00000000 };
Point ( 6880 ) = { 2.34117602, 7.39524723, 0.00000000 };
Point ( 6881 ) = { 2.34332757, 7.39456576, 0.00000000 };
Point ( 6882 ) = { 2.34547794, 7.39388396, 0.00000000 };
Point ( 6883 ) = { 2.34762909, 7.39320123, 0.00000000 };
Point ( 6884 ) = { 2.34977906, 7.39251819, 0.00000000 };
Point ( 6885 ) = { 2.35192982, 7.39183421, 0.00000000 };
Point ( 6886 ) = { 2.35165632, 7.38725670, 0.00000000 };
Point ( 6887 ) = { 2.35138244, 7.38268226, 0.00000000 };
Point ( 6888 ) = { 2.35353034, 7.38199781, 0.00000000 };
Point ( 6889 ) = { 2.35567705, 7.38131305, 0.00000000 };
Point ( 6890 ) = { 2.35782455, 7.38062735, 0.00000000 };
Point ( 6891 ) = { 2.35997086, 7.37994135, 0.00000000 };
Point ( 6892 ) = { 2.36211796, 7.37925440, 0.00000000 };
Point ( 6893 ) = { 2.36426485, 7.37856683, 0.00000000 };
Point ( 6894 ) = { 2.36641057, 7.37787895, 0.00000000 };
Point ( 6895 ) = { 2.36855706, 7.37719013, 0.00000000 };
Point ( 6896 ) = { 2.37070238, 7.37650100, 0.00000000 };
Point ( 6897 ) = { 2.37284847, 7.37581093, 0.00000000 };
Point ( 6898 ) = { 2.37499338, 7.37512055, 0.00000000 };
Point ( 6899 ) = { 2.37470562, 7.37055186, 0.00000000 };
Point ( 6900 ) = { 2.37441811, 7.36598816, 0.00000000 };
Point ( 6901 ) = { 2.37656016, 7.36529733, 0.00000000 };
Point ( 6902 ) = { 2.37870300, 7.36460555, 0.00000000 };
Point ( 6903 ) = { 2.38084465, 7.36391348, 0.00000000 };
Point ( 6904 ) = { 2.38298708, 7.36322046, 0.00000000 };
Point ( 6905 ) = { 2.38512833, 7.36252713, 0.00000000 };
Point ( 6906 ) = { 2.38727036, 7.36183287, 0.00000000 };
Point ( 6907 ) = { 2.38941121, 7.36113830, 0.00000000 };
Point ( 6908 ) = { 2.39155283, 7.36044278, 0.00000000 };
Point ( 6909 ) = { 2.39369426, 7.35974665, 0.00000000 };
Point ( 6910 ) = { 2.39583450, 7.35905021, 0.00000000 };
Point ( 6911 ) = { 2.39797551, 7.35835283, 0.00000000 };
Point ( 6912 ) = { 2.40011535, 7.35765515, 0.00000000 };
Point ( 6913 ) = { 2.39981218, 7.35309746, 0.00000000 };
Point ( 6914 ) = { 2.39950990, 7.34854668, 0.00000000 };
Point ( 6915 ) = { 2.40164689, 7.34784855, 0.00000000 };
Point ( 6916 ) = { 2.40378464, 7.34714948, 0.00000000 };
Point ( 6917 ) = { 2.40592122, 7.34645011, 0.00000000 };
Point ( 6918 ) = { 2.40805857, 7.34574979, 0.00000000 };
Point ( 6919 ) = { 2.41019474, 7.34504918, 0.00000000 };
Point ( 6920 ) = { 2.41233168, 7.34434762, 0.00000000 };
Point ( 6921 ) = { 2.41446744, 7.34364576, 0.00000000 };
Point ( 6922 ) = { 2.41660398, 7.34294296, 0.00000000 };
Point ( 6923 ) = { 2.41873933, 7.34223986, 0.00000000 };
Point ( 6924 ) = { 2.42087545, 7.34153582, 0.00000000 };
Point ( 6925 ) = { 2.42301137, 7.34083115, 0.00000000 };
Point ( 6926 ) = { 2.42269434, 7.33628648, 0.00000000 };
Point ( 6927 ) = { 2.42237759, 7.33174677, 0.00000000 };
Point ( 6928 ) = { 2.42451066, 7.33104167, 0.00000000 };
Point ( 6929 ) = { 2.42664255, 7.33033627, 0.00000000 };
Point ( 6930 ) = { 2.42877521, 7.32962992, 0.00000000 };
Point ( 6931 ) = { 2.43090669, 7.32892328, 0.00000000 };
Point ( 6932 ) = { 2.43303894, 7.32821570, 0.00000000 };
Point ( 6933 ) = { 2.43517001, 7.32750782, 0.00000000 };
Point ( 6934 ) = { 2.43730184, 7.32679900, 0.00000000 };
Point ( 6935 ) = { 2.43943250, 7.32608988, 0.00000000 };
Point ( 6936 ) = { 2.44156393, 7.32537982, 0.00000000 };
Point ( 6937 ) = { 2.44369417, 7.32466946, 0.00000000 };
Point ( 6938 ) = { 2.44336500, 7.32013547, 0.00000000 };
Point ( 6939 ) = { 2.44303549, 7.31560450, 0.00000000 };
Point ( 6940 ) = { 2.44516289, 7.31489372, 0.00000000 };
Point ( 6941 ) = { 2.44729106, 7.31418198, 0.00000000 };
Point ( 6942 ) = { 2.44941902, 7.31346963, 0.00000000 };
Point ( 6943 ) = { 2.45154580, 7.31275699, 0.00000000 };
Point ( 6944 ) = { 2.45367334, 7.31204340, 0.00000000 };
Point ( 6945 ) = { 2.45579971, 7.31132953, 0.00000000 };
Point ( 6946 ) = { 2.45792684, 7.31061470, 0.00000000 };
Point ( 6947 ) = { 2.46005279, 7.30989958, 0.00000000 };
Point ( 6948 ) = { 2.46217950, 7.30918352, 0.00000000 };
Point ( 6949 ) = { 2.46430503, 7.30846717, 0.00000000 };
Point ( 6950 ) = { 2.46643133, 7.30774987, 0.00000000 };
Point ( 6951 ) = { 2.46855644, 7.30703228, 0.00000000 };
Point ( 6952 ) = { 2.47068232, 7.30631374, 0.00000000 };
Point ( 6953 ) = { 2.47280702, 7.30559492, 0.00000000 };
Point ( 6954 ) = { 2.47493248, 7.30487514, 0.00000000 };
Point ( 6955 ) = { 2.47705676, 7.30415508, 0.00000000 };
Point ( 6956 ) = { 2.47918180, 7.30343407, 0.00000000 };
Point ( 6957 ) = { 2.48130663, 7.30271244, 0.00000000 };
Point ( 6958 ) = { 2.48343028, 7.30199053, 0.00000000 };
Point ( 6959 ) = { 2.48555469, 7.30126766, 0.00000000 };
Point ( 6960 ) = { 2.48767792, 7.30054451, 0.00000000 };
Point ( 6961 ) = { 2.48980191, 7.29982041, 0.00000000 };
Point ( 6962 ) = { 2.49228502, 7.30362452, 0.00000000 };
Point ( 6963 ) = { 2.49477024, 7.30743083, 0.00000000 };
Point ( 6964 ) = { 2.49689623, 7.30670466, 0.00000000 };
Point ( 6965 ) = { 2.49902104, 7.30597822, 0.00000000 };
Point ( 6966 ) = { 2.50114661, 7.30525082, 0.00000000 };
Point ( 6967 ) = { 2.50327100, 7.30452313, 0.00000000 };
Point ( 6968 ) = { 2.50539615, 7.30379449, 0.00000000 };
Point ( 6969 ) = { 2.50752011, 7.30306557, 0.00000000 };
Point ( 6970 ) = { 2.50964483, 7.30233570, 0.00000000 };
Point ( 6971 ) = { 2.51176837, 7.30160554, 0.00000000 };
Point ( 6972 ) = { 2.51389267, 7.30087443, 0.00000000 };
Point ( 6973 ) = { 2.51351999, 7.29634381, 0.00000000 };
Point ( 6974 ) = { 2.51314700, 7.29181622, 0.00000000 };
Point ( 6975 ) = { 2.51526748, 7.29108504, 0.00000000 };
Point ( 6976 ) = { 2.51738872, 7.29035292, 0.00000000 };
Point ( 6977 ) = { 2.51950877, 7.28962051, 0.00000000 };
Point ( 6978 ) = { 2.52162959, 7.28888715, 0.00000000 };
Point ( 6979 ) = { 2.52374921, 7.28815351, 0.00000000 };
Point ( 6980 ) = { 2.52586960, 7.28741891, 0.00000000 };
Point ( 6981 ) = { 2.52798880, 7.28668404, 0.00000000 };
Point ( 6982 ) = { 2.53010875, 7.28594821, 0.00000000 };
Point ( 6983 ) = { 2.52972510, 7.28142660, 0.00000000 };
Point ( 6984 ) = { 2.52934181, 7.27690990, 0.00000000 };
Point ( 6985 ) = { 2.53145892, 7.27617368, 0.00000000 };
Point ( 6986 ) = { 2.53357485, 7.27543718, 0.00000000 };
Point ( 6987 ) = { 2.53569153, 7.27469973, 0.00000000 };
Point ( 6988 ) = { 2.53780703, 7.27396200, 0.00000000 };
Point ( 6989 ) = { 2.53741933, 7.26945050, 0.00000000 };
Point ( 6990 ) = { 2.53703265, 7.26494579, 0.00000000 };
Point ( 6991 ) = { 2.53914628, 7.26420733, 0.00000000 };
Point ( 6992 ) = { 2.54125873, 7.26346860, 0.00000000 };
Point ( 6993 ) = { 2.54337193, 7.26272891, 0.00000000 };
Point ( 6994 ) = { 2.54298119, 7.25822960, 0.00000000 };
Point ( 6995 ) = { 2.54259016, 7.25373329, 0.00000000 };
Point ( 6996 ) = { 2.54470053, 7.25299322, 0.00000000 };
Point ( 6997 ) = { 2.54680972, 7.25225287, 0.00000000 };
Point ( 6998 ) = { 2.54891965, 7.25151157, 0.00000000 };
Point ( 6999 ) = { 2.54852507, 7.24702047, 0.00000000 };
Point ( 7000 ) = { 2.54813151, 7.24253614, 0.00000000 };
Point ( 7001 ) = { 2.55023862, 7.24179445, 0.00000000 };
Point ( 7002 ) = { 2.55234455, 7.24105249, 0.00000000 };
Point ( 7003 ) = { 2.55445123, 7.24030958, 0.00000000 };
Point ( 7004 ) = { 2.55655672, 7.23956639, 0.00000000 };
Point ( 7005 ) = { 2.55866297, 7.23882226, 0.00000000 };
Point ( 7006 ) = { 2.55826326, 7.23434335, 0.00000000 };
Point ( 7007 ) = { 2.55786326, 7.22986742, 0.00000000 };
Point ( 7008 ) = { 2.55996668, 7.22912290, 0.00000000 };
Point ( 7009 ) = { 2.56206989, 7.22837777, 0.00000000 };
Point ( 7010 ) = { 2.56417192, 7.22763237, 0.00000000 };
Point ( 7011 ) = { 2.56627469, 7.22688602, 0.00000000 };
Point ( 7012 ) = { 2.56837629, 7.22613940, 0.00000000 };
Point ( 7013 ) = { 2.57047863, 7.22539182, 0.00000000 };
Point ( 7014 ) = { 2.57298890, 7.22911909, 0.00000000 };
Point ( 7015 ) = { 2.57550127, 7.23284847, 0.00000000 };
Point ( 7016 ) = { 2.57760556, 7.23209882, 0.00000000 };
Point ( 7017 ) = { 2.57970867, 7.23134891, 0.00000000 };
Point ( 7018 ) = { 2.58181253, 7.23059803, 0.00000000 };
Point ( 7019 ) = { 2.58433093, 7.23432923, 0.00000000 };
Point ( 7020 ) = { 2.58685279, 7.23806632, 0.00000000 };
Point ( 7021 ) = { 2.58937791, 7.24180726, 0.00000000 };
Point ( 7022 ) = { 2.59190516, 7.24555033, 0.00000000 };
Point ( 7023 ) = { 2.59401218, 7.24479626, 0.00000000 };
Point ( 7024 ) = { 2.59611994, 7.24404122, 0.00000000 };
Point ( 7025 ) = { 2.59865168, 7.24778703, 0.00000000 };
Point ( 7026 ) = { 2.60118689, 7.25153877, 0.00000000 };
Point ( 7027 ) = { 2.60329662, 7.25078164, 0.00000000 };
Point ( 7028 ) = { 2.60540612, 7.25002391, 0.00000000 };
Point ( 7029 ) = { 2.60751444, 7.24926590, 0.00000000 };
Point ( 7030 ) = { 2.60962351, 7.24850694, 0.00000000 };
Point ( 7031 ) = { 2.61173139, 7.24774771, 0.00000000 };
Point ( 7032 ) = { 2.61384001, 7.24698752, 0.00000000 };
Point ( 7033 ) = { 2.61594745, 7.24622706, 0.00000000 };
Point ( 7034 ) = { 2.61849360, 7.24997749, 0.00000000 };
Point ( 7035 ) = { 2.62104257, 7.25373197, 0.00000000 };
Point ( 7036 ) = { 2.62315196, 7.25296942, 0.00000000 };
Point ( 7037 ) = { 2.62526211, 7.25220591, 0.00000000 };
Point ( 7038 ) = { 2.62737106, 7.25144213, 0.00000000 };
Point ( 7039 ) = { 2.62948076, 7.25067739, 0.00000000 };
Point ( 7040 ) = { 2.63158927, 7.24991238, 0.00000000 };
Point ( 7041 ) = { 2.63369852, 7.24914641, 0.00000000 };
Point ( 7042 ) = { 2.63580659, 7.24838018, 0.00000000 };
Point ( 7043 ) = { 2.63791540, 7.24761299, 0.00000000 };
Point ( 7044 ) = { 2.64002398, 7.24684518, 0.00000000 };
Point ( 7045 ) = { 2.64213138, 7.24607711, 0.00000000 };
Point ( 7046 ) = { 2.64423951, 7.24530807, 0.00000000 };
Point ( 7047 ) = { 2.64634646, 7.24453877, 0.00000000 };
Point ( 7048 ) = { 2.64845415, 7.24376851, 0.00000000 };
Point ( 7049 ) = { 2.65056065, 7.24299799, 0.00000000 };
Point ( 7050 ) = { 2.65266789, 7.24222650, 0.00000000 };
Point ( 7051 ) = { 2.65477394, 7.24145475, 0.00000000 };
Point ( 7052 ) = { 2.65688073, 7.24068204, 0.00000000 };
Point ( 7053 ) = { 2.65898634, 7.23990907, 0.00000000 };
Point ( 7054 ) = { 2.65852300, 7.23539479, 0.00000000 };
Point ( 7055 ) = { 2.65806011, 7.23088543, 0.00000000 };
Point ( 7056 ) = { 2.66016286, 7.23011212, 0.00000000 };
Point ( 7057 ) = { 2.66226635, 7.22933784, 0.00000000 };
Point ( 7058 ) = { 2.66436865, 7.22856330, 0.00000000 };
Point ( 7059 ) = { 2.66647169, 7.22778779, 0.00000000 };
Point ( 7060 ) = { 2.66857451, 7.22701168, 0.00000000 };
Point ( 7061 ) = { 2.67067613, 7.22623530, 0.00000000 };
Point ( 7062 ) = { 2.67277850, 7.22545796, 0.00000000 };
Point ( 7063 ) = { 2.67487967, 7.22468037, 0.00000000 };
Point ( 7064 ) = { 2.67698158, 7.22390181, 0.00000000 };
Point ( 7065 ) = { 2.67908230, 7.22312299, 0.00000000 };
Point ( 7066 ) = { 2.68118376, 7.22234320, 0.00000000 };
Point ( 7067 ) = { 2.68328403, 7.22156316, 0.00000000 };
Point ( 7068 ) = { 2.68538503, 7.22078215, 0.00000000 };
Point ( 7069 ) = { 2.68748484, 7.22000089, 0.00000000 };
Point ( 7070 ) = { 2.68700405, 7.21549836, 0.00000000 };
Point ( 7071 ) = { 2.68652442, 7.21100260, 0.00000000 };
Point ( 7072 ) = { 2.68862139, 7.21022101, 0.00000000 };
Point ( 7073 ) = { 2.69071910, 7.20943845, 0.00000000 };
Point ( 7074 ) = { 2.69281561, 7.20865564, 0.00000000 };
Point ( 7075 ) = { 2.69491286, 7.20787185, 0.00000000 };
Point ( 7076 ) = { 2.69700988, 7.20708746, 0.00000000 };
Point ( 7077 ) = { 2.69910571, 7.20630282, 0.00000000 };
Point ( 7078 ) = { 2.70120227, 7.20551721, 0.00000000 };
Point ( 7079 ) = { 2.70329764, 7.20473135, 0.00000000 };
Point ( 7080 ) = { 2.70539375, 7.20394452, 0.00000000 };
Point ( 7081 ) = { 2.70748866, 7.20315744, 0.00000000 };
Point ( 7082 ) = { 2.70699643, 7.19866798, 0.00000000 };
Point ( 7083 ) = { 2.70650397, 7.19418151, 0.00000000 };
Point ( 7084 ) = { 2.70859605, 7.19339411, 0.00000000 };
Point ( 7085 ) = { 2.71068885, 7.19260574, 0.00000000 };
Point ( 7086 ) = { 2.71278047, 7.19181712, 0.00000000 };
Point ( 7087 ) = { 2.71487282, 7.19102753, 0.00000000 };
Point ( 7088 ) = { 2.71696398, 7.19023770, 0.00000000 };
Point ( 7089 ) = { 2.71905587, 7.18944689, 0.00000000 };
Point ( 7090 ) = { 2.72114657, 7.18865584, 0.00000000 };
Point ( 7091 ) = { 2.72323799, 7.18786381, 0.00000000 };
Point ( 7092 ) = { 2.72532919, 7.18707118, 0.00000000 };
Point ( 7093 ) = { 2.72792519, 7.19076314, 0.00000000 };
Point ( 7094 ) = { 2.73052334, 7.19445719, 0.00000000 };
Point ( 7095 ) = { 2.73261646, 7.19366244, 0.00000000 };
Point ( 7096 ) = { 2.73470838, 7.19286744, 0.00000000 };
Point ( 7097 ) = { 2.73680103, 7.19207147, 0.00000000 };
Point ( 7098 ) = { 2.73889250, 7.19127526, 0.00000000 };
Point ( 7099 ) = { 2.74098468, 7.19047807, 0.00000000 };
Point ( 7100 ) = { 2.74307568, 7.18968065, 0.00000000 };
Point ( 7101 ) = { 2.74516741, 7.18888224, 0.00000000 };
Point ( 7102 ) = { 2.74725794, 7.18808360, 0.00000000 };
Point ( 7103 ) = { 2.74934920, 7.18728398, 0.00000000 };
Point ( 7104 ) = { 2.75143927, 7.18648411, 0.00000000 };
Point ( 7105 ) = { 2.75353006, 7.18568328, 0.00000000 };
Point ( 7106 ) = { 2.75561967, 7.18488220, 0.00000000 };
Point ( 7107 ) = { 2.75770999, 7.18408015, 0.00000000 };
Point ( 7108 ) = { 2.75980009, 7.18327749, 0.00000000 };
Point ( 7109 ) = { 2.76188899, 7.18247459, 0.00000000 };
Point ( 7110 ) = { 2.76397862, 7.18167071, 0.00000000 };
Point ( 7111 ) = { 2.76606705, 7.18086659, 0.00000000 };
Point ( 7112 ) = { 2.76815621, 7.18006150, 0.00000000 };
Point ( 7113 ) = { 2.77024418, 7.17925617, 0.00000000 };
Point ( 7114 ) = { 2.77233287, 7.17844986, 0.00000000 };
Point ( 7115 ) = { 2.77442037, 7.17764332, 0.00000000 };
Point ( 7116 ) = { 2.77650859, 7.17683579, 0.00000000 };
Point ( 7117 ) = { 2.77859562, 7.17602803, 0.00000000 };
Point ( 7118 ) = { 2.78068337, 7.17521930, 0.00000000 };
Point ( 7119 ) = { 2.78276993, 7.17441032, 0.00000000 };
Point ( 7120 ) = { 2.78539826, 7.17808915, 0.00000000 };
Point ( 7121 ) = { 2.78803022, 7.18177382, 0.00000000 };
Point ( 7122 ) = { 2.79011868, 7.18096271, 0.00000000 };
Point ( 7123 ) = { 2.79275463, 7.18465058, 0.00000000 };
Point ( 7124 ) = { 2.79539349, 7.18834243, 0.00000000 };
Point ( 7125 ) = { 2.79748482, 7.18752880, 0.00000000 };
Point ( 7126 ) = { 2.79957496, 7.18671494, 0.00000000 };
Point ( 7127 ) = { 2.80166582, 7.18590010, 0.00000000 };
Point ( 7128 ) = { 2.80375548, 7.18508503, 0.00000000 };
Point ( 7129 ) = { 2.80584587, 7.18426897, 0.00000000 };
Point ( 7130 ) = { 2.80793506, 7.18345268, 0.00000000 };
Point ( 7131 ) = { 2.81002497, 7.18263540, 0.00000000 };
Point ( 7132 ) = { 2.81211368, 7.18181789, 0.00000000 };
Point ( 7133 ) = { 2.81420311, 7.18099941, 0.00000000 };
Point ( 7134 ) = { 2.81629135, 7.18018068, 0.00000000 };
Point ( 7135 ) = { 2.81572965, 7.17567759, 0.00000000 };
Point ( 7136 ) = { 2.81516849, 7.17117940, 0.00000000 };
Point ( 7137 ) = { 2.81725388, 7.17036040, 0.00000000 };
Point ( 7138 ) = { 2.81669197, 7.16586727, 0.00000000 };
Point ( 7139 ) = { 2.81613134, 7.16138089, 0.00000000 };
Point ( 7140 ) = { 2.81557078, 7.15689957, 0.00000000 };
Point ( 7141 ) = { 2.81501004, 7.15242126, 0.00000000 };
Point ( 7142 ) = { 2.81445032, 7.14794762, 0.00000000 };
Point ( 7143 ) = { 2.81125676, 7.13983684, 0.00000000 };
Point ( 7144 ) = { 2.80862381, 7.13619504, 0.00000000 };
Point ( 7145 ) = { 2.80654837, 7.13701153, 0.00000000 };
Point ( 7146 ) = { 2.80391937, 7.13337287, 0.00000000 };
Point ( 7147 ) = { 2.80129400, 7.12973996, 0.00000000 };
Point ( 7148 ) = { 2.79867198, 7.12611074, 0.00000000 };
Point ( 7149 ) = { 2.79605211, 7.12248356, 0.00000000 };
Point ( 7150 ) = { 2.79397970, 7.12329677, 0.00000000 };
Point ( 7151 ) = { 2.79136377, 7.11967270, 0.00000000 };
Point ( 7152 ) = { 2.78875142, 7.11605435, 0.00000000 };
Point ( 7153 ) = { 2.78614147, 7.11244004, 0.00000000 };
Point ( 7154 ) = { 2.78353365, 7.10882775, 0.00000000 };
Point ( 7155 ) = { 2.78146616, 7.10963695, 0.00000000 };
Point ( 7156 ) = { 2.77886225, 7.10602775, 0.00000000 };
Point ( 7157 ) = { 2.77626190, 7.10242424, 0.00000000 };
Point ( 7158 ) = { 2.77366487, 7.09882437, 0.00000000 };
Point ( 7159 ) = { 2.77106997, 7.09522650, 0.00000000 };
Point ( 7160 ) = { 2.76900549, 7.09603245, 0.00000000 };
Point ( 7161 ) = { 2.76694172, 7.09683742, 0.00000000 };
Point ( 7162 ) = { 2.76435127, 7.09324206, 0.00000000 };
Point ( 7163 ) = { 2.76176365, 7.08965052, 0.00000000 };
Point ( 7164 ) = { 2.75970174, 7.09045339, 0.00000000 };
Point ( 7165 ) = { 2.75763865, 7.09125602, 0.00000000 };
Point ( 7166 ) = { 2.75557533, 7.09205806, 0.00000000 };
Point ( 7167 ) = { 2.75351272, 7.09285913, 0.00000000 };
Point ( 7168 ) = { 2.75144893, 7.09365996, 0.00000000 };
Point ( 7169 ) = { 2.74938586, 7.09445983, 0.00000000 };
Point ( 7170 ) = { 2.74732161, 7.09525947, 0.00000000 };
Point ( 7171 ) = { 2.74474459, 7.09166630, 0.00000000 };
Point ( 7172 ) = { 2.74217109, 7.08807878, 0.00000000 };
Point ( 7173 ) = { 2.74010869, 7.08887631, 0.00000000 };
Point ( 7174 ) = { 2.73804701, 7.08967288, 0.00000000 };
Point ( 7175 ) = { 2.73547793, 7.08608785, 0.00000000 };
Point ( 7176 ) = { 2.73291164, 7.08250662, 0.00000000 };
Point ( 7177 ) = { 2.73085181, 7.08330110, 0.00000000 };
Point ( 7178 ) = { 2.72828936, 7.07972291, 0.00000000 };
Point ( 7179 ) = { 2.72572899, 7.07614670, 0.00000000 };
Point ( 7180 ) = { 2.72367101, 7.07693909, 0.00000000 };
Point ( 7181 ) = { 2.72161186, 7.07773124, 0.00000000 };
Point ( 7182 ) = { 2.71905683, 7.07415715, 0.00000000 };
Point ( 7183 ) = { 2.71650458, 7.07058683, 0.00000000 };
Point ( 7184 ) = { 2.71444727, 7.07137690, 0.00000000 };
Point ( 7185 ) = { 2.71238974, 7.07216637, 0.00000000 };
Point ( 7186 ) = { 2.71033291, 7.07295488, 0.00000000 };
Point ( 7187 ) = { 2.70827492, 7.07374316, 0.00000000 };
Point ( 7188 ) = { 2.70621764, 7.07453047, 0.00000000 };
Point ( 7189 ) = { 2.70415919, 7.07531755, 0.00000000 };
Point ( 7190 ) = { 2.70210145, 7.07610366, 0.00000000 };
Point ( 7191 ) = { 2.69955877, 7.07253212, 0.00000000 };
Point ( 7192 ) = { 2.69701954, 7.06896616, 0.00000000 };
Point ( 7193 ) = { 2.69496365, 7.06975020, 0.00000000 };
Point ( 7194 ) = { 2.69290659, 7.07053400, 0.00000000 };
Point ( 7195 ) = { 2.69085024, 7.07131685, 0.00000000 };
Point ( 7196 ) = { 2.68831687, 7.06775244, 0.00000000 };
Point ( 7197 ) = { 2.68578557, 7.06418999, 0.00000000 };
Point ( 7198 ) = { 2.68373107, 7.06497076, 0.00000000 };
Point ( 7199 ) = { 2.68120354, 7.06141133, 0.00000000 };
Point ( 7200 ) = { 2.67867943, 7.05785745, 0.00000000 };
Point ( 7201 ) = { 2.67615853, 7.05430714, 0.00000000 };
Point ( 7202 ) = { 2.67363968, 7.05075876, 0.00000000 };
Point ( 7203 ) = { 2.67158814, 7.05153636, 0.00000000 };
Point ( 7204 ) = { 2.66907257, 7.04799117, 0.00000000 };
Point ( 7205 ) = { 2.66656040, 7.04445149, 0.00000000 };
Point ( 7206 ) = { 2.66451164, 7.04522668, 0.00000000 };
Point ( 7207 ) = { 2.66200321, 7.04169000, 0.00000000 };
Point ( 7208 ) = { 2.65949682, 7.03815523, 0.00000000 };
Point ( 7209 ) = { 2.65744989, 7.03892836, 0.00000000 };
Point ( 7210 ) = { 2.65540180, 7.03970125, 0.00000000 };
Point ( 7211 ) = { 2.65335442, 7.04047319, 0.00000000 };
Point ( 7212 ) = { 2.65130588, 7.04124489, 0.00000000 };
Point ( 7213 ) = { 2.64880676, 7.03771075, 0.00000000 };
Point ( 7214 ) = { 2.64631102, 7.03418210, 0.00000000 };
Point ( 7215 ) = { 2.64426431, 7.03495175, 0.00000000 };
Point ( 7216 ) = { 2.64221831, 7.03572045, 0.00000000 };
Point ( 7217 ) = { 2.64017115, 7.03648891, 0.00000000 };
Point ( 7218 ) = { 2.63812471, 7.03725642, 0.00000000 };
Point ( 7219 ) = { 2.63607711, 7.03802368, 0.00000000 };
Point ( 7220 ) = { 2.63403022, 7.03879000, 0.00000000 };
Point ( 7221 ) = { 2.63198217, 7.03955608, 0.00000000 };
Point ( 7222 ) = { 2.62993389, 7.04032156, 0.00000000 };
Point ( 7223 ) = { 2.62788634, 7.04108609, 0.00000000 };
Point ( 7224 ) = { 2.62540205, 7.03755480, 0.00000000 };
Point ( 7225 ) = { 2.62291977, 7.03402543, 0.00000000 };
Point ( 7226 ) = { 2.62087405, 7.03478792, 0.00000000 };
Point ( 7227 ) = { 2.61882716, 7.03555017, 0.00000000 };
Point ( 7228 ) = { 2.61678099, 7.03631147, 0.00000000 };
Point ( 7229 ) = { 2.61473367, 7.03707253, 0.00000000 };
Point ( 7230 ) = { 2.61268705, 7.03783264, 0.00000000 };
Point ( 7231 ) = { 2.61063928, 7.03859250, 0.00000000 };
Point ( 7232 ) = { 2.60816630, 7.03506233, 0.00000000 };
Point ( 7233 ) = { 2.60569665, 7.03153764, 0.00000000 };
Point ( 7234 ) = { 2.60365071, 7.03229547, 0.00000000 };
Point ( 7235 ) = { 2.60160549, 7.03305236, 0.00000000 };
Point ( 7236 ) = { 2.59955911, 7.03380900, 0.00000000 };
Point ( 7237 ) = { 2.59751345, 7.03456470, 0.00000000 };
Point ( 7238 ) = { 2.59505008, 7.03104100, 0.00000000 };
Point ( 7239 ) = { 2.59258871, 7.02751919, 0.00000000 };
Point ( 7240 ) = { 2.59012997, 7.02400107, 0.00000000 };
Point ( 7241 ) = { 2.58726191, 7.01622337, 0.00000000 };
Point ( 7242 ) = { 2.58440140, 7.00846612, 0.00000000 };
Point ( 7243 ) = { 2.58154709, 7.00072570, 0.00000000 };
Point ( 7244 ) = { 2.57869766, 6.99299853, 0.00000000 };
Point ( 7245 ) = { 2.57625849, 6.98951608, 0.00000000 };
Point ( 7246 ) = { 2.57382239, 6.98603708, 0.00000000 };
Point ( 7247 ) = { 2.57138954, 6.98256345, 0.00000000 };
Point ( 7248 ) = { 2.56895882, 6.97909359, 0.00000000 };
Point ( 7249 ) = { 2.56653005, 6.97562556, 0.00000000 };
Point ( 7250 ) = { 2.56410434, 6.97216097, 0.00000000 };
Point ( 7251 ) = { 2.56168185, 6.96870171, 0.00000000 };
Point ( 7252 ) = { 2.55926148, 6.96524620, 0.00000000 };
Point ( 7253 ) = { 2.55684305, 6.96179251, 0.00000000 };
Point ( 7254 ) = { 2.55481833, 6.96253579, 0.00000000 };
Point ( 7255 ) = { 2.55279247, 6.96327882, 0.00000000 };
Point ( 7256 ) = { 2.55076732, 6.96402092, 0.00000000 };
Point ( 7257 ) = { 2.54835447, 6.96056870, 0.00000000 };
Point ( 7258 ) = { 2.54594482, 6.95712179, 0.00000000 };
Point ( 7259 ) = { 2.54392147, 6.95786190, 0.00000000 };
Point ( 7260 ) = { 2.54189697, 6.95860176, 0.00000000 };
Point ( 7261 ) = { 2.53949235, 6.95515683, 0.00000000 };
Point ( 7262 ) = { 2.53911122, 6.95097559, 0.00000000 };
Point ( 7263 ) = { 2.53873089, 6.94679855, 0.00000000 };
Point ( 7264 ) = { 2.53835153, 6.94262759, 0.00000000 };
Point ( 7265 ) = { 2.53797204, 6.93846114, 0.00000000 };
Point ( 7266 ) = { 2.53519728, 6.93087535, 0.00000000 };
Point ( 7267 ) = { 2.53482000, 6.92672178, 0.00000000 };
Point ( 7268 ) = { 2.53444352, 6.92257236, 0.00000000 };
Point ( 7269 ) = { 2.53167845, 6.91501985, 0.00000000 };
Point ( 7270 ) = { 2.52891929, 6.90748351, 0.00000000 };
Point ( 7271 ) = { 2.52854685, 6.90335534, 0.00000000 };
Point ( 7272 ) = { 2.52817428, 6.89923160, 0.00000000 };
Point ( 7273 ) = { 2.52542598, 6.89173166, 0.00000000 };
Point ( 7274 ) = { 2.52505494, 6.88761888, 0.00000000 };
Point ( 7275 ) = { 2.52468469, 6.88351018, 0.00000000 };
Point ( 7276 ) = { 2.52194467, 6.87603955, 0.00000000 };
Point ( 7277 ) = { 2.51921173, 6.86858824, 0.00000000 };
Point ( 7278 ) = { 2.51884545, 6.86450046, 0.00000000 };
Point ( 7279 ) = { 2.51847904, 6.86041706, 0.00000000 };
Point ( 7280 ) = { 2.51811356, 6.85633956, 0.00000000 };
Point ( 7281 ) = { 2.51774886, 6.85226609, 0.00000000 };
Point ( 7282 ) = { 2.51738385, 6.84819510, 0.00000000 };
Point ( 7283 ) = { 2.51937531, 6.84746271, 0.00000000 };
Point ( 7284 ) = { 2.51900943, 6.84339601, 0.00000000 };
Point ( 7285 ) = { 2.51864449, 6.83933518, 0.00000000 };
Point ( 7286 ) = { 2.51827940, 6.83527867, 0.00000000 };
Point ( 7287 ) = { 2.51791401, 6.83122464, 0.00000000 };
Point ( 7288 ) = { 2.51990145, 6.83049176, 0.00000000 };
Point ( 7289 ) = { 2.51953565, 6.82644183, 0.00000000 };
Point ( 7290 ) = { 2.51917078, 6.82239772, 0.00000000 };
Point ( 7291 ) = { 2.52115474, 6.82166481, 0.00000000 };
Point ( 7292 ) = { 2.52078901, 6.81762494, 0.00000000 };
Point ( 7293 ) = { 2.52042297, 6.81358753, 0.00000000 };
Point ( 7294 ) = { 2.52005679, 6.80955441, 0.00000000 };
Point ( 7295 ) = { 2.51969155, 6.80552709, 0.00000000 };
Point ( 7296 ) = { 2.52167151, 6.80479370, 0.00000000 };
Point ( 7297 ) = { 2.52130541, 6.80077059, 0.00000000 };
Point ( 7298 ) = { 2.52093900, 6.79674992, 0.00000000 };
Point ( 7299 ) = { 2.52291641, 6.79601617, 0.00000000 };
Point ( 7300 ) = { 2.52254914, 6.79199971, 0.00000000 };
Point ( 7301 ) = { 2.52218219, 6.78798734, 0.00000000 };
Point ( 7302 ) = { 2.52415705, 6.78725322, 0.00000000 };
Point ( 7303 ) = { 2.52613080, 6.78651887, 0.00000000 };
Point ( 7304 ) = { 2.52576228, 6.78251063, 0.00000000 };
Point ( 7305 ) = { 2.52539469, 6.77850814, 0.00000000 };
Point ( 7306 ) = { 2.52736589, 6.77777343, 0.00000000 };
Point ( 7307 ) = { 2.52933778, 6.77703780, 0.00000000 };
Point ( 7308 ) = { 2.53130855, 6.77630194, 0.00000000 };
Point ( 7309 ) = { 2.53328001, 6.77556517, 0.00000000 };
Point ( 7310 ) = { 2.53525126, 6.77482783, 0.00000000 };
Point ( 7311 ) = { 2.53722139, 6.77409024, 0.00000000 };
Point ( 7312 ) = { 2.53919220, 6.77335175, 0.00000000 };
Point ( 7313 ) = { 2.54116190, 6.77261303, 0.00000000 };
Point ( 7314 ) = { 2.54313229, 6.77187339, 0.00000000 };
Point ( 7315 ) = { 2.54510156, 6.77113351, 0.00000000 };
Point ( 7316 ) = { 2.54707152, 6.77039273, 0.00000000 };
Point ( 7317 ) = { 2.54904035, 6.76965171, 0.00000000 };
Point ( 7318 ) = { 2.55100988, 6.76890978, 0.00000000 };
Point ( 7319 ) = { 2.55297829, 6.76816762, 0.00000000 };
Point ( 7320 ) = { 2.55494738, 6.76742454, 0.00000000 };
Point ( 7321 ) = { 2.55691535, 6.76668123, 0.00000000 };
Point ( 7322 ) = { 2.55888401, 6.76593701, 0.00000000 };
Point ( 7323 ) = { 2.56085156, 6.76519256, 0.00000000 };
Point ( 7324 ) = { 2.56320948, 6.76844758, 0.00000000 };
Point ( 7325 ) = { 2.56557049, 6.77170755, 0.00000000 };
Point ( 7326 ) = { 2.56754061, 6.77096081, 0.00000000 };
Point ( 7327 ) = { 2.56950961, 6.77021384, 0.00000000 };
Point ( 7328 ) = { 2.57147930, 6.76946595, 0.00000000 };
Point ( 7329 ) = { 2.57344787, 6.76871784, 0.00000000 };
Point ( 7330 ) = { 2.57541712, 6.76796881, 0.00000000 };
Point ( 7331 ) = { 2.57738525, 6.76721954, 0.00000000 };
Point ( 7332 ) = { 2.57935407, 6.76646937, 0.00000000 };
Point ( 7333 ) = { 2.58132177, 6.76571896, 0.00000000 };
Point ( 7334 ) = { 2.58329015, 6.76496764, 0.00000000 };
Point ( 7335 ) = { 2.58525741, 6.76421609, 0.00000000 };
Point ( 7336 ) = { 2.58722535, 6.76346362, 0.00000000 };
Point ( 7337 ) = { 2.58919217, 6.76271092, 0.00000000 };
Point ( 7338 ) = { 2.59115967, 6.76195731, 0.00000000 };
Point ( 7339 ) = { 2.59075225, 6.75795297, 0.00000000 };
Point ( 7340 ) = { 2.59034581, 6.75395437, 0.00000000 };
Point ( 7341 ) = { 2.59231076, 6.75320042, 0.00000000 };
Point ( 7342 ) = { 2.59427550, 6.75244590, 0.00000000 };
Point ( 7343 ) = { 2.59623912, 6.75169116, 0.00000000 };
Point ( 7344 ) = { 2.59820341, 6.75093549, 0.00000000 };
Point ( 7345 ) = { 2.59779268, 6.74694143, 0.00000000 };
Point ( 7346 ) = { 2.59738230, 6.74295144, 0.00000000 };
Point ( 7347 ) = { 2.59934406, 6.74219544, 0.00000000 };
Point ( 7348 ) = { 2.60130469, 6.74143922, 0.00000000 };
Point ( 7349 ) = { 2.60089280, 6.73745335, 0.00000000 };
Point ( 7350 ) = { 2.60048064, 6.73346987, 0.00000000 };
Point ( 7351 ) = { 2.60243873, 6.73271332, 0.00000000 };
Point ( 7352 ) = { 2.60439751, 6.73195586, 0.00000000 };
Point ( 7353 ) = { 2.60635517, 6.73119817, 0.00000000 };
Point ( 7354 ) = { 2.60593988, 6.72721910, 0.00000000 };
Point ( 7355 ) = { 2.60552496, 6.72324407, 0.00000000 };
Point ( 7356 ) = { 2.60748009, 6.72248605, 0.00000000 };
Point ( 7357 ) = { 2.60943588, 6.72172712, 0.00000000 };
Point ( 7358 ) = { 2.61139057, 6.72096797, 0.00000000 };
Point ( 7359 ) = { 2.61334593, 6.72020790, 0.00000000 };
Point ( 7360 ) = { 2.61292674, 6.71623739, 0.00000000 };
Point ( 7361 ) = { 2.61250856, 6.71227254, 0.00000000 };
Point ( 7362 ) = { 2.61446050, 6.71151249, 0.00000000 };
Point ( 7363 ) = { 2.61641310, 6.71075153, 0.00000000 };
Point ( 7364 ) = { 2.61836459, 6.70999035, 0.00000000 };
Point ( 7365 ) = { 2.62031676, 6.70922825, 0.00000000 };
Point ( 7366 ) = { 2.62226780, 6.70846594, 0.00000000 };
Point ( 7367 ) = { 2.62421952, 6.70770270, 0.00000000 };
Point ( 7368 ) = { 2.62617013, 6.70693925, 0.00000000 };
Point ( 7369 ) = { 2.62574425, 6.70297928, 0.00000000 };
Point ( 7370 ) = { 2.62531810, 6.69902168, 0.00000000 };
Point ( 7371 ) = { 2.62726617, 6.69825791, 0.00000000 };
Point ( 7372 ) = { 2.62921492, 6.69749322, 0.00000000 };
Point ( 7373 ) = { 2.63116256, 6.69672832, 0.00000000 };
Point ( 7374 ) = { 2.63311086, 6.69596250, 0.00000000 };
Point ( 7375 ) = { 2.63505805, 6.69519646, 0.00000000 };
Point ( 7376 ) = { 2.63700591, 6.69442951, 0.00000000 };
Point ( 7377 ) = { 2.63895355, 6.69366199, 0.00000000 };
Point ( 7378 ) = { 2.64090007, 6.69289425, 0.00000000 };
Point ( 7379 ) = { 2.64284725, 6.69212560, 0.00000000 };
Point ( 7380 ) = { 2.64241068, 6.68817331, 0.00000000 };
Point ( 7381 ) = { 2.64197513, 6.68422665, 0.00000000 };
Point ( 7382 ) = { 2.64391979, 6.68345768, 0.00000000 };
Point ( 7383 ) = { 2.64586335, 6.68268850, 0.00000000 };
Point ( 7384 ) = { 2.64780757, 6.68191841, 0.00000000 };
Point ( 7385 ) = { 2.65019081, 6.68509424, 0.00000000 };
Point ( 7386 ) = { 2.65257716, 6.68827489, 0.00000000 };
Point ( 7387 ) = { 2.65452301, 6.68750284, 0.00000000 };
Point ( 7388 ) = { 2.65646774, 6.68673057, 0.00000000 };
Point ( 7389 ) = { 2.65841313, 6.68595739, 0.00000000 };
Point ( 7390 ) = { 2.66035741, 6.68518400, 0.00000000 };
Point ( 7391 ) = { 2.66275037, 6.68836486, 0.00000000 };
Point ( 7392 ) = { 2.66514515, 6.69154728, 0.00000000 };
Point ( 7393 ) = { 2.66709106, 6.69077192, 0.00000000 };
Point ( 7394 ) = { 2.66903763, 6.68999565, 0.00000000 };
Point ( 7395 ) = { 2.67143673, 6.69317985, 0.00000000 };
Point ( 7396 ) = { 2.67383897, 6.69636889, 0.00000000 };
Point ( 7397 ) = { 2.67578628, 6.69559101, 0.00000000 };
Point ( 7398 ) = { 2.67773425, 6.69481220, 0.00000000 };
Point ( 7399 ) = { 2.68014039, 6.69800321, 0.00000000 };
Point ( 7400 ) = { 2.68254901, 6.70119742, 0.00000000 };
Point ( 7401 ) = { 2.68449861, 6.70041665, 0.00000000 };
Point ( 7402 ) = { 2.68644710, 6.69963567, 0.00000000 };
Point ( 7403 ) = { 2.68839624, 6.69885376, 0.00000000 };
Point ( 7404 ) = { 2.69081015, 6.70204907, 0.00000000 };
Point ( 7405 ) = { 2.69369310, 6.70922969, 0.00000000 };
Point ( 7406 ) = { 2.69611293, 6.71243369, 0.00000000 };
Point ( 7407 ) = { 2.69853571, 6.71564074, 0.00000000 };
Point ( 7408 ) = { 2.70143424, 6.72285410, 0.00000000 };
Point ( 7409 ) = { 2.70433889, 6.73008268, 0.00000000 };
Point ( 7410 ) = { 2.70724834, 6.73732321, 0.00000000 };
Point ( 7411 ) = { 2.70772537, 6.74134485, 0.00000000 };
Point ( 7412 ) = { 2.70820327, 6.74537042, 0.00000000 };
Point ( 7413 ) = { 2.70868094, 6.74939846, 0.00000000 };
Point ( 7414 ) = { 2.70915858, 6.75343081, 0.00000000 };
Point ( 7415 ) = { 2.70963732, 6.75746895, 0.00000000 };
Point ( 7416 ) = { 2.70767202, 6.75825668, 0.00000000 };
Point ( 7417 ) = { 2.70815002, 6.76229911, 0.00000000 };
Point ( 7418 ) = { 2.70862777, 6.76634401, 0.00000000 };
Point ( 7419 ) = { 2.70665989, 6.76713144, 0.00000000 };
Point ( 7420 ) = { 2.70713690, 6.77118064, 0.00000000 };
Point ( 7421 ) = { 2.70761501, 6.77523568, 0.00000000 };
Point ( 7422 ) = { 2.70809400, 6.77929471, 0.00000000 };
Point ( 7423 ) = { 2.70857275, 6.78335623, 0.00000000 };
Point ( 7424 ) = { 2.70659901, 6.78414401, 0.00000000 };
Point ( 7425 ) = { 2.70707656, 6.78821003, 0.00000000 };
Point ( 7426 ) = { 2.70755521, 6.79228193, 0.00000000 };
Point ( 7427 ) = { 2.70557978, 6.79306905, 0.00000000 };
Point ( 7428 ) = { 2.70605768, 6.79714528, 0.00000000 };
Point ( 7429 ) = { 2.70653534, 6.80122403, 0.00000000 };
Point ( 7430 ) = { 2.70701388, 6.80530680, 0.00000000 };
Point ( 7431 ) = { 2.70947370, 6.80860781, 0.00000000 };
Point ( 7432 ) = { 2.71193657, 6.81191201, 0.00000000 };
Point ( 7433 ) = { 2.71440202, 6.81521958, 0.00000000 };
Point ( 7434 ) = { 2.71686961, 6.81853072, 0.00000000 };
Point ( 7435 ) = { 2.71933913, 6.82184353, 0.00000000 };
Point ( 7436 ) = { 2.72132383, 6.82105205, 0.00000000 };
Point ( 7437 ) = { 2.72330830, 6.82025999, 0.00000000 };
Point ( 7438 ) = { 2.72529164, 6.81946772, 0.00000000 };
Point ( 7439 ) = { 2.72776710, 6.82278159, 0.00000000 };
Point ( 7440 ) = { 2.73024517, 6.82609884, 0.00000000 };
Point ( 7441 ) = { 2.73223020, 6.82530455, 0.00000000 };
Point ( 7442 ) = { 2.73421591, 6.82450932, 0.00000000 };
Point ( 7443 ) = { 2.73620048, 6.82371387, 0.00000000 };
Point ( 7444 ) = { 2.73868406, 6.82703236, 0.00000000 };
Point ( 7445 ) = { 2.74117094, 6.83035595, 0.00000000 };
Point ( 7446 ) = { 2.74366000, 6.83368313, 0.00000000 };
Point ( 7447 ) = { 2.74615168, 6.83701372, 0.00000000 };
Point ( 7448 ) = { 2.74814080, 6.83621444, 0.00000000 };
Point ( 7449 ) = { 2.75063608, 6.83954773, 0.00000000 };
Point ( 7450 ) = { 2.75313332, 6.84288273, 0.00000000 };
Point ( 7451 ) = { 2.75563366, 6.84622097, 0.00000000 };
Point ( 7452 ) = { 2.75864968, 6.85371411, 0.00000000 };
Point ( 7453 ) = { 2.76167080, 6.86121993, 0.00000000 };
Point ( 7454 ) = { 2.76218578, 6.86538252, 0.00000000 };
Point ( 7455 ) = { 2.76270170, 6.86954928, 0.00000000 };
Point ( 7456 ) = { 2.76321740, 6.87371866, 0.00000000 };
Point ( 7457 ) = { 2.76121737, 6.87452233, 0.00000000 };
Point ( 7458 ) = { 2.76173233, 6.87869622, 0.00000000 };
Point ( 7459 ) = { 2.76224846, 6.88287620, 0.00000000 };
Point ( 7460 ) = { 2.76276462, 6.88706074, 0.00000000 };
Point ( 7461 ) = { 2.76328056, 6.89124793, 0.00000000 };
Point ( 7462 ) = { 2.76127635, 6.89205124, 0.00000000 };
Point ( 7463 ) = { 2.76179155, 6.89624297, 0.00000000 };
Point ( 7464 ) = { 2.76230792, 6.90044082, 0.00000000 };
Point ( 7465 ) = { 2.76282523, 6.90464289, 0.00000000 };
Point ( 7466 ) = { 2.76334233, 6.90884763, 0.00000000 };
Point ( 7467 ) = { 2.76133208, 6.90965134, 0.00000000 };
Point ( 7468 ) = { 2.76184844, 6.91386064, 0.00000000 };
Point ( 7469 ) = { 2.76236597, 6.91807611, 0.00000000 };
Point ( 7470 ) = { 2.76035304, 6.91887953, 0.00000000 };
Point ( 7471 ) = { 2.76086936, 6.92309977, 0.00000000 };
Point ( 7472 ) = { 2.76138617, 6.92732445, 0.00000000 };
Point ( 7473 ) = { 2.76190393, 6.93155339, 0.00000000 };
Point ( 7474 ) = { 2.76242147, 6.93578503, 0.00000000 };
Point ( 7475 ) = { 2.76293903, 6.94002131, 0.00000000 };
Point ( 7476 ) = { 2.76599716, 6.94770280, 0.00000000 };
Point ( 7477 ) = { 2.76854067, 6.95114890, 0.00000000 };
Point ( 7478 ) = { 2.77108645, 6.95459878, 0.00000000 };
Point ( 7479 ) = { 2.77363497, 6.95805226, 0.00000000 };
Point ( 7480 ) = { 2.77565930, 6.95724498, 0.00000000 };
Point ( 7481 ) = { 2.77821202, 6.96070114, 0.00000000 };
Point ( 7482 ) = { 2.78076678, 6.96415915, 0.00000000 };
Point ( 7483 ) = { 2.78279196, 6.96335016, 0.00000000 };
Point ( 7484 ) = { 2.78481783, 6.96254021, 0.00000000 };
Point ( 7485 ) = { 2.78684254, 6.96173005, 0.00000000 };
Point ( 7486 ) = { 2.78886794, 6.96091892, 0.00000000 };
Point ( 7487 ) = { 2.79089218, 6.96010757, 0.00000000 };
Point ( 7488 ) = { 2.79291711, 6.95929527, 0.00000000 };
Point ( 7489 ) = { 2.79494087, 6.95848275, 0.00000000 };
Point ( 7490 ) = { 2.79696533, 6.95766926, 0.00000000 };
Point ( 7491 ) = { 2.79898862, 6.95685556, 0.00000000 };
Point ( 7492 ) = { 2.80101260, 6.95604090, 0.00000000 };
Point ( 7493 ) = { 2.80303542, 6.95522602, 0.00000000 };
Point ( 7494 ) = { 2.80505892, 6.95441019, 0.00000000 };
Point ( 7495 ) = { 2.80708127, 6.95359413, 0.00000000 };
Point ( 7496 ) = { 2.80910430, 6.95277712, 0.00000000 };
Point ( 7497 ) = { 2.81112709, 6.95195951, 0.00000000 };
Point ( 7498 ) = { 2.81314872, 6.95114170, 0.00000000 };
Point ( 7499 ) = { 2.81517104, 6.95032291, 0.00000000 };
Point ( 7500 ) = { 2.81719219, 6.94950392, 0.00000000 };
Point ( 7501 ) = { 2.81921404, 6.94868396, 0.00000000 };
Point ( 7502 ) = { 2.82123471, 6.94786379, 0.00000000 };
Point ( 7503 ) = { 2.82381232, 6.95131048, 0.00000000 };
Point ( 7504 ) = { 2.82639342, 6.95476255, 0.00000000 };
Point ( 7505 ) = { 2.82841586, 6.95394029, 0.00000000 };
Point ( 7506 ) = { 2.83043899, 6.95311707, 0.00000000 };
Point ( 7507 ) = { 2.83302442, 6.95657144, 0.00000000 };
Point ( 7508 ) = { 2.83561191, 6.96002766, 0.00000000 };
Point ( 7509 ) = { 2.83763681, 6.95920234, 0.00000000 };
Point ( 7510 ) = { 2.83966055, 6.95837681, 0.00000000 };
Point ( 7511 ) = { 2.84225330, 6.96183496, 0.00000000 };
Point ( 7512 ) = { 2.84484957, 6.96529851, 0.00000000 };
Point ( 7513 ) = { 2.84687508, 6.96447088, 0.00000000 };
Point ( 7514 ) = { 2.84890128, 6.96364229, 0.00000000 };
Point ( 7515 ) = { 2.85092723, 6.96281310, 0.00000000 };
Point ( 7516 ) = { 2.85295202, 6.96198371, 0.00000000 };
Point ( 7517 ) = { 2.85497749, 6.96115335, 0.00000000 };
Point ( 7518 ) = { 2.85700179, 6.96032278, 0.00000000 };
Point ( 7519 ) = { 2.85902678, 6.95949124, 0.00000000 };
Point ( 7520 ) = { 2.86105060, 6.95865949, 0.00000000 };
Point ( 7521 ) = { 2.86307510, 6.95782677, 0.00000000 };
Point ( 7522 ) = { 2.86509843, 6.95699385, 0.00000000 };
Point ( 7523 ) = { 2.86712245, 6.95615995, 0.00000000 };
Point ( 7524 ) = { 2.86914530, 6.95532585, 0.00000000 };
Point ( 7525 ) = { 2.87116883, 6.95449077, 0.00000000 };
Point ( 7526 ) = { 2.87319120, 6.95365549, 0.00000000 };
Point ( 7527 ) = { 2.87521424, 6.95281924, 0.00000000 };
Point ( 7528 ) = { 2.87723612, 6.95198279, 0.00000000 };
Point ( 7529 ) = { 2.87925868, 6.95114536, 0.00000000 };
Point ( 7530 ) = { 2.88128100, 6.95030735, 0.00000000 };
Point ( 7531 ) = { 2.88330215, 6.94946913, 0.00000000 };
Point ( 7532 ) = { 2.88532397, 6.94862993, 0.00000000 };
Point ( 7533 ) = { 2.88734463, 6.94779054, 0.00000000 };
Point ( 7534 ) = { 2.88996484, 6.95124178, 0.00000000 };
Point ( 7535 ) = { 2.89258714, 6.95469488, 0.00000000 };
Point ( 7536 ) = { 2.89460956, 6.95385337, 0.00000000 };
Point ( 7537 ) = { 2.89723570, 6.95730933, 0.00000000 };
Point ( 7538 ) = { 2.89986542, 6.96077071, 0.00000000 };
Point ( 7539 ) = { 2.90188961, 6.95992708, 0.00000000 };
Point ( 7540 ) = { 2.90391448, 6.95908248, 0.00000000 };
Point ( 7541 ) = { 2.90593817, 6.95823768, 0.00000000 };
Point ( 7542 ) = { 2.90857376, 6.96170040, 0.00000000 };
Point ( 7543 ) = { 2.91121145, 6.96516498, 0.00000000 };
Point ( 7544 ) = { 2.91323691, 6.96431806, 0.00000000 };
Point ( 7545 ) = { 2.91526306, 6.96347016, 0.00000000 };
Point ( 7546 ) = { 2.91464779, 6.95915958, 0.00000000 };
Point ( 7547 ) = { 2.91403236, 6.95485181, 0.00000000 };
Point ( 7548 ) = { 2.91605575, 6.95400368, 0.00000000 };
Point ( 7549 ) = { 2.91807890, 6.95315495, 0.00000000 };
Point ( 7550 ) = { 2.92010087, 6.95230603, 0.00000000 };
Point ( 7551 ) = { 2.92212352, 6.95145613, 0.00000000 };
Point ( 7552 ) = { 2.92150368, 6.94715367, 0.00000000 };
Point ( 7553 ) = { 2.92088519, 6.94285755, 0.00000000 };
Point ( 7554 ) = { 2.92290509, 6.94200742, 0.00000000 };
Point ( 7555 ) = { 2.92492382, 6.94115710, 0.00000000 };
Point ( 7556 ) = { 2.92694323, 6.94030580, 0.00000000 };
Point ( 7557 ) = { 2.92896147, 6.93945430, 0.00000000 };
Point ( 7558 ) = { 2.93098038, 6.93860182, 0.00000000 };
Point ( 7559 ) = { 2.93299812, 6.93774915, 0.00000000 };
Point ( 7560 ) = { 2.93501654, 6.93689550, 0.00000000 };
Point ( 7561 ) = { 2.93703378, 6.93604165, 0.00000000 };
Point ( 7562 ) = { 2.93905170, 6.93518683, 0.00000000 };
Point ( 7563 ) = { 2.94169944, 6.93862611, 0.00000000 };
Point ( 7564 ) = { 2.94435079, 6.94207078, 0.00000000 };
Point ( 7565 ) = { 2.94637046, 6.94121383, 0.00000000 };
Point ( 7566 ) = { 2.94838989, 6.94035628, 0.00000000 };
Point ( 7567 ) = { 2.95104611, 6.94380303, 0.00000000 };
Point ( 7568 ) = { 2.95370445, 6.94725164, 0.00000000 };
Point ( 7569 ) = { 2.95572563, 6.94639196, 0.00000000 };
Point ( 7570 ) = { 2.95774564, 6.94553209, 0.00000000 };
Point ( 7571 ) = { 2.95976632, 6.94467124, 0.00000000 };
Point ( 7572 ) = { 2.96178582, 6.94381020, 0.00000000 };
Point ( 7573 ) = { 2.96445152, 6.94725914, 0.00000000 };
Point ( 7574 ) = { 2.96712086, 6.95071349, 0.00000000 };
Point ( 7575 ) = { 2.96914212, 6.94985031, 0.00000000 };
Point ( 7576 ) = { 2.97116406, 6.94898614, 0.00000000 };
Point ( 7577 ) = { 2.97318482, 6.94812178, 0.00000000 };
Point ( 7578 ) = { 2.97520625, 6.94725644, 0.00000000 };
Point ( 7579 ) = { 2.97722651, 6.94639090, 0.00000000 };
Point ( 7580 ) = { 2.97924744, 6.94552439, 0.00000000 };
Point ( 7581 ) = { 2.98126719, 6.94465768, 0.00000000 };
Point ( 7582 ) = { 2.98328761, 6.94378998, 0.00000000 };
Point ( 7583 ) = { 2.98596789, 6.94724175, 0.00000000 };
Point ( 7584 ) = { 2.98865030, 6.95069538, 0.00000000 };
Point ( 7585 ) = { 2.99067156, 6.94982594, 0.00000000 };
Point ( 7586 ) = { 2.99269349, 6.94895551, 0.00000000 };
Point ( 7587 ) = { 2.99471423, 6.94808489, 0.00000000 };
Point ( 7588 ) = { 2.99673566, 6.94721328, 0.00000000 };
Point ( 7589 ) = { 2.99875590, 6.94634149, 0.00000000 };
Point ( 7590 ) = { 3.00077681, 6.94546870, 0.00000000 };
Point ( 7591 ) = { 3.00279655, 6.94459573, 0.00000000 };
Point ( 7592 ) = { 3.00481695, 6.94372177, 0.00000000 };
Point ( 7593 ) = { 3.00683618, 6.94284763, 0.00000000 };
Point ( 7594 ) = { 3.00953054, 6.94629786, 0.00000000 };
Point ( 7595 ) = { 3.01222861, 6.94975353, 0.00000000 };
Point ( 7596 ) = { 3.01424959, 6.94887723, 0.00000000 };
Point ( 7597 ) = { 3.01627124, 6.94799994, 0.00000000 };
Point ( 7598 ) = { 3.01829171, 6.94712246, 0.00000000 };
Point ( 7599 ) = { 3.02031285, 6.94624399, 0.00000000 };
Point ( 7600 ) = { 3.02233373, 6.94536494, 0.00000000 };
Point ( 7601 ) = { 3.02435344, 6.94448570, 0.00000000 };
Point ( 7602 ) = { 3.02637381, 6.94360547, 0.00000000 };
Point ( 7603 ) = { 3.02839300, 6.94272505, 0.00000000 };
Point ( 7604 ) = { 3.03041286, 6.94184365, 0.00000000 };
Point ( 7605 ) = { 3.03312244, 6.94529608, 0.00000000 };
Point ( 7606 ) = { 3.03583496, 6.94875218, 0.00000000 };
Point ( 7607 ) = { 3.03785657, 6.94786860, 0.00000000 };
Point ( 7608 ) = { 3.03987700, 6.94698485, 0.00000000 };
Point ( 7609 ) = { 3.04189810, 6.94610010, 0.00000000 };
Point ( 7610 ) = { 3.04391802, 6.94521517, 0.00000000 };
Point ( 7611 ) = { 3.04593860, 6.94432925, 0.00000000 };
Point ( 7612 ) = { 3.04795800, 6.94344314, 0.00000000 };
Point ( 7613 ) = { 3.05067997, 6.94689795, 0.00000000 };
Point ( 7614 ) = { 3.05340411, 6.95035462, 0.00000000 };
Point ( 7615 ) = { 3.05542527, 6.94946635, 0.00000000 };
Point ( 7616 ) = { 3.05815338, 6.95292589, 0.00000000 };
Point ( 7617 ) = { 3.06088446, 6.95638910, 0.00000000 };
Point ( 7618 ) = { 3.06290830, 6.95549824, 0.00000000 };
Point ( 7619 ) = { 3.06493095, 6.95460720, 0.00000000 };
Point ( 7620 ) = { 3.06766702, 6.95807250, 0.00000000 };
Point ( 7621 ) = { 3.07040686, 6.96154326, 0.00000000 };
Point ( 7622 ) = { 3.07243127, 6.96065004, 0.00000000 };
Point ( 7623 ) = { 3.07445634, 6.95975582, 0.00000000 };
Point ( 7624 ) = { 3.07648023, 6.95886142, 0.00000000 };
Point ( 7625 ) = { 3.07850478, 6.95796603, 0.00000000 };
Point ( 7626 ) = { 3.08052815, 6.95707045, 0.00000000 };
Point ( 7627 ) = { 3.08255218, 6.95617387, 0.00000000 };
Point ( 7628 ) = { 3.08530061, 6.95964374, 0.00000000 };
Point ( 7629 ) = { 3.08805204, 6.96311730, 0.00000000 };
Point ( 7630 ) = { 3.09007783, 6.96221853, 0.00000000 };
Point ( 7631 ) = { 3.09210243, 6.96131959, 0.00000000 };
Point ( 7632 ) = { 3.09412770, 6.96041965, 0.00000000 };
Point ( 7633 ) = { 3.09615178, 6.95951953, 0.00000000 };
Point ( 7634 ) = { 3.09817652, 6.95861841, 0.00000000 };
Point ( 7635 ) = { 3.10020101, 6.95771670, 0.00000000 };
Point ( 7636 ) = { 3.10222430, 6.95681481, 0.00000000 };
Point ( 7637 ) = { 3.10424825, 6.95591192, 0.00000000 };
Point ( 7638 ) = { 3.10627102, 6.95500886, 0.00000000 };
Point ( 7639 ) = { 3.10829445, 6.95410479, 0.00000000 };
Point ( 7640 ) = { 3.11105899, 6.95757402, 0.00000000 };
Point ( 7641 ) = { 3.11382575, 6.96104514, 0.00000000 };
Point ( 7642 ) = { 3.11585093, 6.96013887, 0.00000000 };
Point ( 7643 ) = { 3.11787493, 6.95923244, 0.00000000 };
Point ( 7644 ) = { 3.11989959, 6.95832500, 0.00000000 };
Point ( 7645 ) = { 3.12192306, 6.95741738, 0.00000000 };
Point ( 7646 ) = { 3.12117492, 6.95304188, 0.00000000 };
Point ( 7647 ) = { 3.12042673, 6.94866929, 0.00000000 };
Point ( 7648 ) = { 3.12244739, 6.94776152, 0.00000000 };
Point ( 7649 ) = { 3.12446871, 6.94685275, 0.00000000 };
Point ( 7650 ) = { 3.12648884, 6.94594381, 0.00000000 };
Point ( 7651 ) = { 3.12850964, 6.94503386, 0.00000000 };
Point ( 7652 ) = { 3.12775710, 6.94066685, 0.00000000 };
Point ( 7653 ) = { 3.12700532, 6.93630454, 0.00000000 };
Point ( 7654 ) = { 3.12902238, 6.93539486, 0.00000000 };
Point ( 7655 ) = { 3.12827008, 6.93103745, 0.00000000 };
Point ( 7656 ) = { 3.12475512, 6.92324967, 0.00000000 };
Point ( 7657 ) = { 3.12124792, 6.91547907, 0.00000000 };
Point ( 7658 ) = { 3.11849092, 6.91205216, 0.00000000 };
Point ( 7659 ) = { 3.11648065, 6.91295878, 0.00000000 };
Point ( 7660 ) = { 3.11372764, 6.90953469, 0.00000000 };
Point ( 7661 ) = { 3.11097761, 6.90611422, 0.00000000 };
Point ( 7662 ) = { 3.10823057, 6.90269736, 0.00000000 };
Point ( 7663 ) = { 3.10548730, 6.89928587, 0.00000000 };
Point ( 7664 ) = { 3.10348074, 6.90018871, 0.00000000 };
Point ( 7665 ) = { 3.10147300, 6.90109138, 0.00000000 };
Point ( 7666 ) = { 3.09873514, 6.89768169, 0.00000000 };
Point ( 7667 ) = { 3.09599946, 6.89427383, 0.00000000 };
Point ( 7668 ) = { 3.09399343, 6.89517432, 0.00000000 };
Point ( 7669 ) = { 3.09198807, 6.89607381, 0.00000000 };
Point ( 7670 ) = { 3.08998152, 6.89697314, 0.00000000 };
Point ( 7671 ) = { 3.08797563, 6.89787147, 0.00000000 };
Point ( 7672 ) = { 3.08524641, 6.89446422, 0.00000000 };
Point ( 7673 ) = { 3.08252093, 6.89106233, 0.00000000 };
Point ( 7674 ) = { 3.08051676, 6.89195849, 0.00000000 };
Point ( 7675 ) = { 3.07851141, 6.89285448, 0.00000000 };
Point ( 7676 ) = { 3.07650672, 6.89374947, 0.00000000 };
Point ( 7677 ) = { 3.07450085, 6.89464429, 0.00000000 };
Point ( 7678 ) = { 3.07249564, 6.89553811, 0.00000000 };
Point ( 7679 ) = { 3.07048925, 6.89643177, 0.00000000 };
Point ( 7680 ) = { 3.06777264, 6.89302870, 0.00000000 };
Point ( 7681 ) = { 3.06505819, 6.88962746, 0.00000000 };
Point ( 7682 ) = { 3.06305444, 6.89051854, 0.00000000 };
Point ( 7683 ) = { 3.06104951, 6.89140945, 0.00000000 };
Point ( 7684 ) = { 3.05834042, 6.88801000, 0.00000000 };
Point ( 7685 ) = { 3.05563504, 6.88461587, 0.00000000 };
Point ( 7686 ) = { 3.05293211, 6.88122552, 0.00000000 };
Point ( 7687 ) = { 3.04953343, 6.87356499, 0.00000000 };
Point ( 7688 ) = { 3.04883700, 6.86929930, 0.00000000 };
Point ( 7689 ) = { 3.04814079, 6.86503833, 0.00000000 };
Point ( 7690 ) = { 3.04475472, 6.85741221, 0.00000000 };
Point ( 7691 ) = { 3.04137758, 6.84980619, 0.00000000 };
Point ( 7692 ) = { 3.03800625, 6.84221326, 0.00000000 };
Point ( 7693 ) = { 3.03532894, 6.83886443, 0.00000000 };
Point ( 7694 ) = { 3.03265404, 6.83551929, 0.00000000 };
Point ( 7695 ) = { 3.02998277, 6.83217937, 0.00000000 };
Point ( 7696 ) = { 3.02799573, 6.83306025, 0.00000000 };
Point ( 7697 ) = { 3.02532829, 6.82972303, 0.00000000 };
Point ( 7698 ) = { 3.02266370, 6.82638927, 0.00000000 };
Point ( 7699 ) = { 3.02000241, 6.82305878, 0.00000000 };
Point ( 7700 ) = { 3.01666903, 6.81552771, 0.00000000 };
Point ( 7701 ) = { 3.01334288, 6.80801296, 0.00000000 };
Point ( 7702 ) = { 3.01267262, 6.80382540, 0.00000000 };
Point ( 7703 ) = { 3.01200346, 6.79964204, 0.00000000 };
Point ( 7704 ) = { 3.00868950, 6.79216071, 0.00000000 };
Point ( 7705 ) = { 3.00538420, 6.78469894, 0.00000000 };
Point ( 7706 ) = { 3.00274697, 6.78140929, 0.00000000 };
Point ( 7707 ) = { 3.00011299, 6.77812283, 0.00000000 };
Point ( 7708 ) = { 2.99748257, 6.77484146, 0.00000000 };
Point ( 7709 ) = { 2.99551130, 6.77571330, 0.00000000 };
Point ( 7710 ) = { 2.99354068, 6.77658415, 0.00000000 };
Point ( 7711 ) = { 2.99091449, 6.77330484, 0.00000000 };
Point ( 7712 ) = { 2.98829034, 6.77002720, 0.00000000 };
Point ( 7713 ) = { 2.98632137, 6.77089596, 0.00000000 };
Point ( 7714 ) = { 2.98435125, 6.77176455, 0.00000000 };
Point ( 7715 ) = { 2.98238178, 6.77263216, 0.00000000 };
Point ( 7716 ) = { 2.98041115, 6.77349960, 0.00000000 };
Point ( 7717 ) = { 2.97844028, 6.77436646, 0.00000000 };
Point ( 7718 ) = { 2.97647005, 6.77523236, 0.00000000 };
Point ( 7719 ) = { 2.97385440, 6.77195353, 0.00000000 };
Point ( 7720 ) = { 2.97124226, 6.76867977, 0.00000000 };
Point ( 7721 ) = { 2.96927368, 6.76954357, 0.00000000 };
Point ( 7722 ) = { 2.96730395, 6.77040719, 0.00000000 };
Point ( 7723 ) = { 2.96533488, 6.77126985, 0.00000000 };
Point ( 7724 ) = { 2.96336465, 6.77213233, 0.00000000 };
Point ( 7725 ) = { 2.96075953, 6.76885870, 0.00000000 };
Point ( 7726 ) = { 2.95815643, 6.76558674, 0.00000000 };
Point ( 7727 ) = { 2.95618785, 6.76644713, 0.00000000 };
Point ( 7728 ) = { 2.95358845, 6.76317778, 0.00000000 };
Point ( 7729 ) = { 2.95099253, 6.75991348, 0.00000000 };
Point ( 7730 ) = { 2.94902560, 6.76077178, 0.00000000 };
Point ( 7731 ) = { 2.94643337, 6.75751007, 0.00000000 };
Point ( 7732 ) = { 2.94384314, 6.75425001, 0.00000000 };
Point ( 7733 ) = { 2.94125519, 6.75099350, 0.00000000 };
Point ( 7734 ) = { 2.93866997, 6.74774031, 0.00000000 };
Point ( 7735 ) = { 2.93670749, 6.74859464, 0.00000000 };
Point ( 7736 ) = { 2.93474386, 6.74944879, 0.00000000 };
Point ( 7737 ) = { 2.93216325, 6.74619744, 0.00000000 };
Point ( 7738 ) = { 2.92958610, 6.74295109, 0.00000000 };
Point ( 7739 ) = { 2.92762501, 6.74380278, 0.00000000 };
Point ( 7740 ) = { 2.92566277, 6.74465429, 0.00000000 };
Point ( 7741 ) = { 2.92370118, 6.74550484, 0.00000000 };
Point ( 7742 ) = { 2.92173845, 6.74635520, 0.00000000 };
Point ( 7743 ) = { 2.91916823, 6.74310898, 0.00000000 };
Point ( 7744 ) = { 2.91660071, 6.73986608, 0.00000000 };
Point ( 7745 ) = { 2.91463962, 6.74071438, 0.00000000 };
Point ( 7746 ) = { 2.91267918, 6.74156172, 0.00000000 };
Point ( 7747 ) = { 2.91071760, 6.74240888, 0.00000000 };
Point ( 7748 ) = { 2.90875667, 6.74325509, 0.00000000 };
Point ( 7749 ) = { 2.90679459, 6.74410110, 0.00000000 };
Point ( 7750 ) = { 2.90423448, 6.74085779, 0.00000000 };
Point ( 7751 ) = { 2.90167634, 6.73761610, 0.00000000 };
Point ( 7752 ) = { 2.89971591, 6.73846006, 0.00000000 };
Point ( 7753 ) = { 2.89716140, 6.73522093, 0.00000000 };
Point ( 7754 ) = { 2.89460957, 6.73198511, 0.00000000 };
Point ( 7755 ) = { 2.89205996, 6.72875278, 0.00000000 };
Point ( 7756 ) = { 2.89147042, 6.72468442, 0.00000000 };
Point ( 7757 ) = { 2.89342596, 6.72384325, 0.00000000 };
Point ( 7758 ) = { 2.89538214, 6.72300112, 0.00000000 };
Point ( 7759 ) = { 2.89479033, 6.71893749, 0.00000000 };
Point ( 7760 ) = { 2.89419836, 6.71487639, 0.00000000 };
Point ( 7761 ) = { 2.89615193, 6.71403403, 0.00000000 };
Point ( 7762 ) = { 2.89810437, 6.71319150, 0.00000000 };
Point ( 7763 ) = { 2.90005745, 6.71234801, 0.00000000 };
Point ( 7764 ) = { 2.90200939, 6.71150434, 0.00000000 };
Point ( 7765 ) = { 2.90396199, 6.71065971, 0.00000000 };
Point ( 7766 ) = { 2.90591344, 6.70981491, 0.00000000 };
Point ( 7767 ) = { 2.90846533, 6.71302924, 0.00000000 };
Point ( 7768 ) = { 2.91101918, 6.71624517, 0.00000000 };
Point ( 7769 ) = { 2.91297226, 6.71539831, 0.00000000 };
Point ( 7770 ) = { 2.91492598, 6.71455049, 0.00000000 };
Point ( 7771 ) = { 2.91687856, 6.71370250, 0.00000000 };
Point ( 7772 ) = { 2.91883179, 6.71285355, 0.00000000 };
Point ( 7773 ) = { 2.92078478, 6.71200403, 0.00000000 };
Point ( 7774 ) = { 2.92273662, 6.71115433, 0.00000000 };
Point ( 7775 ) = { 2.92529876, 6.71436907, 0.00000000 };
Point ( 7776 ) = { 2.92786431, 6.71758875, 0.00000000 };
Point ( 7777 ) = { 2.92981778, 6.71673700, 0.00000000 };
Point ( 7778 ) = { 2.93177189, 6.71588428, 0.00000000 };
Point ( 7779 ) = { 2.93372486, 6.71503139, 0.00000000 };
Point ( 7780 ) = { 2.93567848, 6.71417754, 0.00000000 };
Point ( 7781 ) = { 2.93763095, 6.71332351, 0.00000000 };
Point ( 7782 ) = { 2.93701290, 6.70925332, 0.00000000 };
Point ( 7783 ) = { 2.93639616, 6.70518899, 0.00000000 };
Point ( 7784 ) = { 2.93834602, 6.70433475, 0.00000000 };
Point ( 7785 ) = { 2.94029652, 6.70347956, 0.00000000 };
Point ( 7786 ) = { 2.94224589, 6.70262418, 0.00000000 };
Point ( 7787 ) = { 2.94419589, 6.70176785, 0.00000000 };
Point ( 7788 ) = { 2.94357455, 6.69770864, 0.00000000 };
Point ( 7789 ) = { 2.94295306, 6.69365194, 0.00000000 };
Point ( 7790 ) = { 2.94490046, 6.69279540, 0.00000000 };
Point ( 7791 ) = { 2.94427881, 6.68874287, 0.00000000 };
Point ( 7792 ) = { 2.94365848, 6.68469617, 0.00000000 };
Point ( 7793 ) = { 2.94560238, 6.68383982, 0.00000000 };
Point ( 7794 ) = { 2.94498144, 6.67979746, 0.00000000 };
Point ( 7795 ) = { 2.94179858, 6.67257811, 0.00000000 };
Point ( 7796 ) = { 2.93862392, 6.66537735, 0.00000000 };
Point ( 7797 ) = { 2.93606923, 6.66220824, 0.00000000 };
Point ( 7798 ) = { 2.93351764, 6.65904213, 0.00000000 };
Point ( 7799 ) = { 2.93096943, 6.65588087, 0.00000000 };
Point ( 7800 ) = { 2.92842344, 6.65272300, 0.00000000 };
Point ( 7801 ) = { 2.92587936, 6.64956667, 0.00000000 };
Point ( 7802 ) = { 2.92333793, 6.64641353, 0.00000000 };
Point ( 7803 ) = { 2.92079987, 6.64326521, 0.00000000 };
Point ( 7804 ) = { 2.91826488, 6.64011986, 0.00000000 };
Point ( 7805 ) = { 2.91513046, 6.63298791, 0.00000000 };
Point ( 7806 ) = { 2.91200264, 6.62587098, 0.00000000 };
Point ( 7807 ) = { 2.90888282, 6.61877226, 0.00000000 };
Point ( 7808 ) = { 2.90636343, 6.61565118, 0.00000000 };
Point ( 7809 ) = { 2.90443848, 6.61649651, 0.00000000 };
Point ( 7810 ) = { 2.90192261, 6.61337782, 0.00000000 };
Point ( 7811 ) = { 2.89940862, 6.61026064, 0.00000000 };
Point ( 7812 ) = { 2.89748524, 6.61110394, 0.00000000 };
Point ( 7813 ) = { 2.89556249, 6.61194630, 0.00000000 };
Point ( 7814 ) = { 2.89305247, 6.60883098, 0.00000000 };
Point ( 7815 ) = { 2.89054504, 6.60571877, 0.00000000 };
Point ( 7816 ) = { 2.88862386, 6.60655911, 0.00000000 };
Point ( 7817 ) = { 2.88670156, 6.60739928, 0.00000000 };
Point ( 7818 ) = { 2.88477989, 6.60823850, 0.00000000 };
Point ( 7819 ) = { 2.88285710, 6.60907755, 0.00000000 };
Point ( 7820 ) = { 2.88035631, 6.60596536, 0.00000000 };
Point ( 7821 ) = { 2.87785881, 6.60285789, 0.00000000 };
Point ( 7822 ) = { 2.87593759, 6.60369492, 0.00000000 };
Point ( 7823 ) = { 2.87344356, 6.60058984, 0.00000000 };
Point ( 7824 ) = { 2.87095140, 6.59748624, 0.00000000 };
Point ( 7825 ) = { 2.86903174, 6.59832126, 0.00000000 };
Point ( 7826 ) = { 2.86654261, 6.59522023, 0.00000000 };
Point ( 7827 ) = { 2.86405674, 6.59212390, 0.00000000 };
Point ( 7828 ) = { 2.86157386, 6.58903046, 0.00000000 };
Point ( 7829 ) = { 2.85909284, 6.58593851, 0.00000000 };
Point ( 7830 ) = { 2.85661393, 6.58284982, 0.00000000 };
Point ( 7831 ) = { 2.85357850, 6.57585489, 0.00000000 };
Point ( 7832 ) = { 2.85301855, 6.57194632, 0.00000000 };
Point ( 7833 ) = { 2.85245866, 6.56804189, 0.00000000 };
Point ( 7834 ) = { 2.85189997, 6.56414298, 0.00000000 };
Point ( 7835 ) = { 2.85134221, 6.56024780, 0.00000000 };
Point ( 7836 ) = { 2.85078427, 6.55635496, 0.00000000 };
Point ( 7837 ) = { 2.85022683, 6.55246603, 0.00000000 };
Point ( 7838 ) = { 2.84967057, 6.54858260, 0.00000000 };
Point ( 7839 ) = { 2.85157489, 6.54775359, 0.00000000 };
Point ( 7840 ) = { 2.85347984, 6.54692364, 0.00000000 };
Point ( 7841 ) = { 2.85292139, 6.54304463, 0.00000000 };
Point ( 7842 ) = { 2.85236275, 6.53916792, 0.00000000 };
Point ( 7843 ) = { 2.85426521, 6.53833775, 0.00000000 };
Point ( 7844 ) = { 2.85616655, 6.53750740, 0.00000000 };
Point ( 7845 ) = { 2.85560659, 6.53363472, 0.00000000 };
Point ( 7846 ) = { 2.85504713, 6.52976593, 0.00000000 };
Point ( 7847 ) = { 2.85694598, 6.52893536, 0.00000000 };
Point ( 7848 ) = { 2.85884546, 6.52810385, 0.00000000 };
Point ( 7849 ) = { 2.86074382, 6.52727217, 0.00000000 };
Point ( 7850 ) = { 2.86264281, 6.52643956, 0.00000000 };
Point ( 7851 ) = { 2.86454069, 6.52560678, 0.00000000 };
Point ( 7852 ) = { 2.86643920, 6.52477306, 0.00000000 };
Point ( 7853 ) = { 2.86833659, 6.52393918, 0.00000000 };
Point ( 7854 ) = { 2.87023461, 6.52310436, 0.00000000 };
Point ( 7855 ) = { 2.87213239, 6.52226899, 0.00000000 };
Point ( 7856 ) = { 2.87402906, 6.52143345, 0.00000000 };
Point ( 7857 ) = { 2.87592635, 6.52059697, 0.00000000 };
Point ( 7858 ) = { 2.87782253, 6.51976033, 0.00000000 };
Point ( 7859 ) = { 2.87971933, 6.51892275, 0.00000000 };
Point ( 7860 ) = { 2.88161503, 6.51808500, 0.00000000 };
Point ( 7861 ) = { 2.88408768, 6.52111263, 0.00000000 };
Point ( 7862 ) = { 2.88656285, 6.52414326, 0.00000000 };
Point ( 7863 ) = { 2.88846006, 6.52330352, 0.00000000 };
Point ( 7864 ) = { 2.89035790, 6.52246285, 0.00000000 };
Point ( 7865 ) = { 2.89225462, 6.52162201, 0.00000000 };
Point ( 7866 ) = { 2.89415196, 6.52078023, 0.00000000 };
Point ( 7867 ) = { 2.89604820, 6.51993828, 0.00000000 };
Point ( 7868 ) = { 2.89794505, 6.51909540, 0.00000000 };
Point ( 7869 ) = { 2.89984079, 6.51825235, 0.00000000 };
Point ( 7870 ) = { 2.90173716, 6.51740837, 0.00000000 };
Point ( 7871 ) = { 2.90363328, 6.51656383, 0.00000000 };
Point ( 7872 ) = { 2.90552828, 6.51571913, 0.00000000 };
Point ( 7873 ) = { 2.90742391, 6.51487349, 0.00000000 };
Point ( 7874 ) = { 2.90931843, 6.51402768, 0.00000000 };
Point ( 7875 ) = { 2.91121356, 6.51318094, 0.00000000 };
Point ( 7876 ) = { 2.91310758, 6.51233403, 0.00000000 };
Point ( 7877 ) = { 2.91500223, 6.51148619, 0.00000000 };
Point ( 7878 ) = { 2.91440694, 6.50761891, 0.00000000 };
Point ( 7879 ) = { 2.91132756, 6.50074293, 0.00000000 };
Point ( 7880 ) = { 2.90884617, 6.49773489, 0.00000000 };
Point ( 7881 ) = { 2.90636687, 6.49473001, 0.00000000 };
Point ( 7882 ) = { 2.90389010, 6.49172809, 0.00000000 };
Point ( 7883 ) = { 2.90141627, 6.48872893, 0.00000000 };
Point ( 7884 ) = { 2.89894426, 6.48573117, 0.00000000 };
Point ( 7885 ) = { 2.89647433, 6.48273654, 0.00000000 };
Point ( 7886 ) = { 2.89400691, 6.47974487, 0.00000000 };
Point ( 7887 ) = { 2.89212237, 6.48058622, 0.00000000 };
Point ( 7888 ) = { 2.88965832, 6.47759676, 0.00000000 };
Point ( 7889 ) = { 2.88719746, 6.47461181, 0.00000000 };
Point ( 7890 ) = { 2.88473953, 6.47162959, 0.00000000 };
Point ( 7891 ) = { 2.88228340, 6.46864874, 0.00000000 };
Point ( 7892 ) = { 2.87982932, 6.46567100, 0.00000000 };
Point ( 7893 ) = { 2.87925862, 6.46186030, 0.00000000 };
Point ( 7894 ) = { 2.87868800, 6.45805357, 0.00000000 };
Point ( 7895 ) = { 2.87811719, 6.45424907, 0.00000000 };
Point ( 7896 ) = { 2.87999494, 6.45341141, 0.00000000 };
Point ( 7897 ) = { 2.87942353, 6.44961087, 0.00000000 };
Point ( 7898 ) = { 2.87885332, 6.44581564, 0.00000000 };
Point ( 7899 ) = { 2.88072861, 6.44497776, 0.00000000 };
Point ( 7900 ) = { 2.88260280, 6.44413973, 0.00000000 };
Point ( 7901 ) = { 2.88447760, 6.44330076, 0.00000000 };
Point ( 7902 ) = { 2.88635130, 6.44246163, 0.00000000 };
Point ( 7903 ) = { 2.88822562, 6.44162157, 0.00000000 };
Point ( 7904 ) = { 2.88765040, 6.43783095, 0.00000000 };
Point ( 7905 ) = { 2.88707500, 6.43404254, 0.00000000 };
Point ( 7906 ) = { 2.88952293, 6.43699070, 0.00000000 };
Point ( 7907 ) = { 2.89197265, 6.43994021, 0.00000000 };
Point ( 7908 ) = { 2.89384538, 6.43909890, 0.00000000 };
Point ( 7909 ) = { 2.89571871, 6.43825666, 0.00000000 };
Point ( 7910 ) = { 2.89759094, 6.43741427, 0.00000000 };
Point ( 7911 ) = { 2.89946379, 6.43657094, 0.00000000 };
Point ( 7912 ) = { 2.90133639, 6.43572707, 0.00000000 };
Point ( 7913 ) = { 2.90320789, 6.43488303, 0.00000000 };
Point ( 7914 ) = { 2.90508000, 6.43403807, 0.00000000 };
Point ( 7915 ) = { 2.90695100, 6.43319295, 0.00000000 };
Point ( 7916 ) = { 2.90882262, 6.43234690, 0.00000000 };
Point ( 7917 ) = { 2.91069313, 6.43150070, 0.00000000 };
Point ( 7918 ) = { 2.91256426, 6.43065356, 0.00000000 };
Point ( 7919 ) = { 2.91502545, 6.43359828, 0.00000000 };
Point ( 7920 ) = { 2.91748984, 6.43654742, 0.00000000 };
Point ( 7921 ) = { 2.91936243, 6.43569830, 0.00000000 };
Point ( 7922 ) = { 2.92123392, 6.43484903, 0.00000000 };
Point ( 7923 ) = { 2.92310602, 6.43399882, 0.00000000 };
Point ( 7924 ) = { 2.92497701, 6.43314846, 0.00000000 };
Point ( 7925 ) = { 2.92684861, 6.43229717, 0.00000000 };
Point ( 7926 ) = { 2.92871911, 6.43144572, 0.00000000 };
Point ( 7927 ) = { 2.93059022, 6.43059333, 0.00000000 };
Point ( 7928 ) = { 2.93246108, 6.42974041, 0.00000000 };
Point ( 7929 ) = { 2.93433084, 6.42888732, 0.00000000 };
Point ( 7930 ) = { 2.93680586, 6.43183269, 0.00000000 };
Point ( 7931 ) = { 2.93928268, 6.43477940, 0.00000000 };
Point ( 7932 ) = { 2.94115391, 6.43392434, 0.00000000 };
Point ( 7933 ) = { 2.94302573, 6.43306834, 0.00000000 };
Point ( 7934 ) = { 2.94489646, 6.43221218, 0.00000000 };
Point ( 7935 ) = { 2.94676779, 6.43135509, 0.00000000 };
Point ( 7936 ) = { 2.94863801, 6.43049785, 0.00000000 };
Point ( 7937 ) = { 2.95050884, 6.42963967, 0.00000000 };
Point ( 7938 ) = { 2.95299289, 6.43258513, 0.00000000 };
Point ( 7939 ) = { 2.95548016, 6.43553503, 0.00000000 };
Point ( 7940 ) = { 2.95735245, 6.43467486, 0.00000000 };
Point ( 7941 ) = { 2.95922364, 6.43381454, 0.00000000 };
Point ( 7942 ) = { 2.96109544, 6.43295328, 0.00000000 };
Point ( 7943 ) = { 2.96358780, 6.43590390, 0.00000000 };
Point ( 7944 ) = { 2.96608199, 6.43885587, 0.00000000 };
Point ( 7945 ) = { 2.96795525, 6.43799261, 0.00000000 };
Point ( 7946 ) = { 2.96982826, 6.43712881, 0.00000000 };
Point ( 7947 ) = { 2.97232669, 6.44008223, 0.00000000 };
Point ( 7948 ) = { 2.97482837, 6.44304010, 0.00000000 };
Point ( 7949 ) = { 2.97670284, 6.44217430, 0.00000000 };
Point ( 7950 ) = { 2.97857621, 6.44130835, 0.00000000 };
Point ( 7951 ) = { 2.98045019, 6.44044146, 0.00000000 };
Point ( 7952 ) = { 2.98232305, 6.43957442, 0.00000000 };
Point ( 7953 ) = { 2.98483115, 6.44253209, 0.00000000 };
Point ( 7954 ) = { 2.98734179, 6.44549266, 0.00000000 };
Point ( 7955 ) = { 2.98921612, 6.44462362, 0.00000000 };
Point ( 7956 ) = { 2.99109106, 6.44375363, 0.00000000 };
Point ( 7957 ) = { 2.99360555, 6.44671586, 0.00000000 };
Point ( 7958 ) = { 2.99612187, 6.44967945, 0.00000000 };
Point ( 7959 ) = { 2.99799828, 6.44880746, 0.00000000 };
Point ( 7960 ) = { 3.00051802, 6.45177324, 0.00000000 };
Point ( 7961 ) = { 3.00304033, 6.45474194, 0.00000000 };
Point ( 7962 ) = { 3.00556563, 6.45771337, 0.00000000 };
Point ( 7963 ) = { 3.00809424, 6.46068930, 0.00000000 };
Point ( 7964 ) = { 3.01062499, 6.46366837, 0.00000000 };
Point ( 7965 ) = { 3.01315832, 6.46665039, 0.00000000 };
Point ( 7966 ) = { 3.01503967, 6.46577344, 0.00000000 };
Point ( 7967 ) = { 3.01692076, 6.46489594, 0.00000000 };
Point ( 7968 ) = { 3.01945842, 6.46787943, 0.00000000 };
Point ( 7969 ) = { 3.02199794, 6.47086431, 0.00000000 };
Point ( 7970 ) = { 3.02388051, 6.46998478, 0.00000000 };
Point ( 7971 ) = { 3.02642349, 6.47297187, 0.00000000 };
Point ( 7972 ) = { 3.02896980, 6.47596350, 0.00000000 };
Point ( 7973 ) = { 3.03151915, 6.47895789, 0.00000000 };
Point ( 7974 ) = { 3.03473728, 6.48583566, 0.00000000 };
Point ( 7975 ) = { 3.03796359, 6.49273094, 0.00000000 };
Point ( 7976 ) = { 3.04052354, 6.49574014, 0.00000000 };
Point ( 7977 ) = { 3.04308567, 6.49875253, 0.00000000 };
Point ( 7978 ) = { 3.04632749, 6.50567569, 0.00000000 };
Point ( 7979 ) = { 3.04957460, 6.51261016, 0.00000000 };
Point ( 7980 ) = { 3.05283001, 6.51956233, 0.00000000 };
Point ( 7981 ) = { 3.05351098, 6.52348636, 0.00000000 };
Point ( 7982 ) = { 3.05419215, 6.52741458, 0.00000000 };
Point ( 7983 ) = { 3.05745919, 6.53439690, 0.00000000 };
Point ( 7984 ) = { 3.06073310, 6.54139388, 0.00000000 };
Point ( 7985 ) = { 3.06401238, 6.54840237, 0.00000000 };
Point ( 7986 ) = { 3.06729858, 6.55542562, 0.00000000 };
Point ( 7987 ) = { 3.07059320, 6.56246688, 0.00000000 };
Point ( 7988 ) = { 3.07128790, 6.56643995, 0.00000000 };
Point ( 7989 ) = { 3.07198368, 6.57041688, 0.00000000 };
Point ( 7990 ) = { 3.07267936, 6.57439625, 0.00000000 };
Point ( 7991 ) = { 3.07337525, 6.57837990, 0.00000000 };
Point ( 7992 ) = { 3.07407254, 6.58236925, 0.00000000 };
Point ( 7993 ) = { 3.07477093, 6.58636249, 0.00000000 };
Point ( 7994 ) = { 3.07546922, 6.59035819, 0.00000000 };
Point ( 7995 ) = { 3.07355162, 6.59125272, 0.00000000 };
Point ( 7996 ) = { 3.07424896, 6.59525293, 0.00000000 };
Point ( 7997 ) = { 3.07494771, 6.59925887, 0.00000000 };
Point ( 7998 ) = { 3.07564755, 6.60326872, 0.00000000 };
Point ( 7999 ) = { 3.07634730, 6.60728106, 0.00000000 };
Point ( 8000 ) = { 3.07704726, 6.61129773, 0.00000000 };
Point ( 8001 ) = { 3.07774864, 6.61532016, 0.00000000 };
Point ( 8002 ) = { 3.07582466, 6.61621495, 0.00000000 };
Point ( 8003 ) = { 3.07652553, 6.62024173, 0.00000000 };
Point ( 8004 ) = { 3.07722630, 6.62427101, 0.00000000 };
Point ( 8005 ) = { 3.07792817, 6.62830424, 0.00000000 };
Point ( 8006 ) = { 3.08126527, 6.63549067, 0.00000000 };
Point ( 8007 ) = { 3.08460795, 6.64268912, 0.00000000 };
Point ( 8008 ) = { 3.08724912, 6.64584690, 0.00000000 };
Point ( 8009 ) = { 3.08989351, 6.64900769, 0.00000000 };
Point ( 8010 ) = { 3.09254067, 6.65217171, 0.00000000 };
Point ( 8011 ) = { 3.09447510, 6.65127207, 0.00000000 };
Point ( 8012 ) = { 3.09712597, 6.65443855, 0.00000000 };
Point ( 8013 ) = { 3.09977885, 6.65760660, 0.00000000 };
Point ( 8014 ) = { 3.10171486, 6.65670485, 0.00000000 };
Point ( 8015 ) = { 3.10365150, 6.65580212, 0.00000000 };
Point ( 8016 ) = { 3.10558788, 6.65489883, 0.00000000 };
Point ( 8017 ) = { 3.10752310, 6.65399539, 0.00000000 };
Point ( 8018 ) = { 3.10945895, 6.65309097, 0.00000000 };
Point ( 8019 ) = { 3.11139366, 6.65218641, 0.00000000 };
Point ( 8020 ) = { 3.11405485, 6.65535306, 0.00000000 };
Point ( 8021 ) = { 3.11671885, 6.65852294, 0.00000000 };
Point ( 8022 ) = { 3.11865513, 6.65761626, 0.00000000 };
Point ( 8023 ) = { 3.12059203, 6.65670861, 0.00000000 };
Point ( 8024 ) = { 3.12252779, 6.65580080, 0.00000000 };
Point ( 8025 ) = { 3.12446416, 6.65489202, 0.00000000 };
Point ( 8026 ) = { 3.12639939, 6.65398309, 0.00000000 };
Point ( 8027 ) = { 3.12833523, 6.65307318, 0.00000000 };
Point ( 8028 ) = { 3.13026993, 6.65216313, 0.00000000 };
Point ( 8029 ) = { 3.13220524, 6.65125209, 0.00000000 };
Point ( 8030 ) = { 3.13413941, 6.65034091, 0.00000000 };
Point ( 8031 ) = { 3.13607420, 6.64942875, 0.00000000 };
Point ( 8032 ) = { 3.13800872, 6.64851603, 0.00000000 };
Point ( 8033 ) = { 3.13994209, 6.64760316, 0.00000000 };
Point ( 8034 ) = { 3.14187608, 6.64668931, 0.00000000 };
Point ( 8035 ) = { 3.14380892, 6.64577532, 0.00000000 };
Point ( 8036 ) = { 3.14574237, 6.64486035, 0.00000000 };
Point ( 8037 ) = { 3.14767468, 6.64394523, 0.00000000 };
Point ( 8038 ) = { 3.14960761, 6.64302913, 0.00000000 };
Point ( 8039 ) = { 3.15153938, 6.64211289, 0.00000000 };
Point ( 8040 ) = { 3.15347177, 6.64119567, 0.00000000 };
Point ( 8041 ) = { 3.15540301, 6.64027830, 0.00000000 };
Point ( 8042 ) = { 3.15733487, 6.63935996, 0.00000000 };
Point ( 8043 ) = { 3.15926558, 6.63844147, 0.00000000 };
Point ( 8044 ) = { 3.16119690, 6.63752200, 0.00000000 };
Point ( 8045 ) = { 3.16312707, 6.63660239, 0.00000000 };
Point ( 8046 ) = { 3.16505786, 6.63568179, 0.00000000 };
Point ( 8047 ) = { 3.16698838, 6.63476064, 0.00000000 };
Point ( 8048 ) = { 3.16891775, 6.63383934, 0.00000000 };
Point ( 8049 ) = { 3.17084773, 6.63291706, 0.00000000 };
Point ( 8050 ) = { 3.17277656, 6.63199465, 0.00000000 };
Point ( 8051 ) = { 3.17470601, 6.63107125, 0.00000000 };
Point ( 8052 ) = { 3.17663430, 6.63014771, 0.00000000 };
Point ( 8053 ) = { 3.17856321, 6.62922318, 0.00000000 };
Point ( 8054 ) = { 3.18049097, 6.62829852, 0.00000000 };
Point ( 8055 ) = { 3.18318810, 6.63144590, 0.00000000 };
Point ( 8056 ) = { 3.18588887, 6.63459815, 0.00000000 };
Point ( 8057 ) = { 3.18511695, 6.63051968, 0.00000000 };
Point ( 8058 ) = { 3.18434656, 6.62644709, 0.00000000 };
Point ( 8059 ) = { 3.18627439, 6.62552033, 0.00000000 };
Point ( 8060 ) = { 3.18820107, 6.62459342, 0.00000000 };
Point ( 8061 ) = { 3.19012837, 6.62366553, 0.00000000 };
Point ( 8062 ) = { 3.19205451, 6.62273751, 0.00000000 };
Point ( 8063 ) = { 3.19398126, 6.62180850, 0.00000000 };
Point ( 8064 ) = { 3.19590774, 6.62087893, 0.00000000 };
Point ( 8065 ) = { 3.19513099, 6.61681191, 0.00000000 };
Point ( 8066 ) = { 3.19435498, 6.61274911, 0.00000000 };
Point ( 8067 ) = { 3.19627883, 6.61181943, 0.00000000 };
Point ( 8068 ) = { 3.19550238, 6.60776105, 0.00000000 };
Point ( 8069 ) = { 3.19472588, 6.60370523, 0.00000000 };
Point ( 8070 ) = { 3.19664710, 6.60277545, 0.00000000 };
Point ( 8071 ) = { 3.19587016, 6.59872405, 0.00000000 };
Point ( 8072 ) = { 3.19509396, 6.59467684, 0.00000000 };
Point ( 8073 ) = { 3.19701255, 6.59374695, 0.00000000 };
Point ( 8074 ) = { 3.19623592, 6.58970415, 0.00000000 };
Point ( 8075 ) = { 3.19546082, 6.58566716, 0.00000000 };
Point ( 8076 ) = { 3.19468690, 6.58163412, 0.00000000 };
Point ( 8077 ) = { 3.19391292, 6.57760361, 0.00000000 };
Point ( 8078 ) = { 3.19582567, 6.57667449, 0.00000000 };
Point ( 8079 ) = { 3.19505126, 6.57264836, 0.00000000 };
Point ( 8080 ) = { 3.19427837, 6.56862800, 0.00000000 };
Point ( 8081 ) = { 3.19618851, 6.56769877, 0.00000000 };
Point ( 8082 ) = { 3.19541519, 6.56368278, 0.00000000 };
Point ( 8083 ) = { 3.19464181, 6.55966929, 0.00000000 };
Point ( 8084 ) = { 3.19654934, 6.55873996, 0.00000000 };
Point ( 8085 ) = { 3.19845747, 6.55780965, 0.00000000 };
Point ( 8086 ) = { 3.20036446, 6.55687920, 0.00000000 };
Point ( 8087 ) = { 3.20227205, 6.55594778, 0.00000000 };
Point ( 8088 ) = { 3.20417937, 6.55501580, 0.00000000 };
Point ( 8089 ) = { 3.20608555, 6.55408369, 0.00000000 };
Point ( 8090 ) = { 3.20877344, 6.55716272, 0.00000000 };
Point ( 8091 ) = { 3.21146333, 6.56024324, 0.00000000 };
Point ( 8092 ) = { 3.21337190, 6.55930859, 0.00000000 };
Point ( 8093 ) = { 3.21606595, 6.56239124, 0.00000000 };
Point ( 8094 ) = { 3.21876360, 6.56547865, 0.00000000 };
Point ( 8095 ) = { 3.22146364, 6.56856941, 0.00000000 };
Point ( 8096 ) = { 3.22495841, 6.57569526, 0.00000000 };
Point ( 8097 ) = { 3.22846224, 6.58283957, 0.00000000 };
Point ( 8098 ) = { 3.23117465, 6.58594767, 0.00000000 };
Point ( 8099 ) = { 3.23389034, 6.58905873, 0.00000000 };
Point ( 8100 ) = { 3.23660807, 6.59217132, 0.00000000 };
Point ( 8101 ) = { 3.23852593, 6.59122935, 0.00000000 };
Point ( 8102 ) = { 3.24044264, 6.59028725, 0.00000000 };
Point ( 8103 ) = { 3.24316460, 6.59340165, 0.00000000 };
Point ( 8104 ) = { 3.24588943, 6.59651923, 0.00000000 };
Point ( 8105 ) = { 3.24780855, 6.59557456, 0.00000000 };
Point ( 8106 ) = { 3.24972740, 6.59462933, 0.00000000 };
Point ( 8107 ) = { 3.25164509, 6.59368397, 0.00000000 };
Point ( 8108 ) = { 3.25356251, 6.59273806, 0.00000000 };
Point ( 8109 ) = { 3.25548053, 6.59179115, 0.00000000 };
Point ( 8110 ) = { 3.25739828, 6.59084369, 0.00000000 };
Point ( 8111 ) = { 3.25931487, 6.58989611, 0.00000000 };
Point ( 8112 ) = { 3.26123119, 6.58894796, 0.00000000 };
Point ( 8113 ) = { 3.26314811, 6.58799883, 0.00000000 };
Point ( 8114 ) = { 3.26588440, 6.59111222, 0.00000000 };
Point ( 8115 ) = { 3.26862438, 6.59423045, 0.00000000 };
Point ( 8116 ) = { 3.27054196, 6.59327960, 0.00000000 };
Point ( 8117 ) = { 3.27246014, 6.59232775, 0.00000000 };
Point ( 8118 ) = { 3.27437804, 6.59137535, 0.00000000 };
Point ( 8119 ) = { 3.27629478, 6.59042283, 0.00000000 };
Point ( 8120 ) = { 3.27821125, 6.58946975, 0.00000000 };
Point ( 8121 ) = { 3.28012832, 6.58851567, 0.00000000 };
Point ( 8122 ) = { 3.28204511, 6.58756104, 0.00000000 };
Point ( 8123 ) = { 3.28396075, 6.58660628, 0.00000000 };
Point ( 8124 ) = { 3.28587611, 6.58565097, 0.00000000 };
Point ( 8125 ) = { 3.28779207, 6.58469467, 0.00000000 };
Point ( 8126 ) = { 3.29054401, 6.58780809, 0.00000000 };
Point ( 8127 ) = { 3.29329884, 6.59092470, 0.00000000 };
Point ( 8128 ) = { 3.29521546, 6.58996668, 0.00000000 };
Point ( 8129 ) = { 3.29713179, 6.58900809, 0.00000000 };
Point ( 8130 ) = { 3.29904873, 6.58804851, 0.00000000 };
Point ( 8131 ) = { 3.30096538, 6.58708837, 0.00000000 };
Point ( 8132 ) = { 3.30288088, 6.58612812, 0.00000000 };
Point ( 8133 ) = { 3.30479698, 6.58516687, 0.00000000 };
Point ( 8134 ) = { 3.30671279, 6.58420506, 0.00000000 };
Point ( 8135 ) = { 3.30862745, 6.58324313, 0.00000000 };
Point ( 8136 ) = { 3.31054183, 6.58228064, 0.00000000 };
Point ( 8137 ) = { 3.31330773, 6.58539322, 0.00000000 };
Point ( 8138 ) = { 3.31607572, 6.58850734, 0.00000000 };
Point ( 8139 ) = { 3.31799250, 6.58754225, 0.00000000 };
Point ( 8140 ) = { 3.31990813, 6.58657704, 0.00000000 };
Point ( 8141 ) = { 3.32182348, 6.58561127, 0.00000000 };
Point ( 8142 ) = { 3.32373943, 6.58464451, 0.00000000 };
Point ( 8143 ) = { 3.32565509, 6.58367719, 0.00000000 };
Point ( 8144 ) = { 3.32756960, 6.58270975, 0.00000000 };
Point ( 8145 ) = { 3.32948382, 6.58174176, 0.00000000 };
Point ( 8146 ) = { 3.33139864, 6.58077277, 0.00000000 };
Point ( 8147 ) = { 3.33331318, 6.57980322, 0.00000000 };
Point ( 8148 ) = { 3.33522656, 6.57883355, 0.00000000 };
Point ( 8149 ) = { 3.33714053, 6.57786289, 0.00000000 };
Point ( 8150 ) = { 3.33905422, 6.57689167, 0.00000000 };
Point ( 8151 ) = { 3.34096675, 6.57592034, 0.00000000 };
Point ( 8152 ) = { 3.34287900, 6.57494845, 0.00000000 };
Point ( 8153 ) = { 3.34201030, 6.57087355, 0.00000000 };
Point ( 8154 ) = { 3.34114160, 6.56680124, 0.00000000 };
Point ( 8155 ) = { 3.34305207, 6.56582885, 0.00000000 };
Point ( 8156 ) = { 3.34496139, 6.56485636, 0.00000000 };
Point ( 8157 ) = { 3.34687042, 6.56388331, 0.00000000 };
Point ( 8158 ) = { 3.34878004, 6.56290926, 0.00000000 };
Point ( 8159 ) = { 3.35068938, 6.56193465, 0.00000000 };
Point ( 8160 ) = { 3.35259756, 6.56095994, 0.00000000 };
Point ( 8161 ) = { 3.35450546, 6.55998467, 0.00000000 };
Point ( 8162 ) = { 3.35362932, 6.55591837, 0.00000000 };
Point ( 8163 ) = { 3.35275403, 6.55185630, 0.00000000 };
Point ( 8164 ) = { 3.35466016, 6.55088053, 0.00000000 };
Point ( 8165 ) = { 3.35656512, 6.54990466, 0.00000000 };
Point ( 8166 ) = { 3.35847068, 6.54892779, 0.00000000 };
Point ( 8167 ) = { 3.36037595, 6.54795037, 0.00000000 };
Point ( 8168 ) = { 3.36228006, 6.54697284, 0.00000000 };
Point ( 8169 ) = { 3.36418389, 6.54599475, 0.00000000 };
Point ( 8170 ) = { 3.36608831, 6.54501566, 0.00000000 };
Point ( 8171 ) = { 3.36799244, 6.54403602, 0.00000000 };
Point ( 8172 ) = { 3.36989542, 6.54305627, 0.00000000 };
Point ( 8173 ) = { 3.37179811, 6.54207597, 0.00000000 };
Point ( 8174 ) = { 3.37370139, 6.54109467, 0.00000000 };
Point ( 8175 ) = { 3.37560438, 6.54011281, 0.00000000 };
Point ( 8176 ) = { 3.37839729, 6.54318936, 0.00000000 };
Point ( 8177 ) = { 3.38119315, 6.54626906, 0.00000000 };
Point ( 8178 ) = { 3.38309677, 6.54528548, 0.00000000 };
Point ( 8179 ) = { 3.38500098, 6.54430089, 0.00000000 };
Point ( 8180 ) = { 3.38690490, 6.54331574, 0.00000000 };
Point ( 8181 ) = { 3.38880767, 6.54233049, 0.00000000 };
Point ( 8182 ) = { 3.39071102, 6.54134424, 0.00000000 };
Point ( 8183 ) = { 3.39261408, 6.54035744, 0.00000000 };
Point ( 8184 ) = { 3.39451599, 6.53937053, 0.00000000 };
Point ( 8185 ) = { 3.39641760, 6.53838307, 0.00000000 };
Point ( 8186 ) = { 3.39551546, 6.53432246, 0.00000000 };
Point ( 8187 ) = { 3.39461420, 6.53026607, 0.00000000 };
Point ( 8188 ) = { 3.39651404, 6.52927813, 0.00000000 };
Point ( 8189 ) = { 3.39841272, 6.52829009, 0.00000000 };
Point ( 8190 ) = { 3.40031111, 6.52730150, 0.00000000 };
Point ( 8191 ) = { 3.40221009, 6.52631190, 0.00000000 };
Point ( 8192 ) = { 3.40410878, 6.52532175, 0.00000000 };
Point ( 8193 ) = { 3.40600631, 6.52433150, 0.00000000 };
Point ( 8194 ) = { 3.40509841, 6.52028113, 0.00000000 };
Point ( 8195 ) = { 3.40419225, 6.51623659, 0.00000000 };
Point ( 8196 ) = { 3.40608800, 6.51524586, 0.00000000 };
Point ( 8197 ) = { 3.40798347, 6.51425458, 0.00000000 };
Point ( 8198 ) = { 3.40987778, 6.51326321, 0.00000000 };
Point ( 8199 ) = { 3.41177268, 6.51227083, 0.00000000 };
Point ( 8200 ) = { 3.41366728, 6.51127789, 0.00000000 };
Point ( 8201 ) = { 3.41556073, 6.51028487, 0.00000000 };
Point ( 8202 ) = { 3.41464839, 6.50624610, 0.00000000 };
Point ( 8203 ) = { 3.41373693, 6.50221152, 0.00000000 };
Point ( 8204 ) = { 3.41562860, 6.50121802, 0.00000000 };
Point ( 8205 ) = { 3.41751999, 6.50022397, 0.00000000 };
Point ( 8206 ) = { 3.41941022, 6.49922982, 0.00000000 };
Point ( 8207 ) = { 3.42130017, 6.49823512, 0.00000000 };
Point ( 8208 ) = { 3.42319068, 6.49723942, 0.00000000 };
Point ( 8209 ) = { 3.42227468, 6.49321012, 0.00000000 };
Point ( 8210 ) = { 3.42135871, 6.48918338, 0.00000000 };
Point ( 8211 ) = { 3.42324573, 6.48818811, 0.00000000 };
Point ( 8212 ) = { 3.42513246, 6.48719230, 0.00000000 };
Point ( 8213 ) = { 3.42421504, 6.48317026, 0.00000000 };
Point ( 8214 ) = { 3.42329850, 6.47915237, 0.00000000 };
Point ( 8215 ) = { 3.42518347, 6.47815609, 0.00000000 };
Point ( 8216 ) = { 3.42426622, 6.47414286, 0.00000000 };
Point ( 8217 ) = { 3.42335070, 6.47013538, 0.00000000 };
Point ( 8218 ) = { 3.42243650, 6.46613180, 0.00000000 };
Point ( 8219 ) = { 3.42152233, 6.46213076, 0.00000000 };
Point ( 8220 ) = { 3.42340235, 6.46113499, 0.00000000 };
Point ( 8221 ) = { 3.42248747, 6.45713857, 0.00000000 };
Point ( 8222 ) = { 3.41878637, 6.45015578, 0.00000000 };
Point ( 8223 ) = { 3.41509143, 6.44318462, 0.00000000 };
Point ( 8224 ) = { 3.41231132, 6.44020242, 0.00000000 };
Point ( 8225 ) = { 3.40953367, 6.43722346, 0.00000000 };
Point ( 8226 ) = { 3.40585639, 6.43028072, 0.00000000 };
Point ( 8227 ) = { 3.40495641, 6.42632118, 0.00000000 };
Point ( 8228 ) = { 3.40405686, 6.42236592, 0.00000000 };
Point ( 8229 ) = { 3.40315734, 6.41841313, 0.00000000 };
Point ( 8230 ) = { 3.40502378, 6.41742316, 0.00000000 };
Point ( 8231 ) = { 3.40412439, 6.41347446, 0.00000000 };
Point ( 8232 ) = { 3.40322670, 6.40953138, 0.00000000 };
Point ( 8233 ) = { 3.40509142, 6.40854094, 0.00000000 };
Point ( 8234 ) = { 3.40695499, 6.40755041, 0.00000000 };
Point ( 8235 ) = { 3.40881827, 6.40655934, 0.00000000 };
Point ( 8236 ) = { 3.41068211, 6.40556727, 0.00000000 };
Point ( 8237 ) = { 3.40978070, 6.40162926, 0.00000000 };
Point ( 8238 ) = { 3.40887930, 6.39769371, 0.00000000 };
Point ( 8239 ) = { 3.41073972, 6.39670208, 0.00000000 };
Point ( 8240 ) = { 3.41259984, 6.39570991, 0.00000000 };
Point ( 8241 ) = { 3.41446053, 6.39471674, 0.00000000 };
Point ( 8242 ) = { 3.41722691, 6.39765753, 0.00000000 };
Point ( 8243 ) = { 3.41999531, 6.40059971, 0.00000000 };
Point ( 8244 ) = { 3.42185657, 6.39960484, 0.00000000 };
Point ( 8245 ) = { 3.42371839, 6.39860898, 0.00000000 };
Point ( 8246 ) = { 3.42557992, 6.39761258, 0.00000000 };
Point ( 8247 ) = { 3.42744031, 6.39661609, 0.00000000 };
Point ( 8248 ) = { 3.42930041, 6.39561906, 0.00000000 };
Point ( 8249 ) = { 3.43116108, 6.39462103, 0.00000000 };
Point ( 8250 ) = { 3.43302145, 6.39362247, 0.00000000 };
Point ( 8251 ) = { 3.43488068, 6.39262381, 0.00000000 };
Point ( 8252 ) = { 3.43673962, 6.39162462, 0.00000000 };
Point ( 8253 ) = { 3.43859912, 6.39062443, 0.00000000 };
Point ( 8254 ) = { 3.44045833, 6.38962370, 0.00000000 };
Point ( 8255 ) = { 3.44323858, 6.39256018, 0.00000000 };
Point ( 8256 ) = { 3.44602256, 6.39550119, 0.00000000 };
Point ( 8257 ) = { 3.44788234, 6.39449876, 0.00000000 };
Point ( 8258 ) = { 3.44974267, 6.39349533, 0.00000000 };
Point ( 8259 ) = { 3.45160272, 6.39249135, 0.00000000 };
Point ( 8260 ) = { 3.45346162, 6.39148730, 0.00000000 };
Point ( 8261 ) = { 3.45532108, 6.39048224, 0.00000000 };
Point ( 8262 ) = { 3.45718024, 6.38947664, 0.00000000 };
Point ( 8263 ) = { 3.45903827, 6.38847096, 0.00000000 };
Point ( 8264 ) = { 3.46089600, 6.38746475, 0.00000000 };
Point ( 8265 ) = { 3.46275429, 6.38645753, 0.00000000 };
Point ( 8266 ) = { 3.46461228, 6.38544977, 0.00000000 };
Point ( 8267 ) = { 3.46646913, 6.38444193, 0.00000000 };
Point ( 8268 ) = { 3.46832569, 6.38343355, 0.00000000 };
Point ( 8269 ) = { 3.47112325, 6.38636755, 0.00000000 };
Point ( 8270 ) = { 3.47392286, 6.38930293, 0.00000000 };
Point ( 8271 ) = { 3.47578168, 6.38829193, 0.00000000 };
Point ( 8272 ) = { 3.47763936, 6.38728084, 0.00000000 };
Point ( 8273 ) = { 3.47949674, 6.38626921, 0.00000000 };
Point ( 8274 ) = { 3.48135468, 6.38525658, 0.00000000 };
Point ( 8275 ) = { 3.48321233, 6.38424341, 0.00000000 };
Point ( 8276 ) = { 3.48601869, 6.38717791, 0.00000000 };
Point ( 8277 ) = { 3.48882882, 6.39011694, 0.00000000 };
Point ( 8278 ) = { 3.49068788, 6.38910159, 0.00000000 };
Point ( 8279 ) = { 3.49254664, 6.38808571, 0.00000000 };
Point ( 8280 ) = { 3.49536141, 6.39102608, 0.00000000 };
Point ( 8281 ) = { 3.49817825, 6.39396784, 0.00000000 };
Point ( 8282 ) = { 3.50003758, 6.39295023, 0.00000000 };
Point ( 8283 ) = { 3.50189746, 6.39193163, 0.00000000 };
Point ( 8284 ) = { 3.50375705, 6.39091248, 0.00000000 };
Point ( 8285 ) = { 3.50561548, 6.38989325, 0.00000000 };
Point ( 8286 ) = { 3.50843867, 6.39283471, 0.00000000 };
Point ( 8287 ) = { 3.51126567, 6.39578071, 0.00000000 };
Point ( 8288 ) = { 3.51312638, 6.39475884, 0.00000000 };
Point ( 8289 ) = { 3.51498679, 6.39373642, 0.00000000 };
Point ( 8290 ) = { 3.51684605, 6.39271393, 0.00000000 };
Point ( 8291 ) = { 3.51870501, 6.39169090, 0.00000000 };
Point ( 8292 ) = { 3.52056452, 6.39066687, 0.00000000 };
Point ( 8293 ) = { 3.52242374, 6.38964229, 0.00000000 };
Point ( 8294 ) = { 3.52428181, 6.38861763, 0.00000000 };
Point ( 8295 ) = { 3.52614043, 6.38759197, 0.00000000 };
Point ( 8296 ) = { 3.52897766, 6.39053414, 0.00000000 };
Point ( 8297 ) = { 3.53181697, 6.39347770, 0.00000000 };
Point ( 8298 ) = { 3.53367615, 6.39245031, 0.00000000 };
Point ( 8299 ) = { 3.53553504, 6.39142239, 0.00000000 };
Point ( 8300 ) = { 3.53739447, 6.39039345, 0.00000000 };
Point ( 8301 ) = { 3.54023931, 6.39333751, 0.00000000 };
Point ( 8302 ) = { 3.54308800, 6.39628614, 0.00000000 };
Point ( 8303 ) = { 3.54494800, 6.39525548, 0.00000000 };
Point ( 8304 ) = { 3.54780010, 6.39820651, 0.00000000 };
Point ( 8305 ) = { 3.55065429, 6.40115895, 0.00000000 };
Point ( 8306 ) = { 3.55251656, 6.40012562, 0.00000000 };
Point ( 8307 ) = { 3.55537502, 6.40307999, 0.00000000 };
Point ( 8308 ) = { 3.55823736, 6.40603895, 0.00000000 };
Point ( 8309 ) = { 3.56110226, 6.40900116, 0.00000000 };
Point ( 8310 ) = { 3.56497536, 6.41597166, 0.00000000 };
Point ( 8311 ) = { 3.56598063, 6.41997949, 0.00000000 };
Point ( 8312 ) = { 3.56698647, 6.42399171, 0.00000000 };
Point ( 8313 ) = { 3.56799328, 6.42800809, 0.00000000 };
Point ( 8314 ) = { 3.56612290, 6.42904593, 0.00000000 };
Point ( 8315 ) = { 3.56425307, 6.43008275, 0.00000000 };
Point ( 8316 ) = { 3.56525895, 6.43410365, 0.00000000 };
Point ( 8317 ) = { 3.56626671, 6.43813034, 0.00000000 };
Point ( 8318 ) = { 3.56439338, 6.43916767, 0.00000000 };
Point ( 8319 ) = { 3.56251976, 6.44020446, 0.00000000 };
Point ( 8320 ) = { 3.56064668, 6.44124023, 0.00000000 };
Point ( 8321 ) = { 3.55877331, 6.44227546, 0.00000000 };
Point ( 8322 ) = { 3.55689878, 6.44331061, 0.00000000 };
Point ( 8323 ) = { 3.55502394, 6.44434522, 0.00000000 };
Point ( 8324 ) = { 3.55314967, 6.44537881, 0.00000000 };
Point ( 8325 ) = { 3.55127423, 6.44641233, 0.00000000 };
Point ( 8326 ) = { 3.54939849, 6.44744530, 0.00000000 };
Point ( 8327 ) = { 3.54752332, 6.44847725, 0.00000000 };
Point ( 8328 ) = { 3.54564784, 6.44950866, 0.00000000 };
Point ( 8329 ) = { 3.54377120, 6.45053999, 0.00000000 };
Point ( 8330 ) = { 3.54189426, 6.45157078, 0.00000000 };
Point ( 8331 ) = { 3.54001789, 6.45260055, 0.00000000 };
Point ( 8332 ) = { 3.53814121, 6.45362978, 0.00000000 };
Point ( 8333 ) = { 3.53913193, 6.45766525, 0.00000000 };
Point ( 8334 ) = { 3.54012361, 6.46170493, 0.00000000 };
Point ( 8335 ) = { 3.54111626, 6.46574880, 0.00000000 };
Point ( 8336 ) = { 3.54399124, 6.46876443, 0.00000000 };
Point ( 8337 ) = { 3.54686925, 6.47178314, 0.00000000 };
Point ( 8338 ) = { 3.54975118, 6.47480656, 0.00000000 };
Point ( 8339 ) = { 3.55163401, 6.47377396, 0.00000000 };
Point ( 8340 ) = { 3.55351655, 6.47274081, 0.00000000 };
Point ( 8341 ) = { 3.55539964, 6.47170664, 0.00000000 };
Point ( 8342 ) = { 3.55828725, 6.47473065, 0.00000000 };
Point ( 8343 ) = { 3.56117702, 6.47775614, 0.00000000 };
Point ( 8344 ) = { 3.56306071, 6.47672021, 0.00000000 };
Point ( 8345 ) = { 3.56494410, 6.47568374, 0.00000000 };
Point ( 8346 ) = { 3.56682806, 6.47464624, 0.00000000 };
Point ( 8347 ) = { 3.56871170, 6.47360820, 0.00000000 };
Point ( 8348 ) = { 3.57059419, 6.47257008, 0.00000000 };
Point ( 8349 ) = { 3.57247724, 6.47153094, 0.00000000 };
Point ( 8350 ) = { 3.57435998, 6.47049125, 0.00000000 };
Point ( 8351 ) = { 3.57624156, 6.46945149, 0.00000000 };
Point ( 8352 ) = { 3.57812283, 6.46841119, 0.00000000 };
Point ( 8353 ) = { 3.58102357, 6.47143220, 0.00000000 };
Point ( 8354 ) = { 3.58392827, 6.47445794, 0.00000000 };
Point ( 8355 ) = { 3.58581186, 6.47341492, 0.00000000 };
Point ( 8356 ) = { 3.58769429, 6.47237183, 0.00000000 };
Point ( 8357 ) = { 3.58957642, 6.47132820, 0.00000000 };
Point ( 8358 ) = { 3.59145910, 6.47028353, 0.00000000 };
Point ( 8359 ) = { 3.59334148, 6.46923832, 0.00000000 };
Point ( 8360 ) = { 3.59522269, 6.46819305, 0.00000000 };
Point ( 8361 ) = { 3.59710360, 6.46714722, 0.00000000 };
Point ( 8362 ) = { 3.59898507, 6.46610037, 0.00000000 };
Point ( 8363 ) = { 3.60086623, 6.46505297, 0.00000000 };
Point ( 8364 ) = { 3.60274623, 6.46400550, 0.00000000 };
Point ( 8365 ) = { 3.60462678, 6.46295701, 0.00000000 };
Point ( 8366 ) = { 3.60650703, 6.46190797, 0.00000000 };
Point ( 8367 ) = { 3.60942492, 6.46492689, 0.00000000 };
Point ( 8368 ) = { 3.61234500, 6.46794730, 0.00000000 };
Point ( 8369 ) = { 3.61422583, 6.46689649, 0.00000000 };
Point ( 8370 ) = { 3.61610723, 6.46584466, 0.00000000 };
Point ( 8371 ) = { 3.61798831, 6.46479227, 0.00000000 };
Point ( 8372 ) = { 3.61986823, 6.46373983, 0.00000000 };
Point ( 8373 ) = { 3.62174785, 6.46268683, 0.00000000 };
Point ( 8374 ) = { 3.62362801, 6.46163281, 0.00000000 };
Point ( 8375 ) = { 3.62550788, 6.46057824, 0.00000000 };
Point ( 8376 ) = { 3.62738657, 6.45952361, 0.00000000 };
Point ( 8377 ) = { 3.62926496, 6.45846843, 0.00000000 };
Point ( 8378 ) = { 3.63114390, 6.45741222, 0.00000000 };
Point ( 8379 ) = { 3.63302253, 6.45635547, 0.00000000 };
Point ( 8380 ) = { 3.63489999, 6.45529865, 0.00000000 };
Point ( 8381 ) = { 3.63783412, 6.45831170, 0.00000000 };
Point ( 8382 ) = { 3.64077228, 6.46132947, 0.00000000 };
Point ( 8383 ) = { 3.64265205, 6.46026992, 0.00000000 };
Point ( 8384 ) = { 3.64453065, 6.45921030, 0.00000000 };
Point ( 8385 ) = { 3.64640895, 6.45815013, 0.00000000 };
Point ( 8386 ) = { 3.64828779, 6.45708893, 0.00000000 };
Point ( 8387 ) = { 3.65016633, 6.45602719, 0.00000000 };
Point ( 8388 ) = { 3.65204370, 6.45496539, 0.00000000 };
Point ( 8389 ) = { 3.65392076, 6.45390304, 0.00000000 };
Point ( 8390 ) = { 3.65579837, 6.45283965, 0.00000000 };
Point ( 8391 ) = { 3.65767567, 6.45177572, 0.00000000 };
Point ( 8392 ) = { 3.65955180, 6.45071174, 0.00000000 };
Point ( 8393 ) = { 3.66142763, 6.44964720, 0.00000000 };
Point ( 8394 ) = { 3.66330400, 6.44858164, 0.00000000 };
Point ( 8395 ) = { 3.66518006, 6.44751552, 0.00000000 };
Point ( 8396 ) = { 3.66813230, 6.45052551, 0.00000000 };
Point ( 8397 ) = { 3.67108674, 6.45353698, 0.00000000 };
Point ( 8398 ) = { 3.67296425, 6.45246860, 0.00000000 };
Point ( 8399 ) = { 3.67484144, 6.45139968, 0.00000000 };
Point ( 8400 ) = { 3.67671746, 6.45033070, 0.00000000 };
Point ( 8401 ) = { 3.67859317, 6.44926117, 0.00000000 };
Point ( 8402 ) = { 3.68046943, 6.44819061, 0.00000000 };
Point ( 8403 ) = { 3.68234538, 6.44711951, 0.00000000 };
Point ( 8404 ) = { 3.68422016, 6.44604834, 0.00000000 };
Point ( 8405 ) = { 3.68609462, 6.44497664, 0.00000000 };
Point ( 8406 ) = { 3.68796963, 6.44390389, 0.00000000 };
Point ( 8407 ) = { 3.68984433, 6.44283060, 0.00000000 };
Point ( 8408 ) = { 3.69171786, 6.44175726, 0.00000000 };
Point ( 8409 ) = { 3.69359108, 6.44068337, 0.00000000 };
Point ( 8410 ) = { 3.69546484, 6.43960845, 0.00000000 };
Point ( 8411 ) = { 3.69843423, 6.44261157, 0.00000000 };
Point ( 8412 ) = { 3.70140769, 6.44561942, 0.00000000 };
Point ( 8413 ) = { 3.70328203, 6.44454271, 0.00000000 };
Point ( 8414 ) = { 3.70515692, 6.44346497, 0.00000000 };
Point ( 8415 ) = { 3.70703149, 6.44238668, 0.00000000 };
Point ( 8416 ) = { 3.70890489, 6.44130834, 0.00000000 };
Point ( 8417 ) = { 3.71077797, 6.44022945, 0.00000000 };
Point ( 8418 ) = { 3.71265160, 6.43914953, 0.00000000 };
Point ( 8419 ) = { 3.71452492, 6.43806906, 0.00000000 };
Point ( 8420 ) = { 3.71639706, 6.43698854, 0.00000000 };
Point ( 8421 ) = { 3.71826889, 6.43590747, 0.00000000 };
Point ( 8422 ) = { 3.72014127, 6.43482537, 0.00000000 };
Point ( 8423 ) = { 3.72201332, 6.43374272, 0.00000000 };
Point ( 8424 ) = { 3.72388421, 6.43266002, 0.00000000 };
Point ( 8425 ) = { 3.72277039, 6.42857995, 0.00000000 };
Point ( 8426 ) = { 3.72165861, 6.42450578, 0.00000000 };
Point ( 8427 ) = { 3.72352767, 6.42342269, 0.00000000 };
Point ( 8428 ) = { 3.72539641, 6.42233906, 0.00000000 };
Point ( 8429 ) = { 3.72726398, 6.42125538, 0.00000000 };
Point ( 8430 ) = { 3.72913209, 6.42017066, 0.00000000 };
Point ( 8431 ) = { 3.73099988, 6.41908539, 0.00000000 };
Point ( 8432 ) = { 3.73286650, 6.41800008, 0.00000000 };
Point ( 8433 ) = { 3.73473281, 6.41691423, 0.00000000 };
Point ( 8434 ) = { 3.73659965, 6.41582734, 0.00000000 };
Point ( 8435 ) = { 3.73846618, 6.41473990, 0.00000000 };
Point ( 8436 ) = { 3.74033154, 6.41365242, 0.00000000 };
Point ( 8437 ) = { 3.74219658, 6.41256440, 0.00000000 };
Point ( 8438 ) = { 3.74406216, 6.41147533, 0.00000000 };
Point ( 8439 ) = { 3.74592743, 6.41038572, 0.00000000 };
Point ( 8440 ) = { 3.74779152, 6.40929607, 0.00000000 };
Point ( 8441 ) = { 3.74965529, 6.40820588, 0.00000000 };
Point ( 8442 ) = { 3.75264990, 6.41118385, 0.00000000 };
Point ( 8443 ) = { 3.75564863, 6.41416650, 0.00000000 };
Point ( 8444 ) = { 3.75751468, 6.41307352, 0.00000000 };
Point ( 8445 ) = { 3.75937955, 6.41198050, 0.00000000 };
Point ( 8446 ) = { 3.76124496, 6.41088644, 0.00000000 };
Point ( 8447 ) = { 3.76311005, 6.40979183, 0.00000000 };
Point ( 8448 ) = { 3.76497397, 6.40869718, 0.00000000 };
Point ( 8449 ) = { 3.76683757, 6.40760199, 0.00000000 };
Point ( 8450 ) = { 3.76870170, 6.40650576, 0.00000000 };
Point ( 8451 ) = { 3.77056552, 6.40540898, 0.00000000 };
Point ( 8452 ) = { 3.77242816, 6.40431216, 0.00000000 };
Point ( 8453 ) = { 3.77429049, 6.40321481, 0.00000000 };
Point ( 8454 ) = { 3.77615335, 6.40211640, 0.00000000 };
Point ( 8455 ) = { 3.77801588, 6.40101746, 0.00000000 };
Point ( 8456 ) = { 3.77987725, 6.39991848, 0.00000000 };
Point ( 8457 ) = { 3.78289001, 6.40289309, 0.00000000 };
Point ( 8458 ) = { 3.78590501, 6.40586916, 0.00000000 };
Point ( 8459 ) = { 3.78776864, 6.40476738, 0.00000000 };
Point ( 8460 ) = { 3.78963195, 6.40366506, 0.00000000 };
Point ( 8461 ) = { 3.79149408, 6.40256269, 0.00000000 };
Point ( 8462 ) = { 3.79335675, 6.40145929, 0.00000000 };
Point ( 8463 ) = { 3.79521910, 6.40035534, 0.00000000 };
Point ( 8464 ) = { 3.79708027, 6.39925135, 0.00000000 };
Point ( 8465 ) = { 3.79894112, 6.39814683, 0.00000000 };
Point ( 8466 ) = { 3.80080250, 6.39704125, 0.00000000 };
Point ( 8467 ) = { 3.80266356, 6.39593514, 0.00000000 };
Point ( 8468 ) = { 3.80568956, 6.39890637, 0.00000000 };
Point ( 8469 ) = { 3.80871973, 6.40188229, 0.00000000 };
Point ( 8470 ) = { 3.81058134, 6.40077438, 0.00000000 };
Point ( 8471 ) = { 3.81244349, 6.39966542, 0.00000000 };
Point ( 8472 ) = { 3.81547904, 6.40264240, 0.00000000 };
Point ( 8473 ) = { 3.81851783, 6.40562247, 0.00000000 };
Point ( 8474 ) = { 3.82038053, 6.40451171, 0.00000000 };
Point ( 8475 ) = { 3.82224291, 6.40340041, 0.00000000 };
Point ( 8476 ) = { 3.82410582, 6.40228805, 0.00000000 };
Point ( 8477 ) = { 3.82715044, 6.40526855, 0.00000000 };
Point ( 8478 ) = { 3.83019734, 6.40825052, 0.00000000 };
Point ( 8479 ) = { 3.83206080, 6.40713636, 0.00000000 };
Point ( 8480 ) = { 3.83392480, 6.40602115, 0.00000000 };
Point ( 8481 ) = { 3.83578847, 6.40490540, 0.00000000 };
Point ( 8482 ) = { 3.83765097, 6.40378961, 0.00000000 };
Point ( 8483 ) = { 3.83951314, 6.40267329, 0.00000000 };
Point ( 8484 ) = { 3.84137583, 6.40155591, 0.00000000 };
Point ( 8485 ) = { 3.84323821, 6.40043799, 0.00000000 };
Point ( 8486 ) = { 3.84509940, 6.39932004, 0.00000000 };
Point ( 8487 ) = { 3.84696027, 6.39820155, 0.00000000 };
Point ( 8488 ) = { 3.84882167, 6.39708200, 0.00000000 };
Point ( 8489 ) = { 3.85068274, 6.39596192, 0.00000000 };
Point ( 8490 ) = { 3.85254263, 6.39484180, 0.00000000 };
Point ( 8491 ) = { 3.85440220, 6.39372114, 0.00000000 };
Point ( 8492 ) = { 3.85746360, 6.39669465, 0.00000000 };
Point ( 8493 ) = { 3.86052827, 6.39967124, 0.00000000 };
Point ( 8494 ) = { 3.86239010, 6.39854775, 0.00000000 };
Point ( 8495 ) = { 3.86425074, 6.39742423, 0.00000000 };
Point ( 8496 ) = { 3.86611191, 6.39629965, 0.00000000 };
Point ( 8497 ) = { 3.86797275, 6.39517454, 0.00000000 };
Point ( 8498 ) = { 3.86983242, 6.39404939, 0.00000000 };
Point ( 8499 ) = { 3.87169175, 6.39292371, 0.00000000 };
Point ( 8500 ) = { 3.87355161, 6.39179697, 0.00000000 };
Point ( 8501 ) = { 3.87233955, 6.38770023, 0.00000000 };
Point ( 8502 ) = { 3.87112871, 6.38360783, 0.00000000 };
Point ( 8503 ) = { 3.87298501, 6.38248176, 0.00000000 };
Point ( 8504 ) = { 3.87484098, 6.38135516, 0.00000000 };
Point ( 8505 ) = { 3.87669748, 6.38022751, 0.00000000 };
Point ( 8506 ) = { 3.87855364, 6.37909931, 0.00000000 };
Point ( 8507 ) = { 3.88040863, 6.37797109, 0.00000000 };
Point ( 8508 ) = { 3.88226329, 6.37684233, 0.00000000 };
Point ( 8509 ) = { 3.88411847, 6.37571252, 0.00000000 };
Point ( 8510 ) = { 3.88597332, 6.37458216, 0.00000000 };
Point ( 8511 ) = { 3.88782699, 6.37345178, 0.00000000 };
Point ( 8512 ) = { 3.88968119, 6.37232035, 0.00000000 };
Point ( 8513 ) = { 3.89153505, 6.37118838, 0.00000000 };
Point ( 8514 ) = { 3.89338774, 6.37005638, 0.00000000 };
Point ( 8515 ) = { 3.89524009, 6.36892385, 0.00000000 };
Point ( 8516 ) = { 3.89709297, 6.36779026, 0.00000000 };
Point ( 8517 ) = { 3.89894552, 6.36665613, 0.00000000 };
Point ( 8518 ) = { 3.90079688, 6.36552198, 0.00000000 };
Point ( 8519 ) = { 3.90264792, 6.36438729, 0.00000000 };
Point ( 8520 ) = { 3.90449948, 6.36325154, 0.00000000 };
Point ( 8521 ) = { 3.90635070, 6.36211526, 0.00000000 };
Point ( 8522 ) = { 3.90820075, 6.36097895, 0.00000000 };
Point ( 8523 ) = { 3.91005047, 6.35984211, 0.00000000 };
Point ( 8524 ) = { 3.91313771, 6.36278879, 0.00000000 };
Point ( 8525 ) = { 3.91622824, 6.36573852, 0.00000000 };
Point ( 8526 ) = { 3.91808018, 6.36459883, 0.00000000 };
Point ( 8527 ) = { 3.91993095, 6.36345911, 0.00000000 };
Point ( 8528 ) = { 3.92178224, 6.36231834, 0.00000000 };
Point ( 8529 ) = { 3.92363319, 6.36117703, 0.00000000 };
Point ( 8530 ) = { 3.92548296, 6.36003570, 0.00000000 };
Point ( 8531 ) = { 3.92733241, 6.35889383, 0.00000000 };
Point ( 8532 ) = { 3.93043138, 6.36184122, 0.00000000 };
Point ( 8533 ) = { 3.93353466, 6.36479329, 0.00000000 };
Point ( 8534 ) = { 3.93538633, 6.36364855, 0.00000000 };
Point ( 8535 ) = { 3.93723682, 6.36250381, 0.00000000 };
Point ( 8536 ) = { 3.94034471, 6.36545740, 0.00000000 };
Point ( 8537 ) = { 3.94345592, 6.36841406, 0.00000000 };
Point ( 8538 ) = { 3.94530864, 6.36726644, 0.00000000 };
Point ( 8539 ) = { 3.94716103, 6.36611828, 0.00000000 };
Point ( 8540 ) = { 3.94901224, 6.36497011, 0.00000000 };
Point ( 8541 ) = { 3.95086312, 6.36382140, 0.00000000 };
Point ( 8542 ) = { 3.95271451, 6.36267162, 0.00000000 };
Point ( 8543 ) = { 3.95456556, 6.36152131, 0.00000000 };
Point ( 8544 ) = { 3.95641544, 6.36037099, 0.00000000 };
Point ( 8545 ) = { 3.95826582, 6.35921960, 0.00000000 };
Point ( 8546 ) = { 3.96011587, 6.35806767, 0.00000000 };
Point ( 8547 ) = { 3.96196474, 6.35691573, 0.00000000 };
Point ( 8548 ) = { 3.96381327, 6.35576325, 0.00000000 };
Point ( 8549 ) = { 3.96566231, 6.35460971, 0.00000000 };
Point ( 8550 ) = { 3.96751102, 6.35345563, 0.00000000 };
Point ( 8551 ) = { 3.96935855, 6.35230154, 0.00000000 };
Point ( 8552 ) = { 3.96808166, 6.34820386, 0.00000000 };
Point ( 8553 ) = { 3.96680606, 6.34411051, 0.00000000 };
Point ( 8554 ) = { 3.96865171, 6.34295610, 0.00000000 };
Point ( 8555 ) = { 3.97049703, 6.34180115, 0.00000000 };
Point ( 8556 ) = { 3.97234117, 6.34064619, 0.00000000 };
Point ( 8557 ) = { 3.97418497, 6.33949070, 0.00000000 };
Point ( 8558 ) = { 3.97602928, 6.33833414, 0.00000000 };
Point ( 8559 ) = { 3.97787325, 6.33717705, 0.00000000 };
Point ( 8560 ) = { 3.97659180, 6.33309026, 0.00000000 };
Point ( 8561 ) = { 3.97531265, 6.32900940, 0.00000000 };
Point ( 8562 ) = { 3.97715391, 6.32785251, 0.00000000 };
Point ( 8563 ) = { 3.97899483, 6.32669509, 0.00000000 };
Point ( 8564 ) = { 3.98083457, 6.32553766, 0.00000000 };
Point ( 8565 ) = { 3.98267398, 6.32437970, 0.00000000 };
Point ( 8566 ) = { 3.98451389, 6.32322067, 0.00000000 };
Point ( 8567 ) = { 3.98635346, 6.32206111, 0.00000000 };
Point ( 8568 ) = { 3.98819186, 6.32090154, 0.00000000 };
Point ( 8569 ) = { 3.99002992, 6.31974144, 0.00000000 };
Point ( 8570 ) = { 3.99186848, 6.31858027, 0.00000000 };
Point ( 8571 ) = { 3.99370670, 6.31741856, 0.00000000 };
Point ( 8572 ) = { 3.99554375, 6.31625686, 0.00000000 };
Point ( 8573 ) = { 3.99738046, 6.31509462, 0.00000000 };
Point ( 8574 ) = { 3.99921767, 6.31393131, 0.00000000 };
Point ( 8575 ) = { 4.00105454, 6.31276747, 0.00000000 };
Point ( 8576 ) = { 4.00289023, 6.31160363, 0.00000000 };
Point ( 8577 ) = { 4.00472642, 6.31043872, 0.00000000 };
Point ( 8578 ) = { 4.00786117, 6.31334803, 0.00000000 };
Point ( 8579 ) = { 4.01100029, 6.31626196, 0.00000000 };
Point ( 8580 ) = { 4.01283699, 6.31509523, 0.00000000 };
Point ( 8581 ) = { 4.01467336, 6.31392796, 0.00000000 };
Point ( 8582 ) = { 4.01651023, 6.31275962, 0.00000000 };
Point ( 8583 ) = { 4.01834676, 6.31159075, 0.00000000 };
Point ( 8584 ) = { 4.02018211, 6.31042188, 0.00000000 };
Point ( 8585 ) = { 4.02201712, 6.30925247, 0.00000000 };
Point ( 8586 ) = { 4.02385263, 6.30808200, 0.00000000 };
Point ( 8587 ) = { 4.02568780, 6.30691099, 0.00000000 };
Point ( 8588 ) = { 4.02752179, 6.30573998, 0.00000000 };
Point ( 8589 ) = { 4.02935543, 6.30456845, 0.00000000 };
Point ( 8590 ) = { 4.03118958, 6.30339584, 0.00000000 };
Point ( 8591 ) = { 4.03302338, 6.30222269, 0.00000000 };
Point ( 8592 ) = { 4.03485601, 6.30104955, 0.00000000 };
Point ( 8593 ) = { 4.03668913, 6.29987534, 0.00000000 };
Point ( 8594 ) = { 4.03852191, 6.29870060, 0.00000000 };
Point ( 8595 ) = { 4.04035351, 6.29752586, 0.00000000 };
Point ( 8596 ) = { 4.04218477, 6.29635059, 0.00000000 };
Point ( 8597 ) = { 4.04401652, 6.29517425, 0.00000000 };
Point ( 8598 ) = { 4.04584793, 6.29399738, 0.00000000 };
Point ( 8599 ) = { 4.04767816, 6.29282051, 0.00000000 };
Point ( 8600 ) = { 4.04635162, 6.28874814, 0.00000000 };
Point ( 8601 ) = { 4.04502744, 6.28468166, 0.00000000 };
Point ( 8602 ) = { 4.04685580, 6.28350449, 0.00000000 };
Point ( 8603 ) = { 4.04868381, 6.28232679, 0.00000000 };
Point ( 8604 ) = { 4.05051065, 6.28114910, 0.00000000 };
Point ( 8605 ) = { 4.05233715, 6.27997088, 0.00000000 };
Point ( 8606 ) = { 4.05416413, 6.27879158, 0.00000000 };
Point ( 8607 ) = { 4.05599078, 6.27761176, 0.00000000 };
Point ( 8608 ) = { 4.05914870, 6.28049571, 0.00000000 };
Point ( 8609 ) = { 4.06231103, 6.28338425, 0.00000000 };
Point ( 8610 ) = { 4.06413901, 6.28220205, 0.00000000 };
Point ( 8611 ) = { 4.06596664, 6.28101932, 0.00000000 };
Point ( 8612 ) = { 4.06779310, 6.27983660, 0.00000000 };
Point ( 8613 ) = { 4.06961921, 6.27865335, 0.00000000 };
Point ( 8614 ) = { 4.07144582, 6.27746903, 0.00000000 };
Point ( 8615 ) = { 4.07327208, 6.27628418, 0.00000000 };
Point ( 8616 ) = { 4.07644282, 6.27917019, 0.00000000 };
Point ( 8617 ) = { 4.07961694, 6.28205920, 0.00000000 };
Point ( 8618 ) = { 4.08144370, 6.28087251, 0.00000000 };
Point ( 8619 ) = { 4.08327095, 6.27968475, 0.00000000 };
Point ( 8620 ) = { 4.08509786, 6.27849645, 0.00000000 };
Point ( 8621 ) = { 4.08692358, 6.27730817, 0.00000000 };
Point ( 8622 ) = { 4.08874895, 6.27611936, 0.00000000 };
Point ( 8623 ) = { 4.09057482, 6.27492947, 0.00000000 };
Point ( 8624 ) = { 4.09240034, 6.27373905, 0.00000000 };
Point ( 8625 ) = { 4.09104384, 6.26966703, 0.00000000 };
Point ( 8626 ) = { 4.08968871, 6.26559932, 0.00000000 };
Point ( 8627 ) = { 4.09151151, 6.26440915, 0.00000000 };
Point ( 8628 ) = { 4.09333397, 6.26321846, 0.00000000 };
Point ( 8629 ) = { 4.09515525, 6.26202779, 0.00000000 };
Point ( 8630 ) = { 4.09697618, 6.26083658, 0.00000000 };
Point ( 8631 ) = { 4.09879760, 6.25964430, 0.00000000 };
Point ( 8632 ) = { 4.09743835, 6.25558259, 0.00000000 };
Point ( 8633 ) = { 4.09608150, 6.25152676, 0.00000000 };
Point ( 8634 ) = { 4.09789938, 6.25033529, 0.00000000 };
Point ( 8635 ) = { 4.09971691, 6.24914328, 0.00000000 };
Point ( 8636 ) = { 4.10153493, 6.24795021, 0.00000000 };
Point ( 8637 ) = { 4.10335260, 6.24675660, 0.00000000 };
Point ( 8638 ) = { 4.10653225, 6.24961659, 0.00000000 };
Point ( 8639 ) = { 4.10971632, 6.25248113, 0.00000000 };
Point ( 8640 ) = { 4.11153448, 6.25128568, 0.00000000 };
Point ( 8641 ) = { 4.11335312, 6.25008917, 0.00000000 };
Point ( 8642 ) = { 4.11517141, 6.24889212, 0.00000000 };
Point ( 8643 ) = { 4.11698852, 6.24769509, 0.00000000 };
Point ( 8644 ) = { 4.11880612, 6.24649699, 0.00000000 };
Point ( 8645 ) = { 4.12062336, 6.24529836, 0.00000000 };
Point ( 8646 ) = { 4.12381584, 6.24816031, 0.00000000 };
Point ( 8647 ) = { 4.12701173, 6.25102523, 0.00000000 };
Point ( 8648 ) = { 4.12882946, 6.24982476, 0.00000000 };
Point ( 8649 ) = { 4.13064767, 6.24862321, 0.00000000 };
Point ( 8650 ) = { 4.13246554, 6.24742113, 0.00000000 };
Point ( 8651 ) = { 4.13428222, 6.24621908, 0.00000000 };
Point ( 8652 ) = { 4.13609855, 6.24501649, 0.00000000 };
Point ( 8653 ) = { 4.13791537, 6.24381283, 0.00000000 };
Point ( 8654 ) = { 4.13973183, 6.24260863, 0.00000000 };
Point ( 8655 ) = { 4.14154711, 6.24140447, 0.00000000 };
Point ( 8656 ) = { 4.14336205, 6.24019977, 0.00000000 };
Point ( 8657 ) = { 4.14656926, 6.24305901, 0.00000000 };
Point ( 8658 ) = { 4.14977885, 6.24591964, 0.00000000 };
Point ( 8659 ) = { 4.15159592, 6.24471199, 0.00000000 };
Point ( 8660 ) = { 4.15341182, 6.24350437, 0.00000000 };
Point ( 8661 ) = { 4.15522819, 6.24229567, 0.00000000 };
Point ( 8662 ) = { 4.15704421, 6.24108644, 0.00000000 };
Point ( 8663 ) = { 4.15885905, 6.23987724, 0.00000000 };
Point ( 8664 ) = { 4.16067354, 6.23866751, 0.00000000 };
Point ( 8665 ) = { 4.16248851, 6.23745670, 0.00000000 };
Point ( 8666 ) = { 4.16430312, 6.23624535, 0.00000000 };
Point ( 8667 ) = { 4.16611655, 6.23503404, 0.00000000 };
Point ( 8668 ) = { 4.16792963, 6.23382220, 0.00000000 };
Point ( 8669 ) = { 4.16974319, 6.23260927, 0.00000000 };
Point ( 8670 ) = { 4.16833684, 6.22854641, 0.00000000 };
Point ( 8671 ) = { 4.16693085, 6.22448628, 0.00000000 };
Point ( 8672 ) = { 4.16874087, 6.22327420, 0.00000000 };
Point ( 8673 ) = { 4.17055053, 6.22206160, 0.00000000 };
Point ( 8674 ) = { 4.17236066, 6.22084791, 0.00000000 };
Point ( 8675 ) = { 4.17417044, 6.21963370, 0.00000000 };
Point ( 8676 ) = { 4.17597904, 6.21841951, 0.00000000 };
Point ( 8677 ) = { 4.17778812, 6.21720425, 0.00000000 };
Point ( 8678 ) = { 4.17959684, 6.21598846, 0.00000000 };
Point ( 8679 ) = { 4.18140438, 6.21477269, 0.00000000 };
Point ( 8680 ) = { 4.18321156, 6.21355641, 0.00000000 };
Point ( 8681 ) = { 4.18501922, 6.21233904, 0.00000000 };
Point ( 8682 ) = { 4.18682653, 6.21112114, 0.00000000 };
Point ( 8683 ) = { 4.18863265, 6.20990328, 0.00000000 };
Point ( 8684 ) = { 4.19043842, 6.20868489, 0.00000000 };
Point ( 8685 ) = { 4.19224466, 6.20746542, 0.00000000 };
Point ( 8686 ) = { 4.19405055, 6.20624542, 0.00000000 };
Point ( 8687 ) = { 4.19585525, 6.20502545, 0.00000000 };
Point ( 8688 ) = { 4.19443142, 6.20097648, 0.00000000 };
Point ( 8689 ) = { 4.19300904, 6.19693180, 0.00000000 };
Point ( 8690 ) = { 4.19481186, 6.19571158, 0.00000000 };
Point ( 8691 ) = { 4.19661432, 6.19449083, 0.00000000 };
Point ( 8692 ) = { 4.19841561, 6.19327012, 0.00000000 };
Point ( 8693 ) = { 4.20021737, 6.19204833, 0.00000000 };
Point ( 8694 ) = { 4.19879213, 6.18800931, 0.00000000 };
Point ( 8695 ) = { 4.19736941, 6.18397612, 0.00000000 };
Point ( 8696 ) = { 4.19916764, 6.18275519, 0.00000000 };
Point ( 8697 ) = { 4.19774476, 6.17872696, 0.00000000 };
Point ( 8698 ) = { 4.19632333, 6.17470298, 0.00000000 };
Point ( 8699 ) = { 4.19811968, 6.17348180, 0.00000000 };
Point ( 8700 ) = { 4.19669893, 6.16946220, 0.00000000 };
Point ( 8701 ) = { 4.19527855, 6.16544528, 0.00000000 };
Point ( 8702 ) = { 4.19707139, 6.16422496, 0.00000000 };
Point ( 8703 ) = { 4.19886387, 6.16300412, 0.00000000 };
Point ( 8704 ) = { 4.20065682, 6.16178220, 0.00000000 };
Point ( 8705 ) = { 4.20244942, 6.16055976, 0.00000000 };
Point ( 8706 ) = { 4.20102539, 6.15654901, 0.00000000 };
Point ( 8707 ) = { 4.19960280, 6.15254250, 0.00000000 };
Point ( 8708 ) = { 4.20139189, 6.15132092, 0.00000000 };
Point ( 8709 ) = { 4.20318144, 6.15009826, 0.00000000 };
Point ( 8710 ) = { 4.20497064, 6.14887508, 0.00000000 };
Point ( 8711 ) = { 4.20675866, 6.14765195, 0.00000000 };
Point ( 8712 ) = { 4.20854714, 6.14642773, 0.00000000 };
Point ( 8713 ) = { 4.21033527, 6.14520299, 0.00000000 };
Point ( 8714 ) = { 4.21212222, 6.14397829, 0.00000000 };
Point ( 8715 ) = { 4.21390882, 6.14275307, 0.00000000 };
Point ( 8716 ) = { 4.21569587, 6.14152678, 0.00000000 };
Point ( 8717 ) = { 4.21748258, 6.14029996, 0.00000000 };
Point ( 8718 ) = { 4.21926810, 6.13907318, 0.00000000 };
Point ( 8719 ) = { 4.22105327, 6.13784589, 0.00000000 };
Point ( 8720 ) = { 4.22427622, 6.14061890, 0.00000000 };
Point ( 8721 ) = { 4.22750260, 6.14339478, 0.00000000 };
Point ( 8722 ) = { 4.22928984, 6.14216453, 0.00000000 };
Point ( 8723 ) = { 4.23107591, 6.14093432, 0.00000000 };
Point ( 8724 ) = { 4.23286162, 6.13970359, 0.00000000 };
Point ( 8725 ) = { 4.23464779, 6.13847177, 0.00000000 };
Point ( 8726 ) = { 4.23643360, 6.13723944, 0.00000000 };
Point ( 8727 ) = { 4.23821824, 6.13600716, 0.00000000 };
Point ( 8728 ) = { 4.24000333, 6.13477378, 0.00000000 };
Point ( 8729 ) = { 4.24178806, 6.13353989, 0.00000000 };
Point ( 8730 ) = { 4.24357162, 6.13230605, 0.00000000 };
Point ( 8731 ) = { 4.24535482, 6.13107169, 0.00000000 };
Point ( 8732 ) = { 4.24713848, 6.12983624, 0.00000000 };
Point ( 8733 ) = { 4.24892178, 6.12860027, 0.00000000 };
Point ( 8734 ) = { 4.25070390, 6.12736436, 0.00000000 };
Point ( 8735 ) = { 4.25248567, 6.12612792, 0.00000000 };
Point ( 8736 ) = { 4.25426789, 6.12489040, 0.00000000 };
Point ( 8737 ) = { 4.25604974, 6.12365236, 0.00000000 };
Point ( 8738 ) = { 4.25783043, 6.12241437, 0.00000000 };
Point ( 8739 ) = { 4.25961075, 6.12117586, 0.00000000 };
Point ( 8740 ) = { 4.26139153, 6.11993626, 0.00000000 };
Point ( 8741 ) = { 4.26317195, 6.11869615, 0.00000000 };
Point ( 8742 ) = { 4.26495119, 6.11745609, 0.00000000 };
Point ( 8743 ) = { 4.26348681, 6.11345976, 0.00000000 };
Point ( 8744 ) = { 4.26202391, 6.10946766, 0.00000000 };
Point ( 8745 ) = { 4.26380128, 6.10822736, 0.00000000 };
Point ( 8746 ) = { 4.26557748, 6.10698711, 0.00000000 };
Point ( 8747 ) = { 4.26735332, 6.10574635, 0.00000000 };
Point ( 8748 ) = { 4.26912961, 6.10450451, 0.00000000 };
Point ( 8749 ) = { 4.27090553, 6.10326214, 0.00000000 };
Point ( 8750 ) = { 4.27268029, 6.10201983, 0.00000000 };
Point ( 8751 ) = { 4.27445468, 6.10077701, 0.00000000 };
Point ( 8752 ) = { 4.27622952, 6.09953309, 0.00000000 };
Point ( 8753 ) = { 4.27800400, 6.09828866, 0.00000000 };
Point ( 8754 ) = { 4.27977731, 6.09704429, 0.00000000 };
Point ( 8755 ) = { 4.28155025, 6.09579940, 0.00000000 };
Point ( 8756 ) = { 4.28332364, 6.09455342, 0.00000000 };
Point ( 8757 ) = { 4.28509667, 6.09330693, 0.00000000 };
Point ( 8758 ) = { 4.28686853, 6.09206049, 0.00000000 };
Point ( 8759 ) = { 4.28864084, 6.09081297, 0.00000000 };
Point ( 8760 ) = { 4.29041278, 6.08956493, 0.00000000 };
Point ( 8761 ) = { 4.29218355, 6.08831695, 0.00000000 };
Point ( 8762 ) = { 4.29395395, 6.08706845, 0.00000000 };
Point ( 8763 ) = { 4.29720975, 6.08980283, 0.00000000 };
Point ( 8764 ) = { 4.30046900, 6.09254003, 0.00000000 };
Point ( 8765 ) = { 4.30224144, 6.09128855, 0.00000000 };
Point ( 8766 ) = { 4.30401271, 6.09003713, 0.00000000 };
Point ( 8767 ) = { 4.30578362, 6.08878519, 0.00000000 };
Point ( 8768 ) = { 4.30755497, 6.08753216, 0.00000000 };
Point ( 8769 ) = { 4.30932596, 6.08627862, 0.00000000 };
Point ( 8770 ) = { 4.31109577, 6.08502513, 0.00000000 };
Point ( 8771 ) = { 4.31286522, 6.08377114, 0.00000000 };
Point ( 8772 ) = { 4.31463511, 6.08251605, 0.00000000 };
Point ( 8773 ) = { 4.31640464, 6.08126045, 0.00000000 };
Point ( 8774 ) = { 4.31817299, 6.08000491, 0.00000000 };
Point ( 8775 ) = { 4.31994179, 6.07874827, 0.00000000 };
Point ( 8776 ) = { 4.32171022, 6.07749113, 0.00000000 };
Point ( 8777 ) = { 4.32347747, 6.07623404, 0.00000000 };
Point ( 8778 ) = { 4.32524436, 6.07497645, 0.00000000 };
Point ( 8779 ) = { 4.32374053, 6.07099480, 0.00000000 };
Point ( 8780 ) = { 4.32223823, 6.06701735, 0.00000000 };
Point ( 8781 ) = { 4.32400324, 6.06575954, 0.00000000 };
Point ( 8782 ) = { 4.32576709, 6.06450179, 0.00000000 };
Point ( 8783 ) = { 4.32753057, 6.06324353, 0.00000000 };
Point ( 8784 ) = { 4.32929449, 6.06198417, 0.00000000 };
Point ( 8785 ) = { 4.33105804, 6.06072431, 0.00000000 };
Point ( 8786 ) = { 4.33282042, 6.05946450, 0.00000000 };
Point ( 8787 ) = { 4.33458243, 6.05820419, 0.00000000 };
Point ( 8788 ) = { 4.33634488, 6.05694278, 0.00000000 };
Point ( 8789 ) = { 4.33810697, 6.05568087, 0.00000000 };
Point ( 8790 ) = { 4.33986788, 6.05441902, 0.00000000 };
Point ( 8791 ) = { 4.34162923, 6.05315607, 0.00000000 };
Point ( 8792 ) = { 4.34339022, 6.05189262, 0.00000000 };
Point ( 8793 ) = { 4.34515003, 6.05062923, 0.00000000 };
Point ( 8794 ) = { 4.34842837, 6.05333634, 0.00000000 };
Point ( 8795 ) = { 4.35171019, 6.05604624, 0.00000000 };
Point ( 8796 ) = { 4.35347202, 6.05477985, 0.00000000 };
Point ( 8797 ) = { 4.35523347, 6.05351295, 0.00000000 };
Point ( 8798 ) = { 4.35699375, 6.05224612, 0.00000000 };
Point ( 8799 ) = { 4.35875367, 6.05097877, 0.00000000 };
Point ( 8800 ) = { 4.36051402, 6.04971033, 0.00000000 };
Point ( 8801 ) = { 4.36380367, 6.05241797, 0.00000000 };
Point ( 8802 ) = { 4.36709572, 6.05512687, 0.00000000 };
Point ( 8803 ) = { 4.36885647, 6.05385658, 0.00000000 };
Point ( 8804 ) = { 4.37061685, 6.05258579, 0.00000000 };
Point ( 8805 ) = { 4.37237767, 6.05131390, 0.00000000 };
Point ( 8806 ) = { 4.37413811, 6.05004150, 0.00000000 };
Point ( 8807 ) = { 4.37589738, 6.04876917, 0.00000000 };
Point ( 8808 ) = { 4.37765709, 6.04749574, 0.00000000 };
Point ( 8809 ) = { 4.37941643, 6.04622181, 0.00000000 };
Point ( 8810 ) = { 4.38117459, 6.04494794, 0.00000000 };
Point ( 8811 ) = { 4.38293237, 6.04367356, 0.00000000 };
Point ( 8812 ) = { 4.38469060, 6.04239809, 0.00000000 };
Point ( 8813 ) = { 4.38799402, 6.04510020, 0.00000000 };
Point ( 8814 ) = { 4.39130096, 6.04780510, 0.00000000 };
Point ( 8815 ) = { 4.39305958, 6.04652777, 0.00000000 };
Point ( 8816 ) = { 4.39481782, 6.04524994, 0.00000000 };
Point ( 8817 ) = { 4.39657651, 6.04397101, 0.00000000 };
Point ( 8818 ) = { 4.39833481, 6.04269157, 0.00000000 };
Point ( 8819 ) = { 4.40009195, 6.04141220, 0.00000000 };
Point ( 8820 ) = { 4.40184871, 6.04013233, 0.00000000 };
Point ( 8821 ) = { 4.40360590, 6.03885135, 0.00000000 };
Point ( 8822 ) = { 4.40536272, 6.03756986, 0.00000000 };
Point ( 8823 ) = { 4.40711836, 6.03628845, 0.00000000 };
Point ( 8824 ) = { 4.40887444, 6.03500595, 0.00000000 };
Point ( 8825 ) = { 4.41063014, 6.03372293, 0.00000000 };
Point ( 8826 ) = { 4.41238466, 6.03243999, 0.00000000 };
Point ( 8827 ) = { 4.41413881, 6.03115653, 0.00000000 };
Point ( 8828 ) = { 4.41589339, 6.02987198, 0.00000000 };
Point ( 8829 ) = { 4.41764760, 6.02858692, 0.00000000 };
Point ( 8830 ) = { 4.41940063, 6.02730194, 0.00000000 };
Point ( 8831 ) = { 4.42115328, 6.02601645, 0.00000000 };
Point ( 8832 ) = { 4.42290637, 6.02472985, 0.00000000 };
Point ( 8833 ) = { 4.42465908, 6.02344275, 0.00000000 };
Point ( 8834 ) = { 4.42641061, 6.02215573, 0.00000000 };
Point ( 8835 ) = { 4.42816177, 6.02086820, 0.00000000 };
Point ( 8836 ) = { 4.42991336, 6.01957957, 0.00000000 };
Point ( 8837 ) = { 4.43166457, 6.01829043, 0.00000000 };
Point ( 8838 ) = { 4.43341460, 6.01700137, 0.00000000 };
Point ( 8839 ) = { 4.43516506, 6.01571121, 0.00000000 };
Point ( 8840 ) = { 4.43691515, 6.01442055, 0.00000000 };
Point ( 8841 ) = { 4.43866406, 6.01312996, 0.00000000 };
Point ( 8842 ) = { 4.44041259, 6.01183887, 0.00000000 };
Point ( 8843 ) = { 4.44216155, 6.01054667, 0.00000000 };
Point ( 8844 ) = { 4.44057972, 6.00657803, 0.00000000 };
Point ( 8845 ) = { 4.43899949, 6.00261358, 0.00000000 };
Point ( 8846 ) = { 4.44074497, 6.00132239, 0.00000000 };
Point ( 8847 ) = { 4.44249007, 6.00003069, 0.00000000 };
Point ( 8848 ) = { 4.44423559, 5.99873790, 0.00000000 };
Point ( 8849 ) = { 4.44598074, 5.99744459, 0.00000000 };
Point ( 8850 ) = { 4.44439711, 5.99348647, 0.00000000 };
Point ( 8851 ) = { 4.44281397, 5.98953101, 0.00000000 };
Point ( 8852 ) = { 4.44455564, 5.98823871, 0.00000000 };
Point ( 8853 ) = { 4.44629773, 5.98694531, 0.00000000 };
Point ( 8854 ) = { 4.44803945, 5.98565140, 0.00000000 };
Point ( 8855 ) = { 4.44977999, 5.98435758, 0.00000000 };
Point ( 8856 ) = { 4.44819425, 5.98040784, 0.00000000 };
Point ( 8857 ) = { 4.44661012, 5.97646227, 0.00000000 };
Point ( 8858 ) = { 4.44834879, 5.97516827, 0.00000000 };
Point ( 8859 ) = { 4.45008628, 5.97387437, 0.00000000 };
Point ( 8860 ) = { 4.45182340, 5.97257995, 0.00000000 };
Point ( 8861 ) = { 4.45356094, 5.97128444, 0.00000000 };
Point ( 8862 ) = { 4.45529809, 5.96998842, 0.00000000 };
Point ( 8863 ) = { 4.45370944, 5.96604961, 0.00000000 };
Point ( 8864 ) = { 4.45212352, 5.96211645, 0.00000000 };
Point ( 8865 ) = { 4.45385722, 5.96082145, 0.00000000 };
Point ( 8866 ) = { 4.45559133, 5.95952534, 0.00000000 };
Point ( 8867 ) = { 4.45732507, 5.95822874, 0.00000000 };
Point ( 8868 ) = { 4.45905764, 5.95693222, 0.00000000 };
Point ( 8869 ) = { 4.46078983, 5.95563519, 0.00000000 };
Point ( 8870 ) = { 4.46252243, 5.95433707, 0.00000000 };
Point ( 8871 ) = { 4.46425466, 5.95303845, 0.00000000 };
Point ( 8872 ) = { 4.46598572, 5.95173992, 0.00000000 };
Point ( 8873 ) = { 4.46771719, 5.95044028, 0.00000000 };
Point ( 8874 ) = { 4.46944828, 5.94914015, 0.00000000 };
Point ( 8875 ) = { 4.47117821, 5.94784010, 0.00000000 };
Point ( 8876 ) = { 4.47290775, 5.94653956, 0.00000000 };
Point ( 8877 ) = { 4.47463771, 5.94523791, 0.00000000 };
Point ( 8878 ) = { 4.47636729, 5.94393576, 0.00000000 };
Point ( 8879 ) = { 4.47809570, 5.94263371, 0.00000000 };
Point ( 8880 ) = { 4.47982373, 5.94133115, 0.00000000 };
Point ( 8881 ) = { 4.48155217, 5.94002749, 0.00000000 };
Point ( 8882 ) = { 4.48328023, 5.93872333, 0.00000000 };
Point ( 8883 ) = { 4.48500713, 5.93741926, 0.00000000 };
Point ( 8884 ) = { 4.48673364, 5.93611470, 0.00000000 };
Point ( 8885 ) = { 4.48512689, 5.93219466, 0.00000000 };
Point ( 8886 ) = { 4.48352063, 5.92827726, 0.00000000 };
Point ( 8887 ) = { 4.48524528, 5.92697253, 0.00000000 };
Point ( 8888 ) = { 4.48696875, 5.92566789, 0.00000000 };
Point ( 8889 ) = { 4.48869264, 5.92436216, 0.00000000 };
Point ( 8890 ) = { 4.49041614, 5.92305592, 0.00000000 };
Point ( 8891 ) = { 4.49213848, 5.92174978, 0.00000000 };
Point ( 8892 ) = { 4.49386043, 5.92044314, 0.00000000 };
Point ( 8893 ) = { 4.49558280, 5.91913540, 0.00000000 };
Point ( 8894 ) = { 4.49730478, 5.91782715, 0.00000000 };
Point ( 8895 ) = { 4.49902560, 5.91651901, 0.00000000 };
Point ( 8896 ) = { 4.50074603, 5.91521037, 0.00000000 };
Point ( 8897 ) = { 4.50246688, 5.91390062, 0.00000000 };
Point ( 8898 ) = { 4.50418734, 5.91259038, 0.00000000 };
Point ( 8899 ) = { 4.50752808, 5.91519123, 0.00000000 };
Point ( 8900 ) = { 4.51087123, 5.91779327, 0.00000000 };
Point ( 8901 ) = { 4.51259204, 5.91648118, 0.00000000 };
Point ( 8902 ) = { 4.51431325, 5.91516799, 0.00000000 };
Point ( 8903 ) = { 4.51603408, 5.91385430, 0.00000000 };
Point ( 8904 ) = { 4.51775374, 5.91254071, 0.00000000 };
Point ( 8905 ) = { 4.51947380, 5.91122602, 0.00000000 };
Point ( 8906 ) = { 4.52282467, 5.91382556, 0.00000000 };
Point ( 8907 ) = { 4.52618022, 5.91642928, 0.00000000 };
Point ( 8908 ) = { 4.52790063, 5.91511274, 0.00000000 };
Point ( 8909 ) = { 4.52962066, 5.91379570, 0.00000000 };
Point ( 8910 ) = { 4.53134109, 5.91247755, 0.00000000 };
Point ( 8911 ) = { 4.53306113, 5.91115891, 0.00000000 };
Point ( 8912 ) = { 4.53478001, 5.90984037, 0.00000000 };
Point ( 8913 ) = { 4.53649850, 5.90852132, 0.00000000 };
Point ( 8914 ) = { 4.53821739, 5.90720118, 0.00000000 };
Point ( 8915 ) = { 4.53993590, 5.90588053, 0.00000000 };
Point ( 8916 ) = { 4.54165324, 5.90455999, 0.00000000 };
Point ( 8917 ) = { 4.54337020, 5.90323895, 0.00000000 };
Point ( 8918 ) = { 4.54508755, 5.90191681, 0.00000000 };
Point ( 8919 ) = { 4.54680453, 5.90059416, 0.00000000 };
Point ( 8920 ) = { 4.54852033, 5.89927162, 0.00000000 };
Point ( 8921 ) = { 4.55188928, 5.90186530, 0.00000000 };
Point ( 8922 ) = { 4.55526180, 5.90446166, 0.00000000 };
Point ( 8923 ) = { 4.55697952, 5.90313606, 0.00000000 };
Point ( 8924 ) = { 4.55869606, 5.90181056, 0.00000000 };
Point ( 8925 ) = { 4.56041221, 5.90048456, 0.00000000 };
Point ( 8926 ) = { 4.56212877, 5.89915746, 0.00000000 };
Point ( 8927 ) = { 4.56384494, 5.89782986, 0.00000000 };
Point ( 8928 ) = { 4.56555993, 5.89650236, 0.00000000 };
Point ( 8929 ) = { 4.56727455, 5.89517437, 0.00000000 };
Point ( 8930 ) = { 4.56898955, 5.89384527, 0.00000000 };
Point ( 8931 ) = { 4.57070418, 5.89251567, 0.00000000 };
Point ( 8932 ) = { 4.57241763, 5.89118618, 0.00000000 };
Point ( 8933 ) = { 4.57413069, 5.88985620, 0.00000000 };
Point ( 8934 ) = { 4.57584416, 5.88852510, 0.00000000 };
Point ( 8935 ) = { 4.57755723, 5.88719351, 0.00000000 };
Point ( 8936 ) = { 4.57926913, 5.88586203, 0.00000000 };
Point ( 8937 ) = { 4.58098143, 5.88452944, 0.00000000 };
Point ( 8938 ) = { 4.58269335, 5.88319635, 0.00000000 };
Point ( 8939 ) = { 4.58440409, 5.88186338, 0.00000000 };
Point ( 8940 ) = { 4.58611444, 5.88052990, 0.00000000 };
Point ( 8941 ) = { 4.58782519, 5.87919532, 0.00000000 };
Point ( 8942 ) = { 4.58953555, 5.87786025, 0.00000000 };
Point ( 8943 ) = { 4.59124474, 5.87652528, 0.00000000 };
Point ( 8944 ) = { 4.59295354, 5.87518982, 0.00000000 };
Point ( 8945 ) = { 4.59466195, 5.87385386, 0.00000000 };
Point ( 8946 ) = { 4.59637154, 5.87251618, 0.00000000 };
Point ( 8947 ) = { 4.59976531, 5.87509189, 0.00000000 };
Point ( 8948 ) = { 4.60316153, 5.87766878, 0.00000000 };
Point ( 8949 ) = { 4.60487066, 5.87632985, 0.00000000 };
Point ( 8950 ) = { 4.60658097, 5.87498920, 0.00000000 };
Point ( 8951 ) = { 4.60828932, 5.87364928, 0.00000000 };
Point ( 8952 ) = { 4.60999729, 5.87230886, 0.00000000 };
Point ( 8953 ) = { 4.61170486, 5.87096795, 0.00000000 };
Point ( 8954 ) = { 4.61341361, 5.86962531, 0.00000000 };
Point ( 8955 ) = { 4.61681793, 5.87219891, 0.00000000 };
Point ( 8956 ) = { 4.62022587, 5.87477518, 0.00000000 };
Point ( 8957 ) = { 4.62193416, 5.87343129, 0.00000000 };
Point ( 8958 ) = { 4.62364363, 5.87208567, 0.00000000 };
Point ( 8959 ) = { 4.62535114, 5.87074079, 0.00000000 };
Point ( 8960 ) = { 4.62705825, 5.86939541, 0.00000000 };
Point ( 8961 ) = { 4.62876498, 5.86804954, 0.00000000 };
Point ( 8962 ) = { 4.63047131, 5.86670316, 0.00000000 };
Point ( 8963 ) = { 4.63388815, 5.86927552, 0.00000000 };
Point ( 8964 ) = { 4.63730981, 5.87185203, 0.00000000 };
Point ( 8965 ) = { 4.63901725, 5.87050317, 0.00000000 };
Point ( 8966 ) = { 4.64072430, 5.86915381, 0.00000000 };
Point ( 8967 ) = { 4.64243251, 5.86780273, 0.00000000 };
Point ( 8968 ) = { 4.64413878, 5.86645238, 0.00000000 };
Point ( 8969 ) = { 4.64584464, 5.86510154, 0.00000000 };
Point ( 8970 ) = { 4.64755012, 5.86375020, 0.00000000 };
Point ( 8971 ) = { 4.64925676, 5.86239712, 0.00000000 };
Point ( 8972 ) = { 4.65096145, 5.86104479, 0.00000000 };
Point ( 8973 ) = { 4.65266575, 5.85969196, 0.00000000 };
Point ( 8974 ) = { 4.65609779, 5.86226216, 0.00000000 };
Point ( 8975 ) = { 4.65953349, 5.86483503, 0.00000000 };
Point ( 8976 ) = { 4.66123889, 5.86347970, 0.00000000 };
Point ( 8977 ) = { 4.66294389, 5.86212389, 0.00000000 };
Point ( 8978 ) = { 4.66464850, 5.86076758, 0.00000000 };
Point ( 8979 ) = { 4.66635271, 5.85941077, 0.00000000 };
Point ( 8980 ) = { 4.66805809, 5.85805222, 0.00000000 };
Point ( 8981 ) = { 4.66976152, 5.85669442, 0.00000000 };
Point ( 8982 ) = { 4.67320459, 5.85926457, 0.00000000 };
Point ( 8983 ) = { 4.67665014, 5.86183589, 0.00000000 };
Point ( 8984 ) = { 4.67835623, 5.86047435, 0.00000000 };
Point ( 8985 ) = { 4.68006036, 5.85911355, 0.00000000 };
Point ( 8986 ) = { 4.68176409, 5.85775226, 0.00000000 };
Point ( 8987 ) = { 4.68346743, 5.85639048, 0.00000000 };
Point ( 8988 ) = { 4.68517193, 5.85502695, 0.00000000 };
Point ( 8989 ) = { 4.68687447, 5.85366417, 0.00000000 };
Point ( 8990 ) = { 4.68857662, 5.85230090, 0.00000000 };
Point ( 8991 ) = { 4.69027993, 5.85093589, 0.00000000 };
Point ( 8992 ) = { 4.69198129, 5.84957163, 0.00000000 };
Point ( 8993 ) = { 4.69368224, 5.84820687, 0.00000000 };
Point ( 8994 ) = { 4.69538280, 5.84684162, 0.00000000 };
Point ( 8995 ) = { 4.69708297, 5.84547587, 0.00000000 };
Point ( 8996 ) = { 4.70054194, 5.84803718, 0.00000000 };
Point ( 8997 ) = { 4.70400581, 5.85060264, 0.00000000 };
Point ( 8998 ) = { 4.70570706, 5.84923439, 0.00000000 };
Point ( 8999 ) = { 4.70740792, 5.84786564, 0.00000000 };
Point ( 9000 ) = { 4.70910994, 5.84649514, 0.00000000 };
Point ( 9001 ) = { 4.71081000, 5.84512541, 0.00000000 };
Point ( 9002 ) = { 4.71250967, 5.84375517, 0.00000000 };
Point ( 9003 ) = { 4.71420893, 5.84238445, 0.00000000 };
Point ( 9004 ) = { 4.71590935, 5.84101197, 0.00000000 };
Point ( 9005 ) = { 4.71760782, 5.83964026, 0.00000000 };
Point ( 9006 ) = { 4.71930589, 5.83826805, 0.00000000 };
Point ( 9007 ) = { 4.72100511, 5.83689409, 0.00000000 };
Point ( 9008 ) = { 4.72270238, 5.83552089, 0.00000000 };
Point ( 9009 ) = { 4.72439925, 5.83414720, 0.00000000 };
Point ( 9010 ) = { 4.72609572, 5.83277302, 0.00000000 };
Point ( 9011 ) = { 4.72779179, 5.83139834, 0.00000000 };
Point ( 9012 ) = { 4.72948902, 5.83002191, 0.00000000 };
Point ( 9013 ) = { 4.73118429, 5.82864625, 0.00000000 };
Point ( 9014 ) = { 4.73287916, 5.82727010, 0.00000000 };
Point ( 9015 ) = { 4.73457518, 5.82589219, 0.00000000 };
Point ( 9016 ) = { 4.73626925, 5.82451504, 0.00000000 };
Point ( 9017 ) = { 4.73796292, 5.82313741, 0.00000000 };
Point ( 9018 ) = { 4.73965619, 5.82175928, 0.00000000 };
Point ( 9019 ) = { 4.74135060, 5.82037940, 0.00000000 };
Point ( 9020 ) = { 4.74304307, 5.81900029, 0.00000000 };
Point ( 9021 ) = { 4.74473513, 5.81762068, 0.00000000 };
Point ( 9022 ) = { 4.74642835, 5.81623932, 0.00000000 };
Point ( 9023 ) = { 4.74811961, 5.81485873, 0.00000000 };
Point ( 9024 ) = { 4.74981047, 5.81347765, 0.00000000 };
Point ( 9025 ) = { 4.75329732, 5.81601909, 0.00000000 };
Point ( 9026 ) = { 4.75678669, 5.81856170, 0.00000000 };
Point ( 9027 ) = { 4.75847863, 5.81717810, 0.00000000 };
Point ( 9028 ) = { 4.76017171, 5.81579274, 0.00000000 };
Point ( 9029 ) = { 4.76186285, 5.81440815, 0.00000000 };
Point ( 9030 ) = { 4.76355357, 5.81302307, 0.00000000 };
Point ( 9031 ) = { 4.76524545, 5.81163623, 0.00000000 };
Point ( 9032 ) = { 4.76693537, 5.81025017, 0.00000000 };
Point ( 9033 ) = { 4.77043291, 5.81278932, 0.00000000 };
Point ( 9034 ) = { 4.77393541, 5.81533259, 0.00000000 };
Point ( 9035 ) = { 4.77562640, 5.81394400, 0.00000000 };
Point ( 9036 ) = { 4.77731855, 5.81255365, 0.00000000 };
Point ( 9037 ) = { 4.77900873, 5.81116408, 0.00000000 };
Point ( 9038 ) = { 4.78069852, 5.80977401, 0.00000000 };
Point ( 9039 ) = { 4.78238945, 5.80838218, 0.00000000 };
Point ( 9040 ) = { 4.78407842, 5.80699114, 0.00000000 };
Point ( 9041 ) = { 4.78576699, 5.80559960, 0.00000000 };
Point ( 9042 ) = { 4.78927842, 5.80813837, 0.00000000 };
Point ( 9043 ) = { 4.79279238, 5.81067831, 0.00000000 };
Point ( 9044 ) = { 4.79448203, 5.80928424, 0.00000000 };
Point ( 9045 ) = { 4.79617281, 5.80788840, 0.00000000 };
Point ( 9046 ) = { 4.79786164, 5.80649334, 0.00000000 };
Point ( 9047 ) = { 4.79955007, 5.80509779, 0.00000000 };
Point ( 9048 ) = { 4.80123963, 5.80370048, 0.00000000 };
Point ( 9049 ) = { 4.80292724, 5.80230395, 0.00000000 };
Point ( 9050 ) = { 4.80461445, 5.80090693, 0.00000000 };
Point ( 9051 ) = { 4.80630125, 5.79950942, 0.00000000 };
Point ( 9052 ) = { 4.80798919, 5.79811014, 0.00000000 };
Point ( 9053 ) = { 4.80967517, 5.79671165, 0.00000000 };
Point ( 9054 ) = { 4.81136075, 5.79531267, 0.00000000 };
Point ( 9055 ) = { 4.81304747, 5.79391192, 0.00000000 };
Point ( 9056 ) = { 4.81473224, 5.79251195, 0.00000000 };
Point ( 9057 ) = { 4.81641660, 5.79111150, 0.00000000 };
Point ( 9058 ) = { 4.81810055, 5.78971056, 0.00000000 };
Point ( 9059 ) = { 4.81978409, 5.78830913, 0.00000000 };
Point ( 9060 ) = { 4.82146877, 5.78690592, 0.00000000 };
Point ( 9061 ) = { 4.82315149, 5.78550351, 0.00000000 };
Point ( 9062 ) = { 4.82483381, 5.78410061, 0.00000000 };
Point ( 9063 ) = { 4.82651727, 5.78269594, 0.00000000 };
Point ( 9064 ) = { 4.82819877, 5.78129206, 0.00000000 };
Point ( 9065 ) = { 4.83173197, 5.78381311, 0.00000000 };
Point ( 9066 ) = { 4.83527019, 5.78633826, 0.00000000 };
Point ( 9067 ) = { 4.83695275, 5.78493184, 0.00000000 };
Point ( 9068 ) = { 4.83863644, 5.78352363, 0.00000000 };
Point ( 9069 ) = { 4.84031819, 5.78211623, 0.00000000 };
Point ( 9070 ) = { 4.84199952, 5.78070834, 0.00000000 };
Point ( 9071 ) = { 4.84368199, 5.77929867, 0.00000000 };
Point ( 9072 ) = { 4.84536250, 5.77788980, 0.00000000 };
Point ( 9073 ) = { 4.84890893, 5.78041140, 0.00000000 };
// Keeping path 1 open to be closed by a later component
BSpline ( 14 ) = { 3910 : 9073 };


// == BRep component: ExtendTo64S =================================
// Extending exterior boundary developed in Amundsen_Sea_brep to parallel -64.0
// Closing path with parallels and meridians, from (-130.00000000, -74.90833282) to  (-85.00000000, -73.50833130)
// Drawing meridian to latitude index 9073 at -130.00, -74.91 (to match -64.00)
Point ( 9074 ) = { 4.82014274, 5.74442243, 0.00000000 };
Point ( 9075 ) = { 4.78824776, 5.70641147, 0.00000000 };
Point ( 9076 ) = { 4.75676477, 5.66889151, 0.00000000 };
Point ( 9077 ) = { 4.72568580, 5.63185303, 0.00000000 };
Point ( 9078 ) = { 4.69500308, 5.59528679, 0.00000000 };
Point ( 9079 ) = { 4.66470902, 5.55918374, 0.00000000 };
Point ( 9080 ) = { 4.63479626, 5.52353509, 0.00000000 };
Point ( 9081 ) = { 4.60525757, 5.48833226, 0.00000000 };
Point ( 9082 ) = { 4.57608596, 5.45356689, 0.00000000 };
Point ( 9083 ) = { 4.54727458, 5.41923081, 0.00000000 };
Point ( 9084 ) = { 4.51881674, 5.38531609, 0.00000000 };
Point ( 9085 ) = { 4.49070595, 5.35181495, 0.00000000 };
Point ( 9086 ) = { 4.46293584, 5.31871982, 0.00000000 };
Point ( 9087 ) = { 4.43550023, 5.28602333, 0.00000000 };
Point ( 9088 ) = { 4.40839306, 5.25371826, 0.00000000 };
Point ( 9089 ) = { 4.38160843, 5.22179758, 0.00000000 };
Point ( 9090 ) = { 4.35514057, 5.19025442, 0.00000000 };
Point ( 9091 ) = { 4.32898387, 5.15908208, 0.00000000 };
Point ( 9092 ) = { 4.30313282, 5.12827400, 0.00000000 };
Point ( 9093 ) = { 4.27758206, 5.09782379, 0.00000000 };
Point ( 9094 ) = { 4.25232636, 5.06772522, 0.00000000 };
Point ( 9095 ) = { 4.22736059, 5.03797217, 0.00000000 };
Point ( 9096 ) = { 4.20267974, 5.00855868, 0.00000000 };
Point ( 9097 ) = { 4.17827895, 4.97947894, 0.00000000 };
Point ( 9098 ) = { 4.15415341, 4.95072726, 0.00000000 };
Point ( 9099 ) = { 4.13029848, 4.92229805, 0.00000000 };
Point ( 9100 ) = { 4.10670959, 4.89418590, 0.00000000 };
Point ( 9101 ) = { 4.08338227, 4.86638549, 0.00000000 };
Point ( 9102 ) = { 4.06031216, 4.83889160, 0.00000000 };
Point ( 9103 ) = { 4.03749500, 4.81169917, 0.00000000 };
Point ( 9104 ) = { 4.01492662, 4.78480322, 0.00000000 };
Point ( 9105 ) = { 3.99260294, 4.75819889, 0.00000000 };
Point ( 9106 ) = { 3.97051995, 4.73188142, 0.00000000 };
Point ( 9107 ) = { 3.94867377, 4.70584615, 0.00000000 };
Point ( 9108 ) = { 3.92706057, 4.68008854, 0.00000000 };
Point ( 9109 ) = { 3.90567660, 4.65460412, 0.00000000 };
Point ( 9110 ) = { 3.88451822, 4.62938854, 0.00000000 };
Point ( 9111 ) = { 3.86358183, 4.60443752, 0.00000000 };
Point ( 9112 ) = { 3.84286392, 4.57974689, 0.00000000 };
Point ( 9113 ) = { 3.82236108, 4.55531255, 0.00000000 };
Point ( 9114 ) = { 3.80206993, 4.53113049, 0.00000000 };
Point ( 9115 ) = { 3.78198718, 4.50719680, 0.00000000 };
Point ( 9116 ) = { 3.76210960, 4.48350763, 0.00000000 };
Point ( 9117 ) = { 3.74243405, 4.46005922, 0.00000000 };
Point ( 9118 ) = { 3.72295742, 4.43684788, 0.00000000 };
Point ( 9119 ) = { 3.70367668, 4.41386999, 0.00000000 };
Point ( 9120 ) = { 3.68458887, 4.39112203, 0.00000000 };
Point ( 9121 ) = { 3.66569108, 4.36860051, 0.00000000 };
Point ( 9122 ) = { 3.64698045, 4.34630205, 0.00000000 };
Point ( 9123 ) = { 3.62845419, 4.32422331, 0.00000000 };
Point ( 9124 ) = { 3.61010955, 4.30236103, 0.00000000 };
Point ( 9125 ) = { 3.59194386, 4.28071200, 0.00000000 };
Point ( 9126 ) = { 3.57395448, 4.25927310, 0.00000000 };
Point ( 9127 ) = { 3.55613883, 4.23804123, 0.00000000 };
Point ( 9128 ) = { 3.53849438, 4.21701339, 0.00000000 };
Point ( 9129 ) = { 3.52101865, 4.19618662, 0.00000000 };
Point ( 9130 ) = { 3.50370919, 4.17555801, 0.00000000 };
Point ( 9131 ) = { 3.48656363, 4.15512473, 0.00000000 };
Point ( 9132 ) = { 3.46957962, 4.13488397, 0.00000000 };
Point ( 9133 ) = { 3.45275486, 4.11483300, 0.00000000 };
Point ( 9134 ) = { 3.43608710, 4.09496914, 0.00000000 };
Point ( 9135 ) = { 3.41957412, 4.07528974, 0.00000000 };
Point ( 9136 ) = { 3.40321376, 4.05579222, 0.00000000 };
Point ( 9137 ) = { 3.38700388, 4.03647404, 0.00000000 };
Point ( 9138 ) = { 3.37094240, 4.01733271, 0.00000000 };
Point ( 9139 ) = { 3.35502725, 3.99836578, 0.00000000 };
Point ( 9140 ) = { 3.33925643, 3.97957085, 0.00000000 };
Point ( 9141 ) = { 3.32362796, 3.96094556, 0.00000000 };
Point ( 9142 ) = { 3.30813989, 3.94248760, 0.00000000 };
Point ( 9143 ) = { 3.29279033, 3.92419470, 0.00000000 };
Point ( 9144 ) = { 3.27757739, 3.90606462, 0.00000000 };
Point ( 9145 ) = { 3.26249923, 3.88809518, 0.00000000 };
Point ( 9146 ) = { 3.24755406, 3.87028421, 0.00000000 };
Point ( 9147 ) = { 3.23274009, 3.85262962, 0.00000000 };
Point ( 9148 ) = { 3.21805559, 3.83512931, 0.00000000 };
Point ( 9149 ) = { 3.20349884, 3.81778125, 0.00000000 };
Point ( 9150 ) = { 3.18906816, 3.80058343, 0.00000000 };
Point ( 9151 ) = { 3.17476190, 3.78353390, 0.00000000 };
Point ( 9152 ) = { 3.16057843, 3.76663070, 0.00000000 };
Point ( 9153 ) = { 3.14651616, 3.74987194, 0.00000000 };
Point ( 9154 ) = { 3.13257353, 3.73325575, 0.00000000 };
Point ( 9155 ) = { 3.11874898, 3.71678030, 0.00000000 };
Point ( 9156 ) = { 3.10504101, 3.70044378, 0.00000000 };
Point ( 9157 ) = { 3.09144813, 3.68424441, 0.00000000 };
Point ( 9158 ) = { 3.07796886, 3.66818045, 0.00000000 };
Point ( 9159 ) = { 3.06460178, 3.65225019, 0.00000000 };
Point ( 9160 ) = { 3.05134547, 3.63645193, 0.00000000 };
Point ( 9161 ) = { 3.03819854, 3.62078403, 0.00000000 };
Point ( 9162 ) = { 3.02515962, 3.60524485, 0.00000000 };
Point ( 9163 ) = { 3.01222736, 3.58983278, 0.00000000 };
Point ( 9164 ) = { 2.99940045, 3.57454626, 0.00000000 };
Point ( 9165 ) = { 2.98667757, 3.55938372, 0.00000000 };
Point ( 9166 ) = { 2.97405745, 3.54434366, 0.00000000 };
Point ( 9167 ) = { 2.96153884, 3.52942455, 0.00000000 };
Point ( 9168 ) = { 2.94912049, 3.51462494, 0.00000000 };
Point ( 9169 ) = { 2.93680118, 3.49994336, 0.00000000 };
Point ( 9170 ) = { 2.92457972, 3.48537839, 0.00000000 };
Point ( 9171 ) = { 2.91245493, 3.47092863, 0.00000000 };
Point ( 9172 ) = { 2.90042564, 3.45659268, 0.00000000 };
Point ( 9173 ) = { 2.88849072, 3.44236919, 0.00000000 };
Point ( 9174 ) = { 2.87664903, 3.42825682, 0.00000000 };
Point ( 9175 ) = { 2.86489948, 3.41425425, 0.00000000 };
Point ( 9176 ) = { 2.85324098, 3.40036018, 0.00000000 };
Point ( 9177 ) = { 2.84167244, 3.38657334, 0.00000000 };
Point ( 9178 ) = { 2.83019283, 3.37289247, 0.00000000 };
Point ( 9179 ) = { 2.81880109, 3.35931633, 0.00000000 };
Point ( 9180 ) = { 2.80749621, 3.34584370, 0.00000000 };
Point ( 9181 ) = { 2.79627718, 3.33247338, 0.00000000 };
Point ( 9182 ) = { 2.78421902, 3.31810302, 0.00000000 };
// Drawing parallel index 9182 at -130.00 (to match -85.00), -64.00
Point ( 9183 ) = { 2.77842360, 3.32295735, 0.00000000 };
Point ( 9184 ) = { 2.77261972, 3.32780155, 0.00000000 };
Point ( 9185 ) = { 2.76680739, 3.33263561, 0.00000000 };
Point ( 9186 ) = { 2.76098663, 3.33745952, 0.00000000 };
Point ( 9187 ) = { 2.75515747, 3.34227327, 0.00000000 };
Point ( 9188 ) = { 2.74931990, 3.34707683, 0.00000000 };
Point ( 9189 ) = { 2.74347397, 3.35187020, 0.00000000 };
Point ( 9190 ) = { 2.73761968, 3.35665336, 0.00000000 };
Point ( 9191 ) = { 2.73175704, 3.36142629, 0.00000000 };
Point ( 9192 ) = { 2.72588609, 3.36618898, 0.00000000 };
Point ( 9193 ) = { 2.72000683, 3.37094142, 0.00000000 };
Point ( 9194 ) = { 2.71411929, 3.37568359, 0.00000000 };
Point ( 9195 ) = { 2.70822348, 3.38041548, 0.00000000 };
Point ( 9196 ) = { 2.70231942, 3.38513707, 0.00000000 };
Point ( 9197 ) = { 2.69640713, 3.38984835, 0.00000000 };
Point ( 9198 ) = { 2.69048662, 3.39454930, 0.00000000 };
Point ( 9199 ) = { 2.68455792, 3.39923992, 0.00000000 };
Point ( 9200 ) = { 2.67862104, 3.40392017, 0.00000000 };
Point ( 9201 ) = { 2.67267601, 3.40859006, 0.00000000 };
Point ( 9202 ) = { 2.66672283, 3.41324957, 0.00000000 };
Point ( 9203 ) = { 2.66076152, 3.41789868, 0.00000000 };
Point ( 9204 ) = { 2.65479212, 3.42253737, 0.00000000 };
Point ( 9205 ) = { 2.64881462, 3.42716564, 0.00000000 };
Point ( 9206 ) = { 2.64282906, 3.43178348, 0.00000000 };
Point ( 9207 ) = { 2.63683544, 3.43639085, 0.00000000 };
Point ( 9208 ) = { 2.63083380, 3.44098776, 0.00000000 };
Point ( 9209 ) = { 2.62482414, 3.44557419, 0.00000000 };
Point ( 9210 ) = { 2.61880648, 3.45015012, 0.00000000 };
Point ( 9211 ) = { 2.61278085, 3.45471555, 0.00000000 };
Point ( 9212 ) = { 2.60674725, 3.45927044, 0.00000000 };
Point ( 9213 ) = { 2.60070572, 3.46381481, 0.00000000 };
Point ( 9214 ) = { 2.59465627, 3.46834862, 0.00000000 };
Point ( 9215 ) = { 2.58859891, 3.47287186, 0.00000000 };
Point ( 9216 ) = { 2.58253366, 3.47738453, 0.00000000 };
Point ( 9217 ) = { 2.57646055, 3.48188660, 0.00000000 };
Point ( 9218 ) = { 2.57037959, 3.48637806, 0.00000000 };
Point ( 9219 ) = { 2.56429080, 3.49085891, 0.00000000 };
Point ( 9220 ) = { 2.55819420, 3.49532912, 0.00000000 };
Point ( 9221 ) = { 2.55208981, 3.49978869, 0.00000000 };
Point ( 9222 ) = { 2.54597764, 3.50423759, 0.00000000 };
Point ( 9223 ) = { 2.53985772, 3.50867582, 0.00000000 };
Point ( 9224 ) = { 2.53373006, 3.51310336, 0.00000000 };
Point ( 9225 ) = { 2.52759468, 3.51752020, 0.00000000 };
Point ( 9226 ) = { 2.52145160, 3.52192633, 0.00000000 };
Point ( 9227 ) = { 2.51530084, 3.52632173, 0.00000000 };
Point ( 9228 ) = { 2.50914242, 3.53070638, 0.00000000 };
Point ( 9229 ) = { 2.50297636, 3.53508028, 0.00000000 };
Point ( 9230 ) = { 2.49680267, 3.53944341, 0.00000000 };
Point ( 9231 ) = { 2.49062138, 3.54379576, 0.00000000 };
Point ( 9232 ) = { 2.48443250, 3.54813732, 0.00000000 };
Point ( 9233 ) = { 2.47823605, 3.55246806, 0.00000000 };
Point ( 9234 ) = { 2.47203205, 3.55678799, 0.00000000 };
Point ( 9235 ) = { 2.46582052, 3.56109708, 0.00000000 };
Point ( 9236 ) = { 2.45960148, 3.56539532, 0.00000000 };
Point ( 9237 ) = { 2.45337495, 3.56968270, 0.00000000 };
Point ( 9238 ) = { 2.44714095, 3.57395921, 0.00000000 };
Point ( 9239 ) = { 2.44089949, 3.57822483, 0.00000000 };
Point ( 9240 ) = { 2.43465059, 3.58247955, 0.00000000 };
Point ( 9241 ) = { 2.42839428, 3.58672336, 0.00000000 };
Point ( 9242 ) = { 2.42213057, 3.59095624, 0.00000000 };
Point ( 9243 ) = { 2.41585948, 3.59517819, 0.00000000 };
Point ( 9244 ) = { 2.40958104, 3.59938918, 0.00000000 };
Point ( 9245 ) = { 2.40329525, 3.60358921, 0.00000000 };
Point ( 9246 ) = { 2.39700214, 3.60777826, 0.00000000 };
Point ( 9247 ) = { 2.39070174, 3.61195632, 0.00000000 };
Point ( 9248 ) = { 2.38439404, 3.61612338, 0.00000000 };
Point ( 9249 ) = { 2.37807909, 3.62027942, 0.00000000 };
Point ( 9250 ) = { 2.37175689, 3.62442444, 0.00000000 };
Point ( 9251 ) = { 2.36542747, 3.62855841, 0.00000000 };
Point ( 9252 ) = { 2.35909084, 3.63268133, 0.00000000 };
Point ( 9253 ) = { 2.35274703, 3.63679319, 0.00000000 };
Point ( 9254 ) = { 2.34639604, 3.64089396, 0.00000000 };
Point ( 9255 ) = { 2.34003791, 3.64498365, 0.00000000 };
Point ( 9256 ) = { 2.33367266, 3.64906223, 0.00000000 };
Point ( 9257 ) = { 2.32730029, 3.65312970, 0.00000000 };
Point ( 9258 ) = { 2.32092084, 3.65718604, 0.00000000 };
Point ( 9259 ) = { 2.31453431, 3.66123124, 0.00000000 };
Point ( 9260 ) = { 2.30814073, 3.66526528, 0.00000000 };
Point ( 9261 ) = { 2.30174013, 3.66928817, 0.00000000 };
Point ( 9262 ) = { 2.29533251, 3.67329987, 0.00000000 };
Point ( 9263 ) = { 2.28891790, 3.67730038, 0.00000000 };
Point ( 9264 ) = { 2.28249632, 3.68128970, 0.00000000 };
Point ( 9265 ) = { 2.27606778, 3.68526779, 0.00000000 };
Point ( 9266 ) = { 2.26963231, 3.68923467, 0.00000000 };
Point ( 9267 ) = { 2.26318993, 3.69319030, 0.00000000 };
Point ( 9268 ) = { 2.25674065, 3.69713469, 0.00000000 };
Point ( 9269 ) = { 2.25028450, 3.70106781, 0.00000000 };
Point ( 9270 ) = { 2.24382149, 3.70498966, 0.00000000 };
Point ( 9271 ) = { 2.23735165, 3.70890022, 0.00000000 };
Point ( 9272 ) = { 2.23087500, 3.71279948, 0.00000000 };
Point ( 9273 ) = { 2.22439154, 3.71668744, 0.00000000 };
Point ( 9274 ) = { 2.21790132, 3.72056407, 0.00000000 };
Point ( 9275 ) = { 2.21140433, 3.72442937, 0.00000000 };
Point ( 9276 ) = { 2.20490061, 3.72828332, 0.00000000 };
Point ( 9277 ) = { 2.19839017, 3.73212592, 0.00000000 };
Point ( 9278 ) = { 2.19187304, 3.73595715, 0.00000000 };
Point ( 9279 ) = { 2.18534923, 3.73977700, 0.00000000 };
Point ( 9280 ) = { 2.17881876, 3.74358545, 0.00000000 };
Point ( 9281 ) = { 2.17228166, 3.74738251, 0.00000000 };
Point ( 9282 ) = { 2.16573794, 3.75116814, 0.00000000 };
Point ( 9283 ) = { 2.15918762, 3.75494235, 0.00000000 };
Point ( 9284 ) = { 2.15263072, 3.75870513, 0.00000000 };
Point ( 9285 ) = { 2.14606727, 3.76245645, 0.00000000 };
Point ( 9286 ) = { 2.13949728, 3.76619631, 0.00000000 };
Point ( 9287 ) = { 2.13292077, 3.76992470, 0.00000000 };
Point ( 9288 ) = { 2.12633777, 3.77364160, 0.00000000 };
Point ( 9289 ) = { 2.11974828, 3.77734701, 0.00000000 };
Point ( 9290 ) = { 2.11315234, 3.78104092, 0.00000000 };
Point ( 9291 ) = { 2.10654997, 3.78472330, 0.00000000 };
Point ( 9292 ) = { 2.09994117, 3.78839416, 0.00000000 };
Point ( 9293 ) = { 2.09332598, 3.79205348, 0.00000000 };
Point ( 9294 ) = { 2.08670442, 3.79570124, 0.00000000 };
Point ( 9295 ) = { 2.08007649, 3.79933745, 0.00000000 };
Point ( 9296 ) = { 2.07344223, 3.80296208, 0.00000000 };
Point ( 9297 ) = { 2.06680166, 3.80657512, 0.00000000 };
Point ( 9298 ) = { 2.06015479, 3.81017657, 0.00000000 };
Point ( 9299 ) = { 2.05350164, 3.81376641, 0.00000000 };
Point ( 9300 ) = { 2.04684224, 3.81734464, 0.00000000 };
Point ( 9301 ) = { 2.04017660, 3.82091124, 0.00000000 };
Point ( 9302 ) = { 2.03350475, 3.82446620, 0.00000000 };
Point ( 9303 ) = { 2.02682670, 3.82800951, 0.00000000 };
Point ( 9304 ) = { 2.02014248, 3.83154115, 0.00000000 };
Point ( 9305 ) = { 2.01345211, 3.83506113, 0.00000000 };
Point ( 9306 ) = { 2.00675560, 3.83856942, 0.00000000 };
Point ( 9307 ) = { 2.00005298, 3.84206602, 0.00000000 };
Point ( 9308 ) = { 1.99334427, 3.84555092, 0.00000000 };
Point ( 9309 ) = { 1.98662948, 3.84902410, 0.00000000 };
Point ( 9310 ) = { 1.97990864, 3.85248556, 0.00000000 };
Point ( 9311 ) = { 1.97318178, 3.85593529, 0.00000000 };
Point ( 9312 ) = { 1.96644890, 3.85937326, 0.00000000 };
Point ( 9313 ) = { 1.95971003, 3.86279948, 0.00000000 };
Point ( 9314 ) = { 1.95296519, 3.86621394, 0.00000000 };
Point ( 9315 ) = { 1.94621440, 3.86961662, 0.00000000 };
Point ( 9316 ) = { 1.93945769, 3.87300750, 0.00000000 };
Point ( 9317 ) = { 1.93269506, 3.87638660, 0.00000000 };
Point ( 9318 ) = { 1.92592655, 3.87975388, 0.00000000 };
Point ( 9319 ) = { 1.91915217, 3.88310934, 0.00000000 };
Point ( 9320 ) = { 1.91237195, 3.88645298, 0.00000000 };
Point ( 9321 ) = { 1.90558590, 3.88978478, 0.00000000 };
Point ( 9322 ) = { 1.89879405, 3.89310473, 0.00000000 };
Point ( 9323 ) = { 1.89199641, 3.89641282, 0.00000000 };
Point ( 9324 ) = { 1.88519301, 3.89970904, 0.00000000 };
Point ( 9325 ) = { 1.87838386, 3.90299338, 0.00000000 };
Point ( 9326 ) = { 1.87156900, 3.90626583, 0.00000000 };
Point ( 9327 ) = { 1.86474843, 3.90952638, 0.00000000 };
Point ( 9328 ) = { 1.85792218, 3.91277503, 0.00000000 };
Point ( 9329 ) = { 1.85109027, 3.91601175, 0.00000000 };
Point ( 9330 ) = { 1.84425273, 3.91923655, 0.00000000 };
Point ( 9331 ) = { 1.83740957, 3.92244941, 0.00000000 };
Point ( 9332 ) = { 1.83056080, 3.92565031, 0.00000000 };
Point ( 9333 ) = { 1.82370647, 3.92883926, 0.00000000 };
Point ( 9334 ) = { 1.81684658, 3.93201625, 0.00000000 };
Point ( 9335 ) = { 1.80998115, 3.93518125, 0.00000000 };
Point ( 9336 ) = { 1.80311021, 3.93833427, 0.00000000 };
Point ( 9337 ) = { 1.79623378, 3.94147529, 0.00000000 };
Point ( 9338 ) = { 1.78935187, 3.94460431, 0.00000000 };
Point ( 9339 ) = { 1.78246452, 3.94772130, 0.00000000 };
Point ( 9340 ) = { 1.77557173, 3.95082628, 0.00000000 };
Point ( 9341 ) = { 1.76867354, 3.95391922, 0.00000000 };
Point ( 9342 ) = { 1.76176996, 3.95700011, 0.00000000 };
Point ( 9343 ) = { 1.75486101, 3.96006895, 0.00000000 };
Point ( 9344 ) = { 1.74794672, 3.96312573, 0.00000000 };
Point ( 9345 ) = { 1.74102710, 3.96617043, 0.00000000 };
Point ( 9346 ) = { 1.73410218, 3.96920306, 0.00000000 };
Point ( 9347 ) = { 1.72717197, 3.97222359, 0.00000000 };
Point ( 9348 ) = { 1.72023651, 3.97523202, 0.00000000 };
Point ( 9349 ) = { 1.71329580, 3.97822834, 0.00000000 };
Point ( 9350 ) = { 1.70634988, 3.98121255, 0.00000000 };
Point ( 9351 ) = { 1.69939876, 3.98418462, 0.00000000 };
Point ( 9352 ) = { 1.69244246, 3.98714456, 0.00000000 };
Point ( 9353 ) = { 1.68548100, 3.99009236, 0.00000000 };
Point ( 9354 ) = { 1.67851441, 3.99302800, 0.00000000 };
Point ( 9355 ) = { 1.67154271, 3.99595148, 0.00000000 };
Point ( 9356 ) = { 1.66456592, 3.99886278, 0.00000000 };
Point ( 9357 ) = { 1.65758405, 4.00176191, 0.00000000 };
Point ( 9358 ) = { 1.65059714, 4.00464884, 0.00000000 };
Point ( 9359 ) = { 1.64360520, 4.00752357, 0.00000000 };
Point ( 9360 ) = { 1.63660825, 4.01038610, 0.00000000 };
Point ( 9361 ) = { 1.62960632, 4.01323641, 0.00000000 };
Point ( 9362 ) = { 1.62259942, 4.01607450, 0.00000000 };
Point ( 9363 ) = { 1.61558758, 4.01890035, 0.00000000 };
Point ( 9364 ) = { 1.60857082, 4.02171396, 0.00000000 };
Point ( 9365 ) = { 1.60154916, 4.02451532, 0.00000000 };
Point ( 9366 ) = { 1.59452262, 4.02730442, 0.00000000 };
Point ( 9367 ) = { 1.58749122, 4.03008125, 0.00000000 };
Point ( 9368 ) = { 1.58045499, 4.03284580, 0.00000000 };
Point ( 9369 ) = { 1.57341394, 4.03559807, 0.00000000 };
Point ( 9370 ) = { 1.56636810, 4.03833805, 0.00000000 };
Point ( 9371 ) = { 1.55931749, 4.04106573, 0.00000000 };
Point ( 9372 ) = { 1.55226213, 4.04378109, 0.00000000 };
Point ( 9373 ) = { 1.54520204, 4.04648414, 0.00000000 };
Point ( 9374 ) = { 1.53813724, 4.04917486, 0.00000000 };
Point ( 9375 ) = { 1.53106776, 4.05185325, 0.00000000 };
Point ( 9376 ) = { 1.52399361, 4.05451930, 0.00000000 };
Point ( 9377 ) = { 1.51691482, 4.05717299, 0.00000000 };
Point ( 9378 ) = { 1.50983141, 4.05981432, 0.00000000 };
Point ( 9379 ) = { 1.50274340, 4.06244329, 0.00000000 };
Point ( 9380 ) = { 1.49565082, 4.06505989, 0.00000000 };
Point ( 9381 ) = { 1.48855368, 4.06766410, 0.00000000 };
Point ( 9382 ) = { 1.48145200, 4.07025592, 0.00000000 };
Point ( 9383 ) = { 1.47434581, 4.07283534, 0.00000000 };
Point ( 9384 ) = { 1.46723513, 4.07540235, 0.00000000 };
Point ( 9385 ) = { 1.46011998, 4.07795695, 0.00000000 };
Point ( 9386 ) = { 1.45300038, 4.08049913, 0.00000000 };
Point ( 9387 ) = { 1.44587636, 4.08302888, 0.00000000 };
Point ( 9388 ) = { 1.43874793, 4.08554619, 0.00000000 };
Point ( 9389 ) = { 1.43161512, 4.08805105, 0.00000000 };
Point ( 9390 ) = { 1.42447795, 4.09054346, 0.00000000 };
Point ( 9391 ) = { 1.41733644, 4.09302342, 0.00000000 };
Point ( 9392 ) = { 1.41019061, 4.09549090, 0.00000000 };
Point ( 9393 ) = { 1.40304048, 4.09794591, 0.00000000 };
Point ( 9394 ) = { 1.39588608, 4.10038843, 0.00000000 };
Point ( 9395 ) = { 1.38872743, 4.10281847, 0.00000000 };
Point ( 9396 ) = { 1.38156455, 4.10523600, 0.00000000 };
Point ( 9397 ) = { 1.37439746, 4.10764103, 0.00000000 };
Point ( 9398 ) = { 1.36722619, 4.11003355, 0.00000000 };
Point ( 9399 ) = { 1.36005075, 4.11241355, 0.00000000 };
Point ( 9400 ) = { 1.35287116, 4.11478102, 0.00000000 };
Point ( 9401 ) = { 1.34568746, 4.11713596, 0.00000000 };
Point ( 9402 ) = { 1.33849966, 4.11947836, 0.00000000 };
Point ( 9403 ) = { 1.33130777, 4.12180820, 0.00000000 };
Point ( 9404 ) = { 1.32411184, 4.12412549, 0.00000000 };
Point ( 9405 ) = { 1.31691187, 4.12643022, 0.00000000 };
Point ( 9406 ) = { 1.30970789, 4.12872238, 0.00000000 };
Point ( 9407 ) = { 1.30249992, 4.13100196, 0.00000000 };
Point ( 9408 ) = { 1.29528798, 4.13326896, 0.00000000 };
Point ( 9409 ) = { 1.28807209, 4.13552337, 0.00000000 };
Point ( 9410 ) = { 1.28085228, 4.13776518, 0.00000000 };
Point ( 9411 ) = { 1.27362857, 4.13999438, 0.00000000 };
Point ( 9412 ) = { 1.26640099, 4.14221098, 0.00000000 };
Point ( 9413 ) = { 1.25916954, 4.14441496, 0.00000000 };
Point ( 9414 ) = { 1.25193426, 4.14660631, 0.00000000 };
Point ( 9415 ) = { 1.24469516, 4.14878503, 0.00000000 };
Point ( 9416 ) = { 1.23745227, 4.15095111, 0.00000000 };
Point ( 9417 ) = { 1.23020561, 4.15310455, 0.00000000 };
Point ( 9418 ) = { 1.22295521, 4.15524534, 0.00000000 };
Point ( 9419 ) = { 1.21570108, 4.15737347, 0.00000000 };
Point ( 9420 ) = { 1.20844324, 4.15948893, 0.00000000 };
Point ( 9421 ) = { 1.20118173, 4.16159173, 0.00000000 };
Point ( 9422 ) = { 1.19391656, 4.16368184, 0.00000000 };
Point ( 9423 ) = { 1.18664775, 4.16575928, 0.00000000 };
Point ( 9424 ) = { 1.17937532, 4.16782402, 0.00000000 };
Point ( 9425 ) = { 1.17209930, 4.16987607, 0.00000000 };
Point ( 9426 ) = { 1.16481972, 4.17191542, 0.00000000 };
Point ( 9427 ) = { 1.15753658, 4.17394206, 0.00000000 };
Point ( 9428 ) = { 1.15024992, 4.17595598, 0.00000000 };
Point ( 9429 ) = { 1.14295975, 4.17795719, 0.00000000 };
Point ( 9430 ) = { 1.13566610, 4.17994566, 0.00000000 };
Point ( 9431 ) = { 1.12836899, 4.18192141, 0.00000000 };
Point ( 9432 ) = { 1.12106845, 4.18388441, 0.00000000 };
Point ( 9433 ) = { 1.11376449, 4.18583467, 0.00000000 };
Point ( 9434 ) = { 1.10645714, 4.18777218, 0.00000000 };
Point ( 9435 ) = { 1.09914641, 4.18969694, 0.00000000 };
Point ( 9436 ) = { 1.09183234, 4.19160893, 0.00000000 };
Point ( 9437 ) = { 1.08451495, 4.19350815, 0.00000000 };
Point ( 9438 ) = { 1.07719425, 4.19539459, 0.00000000 };
Point ( 9439 ) = { 1.06987026, 4.19726826, 0.00000000 };
Point ( 9440 ) = { 1.06254302, 4.19912914, 0.00000000 };
Point ( 9441 ) = { 1.05521255, 4.20097724, 0.00000000 };
Point ( 9442 ) = { 1.04787885, 4.20281253, 0.00000000 };
Point ( 9443 ) = { 1.04054197, 4.20463502, 0.00000000 };
Point ( 9444 ) = { 1.03320192, 4.20644470, 0.00000000 };
Point ( 9445 ) = { 1.02585872, 4.20824157, 0.00000000 };
Point ( 9446 ) = { 1.01851239, 4.21002562, 0.00000000 };
Point ( 9447 ) = { 1.01116296, 4.21179685, 0.00000000 };
Point ( 9448 ) = { 1.00381045, 4.21355525, 0.00000000 };
Point ( 9449 ) = { 0.99645489, 4.21530081, 0.00000000 };
Point ( 9450 ) = { 0.98909628, 4.21703353, 0.00000000 };
Point ( 9451 ) = { 0.98173467, 4.21875340, 0.00000000 };
Point ( 9452 ) = { 0.97437006, 4.22046043, 0.00000000 };
Point ( 9453 ) = { 0.96700249, 4.22215460, 0.00000000 };
Point ( 9454 ) = { 0.95963197, 4.22383590, 0.00000000 };
Point ( 9455 ) = { 0.95225853, 4.22550434, 0.00000000 };
Point ( 9456 ) = { 0.94488219, 4.22715991, 0.00000000 };
Point ( 9457 ) = { 0.93750297, 4.22880260, 0.00000000 };
Point ( 9458 ) = { 0.93012089, 4.23043241, 0.00000000 };
Point ( 9459 ) = { 0.92273598, 4.23204933, 0.00000000 };
Point ( 9460 ) = { 0.91534826, 4.23365337, 0.00000000 };
Point ( 9461 ) = { 0.90795775, 4.23524450, 0.00000000 };
Point ( 9462 ) = { 0.90056447, 4.23682273, 0.00000000 };
Point ( 9463 ) = { 0.89316845, 4.23838806, 0.00000000 };
Point ( 9464 ) = { 0.88576971, 4.23994048, 0.00000000 };
Point ( 9465 ) = { 0.87836828, 4.24147998, 0.00000000 };
Point ( 9466 ) = { 0.87096416, 4.24300656, 0.00000000 };
Point ( 9467 ) = { 0.86355740, 4.24452022, 0.00000000 };
Point ( 9468 ) = { 0.85614800, 4.24602094, 0.00000000 };
Point ( 9469 ) = { 0.84873600, 4.24750874, 0.00000000 };
Point ( 9470 ) = { 0.84132141, 4.24898359, 0.00000000 };
Point ( 9471 ) = { 0.83390425, 4.25044550, 0.00000000 };
Point ( 9472 ) = { 0.82648456, 4.25189446, 0.00000000 };
Point ( 9473 ) = { 0.81906235, 4.25333047, 0.00000000 };
Point ( 9474 ) = { 0.81163764, 4.25475353, 0.00000000 };
Point ( 9475 ) = { 0.80421047, 4.25616362, 0.00000000 };
Point ( 9476 ) = { 0.79678084, 4.25756075, 0.00000000 };
Point ( 9477 ) = { 0.78934878, 4.25894491, 0.00000000 };
Point ( 9478 ) = { 0.78191432, 4.26031610, 0.00000000 };
Point ( 9479 ) = { 0.77447748, 4.26167430, 0.00000000 };
Point ( 9480 ) = { 0.76703828, 4.26301953, 0.00000000 };
Point ( 9481 ) = { 0.75959674, 4.26435177, 0.00000000 };
Point ( 9482 ) = { 0.75215289, 4.26567102, 0.00000000 };
Point ( 9483 ) = { 0.74470675, 4.26697728, 0.00000000 };
Point ( 9484 ) = { 0.73725834, 4.26827054, 0.00000000 };
Point ( 9485 ) = { 0.72980768, 4.26955080, 0.00000000 };
Point ( 9486 ) = { 0.72235480, 4.27081805, 0.00000000 };
Point ( 9487 ) = { 0.71489972, 4.27207229, 0.00000000 };
Point ( 9488 ) = { 0.70744247, 4.27331352, 0.00000000 };
Point ( 9489 ) = { 0.69998305, 4.27454173, 0.00000000 };
Point ( 9490 ) = { 0.69252151, 4.27575692, 0.00000000 };
Point ( 9491 ) = { 0.68505785, 4.27695908, 0.00000000 };
Point ( 9492 ) = { 0.67759211, 4.27814822, 0.00000000 };
Point ( 9493 ) = { 0.67012431, 4.27932432, 0.00000000 };
Point ( 9494 ) = { 0.66265446, 4.28048739, 0.00000000 };
Point ( 9495 ) = { 0.65518259, 4.28163742, 0.00000000 };
Point ( 9496 ) = { 0.64770873, 4.28277441, 0.00000000 };
Point ( 9497 ) = { 0.64023290, 4.28389835, 0.00000000 };
Point ( 9498 ) = { 0.63275511, 4.28500924, 0.00000000 };
Point ( 9499 ) = { 0.62527540, 4.28610708, 0.00000000 };
Point ( 9500 ) = { 0.61779379, 4.28719187, 0.00000000 };
Point ( 9501 ) = { 0.61031029, 4.28826359, 0.00000000 };
Point ( 9502 ) = { 0.60282493, 4.28932225, 0.00000000 };
Point ( 9503 ) = { 0.59533774, 4.29036784, 0.00000000 };
Point ( 9504 ) = { 0.58784873, 4.29140037, 0.00000000 };
Point ( 9505 ) = { 0.58035793, 4.29241982, 0.00000000 };
Point ( 9506 ) = { 0.57286536, 4.29342620, 0.00000000 };
Point ( 9507 ) = { 0.56537105, 4.29441950, 0.00000000 };
Point ( 9508 ) = { 0.55787502, 4.29539972, 0.00000000 };
Point ( 9509 ) = { 0.55037729, 4.29636685, 0.00000000 };
Point ( 9510 ) = { 0.54287788, 4.29732089, 0.00000000 };
Point ( 9511 ) = { 0.53537681, 4.29826185, 0.00000000 };
Point ( 9512 ) = { 0.52787412, 4.29918971, 0.00000000 };
Point ( 9513 ) = { 0.52036982, 4.30010448, 0.00000000 };
Point ( 9514 ) = { 0.51286393, 4.30100614, 0.00000000 };
Point ( 9515 ) = { 0.50535648, 4.30189471, 0.00000000 };
Point ( 9516 ) = { 0.49784749, 4.30277017, 0.00000000 };
Point ( 9517 ) = { 0.49033699, 4.30363252, 0.00000000 };
Point ( 9518 ) = { 0.48282499, 4.30448177, 0.00000000 };
Point ( 9519 ) = { 0.47531152, 4.30531790, 0.00000000 };
Point ( 9520 ) = { 0.46779660, 4.30614092, 0.00000000 };
Point ( 9521 ) = { 0.46028026, 4.30695082, 0.00000000 };
Point ( 9522 ) = { 0.45276252, 4.30774760, 0.00000000 };
Point ( 9523 ) = { 0.44524339, 4.30853125, 0.00000000 };
Point ( 9524 ) = { 0.43772291, 4.30930179, 0.00000000 };
Point ( 9525 ) = { 0.43020110, 4.31005919, 0.00000000 };
Point ( 9526 ) = { 0.42267798, 4.31080347, 0.00000000 };
Point ( 9527 ) = { 0.41515356, 4.31153462, 0.00000000 };
Point ( 9528 ) = { 0.40762789, 4.31225263, 0.00000000 };
Point ( 9529 ) = { 0.40010097, 4.31295751, 0.00000000 };
Point ( 9530 ) = { 0.39257283, 4.31364925, 0.00000000 };
Point ( 9531 ) = { 0.38504350, 4.31432784, 0.00000000 };
Point ( 9532 ) = { 0.37751300, 4.31499330, 0.00000000 };
Point ( 9533 ) = { 0.36998134, 4.31564561, 0.00000000 };
Point ( 9534 ) = { 0.36244856, 4.31628478, 0.00000000 };
Point ( 9535 ) = { 0.35491467, 4.31691080, 0.00000000 };
Point ( 9536 ) = { 0.34737971, 4.31752366, 0.00000000 };
Point ( 9537 ) = { 0.33984368, 4.31812338, 0.00000000 };
Point ( 9538 ) = { 0.33230662, 4.31870994, 0.00000000 };
Point ( 9539 ) = { 0.32476855, 4.31928335, 0.00000000 };
Point ( 9540 ) = { 0.31722948, 4.31984360, 0.00000000 };
Point ( 9541 ) = { 0.30968946, 4.32039069, 0.00000000 };
Point ( 9542 ) = { 0.30214848, 4.32092462, 0.00000000 };
Point ( 9543 ) = { 0.29460659, 4.32144538, 0.00000000 };
Point ( 9544 ) = { 0.28706380, 4.32195299, 0.00000000 };
Point ( 9545 ) = { 0.27952014, 4.32244743, 0.00000000 };
Point ( 9546 ) = { 0.27197562, 4.32292870, 0.00000000 };
Point ( 9547 ) = { 0.26443028, 4.32339680, 0.00000000 };
Point ( 9548 ) = { 0.25688413, 4.32385173, 0.00000000 };
Point ( 9549 ) = { 0.24933719, 4.32429349, 0.00000000 };
Point ( 9550 ) = { 0.24178950, 4.32472208, 0.00000000 };
Point ( 9551 ) = { 0.23424107, 4.32513750, 0.00000000 };
Point ( 9552 ) = { 0.22669193, 4.32553974, 0.00000000 };
Point ( 9553 ) = { 0.21914210, 4.32592880, 0.00000000 };
Point ( 9554 ) = { 0.21159160, 4.32630469, 0.00000000 };
Point ( 9555 ) = { 0.20404045, 4.32666739, 0.00000000 };
Point ( 9556 ) = { 0.19648869, 4.32701692, 0.00000000 };
Point ( 9557 ) = { 0.18893632, 4.32735327, 0.00000000 };
Point ( 9558 ) = { 0.18138338, 4.32767643, 0.00000000 };
Point ( 9559 ) = { 0.17382989, 4.32798642, 0.00000000 };
Point ( 9560 ) = { 0.16627587, 4.32828321, 0.00000000 };
Point ( 9561 ) = { 0.15872134, 4.32856683, 0.00000000 };
Point ( 9562 ) = { 0.15116633, 4.32883726, 0.00000000 };
Point ( 9563 ) = { 0.14361086, 4.32909450, 0.00000000 };
Point ( 9564 ) = { 0.13605495, 4.32933855, 0.00000000 };
Point ( 9565 ) = { 0.12849862, 4.32956942, 0.00000000 };
Point ( 9566 ) = { 0.12094190, 4.32978710, 0.00000000 };
Point ( 9567 ) = { 0.11338482, 4.32999159, 0.00000000 };
Point ( 9568 ) = { 0.10582739, 4.33018288, 0.00000000 };
Point ( 9569 ) = { 0.09826964, 4.33036099, 0.00000000 };
Point ( 9570 ) = { 0.09071159, 4.33052591, 0.00000000 };
Point ( 9571 ) = { 0.08315326, 4.33067764, 0.00000000 };
Point ( 9572 ) = { 0.07559468, 4.33081617, 0.00000000 };
Point ( 9573 ) = { 0.06803587, 4.33094151, 0.00000000 };
Point ( 9574 ) = { 0.06047685, 4.33105366, 0.00000000 };
Point ( 9575 ) = { 0.05291764, 4.33115261, 0.00000000 };
Point ( 9576 ) = { 0.04535828, 4.33123838, 0.00000000 };
Point ( 9577 ) = { 0.03779878, 4.33131094, 0.00000000 };
Point ( 9578 ) = { 0.03023916, 4.33137032, 0.00000000 };
Point ( 9579 ) = { 0.02267945, 4.33141650, 0.00000000 };
Point ( 9580 ) = { 0.01511967, 4.33144949, 0.00000000 };
Point ( 9581 ) = { 0.00755985, 4.33146928, 0.00000000 };
Point ( 9582 ) = { 0.00000000, 4.33147587, 0.00000000 };
Point ( 9583 ) = { -0.00755985, 4.33146928, 0.00000000 };
Point ( 9584 ) = { -0.01511967, 4.33144949, 0.00000000 };
Point ( 9585 ) = { -0.02267945, 4.33141650, 0.00000000 };
Point ( 9586 ) = { -0.03023916, 4.33137032, 0.00000000 };
Point ( 9587 ) = { -0.03779878, 4.33131094, 0.00000000 };
Point ( 9588 ) = { -0.04535828, 4.33123838, 0.00000000 };
Point ( 9589 ) = { -0.05291764, 4.33115261, 0.00000000 };
Point ( 9590 ) = { -0.06047685, 4.33105366, 0.00000000 };
Point ( 9591 ) = { -0.06803587, 4.33094151, 0.00000000 };
Point ( 9592 ) = { -0.07559468, 4.33081617, 0.00000000 };
Point ( 9593 ) = { -0.08315326, 4.33067764, 0.00000000 };
Point ( 9594 ) = { -0.09071159, 4.33052591, 0.00000000 };
Point ( 9595 ) = { -0.09826964, 4.33036099, 0.00000000 };
Point ( 9596 ) = { -0.10582739, 4.33018288, 0.00000000 };
Point ( 9597 ) = { -0.11338482, 4.32999159, 0.00000000 };
Point ( 9598 ) = { -0.12094190, 4.32978710, 0.00000000 };
Point ( 9599 ) = { -0.12849862, 4.32956942, 0.00000000 };
Point ( 9600 ) = { -0.13605495, 4.32933855, 0.00000000 };
Point ( 9601 ) = { -0.14361086, 4.32909450, 0.00000000 };
Point ( 9602 ) = { -0.15116633, 4.32883726, 0.00000000 };
Point ( 9603 ) = { -0.15872134, 4.32856683, 0.00000000 };
Point ( 9604 ) = { -0.16627587, 4.32828321, 0.00000000 };
Point ( 9605 ) = { -0.17382989, 4.32798642, 0.00000000 };
Point ( 9606 ) = { -0.18138338, 4.32767643, 0.00000000 };
Point ( 9607 ) = { -0.18893632, 4.32735327, 0.00000000 };
Point ( 9608 ) = { -0.19648869, 4.32701692, 0.00000000 };
Point ( 9609 ) = { -0.20404045, 4.32666739, 0.00000000 };
Point ( 9610 ) = { -0.21159160, 4.32630469, 0.00000000 };
Point ( 9611 ) = { -0.21914210, 4.32592880, 0.00000000 };
Point ( 9612 ) = { -0.22669193, 4.32553974, 0.00000000 };
Point ( 9613 ) = { -0.23424107, 4.32513750, 0.00000000 };
Point ( 9614 ) = { -0.24178950, 4.32472208, 0.00000000 };
Point ( 9615 ) = { -0.24933719, 4.32429349, 0.00000000 };
Point ( 9616 ) = { -0.25688413, 4.32385173, 0.00000000 };
Point ( 9617 ) = { -0.26443028, 4.32339680, 0.00000000 };
Point ( 9618 ) = { -0.27197562, 4.32292870, 0.00000000 };
Point ( 9619 ) = { -0.27952014, 4.32244743, 0.00000000 };
Point ( 9620 ) = { -0.28706380, 4.32195299, 0.00000000 };
Point ( 9621 ) = { -0.29460659, 4.32144538, 0.00000000 };
Point ( 9622 ) = { -0.30214848, 4.32092462, 0.00000000 };
Point ( 9623 ) = { -0.30968946, 4.32039069, 0.00000000 };
Point ( 9624 ) = { -0.31722948, 4.31984360, 0.00000000 };
Point ( 9625 ) = { -0.32476855, 4.31928335, 0.00000000 };
Point ( 9626 ) = { -0.33230662, 4.31870994, 0.00000000 };
Point ( 9627 ) = { -0.33984368, 4.31812338, 0.00000000 };
Point ( 9628 ) = { -0.34737971, 4.31752366, 0.00000000 };
Point ( 9629 ) = { -0.35491467, 4.31691080, 0.00000000 };
Point ( 9630 ) = { -0.36244856, 4.31628478, 0.00000000 };
Point ( 9631 ) = { -0.36998134, 4.31564561, 0.00000000 };
Point ( 9632 ) = { -0.37751300, 4.31499330, 0.00000000 };
// Drawing meridian to end index 9632 at -85.00, -64.00 (to match -73.51)
Point ( 9633 ) = { -0.37902173, 4.33223819, 0.00000000 };
Point ( 9634 ) = { -0.38054196, 4.34961446, 0.00000000 };
Point ( 9635 ) = { -0.38207381, 4.36712366, 0.00000000 };
Point ( 9636 ) = { -0.38361743, 4.38476734, 0.00000000 };
Point ( 9637 ) = { -0.38517296, 4.40254708, 0.00000000 };
Point ( 9638 ) = { -0.38674053, 4.42046449, 0.00000000 };
Point ( 9639 ) = { -0.38832029, 4.43852121, 0.00000000 };
Point ( 9640 ) = { -0.38991238, 4.45671889, 0.00000000 };
Point ( 9641 ) = { -0.39151695, 4.47505921, 0.00000000 };
Point ( 9642 ) = { -0.39313415, 4.49354390, 0.00000000 };
Point ( 9643 ) = { -0.39476413, 4.51217468, 0.00000000 };
Point ( 9644 ) = { -0.39640705, 4.53095333, 0.00000000 };
Point ( 9645 ) = { -0.39806306, 4.54988164, 0.00000000 };
Point ( 9646 ) = { -0.39973233, 4.56896144, 0.00000000 };
Point ( 9647 ) = { -0.40141501, 4.58819459, 0.00000000 };
Point ( 9648 ) = { -0.40311128, 4.60758296, 0.00000000 };
Point ( 9649 ) = { -0.40482129, 4.62712848, 0.00000000 };
Point ( 9650 ) = { -0.40654522, 4.64683310, 0.00000000 };
Point ( 9651 ) = { -0.40828324, 4.66669879, 0.00000000 };
Point ( 9652 ) = { -0.41003553, 4.68672757, 0.00000000 };
Point ( 9653 ) = { -0.41180227, 4.70692149, 0.00000000 };
Point ( 9654 ) = { -0.41358364, 4.72728263, 0.00000000 };
Point ( 9655 ) = { -0.41537982, 4.74781310, 0.00000000 };
Point ( 9656 ) = { -0.41719101, 4.76851506, 0.00000000 };
Point ( 9657 ) = { -0.41901739, 4.78939070, 0.00000000 };
Point ( 9658 ) = { -0.42085916, 4.81044224, 0.00000000 };
Point ( 9659 ) = { -0.42271652, 4.83167196, 0.00000000 };
Point ( 9660 ) = { -0.42458967, 4.85308215, 0.00000000 };
Point ( 9661 ) = { -0.42647881, 4.87467516, 0.00000000 };
Point ( 9662 ) = { -0.42838416, 4.89645337, 0.00000000 };
Point ( 9663 ) = { -0.43030592, 4.91841922, 0.00000000 };
Point ( 9664 ) = { -0.43224432, 4.94057516, 0.00000000 };
Point ( 9665 ) = { -0.43419956, 4.96292372, 0.00000000 };
Point ( 9666 ) = { -0.43617188, 4.98546745, 0.00000000 };
Point ( 9667 ) = { -0.43816151, 5.00820895, 0.00000000 };
Point ( 9668 ) = { -0.44016867, 5.03115087, 0.00000000 };
Point ( 9669 ) = { -0.44219359, 5.05429591, 0.00000000 };
Point ( 9670 ) = { -0.44423653, 5.07764681, 0.00000000 };
Point ( 9671 ) = { -0.44629773, 5.10120637, 0.00000000 };
Point ( 9672 ) = { -0.44837743, 5.12497743, 0.00000000 };
Point ( 9673 ) = { -0.45047588, 5.14896290, 0.00000000 };
Point ( 9674 ) = { -0.45259335, 5.17316572, 0.00000000 };
Point ( 9675 ) = { -0.45473011, 5.19758890, 0.00000000 };
Point ( 9676 ) = { -0.45688640, 5.22223549, 0.00000000 };
Point ( 9677 ) = { -0.45906252, 5.24710862, 0.00000000 };
Point ( 9678 ) = { -0.46125873, 5.27221146, 0.00000000 };
Point ( 9679 ) = { -0.46347533, 5.29754726, 0.00000000 };
Point ( 9680 ) = { -0.46571259, 5.32311929, 0.00000000 };
Point ( 9681 ) = { -0.46797082, 5.34893093, 0.00000000 };
Point ( 9682 ) = { -0.47025031, 5.37498560, 0.00000000 };
Point ( 9683 ) = { -0.47255136, 5.40128679, 0.00000000 };
Point ( 9684 ) = { -0.47487430, 5.42783804, 0.00000000 };
Point ( 9685 ) = { -0.47721943, 5.45464300, 0.00000000 };
Point ( 9686 ) = { -0.47958707, 5.48170535, 0.00000000 };
Point ( 9687 ) = { -0.48197757, 5.50902885, 0.00000000 };
Point ( 9688 ) = { -0.48439125, 5.53661735, 0.00000000 };
Point ( 9689 ) = { -0.48682846, 5.56447478, 0.00000000 };
Point ( 9690 ) = { -0.48928955, 5.59260511, 0.00000000 };
Point ( 9691 ) = { -0.49177486, 5.62101242, 0.00000000 };
Point ( 9692 ) = { -0.49428478, 5.64970088, 0.00000000 };
Point ( 9693 ) = { -0.49681966, 5.67867471, 0.00000000 };
Point ( 9694 ) = { -0.49937989, 5.70793825, 0.00000000 };
Point ( 9695 ) = { -0.50196585, 5.73749590, 0.00000000 };
Point ( 9696 ) = { -0.50457793, 5.76735217, 0.00000000 };
Point ( 9697 ) = { -0.50721655, 5.79751165, 0.00000000 };
Point ( 9698 ) = { -0.50988210, 5.82797902, 0.00000000 };
Point ( 9699 ) = { -0.51257500, 5.85875909, 0.00000000 };
Point ( 9700 ) = { -0.51529569, 5.88985673, 0.00000000 };
Point ( 9701 ) = { -0.51804460, 5.92127692, 0.00000000 };
Point ( 9702 ) = { -0.52082218, 5.95302478, 0.00000000 };
Point ( 9703 ) = { -0.52362888, 5.98510549, 0.00000000 };
Point ( 9704 ) = { -0.52646516, 6.01752436, 0.00000000 };
Point ( 9705 ) = { -0.52933151, 6.05028683, 0.00000000 };
Point ( 9706 ) = { -0.53222840, 6.08339844, 0.00000000 };
Point ( 9707 ) = { -0.53515633, 6.11686484, 0.00000000 };
Point ( 9708 ) = { -0.53811581, 6.15069182, 0.00000000 };
Point ( 9709 ) = { -0.54110735, 6.18488530, 0.00000000 };
Point ( 9710 ) = { -0.54413148, 6.21945131, 0.00000000 };
Point ( 9711 ) = { -0.54718875, 6.25439604, 0.00000000 };
Point ( 9712 ) = { -0.55027970, 6.28972578, 0.00000000 };
Point ( 9713 ) = { -0.55340490, 6.32544701, 0.00000000 };
Point ( 9714 ) = { -0.55656493, 6.36156630, 0.00000000 };
Point ( 9715 ) = { -0.55976038, 6.39809042, 0.00000000 };
Point ( 9716 ) = { -0.56299185, 6.43502626, 0.00000000 };
Point ( 9717 ) = { -0.56625995, 6.47238088, 0.00000000 };
Point ( 9718 ) = { -0.56956533, 6.51016150, 0.00000000 };
Point ( 9719 ) = { -0.57290862, 6.54837552, 0.00000000 };
Point ( 9720 ) = { -0.57629049, 6.58703048, 0.00000000 };
Point ( 9721 ) = { -0.57971162, 6.62613412, 0.00000000 };
Point ( 9722 ) = { -0.58317269, 6.66569437, 0.00000000 };
Point ( 9723 ) = { -0.58667442, 6.70571933, 0.00000000 };
Point ( 9724 ) = { -0.59021753, 6.74621729, 0.00000000 };
Point ( 9725 ) = { -0.59380277, 6.78719676, 0.00000000 };
Point ( 9726 ) = { -0.59743090, 6.82866644, 0.00000000 };
BSpline ( 15 ) = { 9073 : 9726, 3910 };
Line Loop( 14 ) = { 14, 15 };


// == Physical entities ===========================================
// Boundary OpenOcean (ID 4): 16
Physical Line( 4 ) = { 15 };
// Boundary Coast (ID 3): 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
Physical Line( 3 ) = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 };
Plane Surface( 10 ) = { 14, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 };
Physical Surface( 10 ) = { 10 };

// == End of contour definitions ==================================
// Do not extent the elements sizes from the boundary inside the domain
Mesh.CharacteristicLengthExtendFromBoundary = 0;

// == Field definitions ===========================================

Field[ 2 ] = Attractor;
Field[ 2 ].EdgesList = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 };
Field[ 2 ].NNodesByEdge = 20000;

Field[ 3 ] = Threshold;
Field[ 3 ].IField = 2;
Field[ 3 ].LcMin = 1.000000e+04;
Field[ 3 ].LcMax = 5.000000e+05;
Field[ 3 ].DistMin = 3.000000e+04;
Field[ 3 ].DistMax = 1.000000e+06;

Background Field = 3;


// Set general options for default view and improved PNG output
General.Color.Background = {255,255,255};
General.Color.BackgroundGradient = {255,255,255};
General.Color.Foreground = Black;
Mesh.Color.Lines = {0,0,0};
Geometry.Color.Lines = {0,0,0};
//Mesh.Color.Triangles = {0,0,0}; 
Mesh.Color.Ten = {0,0,0};
Mesh.ColorCarousel = 2;
Mesh.Light = 0;
General.Antialiasing = 1;

General.Trackball = 0;
General.RotationX = 180;
General.RotationY = 0;
General.RotationZ = 270;
