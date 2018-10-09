%% load models

load('cobraModels.mat');

%% Set model boundary reactions

% Turn everything off
EXlist = {'EX_cpd00156_e0';'EX_cpd11583_e0';'EX_cpd01242_e0';'EX_cpd00254_e0';'EX_cpd15603_e0';'EX_cpd00067_e0';'EX_cpd11576_e0';'EX_cpd00098_e0';'EX_cpd10516_e0';'EX_cpd00137_e0';'EX_cpd08023_e0';'EX_cpd00205_e0';'EX_cpd00034_e0';'EX_cpd00009_e0';'EX_cpd15606_e0';'EX_cpd00048_e0';'EX_cpd00039_e0';'EX_cpd00106_e0';'EX_cpd00264_e0';'EX_cpd00030_e0';'EX_cpd09878_e0';'EX_cpd00129_e0';'EX_cpd00080_e0';'EX_cpd00119_e0';'EX_cpd01017_e0';'EX_cpd11586_e0';'EX_cpd00060_e0';'EX_cpd00309_e0';'EX_cpd11589_e0';'EX_cpd11578_e0';'EX_cpd15302_c0';'EX_cpd00268_e0';'EX_cpd11584_e0';'EX_cpd15604_e0';'EX_cpd00105_e0';'EX_cpd00041_e0';'EX_cpd11593_e0';'EX_cpd00027_e0';'EX_cpd00001_e0';'EX_cpd00222_e0';'EX_cpd01329_e0';'EX_cpd00210_e0';'EX_cpd11587_e0';'EX_cpd00322_e0';'EX_cpd00971_e0';'EX_cpd00013_e0';'EX_cpd00224_e0';'EX_cpd00540_e0';'EX_cpd00107_e0';'EX_cpd00226_e0';'EX_cpd00036_e0';'EX_cpd03725_e0';'EX_cpd10515_e0';'EX_cpd03343_e0';'EX_cpd03048_e0';'EX_cpd00099_e0';'EX_cpd00104_e0';'EX_cpd11592_e0';'EX_cpd00012_e0';'EX_cpd11579_e0';'EX_cpd11580_e0';'EX_cpd11581_e0';'EX_cpd01012_e0';'EX_cpd01262_e0';'EX_cpd00063_e0';'EX_cpd00307_e0';'EX_cpd01914_e0';'EX_cpd00395_e0';'EX_cpd00531_e0';'EX_cpd03724_e0';'EX_cpd11596_e0';'EX_cpd11585_e0';'EX_cpd11575_e0';'EX_cpd00305_e0';'EX_cpd00209_e0';'EX_cpd11591_e0';'EX_cpd00033_e0';'EX_cpd00092_e0';'EX_cpd00064_e0';'EX_cpd00051_e0';'EX_cpd00154_e0';'EX_cpd00058_e0';'EX_cpd04097_e0';'EX_cpd00149_e0';'EX_cpd00179_e0';'EX_cpd15605_e0';'EX_cpd00073_e0';'EX_cpd00118_e0';'EX_cpd11582_e0';'EX_cpd00637_e0';'EX_cpd11588_e0';'EX_cpd01092_e0';'EX_cpd00023_e0';'EX_cpd00075_e0';'EX_cpd00011_e0';'EX_cpd00007_e0';'EX_cpd11416_c0';'EX_cpd15378_e0';'EX_cpd00147_e0';'EX_cpd00121_e0';'EX_cpd11574_e0';'EX_cpd00392_e0';'EX_cpd00366_e0';'EX_cpd00417_e0';'EX_cpd00567_e0';'EX_cpd03727_e0';'EX_cpd15137_e0';'EX_cpd00396_e0';'EX_cpd00308_e0';'EX_cpd02233_e0';'EX_cpd07061_e0';'EX_cpd00122_e0';'EX_cpd00609_e0';'EX_cpd00108_e0';'EX_cpd00117_e0';'EX_cpd00794_e0';'EX_cpd00138_e0';'EX_cpd01171_e0';'EX_cpd00550_e0';'EX_cpd00588_e0';'EX_cpd00100_e0';'EX_cpd00751_e0';'EX_cpd00164_e0';'EX_cpd00159_e0';'EX_cpd00047_e0';'EX_cpd00314_e0';'EX_cpd00079_e0';'EX_cpd02143_e0';'EX_cpd13391_e0';'EX_cpd00082_e0';'EX_cpd00029_e0';'EX_cpd03198_e0';'EX_cpd00184_e0';'EX_cpd00132_e0';'EX_cpd00320_e0';'EX_cpd02351_e0';'EX_cpd00453_e0';'EX_cpd00024_e0';'EX_cpd00094_e0';'EX_cpd02274_e0';'EX_cpd00208_e0';'EX_cpd04349_e0';'EX_cpd00076_e0';'EX_cpd00249_e0';'EX_cpd00053_e0';'EX_cpd00432_e0';'EX_cpd00089_e0';'EX_cpd00072_e0';'EX_cpd13392_e0';'EX_cpd03561_e0';'EX_cpd11603_e0';'EX_cpd00438_e0';'EX_cpd00182_e0';'EX_cpd00611_e0';'EX_cpd00141_e0';'EX_cpd01246_e0';'EX_cpd00139_e0';'EX_cpd00040_e0';'EX_cpd00158_e0';'EX_cpd00246_e0';'EX_cpd00054_e0';'EX_cpd00161_e0';'EX_cpd00035_e0';'EX_cpd00142_e0';'EX_cpd00492_e0';'EX_cpd00386_e0';'EX_cpd00130_e0';'EX_cpd00489_e0';'EX_cpd00374_e0';'EX_cpd03884_e0';'EX_cpd01067_e0';'EX_cpd00020_e0';'EX_cpd00280_e0';'EX_cpd03161_e0';'EX_cpd00162_e0';'EX_cpd11717_e0';'EX_cpd11594_e0';'EX_cpd11879_e0';'EX_cpd00155_e0';'EX_cpd11602_e0';'EX_cpd11748_e0';'EX_cpd11685_e0';'EX_cpd11601_e0';'EX_cpd00832_e0';'EX_cpd00232_e0';'EX_cpd01055_e0';'EX_cpd05240_e0';'EX_cpd00185_e0';'EX_cpd01307_e0';'EX_cpd03696_e0';'EX_cpd00750_e0';'EX_cpd05158_e0';'EX_cpd09457_e0';'EX_cpd05161_e0';'EX_cpd16821_e0';'EX_cpd01200_e0';'EX_cpd00382_e0';'EX_cpd01030_e0';'EX_cpd00212_e0';'EX_cpd01133_e0';'EX_cpd00589_e0';'EX_cpd00306_e0';'EX_cpd00281_e0';'EX_cpd00339_e0';'EX_cpd00211_e0';'EX_cpd01107_e0';'EX_cpd01113_e0';'EX_cpd01502_e0';'EX_cpd00607_e0';'EX_cpd00276_e0';'EX_cpd00599_e0';'EX_cpd00136_e0';'EX_cpd00797_e0';'EX_cpd00728_e0';'EX_cpd03737_e0';'EX_cpd00380_e0';'EX_cpd00180_e0';'EX_cpd01363_e0';'EX_cpd00248_e0';'EX_cpd05192_e0';'EX_cpd00666_e0';'EX_cpd03734_e0';'EX_cpd00477_e0';'EX_cpd00227_e0';'EX_cpd00066_e0';'EX_cpd01293_e0';'EX_cpd10719_e0';'EX_cpd00266_e0';'EX_cpd01799_e0';'EX_cpd02599_e0';'EX_cpd00157_e0';'EX_cpd01947_e0';'EX_cpd00361_e0';'EX_cpd00851_e0';'EX_cpd02175_e0';'EX_cpd00737_e0';'EX_cpd03963_e0';'EX_cpd00084_e0';'EX_cpd00065_e0';'EX_cpd00069_e0';'EX_cpd01308_e0';'EX_cpd00186_e0';'EX_cpd00549_e0';'EX_cpd03840_e0';'EX_cpd00274_e0';'EX_cpd00165_e0';'EX_cpd00187_e0';'EX_cpd00591_e0';'EX_cpd00152_e0';'EX_cpd00312_e0';'EX_cpd00378_e0';'EX_cpd01524_e0';'EX_cpd02241_e0';'EX_cpd00128_e0';'EX_cpd00367_e0';'EX_cpd00207_e0';'EX_cpd00311_e0';'EX_cpd00151_e0';'EX_cpd01217_e0';'EX_cpd00300_e0';'EX_cpd01573_e0';'EX_cpd01588_e0';'EX_cpd11590_e0';'EX_cpd00919_e0';'EX_cpd00635_e0';'EX_cpd00528_e0';'EX_cpdFixed_e0';'EX_cpd11640_e0';'EX_cpd01024_e0';'EX_cpd00197_e0'};
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021,EXlist,0,'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83,EXlist,0,'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C,EXlist,0,'l');
AK83_AK83 = changeRxnBounds(AK83_AK83,EXlist,0,'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C,EXlist,0,'l');

% Set base soil environment
SoilBase = { 'EX_cpd00001_e0', 'EX_cpd00007_e0', 'EX_cpd00011_e0', 'EX_cpd00030_e0', 'EX_cpd00034_e0', 'EX_cpd00058_e0', 'EX_cpd00063_e0', 'EX_cpd00067_e0', 'EX_cpd00099_e0', 'EX_cpd00104_e0', 'EX_cpd00149_e0', 'EX_cpd00205_e0', 'EX_cpd00254_e0', 'EX_cpd00971_e0', 'EX_cpd10515_e0', 'EX_cpd10516_e0', 'EX_cpd00048_e0', 'EX_cpd00009_e0' };
SoilBase2 = { 'EX_cpd00013_e0', 'EX_cpd00209_e0' };
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021,SoilBase,-15,'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021,SoilBase2,-7.5,'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83,SoilBase,-15,'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83,SoilBase2,-7.5,'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C,SoilBase,-15,'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C,SoilBase2,-7.5,'l');
AK83_AK83 = changeRxnBounds(AK83_AK83,SoilBase,-15,'l');
AK83_AK83 = changeRxnBounds(AK83_AK83,SoilBase2,-7.5,'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C,SoilBase,-15,'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C,SoilBase2,-7.5,'l');

%Define the rhizosphere soil
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00224_e0', -0.26974143, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00108_e0', -0.18317325, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00027_e0', -0.04098397, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00138_e0', -0.05436649, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00396_e0', -0.02927426, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00154_e0', -0.04600242, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00105_e0', -0, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00076_e0', -0.02049199, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00382_e0', -0.01024599, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd01133_e0', -0.03073798, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00036_e0', -0.12240603, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00130_e0', -0.79413596, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00041_e0', -0.03205557, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00161_e0', -0.00961667, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00054_e0', -0.01004986, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00023_e0', -0.02833020, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00129_e0', -0, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00033_e0', -0.00693094, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00035_e0', -0.00823049, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00156_e0', -0.00337883, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00084_e0', -0, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00322_e0', -0.00186269, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00107_e0', -0.00303228, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00069_e0', -0.00233919, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00281_e0', -0, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00064_e0', -0.00831712, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00119_e0', -0.00506825, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00051_e0', -0.00948672, 'l');
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021, 'EX_cpd00851_e0', -0.26974144, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00224_e0', -0.26974143, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00108_e0', -0.18317325, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00027_e0', -0.04098397, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00138_e0', -0.05436649, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00396_e0', -0.02927426, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00154_e0', -0.04600242, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00105_e0', -0, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00076_e0', -0.02049199, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00382_e0', -0.01024599, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd01133_e0', -0.03073798, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00036_e0', -0.12240603, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00130_e0', -0.79413596, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00041_e0', -0.03205557, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00161_e0', -0.00961667, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00054_e0', -0.01004986, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00023_e0', -0.02833020, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00129_e0', -0, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00033_e0', -0.00693094, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00035_e0', -0.00823049, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00156_e0', -0.00337883, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00084_e0', -0, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00322_e0', -0.00186269, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00107_e0', -0.00303228, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00069_e0', -0.00233919, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00281_e0', -0, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00064_e0', -0.00831712, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00119_e0', -0.00506825, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00051_e0', -0.00948672, 'l');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83, 'EX_cpd00851_e0', -0.26974144, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00224_e0', -0.26974143, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00108_e0', -0.18317325, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00027_e0', -0.04098397, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00138_e0', -0.05436649, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00396_e0', -0.02927426, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00154_e0', -0.04600242, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00105_e0', -0, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00076_e0', -0.02049199, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00382_e0', -0.01024599, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd01133_e0', -0.03073798, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00036_e0', -0.12240603, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00130_e0', -0.79413596, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00041_e0', -0.03205557, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00161_e0', -0.00961667, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00054_e0', -0.01004986, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00023_e0', -0.02833020, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00129_e0', -0, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00033_e0', -0.00693094, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00035_e0', -0.00823049, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00156_e0', -0.00337883, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00084_e0', -0, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00322_e0', -0.00186269, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00107_e0', -0.00303228, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00069_e0', -0.00233919, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00281_e0', -0, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00064_e0', -0.00831712, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00119_e0', -0.00506825, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00051_e0', -0.00948672, 'l');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C, 'EX_cpd00851_e0', -0.26974144, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00224_e0', -0.26974143, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00108_e0', -0.18317325, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00027_e0', -0.04098397, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00138_e0', -0.05436649, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00396_e0', -0.02927426, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00154_e0', -0.04600242, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00105_e0', -0, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00076_e0', -0.02049199, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00382_e0', -0.01024599, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd01133_e0', -0.03073798, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00036_e0', -0.12240603, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00130_e0', -0.79413596, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00041_e0', -0.03205557, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00161_e0', -0.00961667, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00054_e0', -0.01004986, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00023_e0', -0.02833020, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00129_e0', -0, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00033_e0', -0.00693094, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00035_e0', -0.00823049, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00156_e0', -0.00337883, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00084_e0', -0, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00322_e0', -0.00186269, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00107_e0', -0.00303228, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00069_e0', -0.00233919, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00281_e0', -0, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00064_e0', -0.00831712, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00119_e0', -0.00506825, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00051_e0', -0.00948672, 'l');
AK83_AK83 = changeRxnBounds(AK83_AK83, 'EX_cpd00851_e0', -0.26974144, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00224_e0', -0.26974143, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00108_e0', -0.18317325, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00027_e0', -0.04098397, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00138_e0', -0.05436649, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00396_e0', -0.02927426, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00154_e0', -0.04600242, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00105_e0', -0, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00076_e0', -0.02049199, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00382_e0', -0.01024599, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd01133_e0', -0.03073798, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00036_e0', -0.12240603, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00130_e0', -0.79413596, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00041_e0', -0.03205557, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00161_e0', -0.00961667, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00054_e0', -0.01004986, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00023_e0', -0.02833020, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00129_e0', -0, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00033_e0', -0.00693094, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00035_e0', -0.00823049, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00156_e0', -0.00337883, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00084_e0', -0, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00322_e0', -0.00186269, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00107_e0', -0.00303228, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00069_e0', -0.00233919, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00281_e0', -0, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00064_e0', -0.00831712, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00119_e0', -0.00506825, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00051_e0', -0.00948672, 'l');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C, 'EX_cpd00851_e0', -0.26974144, 'l');

%% Change objective function

% Remove existing biomass reactions
Rm1021_Rm1021 = removeRxns(Rm1021_Rm1021,'biomass_rhizosphere_c0');
Rm1021_AK83 = removeRxns(Rm1021_AK83,'biomass_rhizosphere_c0');
Rm1021_BL225C = removeRxns(Rm1021_BL225C,'biomass_rhizosphere_c0');
AK83_AK83 = removeRxns(AK83_AK83,'biomass_rhizosphere_c0');
BL225C_BL225C = removeRxns(BL225C_BL225C,'biomass_rhizosphere_c0');

% Add the new biomass reactions with additional compounds

[Rm1021_Rm1021,rxnIDexits] = addReaction(Rm1021_Rm1021,'biomass_rhizosphere_c0',...
    {'cpd00010[c]','cpd00004[c]','cpd00003[c]','cpd00006[c]','cpd00005[c]',...
    'cpd00016[c]','cpd00254[c]','cpd10516[c]','cpd10515[c]','cpd00205[c]',...
    'cpd00034[c]','cpd15665[c]','cpd15560[c]','cpd00042[c]','cpd00264[c]',...
    'cpd00030[c]','cpd00087[c]','cpd00015[c]','cpd00982[c]','cpd00056[c]',...
    'cpd15541[c]','cpd00125[c]','cpd00118[c]','cpd00644[c]','cpd00155[c]',...
    'cpd00166[c]','cpd00149[c]','cpd00393[c]','cpd15312[c]','cpd00220[c]',...
    'cpd15534[c]','cpd00971[c]','cpd00104[c]','cpd12848[c]','cpd00111[c]',...
    'cpd00063[c]','cpd15432[c]','cpd15431[c]','cpd11624[c]','cpdOL[c]',...
    'cpd12836[c]','cpdEPSLn[c]','cpdEPSHn[c]','cpd11461[c]','cpd11613[c]',...
    'cpd11463[c]','cpdNodF[c]','cpd15666[c]','cpd15302[c]','cpd11416[c]',...
    'cpd12837[c]','cpdEPSLn1[c]','cpdEPSHn1[c]'},...
    [-0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.017751 -0.0001 -0.0001 -5.2742e-05 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.012899 -0.0001 -0.00026356 -0.0001 -0.02467...
    -0.0001 -0.0001 -0.0001 -0.0033073 -0.0001 -0.043525 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.0071853 -0.0027253 -0.097369 -0.0033778...
    -1.0222 -0.049837412 -0.012459352 -0.00090612 -0.0022966 -0.00045458 -0.000892701 ...
    0.017751 0.02467 1 1.0222 0.024919 0.0062297],...
    false,0,1000,1);

[Rm1021_AK83,rxnIDexits] = addReaction(Rm1021_AK83,'biomass_rhizosphere_c0',...
    {'cpd00010[c]','cpd00004[c]','cpd00003[c]','cpd00006[c]','cpd00005[c]',...
    'cpd00016[c]','cpd00254[c]','cpd10516[c]','cpd10515[c]','cpd00205[c]',...
    'cpd00034[c]','cpd15665[c]','cpd15560[c]','cpd00042[c]','cpd00264[c]',...
    'cpd00030[c]','cpd00087[c]','cpd00015[c]','cpd00982[c]','cpd00056[c]',...
    'cpd15541[c]','cpd00125[c]','cpd00118[c]','cpd00644[c]','cpd00155[c]',...
    'cpd00166[c]','cpd00149[c]','cpd00393[c]','cpd15312[c]','cpd00220[c]',...
    'cpd15534[c]','cpd00971[c]','cpd00104[c]','cpd12848[c]','cpd00111[c]',...
    'cpd00063[c]','cpd15432[c]','cpd15431[c]','cpd11624[c]','cpdOL[c]',...
    'cpd12836[c]','cpdEPSLn[c]','cpdEPSHn[c]','cpd11461[c]','cpd11613[c]',...
    'cpd11463[c]','cpdNodF[c]','cpd15666[c]','cpd15302[c]','cpd11416[c]',...
    'cpd12837[c]','cpdEPSLn1[c]','cpdEPSHn1[c]'},...
    [-0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.017751 -0.0001 -0.0001 -5.2742e-05 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.012899 -0.0001 -0.00026356 -0.0001 -0.02467...
    -0.0001 -0.0001 -0.0001 -0.0033073 -0.0001 -0.043525 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.0071853 -0.0027253 -0.097369 -0.0033778...
    -1.0222 -0.049837412 -0.012459352 -0.00090612 -0.0022966 -0.00045458 -0.000892701 ...
    0.017751 0.02467 1 1.0222 0.024919 0.0062297],...
    false,0,1000,1);

[Rm1021_BL225C,rxnIDexits] = addReaction(Rm1021_BL225C,'biomass_rhizosphere_c0',...
    {'cpd00010[c]','cpd00004[c]','cpd00003[c]','cpd00006[c]','cpd00005[c]',...
    'cpd00016[c]','cpd00254[c]','cpd10516[c]','cpd10515[c]','cpd00205[c]',...
    'cpd00034[c]','cpd15665[c]','cpd15560[c]','cpd00042[c]','cpd00264[c]',...
    'cpd00030[c]','cpd00087[c]','cpd00015[c]','cpd00982[c]','cpd00056[c]',...
    'cpd15541[c]','cpd00125[c]','cpd00118[c]','cpd00644[c]','cpd00155[c]',...
    'cpd00166[c]','cpd00149[c]','cpd00393[c]','cpd15312[c]','cpd00220[c]',...
    'cpd15534[c]','cpd00971[c]','cpd00104[c]','cpd12848[c]','cpd00111[c]',...
    'cpd00063[c]','cpd15432[c]','cpd15431[c]','cpd11624[c]','cpdOL[c]',...
    'cpd12836[c]','cpdEPSLn[c]','cpdEPSHn[c]','cpd11461[c]','cpd11613[c]',...
    'cpd11463[c]','cpdNodF[c]','cpd15666[c]','cpd15302[c]','cpd11416[c]',...
    'cpd12837[c]','cpdEPSLn1[c]','cpdEPSHn1[c]'},...
    [-0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.017751 -0.0001 -0.0001 -5.2742e-05 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.012899 -0.0001 -0.00026356 -0.0001 -0.02467...
    -0.0001 -0.0001 -0.0001 -0.0033073 -0.0001 -0.043525 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.0071853 -0.0027253 -0.097369 -0.0033778...
    -1.0222 -0.049837412 -0.012459352 -0.00090612 -0.0022966 -0.00045458 -0.000892701 ...
    0.017751 0.02467 1 1.0222 0.024919 0.0062297],...
    false,0,1000,1);

[AK83_AK83,rxnIDexits] = addReaction(AK83_AK83,'biomass_rhizosphere_c0',...
    {'cpd00010[c]','cpd00004[c]','cpd00003[c]','cpd00006[c]','cpd00005[c]',...
    'cpd00016[c]','cpd00254[c]','cpd10516[c]','cpd10515[c]','cpd00205[c]',...
    'cpd00034[c]','cpd15665[c]','cpd15560[c]','cpd00042[c]','cpd00264[c]',...
    'cpd00030[c]','cpd00087[c]','cpd00015[c]','cpd00982[c]','cpd00056[c]',...
    'cpd15541[c]','cpd00125[c]','cpd00118[c]','cpd00644[c]','cpd00155[c]',...
    'cpd00166[c]','cpd00149[c]','cpd00393[c]','cpd15312[c]','cpd00220[c]',...
    'cpd15534[c]','cpd00971[c]','cpd00104[c]','cpd12848[c]','cpd00111[c]',...
    'cpd00063[c]','cpd15432[c]','cpd15431[c]','cpd11624[c]','cpdOL[c]',...
    'cpd12836[c]','cpdEPSLn[c]','cpdEPSHn[c]','cpd11461[c]','cpd11613[c]',...
    'cpd11463[c]','cpdNodF[c]','cpd15666[c]','cpd15302[c]','cpd11416[c]',...
    'cpd12837[c]','cpdEPSLn1[c]','cpdEPSHn1[c]'},...
    [-0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.017751 -0.0001 -0.0001 -5.2742e-05 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.012899 -0.0001 -0.00026356 -0.0001 -0.02467...
    -0.0001 -0.0001 -0.0001 -0.0033073 -0.0001 -0.043525 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.0071853 -0.0027253 -0.097369 -0.0033778...
    -1.0222 -0.049837412 -0.012459352 -0.00090612 -0.0022966 -0.00045458 -0.000892701 ...
    0.017751 0.02467 1 1.0222 0.024919 0.0062297],...
    false,0,1000,1);

[BL225C_BL225C,rxnIDexits] = addReaction(BL225C_BL225C,'biomass_rhizosphere_c0',...
    {'cpd00010[c]','cpd00004[c]','cpd00003[c]','cpd00006[c]','cpd00005[c]',...
    'cpd00016[c]','cpd00254[c]','cpd10516[c]','cpd10515[c]','cpd00205[c]',...
    'cpd00034[c]','cpd15665[c]','cpd15560[c]','cpd00042[c]','cpd00264[c]',...
    'cpd00030[c]','cpd00087[c]','cpd00015[c]','cpd00982[c]','cpd00056[c]',...
    'cpd15541[c]','cpd00125[c]','cpd00118[c]','cpd00644[c]','cpd00155[c]',...
    'cpd00166[c]','cpd00149[c]','cpd00393[c]','cpd15312[c]','cpd00220[c]',...
    'cpd15534[c]','cpd00971[c]','cpd00104[c]','cpd12848[c]','cpd00111[c]',...
    'cpd00063[c]','cpd15432[c]','cpd15431[c]','cpd11624[c]','cpdOL[c]',...
    'cpd12836[c]','cpdEPSLn[c]','cpdEPSHn[c]','cpd11461[c]','cpd11613[c]',...
    'cpd11463[c]','cpdNodF[c]','cpd15666[c]','cpd15302[c]','cpd11416[c]',...
    'cpd12837[c]','cpdEPSLn1[c]','cpdEPSHn1[c]'},...
    [-0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.017751 -0.0001 -0.0001 -5.2742e-05 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.012899 -0.0001 -0.00026356 -0.0001 -0.02467...
    -0.0001 -0.0001 -0.0001 -0.0033073 -0.0001 -0.043525 -0.0001 -0.0001...
    -0.0001 -0.0001 -0.0001 -0.0071853 -0.0027253 -0.097369 -0.0033778...
    -1.0222 -0.049837412 -0.012459352 -0.00090612 -0.0022966 -0.00045458 -0.000892701 ...
    0.017751 0.02467 1 1.0222 0.024919 0.0062297],...
    false,0,1000,1);

% Change objective
Rm1021_Rm1021 = changeObjective(Rm1021_Rm1021,'biomass_rhizo_c0');
Rm1021_AK83 = changeObjective(Rm1021_AK83,'biomass_rhizo_c0');
Rm1021_BL225C = changeObjective(Rm1021_BL225C,'biomass_rhizo_c0');
AK83_AK83 = changeObjective(AK83_AK83,'biomass_rhizo_c0');
BL225C_BL225C = changeObjective(BL225C_BL225C,'biomass_rhizo_c0');

% Prevent growth with CO2
Rm1021_Rm1021 = changeRxnBounds(Rm1021_Rm1021,'rxn01111_c0',0,'b');
Rm1021_AK83 = changeRxnBounds(Rm1021_AK83,'rxn01111_c0',0,'b');
Rm1021_BL225C = changeRxnBounds(Rm1021_BL225C,'rxn01111_c0',0,'b');
AK83_AK83 = changeRxnBounds(AK83_AK83,'rxn01111_c0',0,'b');
BL225C_BL225C = changeRxnBounds(BL225C_BL225C,'rxn01111_c0',0,'b');

%% Run FBA and FVA

% FBA analysis
temp = optimizeCbModel(Rm1021_Rm1021,'max');
FBA_Rm1021_Rm1021 = temp.x;
growth_Rm1021_Rm1021 = temp.f;

temp = optimizeCbModel(Rm1021_AK83,'max');
FBA_Rm1021_AK83 = temp.x;
growth_Rm1021_AK83 = temp.f;

temp = optimizeCbModel(Rm1021_BL225C,'max');
FBA_Rm1021_BL225C = temp.x;
growth_Rm1021_BL225C = temp.f;

temp = optimizeCbModel(AK83_AK83,'max');
FBA_AK83_AK83 = temp.x;
growth_AK83_AK83 = temp.f;

temp = optimizeCbModel(BL225C_BL225C,'max');
FBA_BL225C_BL225C = temp.x;
growth_BL225C_BL225C = temp.f;

% FVA analysis
[minFlux_Rm1021_Rm1021,maxFlux_Rm1021_Rm1021] = fluxVariability(Rm1021_Rm1021);
[minFlux_Rm1021_AK83,maxFlux_Rm1021_AK83] = fluxVariability(Rm1021_AK83,100);
[minFlux_Rm1021_BL225C,maxFlux_Rm1021_BL225C] = fluxVariability(Rm1021_BL225C);
[minFlux_AK83_AK83,maxFlux_AK83_AK83] = fluxVariability(AK83_AK83);
[minFlux_BL225C_BL225C,maxFlux_BL225C_BL225C] = fluxVariability(BL225C_BL225C);

%% Reaction essentiality

for n = 1:length(Rm1021_Rm1021.rxns)
    test = Rm1021_Rm1021;
    test = removeRxns(test,Rm1021_Rm1021.rxns{n,1});
    solution = optimizeCbModel(test,'max');
    rxnFitness_Rm1021_Rm1021{n,1} = Rm1021_Rm1021.rxns{n,1};
    rxnFitness_Rm1021_Rm1021{n,2} = round(solution.f,3);
end

for n = 1:length(Rm1021_AK83.rxns)
    test = Rm1021_AK83;
    test = removeRxns(test,Rm1021_AK83.rxns{n,1});
    solution = optimizeCbModel(test,'max');
    rxnFitness_Rm1021_AK83{n,1} = Rm1021_AK83.rxns{n,1};
    rxnFitness_Rm1021_AK83{n,2} = round(solution.f,3);
end

for n = 1:length(Rm1021_BL225C.rxns)
    test = Rm1021_BL225C;
    test = removeRxns(test,Rm1021_BL225C.rxns{n,1});
    solution = optimizeCbModel(test,'max');
    rxnFitness_Rm1021_BL225C{n,1} = Rm1021_BL225C.rxns{n,1};
    rxnFitness_Rm1021_BL225C{n,2} = round(solution.f,3);
end

for n = 1:length(AK83_AK83.rxns)
    test = AK83_AK83;
    test = removeRxns(test,AK83_AK83.rxns{n,1});
    solution = optimizeCbModel(test,'max');
    rxnFitness_AK83_AK83{n,1} = AK83_AK83.rxns{n,1};
    rxnFitness_AK83_AK83{n,2} = round(solution.f,3);
end

for n = 1:length(BL225C_BL225C.rxns)
    test = BL225C_BL225C;
    test = removeRxns(test,BL225C_BL225C.rxns{n,1});
    solution = optimizeCbModel(test,'max');
    rxnFitness_BL225C_BL225C{n,1} = BL225C_BL225C.rxns{n,1};
    rxnFitness_BL225C_BL225C{n,2} = round(solution.f,3);
end

%% Save all output

save('allOutput.mat');
