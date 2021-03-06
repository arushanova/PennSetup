// This geometry is for SPECTRE with the Y90 capillary. 

{
name: "GEO",
index: "world",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "",
enable: 1,

factory: "solid",
solid: "box",

half_size: [950.0, 950.0, 455.0],
position: [0.0, 0.0, 0.0],
rotation: [0.0, 0.0, 0.0],
material: "air",
}

{
name: "GEO",
index: "table_leg_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 14.57,
half_z: 340.0,

position: [-88.0, -370.0,-115.0],
material: "aluminum",
}

{
name: "GEO",
index: "table_leg_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 14.57,
half_z: 340.0,

position: [-540.0, -72.0,-115.0],
material: "aluminum",
}

{
name: "GEO",
index: "table_leg_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 14.57,
half_z: 340.0,

position: [-250.0, 390.0,-115.0],
material: "aluminum",
}

{
name: "GEO",
index: "table_leg_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 14.57,
half_z: 340.0,

position: [220.0, 110.0,-115.0],
material: "aluminum",
}

{
name: "GEO",
index: "acrylic",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "solid",
solid: "sphere",

r_max: 203.2,

position: [-190.0, 20.0,-191.8],
material: "acrylic_uva_McMaster",
}

{
name: "GEO",
index: "scint",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "acrylic",
enable: 1,

factory: "solid",
solid: "sphere",

r_max: 201.7,

position: [0.0, 0.0, 0.0],
//material: "labppo_scintillator",
material: "te_0p3_labppo_scintillator_Perylene_Feb2015",
}

{
name: "GEO",
index: "aluminum_disc",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 66.7,
half_z: 2.5,

position: [0.0, 0.0 ,190.15],
material: "aluminum",
}



{
name: "GEO",
index: "source_leg_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 2.5,
half_z:67.5,

position: [0.0, 21.25 ,122.55],
material: "ABSplastic",
}

{
name: "GEO",
index: "source_leg_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 2.5,
half_z:67.5,

position: [-18.403, -10.625 ,122.55],
material: "ABSplastic",
}

{
name: "GEO",
index: "source_leg_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 2.5,
half_z:67.5,

position: [18.403, -10.625 ,122.55],
material: "ABSplastic",
}

{
name: "GEO",
index: "acrylic_center_disc",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 22.5,
half_z:1.25,

position: [0.0, 0.0 ,53.8],
material: "acrylic_uva_McMaster",
}

{
name: "GEO",
index: "acrylic_capholder_disc",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 15.0,
half_z:7.5,

position: [0.0, 0.0 ,62.55],
material: "acrylic_uva_McMaster",
}

{
name: "GEO",
index: "acrylic_capholder_disc_lower",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 15.0,
half_z:10.0,

position: [0.0, 0.0 ,42.55],
material: "acrylic_uva_McMaster",
}

{
name: "GEO",
index: "capillary",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "scint",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 0.6,
half_z:21.25,

position: [0.0, 0.0 ,11.30],
material: "glass",
}

{
name: "GEO",
index: "capillary_airgap",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capillary",
enable: 1,

factory: "solid",
solid: "tube",

r_max: 0.45,
half_z:21.225,

position: [0.0, 0.0 ,0.0],   
material: "air",
}

{
name: "GEO",
index: "snoPMT",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
enable: 1,

factory: "pmtbuilder",

pmt_build_type: [3], 
pmt_type: ["r1408"],

add_concentrator: [0],
concentrator_type: ["cRAT"],

add_bucket: [0],
bucket_type: ["bRAT"],

add_pmtbase: [0],
pmtbase_type: ["r1408"],

grey_disc: [0],
grey_disc_model_params: ["DiscOptics0_0"],

sensitive_detector: "/mydet/pmt/inner",

vis_simple: 1,
vis_invisible: 0,
}


