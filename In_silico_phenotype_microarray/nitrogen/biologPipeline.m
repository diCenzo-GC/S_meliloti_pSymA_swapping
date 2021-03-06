%% Load models

% Load the models
load('cobraModels.mat');
% Set the objective function of the models
Rm1021_Rm1021 = changeObjective(Rm1021_Rm1021,'biomass_bulk_c0');
Rm1021_AK83 = changeObjective(Rm1021_AK83,'biomass_bulk_c0');
Rm1021_BL225C = changeObjective(Rm1021_AK83,'biomass_bulk_c0');
AK83_AK83 = changeObjective(AK83_AK83,'biomass_bulk_c0');
BL225C_BL225C = changeObjective(BL225C_BL225C,'biomass_bulk_c0');

%% Define variables

% Define list of the models
testModels = { Rm1021_Rm1021; Rm1021_AK83; Rm1021_BL225C; AK83_AK83; BL225C_BL225C };
% Model names
models = { 'Rm1021_Rm1021'; 'Rm1021_AK83'; 'Rm1021_BL225C'; 'AK83_AK83'; 'BL225C_BL225C' };
% Define list of the exchange reactions
EXlist = {'EX_cpd00156_e0';'EX_cpd11583_e0';'EX_cpd01242_e0';'EX_cpd00254_e0';'EX_cpd15603_e0';'EX_cpd00067_e0';'EX_cpd11576_e0';'EX_cpd00098_e0';'EX_cpd10516_e0';'EX_cpd00137_e0';'EX_cpd08023_e0';'EX_cpd00205_e0';'EX_cpd00034_e0';'EX_cpd00009_e0';'EX_cpd15606_e0';'EX_cpd00048_e0';'EX_cpd00039_e0';'EX_cpd00106_e0';'EX_cpd00264_e0';'EX_cpd00030_e0';'EX_cpd09878_e0';'EX_cpd00129_e0';'EX_cpd00080_e0';'EX_cpd00119_e0';'EX_cpd01017_e0';'EX_cpd11586_e0';'EX_cpd00060_e0';'EX_cpd00309_e0';'EX_cpd11589_e0';'EX_cpd11578_e0';'EX_cpd15302_c0';'EX_cpd00268_e0';'EX_cpd11584_e0';'EX_cpd15604_e0';'EX_cpd00105_e0';'EX_cpd00041_e0';'EX_cpd11593_e0';'EX_cpd00027_e0';'EX_cpd00001_e0';'EX_cpd00222_e0';'EX_cpd01329_e0';'EX_cpd00210_e0';'EX_cpd11587_e0';'EX_cpd00322_e0';'EX_cpd00971_e0';'EX_cpd00013_e0';'EX_cpd00224_e0';'EX_cpd00540_e0';'EX_cpd00107_e0';'EX_cpd00226_e0';'EX_cpd00036_e0';'EX_cpd03725_e0';'EX_cpd10515_e0';'EX_cpd03343_e0';'EX_cpd03048_e0';'EX_cpd00099_e0';'EX_cpd00104_e0';'EX_cpd11592_e0';'EX_cpd00012_e0';'EX_cpd11579_e0';'EX_cpd11580_e0';'EX_cpd11581_e0';'EX_cpd01012_e0';'EX_cpd01262_e0';'EX_cpd00063_e0';'EX_cpd00307_e0';'EX_cpd01914_e0';'EX_cpd00395_e0';'EX_cpd00531_e0';'EX_cpd03724_e0';'EX_cpd11596_e0';'EX_cpd11585_e0';'EX_cpd11575_e0';'EX_cpd00305_e0';'EX_cpd00209_e0';'EX_cpd11591_e0';'EX_cpd00033_e0';'EX_cpd00092_e0';'EX_cpd00064_e0';'EX_cpd00051_e0';'EX_cpd00154_e0';'EX_cpd00058_e0';'EX_cpd04097_e0';'EX_cpd00149_e0';'EX_cpd00179_e0';'EX_cpd15605_e0';'EX_cpd00073_e0';'EX_cpd00118_e0';'EX_cpd11582_e0';'EX_cpd00637_e0';'EX_cpd11588_e0';'EX_cpd01092_e0';'EX_cpd00023_e0';'EX_cpd00075_e0';'EX_cpd00011_e0';'EX_cpd00007_e0';'EX_cpd11416_c0';'EX_cpd15378_e0';'EX_cpd00147_e0';'EX_cpd00121_e0';'EX_cpd11574_e0';'EX_cpd00392_e0';'EX_cpd00366_e0';'EX_cpd00417_e0';'EX_cpd00567_e0';'EX_cpd03727_e0';'EX_cpd15137_e0';'EX_cpd00396_e0';'EX_cpd00308_e0';'EX_cpd02233_e0';'EX_cpd07061_e0';'EX_cpd00122_e0';'EX_cpd00609_e0';'EX_cpd00108_e0';'EX_cpd00117_e0';'EX_cpd00794_e0';'EX_cpd00138_e0';'EX_cpd01171_e0';'EX_cpd00550_e0';'EX_cpd00588_e0';'EX_cpd00100_e0';'EX_cpd00751_e0';'EX_cpd00164_e0';'EX_cpd00159_e0';'EX_cpd00047_e0';'EX_cpd00314_e0';'EX_cpd00079_e0';'EX_cpd02143_e0';'EX_cpd13391_e0';'EX_cpd00082_e0';'EX_cpd00029_e0';'EX_cpd03198_e0';'EX_cpd00184_e0';'EX_cpd00132_e0';'EX_cpd00320_e0';'EX_cpd02351_e0';'EX_cpd00453_e0';'EX_cpd00024_e0';'EX_cpd00094_e0';'EX_cpd02274_e0';'EX_cpd00208_e0';'EX_cpd04349_e0';'EX_cpd00076_e0';'EX_cpd00249_e0';'EX_cpd00053_e0';'EX_cpd00432_e0';'EX_cpd00089_e0';'EX_cpd00072_e0';'EX_cpd13392_e0';'EX_cpd03561_e0';'EX_cpd11603_e0';'EX_cpd00438_e0';'EX_cpd00182_e0';'EX_cpd00611_e0';'EX_cpd00141_e0';'EX_cpd01246_e0';'EX_cpd00139_e0';'EX_cpd00040_e0';'EX_cpd00158_e0';'EX_cpd00246_e0';'EX_cpd00054_e0';'EX_cpd00161_e0';'EX_cpd00035_e0';'EX_cpd00142_e0';'EX_cpd00492_e0';'EX_cpd00386_e0';'EX_cpd00130_e0';'EX_cpd00489_e0';'EX_cpd00374_e0';'EX_cpd03884_e0';'EX_cpd01067_e0';'EX_cpd00020_e0';'EX_cpd00280_e0';'EX_cpd03161_e0';'EX_cpd00162_e0';'EX_cpd11717_e0';'EX_cpd11594_e0';'EX_cpd11879_e0';'EX_cpd00155_e0';'EX_cpd11602_e0';'EX_cpd11748_e0';'EX_cpd11685_e0';'EX_cpd11601_e0';'EX_cpd00832_e0';'EX_cpd00232_e0';'EX_cpd01055_e0';'EX_cpd05240_e0';'EX_cpd00185_e0';'EX_cpd01307_e0';'EX_cpd03696_e0';'EX_cpd00750_e0';'EX_cpd05158_e0';'EX_cpd09457_e0';'EX_cpd05161_e0';'EX_cpd16821_e0';'EX_cpd01200_e0';'EX_cpd00382_e0';'EX_cpd01030_e0';'EX_cpd00212_e0';'EX_cpd01133_e0';'EX_cpd00589_e0';'EX_cpd00306_e0';'EX_cpd00281_e0';'EX_cpd00339_e0';'EX_cpd00211_e0';'EX_cpd01107_e0';'EX_cpd01113_e0';'EX_cpd01502_e0';'EX_cpd00607_e0';'EX_cpd00276_e0';'EX_cpd00599_e0';'EX_cpd00136_e0';'EX_cpd00797_e0';'EX_cpd00728_e0';'EX_cpd03737_e0';'EX_cpd00380_e0';'EX_cpd00180_e0';'EX_cpd01363_e0';'EX_cpd00248_e0';'EX_cpd05192_e0';'EX_cpd00666_e0';'EX_cpd03734_e0';'EX_cpd00477_e0';'EX_cpd00227_e0';'EX_cpd00066_e0';'EX_cpd01293_e0';'EX_cpd10719_e0';'EX_cpd00266_e0';'EX_cpd01799_e0';'EX_cpd02599_e0';'EX_cpd00157_e0';'EX_cpd01947_e0';'EX_cpd00361_e0';'EX_cpd00851_e0';'EX_cpd02175_e0';'EX_cpd00737_e0';'EX_cpd03963_e0';'EX_cpd00084_e0';'EX_cpd00065_e0';'EX_cpd00069_e0';'EX_cpd01308_e0';'EX_cpd00186_e0';'EX_cpd00549_e0';'EX_cpd03840_e0';'EX_cpd00274_e0';'EX_cpd00165_e0';'EX_cpd00187_e0';'EX_cpd00591_e0';'EX_cpd00152_e0';'EX_cpd00312_e0';'EX_cpd00378_e0';'EX_cpd01524_e0';'EX_cpd02241_e0';'EX_cpd00128_e0';'EX_cpd00367_e0';'EX_cpd00207_e0';'EX_cpd00311_e0';'EX_cpd00151_e0';'EX_cpd01217_e0';'EX_cpd00300_e0';'EX_cpd01573_e0';'EX_cpd01588_e0';'EX_cpd11590_e0';'EX_cpd00919_e0';'EX_cpd00635_e0';'EX_cpd00528_e0';'EX_cpdFixed_e0';'EX_cpd11640_e0';'EX_cpd01024_e0';'EX_cpd00197_e0'};
% Define list of the biolog test compounds
biolog = {'EX_cpd00013_e0','EX_cpd00023_e0','EX_cpd00033_e0','EX_cpd00035_e0','EX_cpd00041_e0','EX_cpd00051_e0','EX_cpd00053_e0','EX_cpd00054_e0','EX_cpd00064_e0','EX_cpd00069_e0','EX_cpd00073_e0','EX_cpd00075_e0','EX_cpd00084_e0','EX_cpd00092_e0','EX_cpd00107_e0','EX_cpd00117_e0','EX_cpd00118_e0','EX_cpd00119_e0','EX_cpd00128_e0','EX_cpd00129_e0','EX_cpd00132_e0','EX_cpd00151_e0','EX_cpd00152_e0','EX_cpd00156_e0','EX_cpd00161_e0','EX_cpd00182_e0','EX_cpd00184_e0','EX_cpd00186_e0','EX_cpd00187_e0','EX_cpd00207_e0','EX_cpd00209_e0','EX_cpd00227_e0','EX_cpd00246_e0','EX_cpd00274_e0','EX_cpd00281_e0','EX_cpd00300_e0','EX_cpd00307_e0','EX_cpd00309_e0','EX_cpd00311_e0','EX_cpd00322_e0','EX_cpd00367_e0','EX_cpd00378_e0','EX_cpd01092_e0','EX_cpd01217_e0','EX_cpd01293_e0','EX_cpd11580_e0','EX_cpd11580_e0','EX_cpd11581_e0','EX_cpd11582_e0','EX_cpd11583_e0','EX_cpd11584_e0','EX_cpd11585_e0','EX_cpd11586_e0','EX_cpd11587_e0','EX_cpd11590_e0','EX_cpd11591_e0','EX_cpd11593_e0','EX_cpd00065_e0','EX_cpd00165_e0','EX_cpd00312_e0','EX_cpd00477_e0','EX_cpd00550_e0','EX_cpd01308_e0','EX_cpd01524_e0','EX_cpd01573_e0','EX_cpd03161_e0','EX_cpd03840_e0','EX_cpd00039_e0','EX_cpd00060_e0','EX_cpd00066_e0','EX_cpd00122_e0','EX_cpd00162_e0','EX_cpd00249_e0','EX_cpd00276_e0','EX_cpd00320_e0','EX_cpd00339_e0','EX_cpd00374_e0','EX_cpd00492_e0','EX_cpd00549_e0','EX_cpd00591_e0','EX_cpd00832_e0','EX_cpd01588_e0','EX_cpd02241_e0','EX_cpd03734_e0','EX_cpd03963_e0'};
% Define a nitrogen free minimal medium for the biolog experiments
carbonFreeMinimal = { 'EX_cpd00001_e0', 'EX_cpd00007_e0', 'EX_cpd00009_e0', 'EX_cpd00149_e0', 'EX_cpd00036_e0', 'EX_cpd00030_e0', 'EX_cpd00034_e0', 'EX_cpd00048_e0', 'EX_cpd00058_e0', 'EX_cpd00063_e0', 'EX_cpd00067_e0', 'EX_cpd00099_e0', 'EX_cpd00104_e0', 'EX_cpd00149_e0', 'EX_cpd00205_e0', 'EX_cpd00254_e0', 'EX_cpd00971_e0', 'EX_cpd10515_e0', 'EX_cpd10516_e0', 'EX_cpd00305_e0' };
% Prepare output matrix
results = cell(length(biolog)+1,length(testModels)+3);

%% Test models don't grow as expected without nitrogen

for n = 1:length(testModels)
    % Turn off all of the exchange reactions
    test = changeRxnBounds(testModels{n,1},EXlist,0,'l');
    % Check if the model grows on nothing
    checkpoint = optimizeCbModel(test,'max');
    if checkpoint.f > 0
        warning('pranic feeding detected')
    end
    % Set nitrogen-free minimal medium and check if the model grows 
    test = changeRxnBounds(test,carbonFreeMinimal,-10,'l');
    checkpoint = optimizeCbModel(test,'max');
    if checkpoint.f > 0
        warning('nitrogen-based lifeform detected')
    end
end

%% Rename the compounds in results file

% Call metabolites the way they are called in the actual biolog experiments
Rm1021_Rm1021.metNames = lower(Rm1021_Rm1021.metNames);
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'_e0','');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'_','-');
Rm1021_Rm1021.metNames = regexprep(Rm1021_Rm1021.metNames,'(.*)ate$','$1ic acid');
Rm1021_Rm1021.metNames = regexprep(Rm1021_Rm1021.metNames,'hydroxy ([^\d]*)','hydroxy$1');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'tartric','tartaric');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'gly-pro-l','gly-pro');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'gly-asp-l','gly-asp');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'gly-glu-l','gly-glu');
Rm1021_Rm1021.metNames = strrep(Rm1021_Rm1021.metNames,'phosphic acid','phosphate');

% Find out the real names of the compounds
metIDs = strrep(biolog,'EX_','');
metIDs = strrep(metIDs,'_e0','[e]');
metNames = cell(length(metIDs),3);
metNames(:,2) = strrep(metIDs,'_e0','');
metNames(:,3) = strrep(metIDs,'_e0','');
for n = 1:length(metIDs)
    metNames{n,1} = Rm1021_Rm1021.metNames(strmatch(metIDs(n),Rm1021_Rm1021.mets,'exact'));
end

%% Perform the Biolog experiment

% Add headers to output
results{1,1} = 'exchangeRxn';
results{1,2} = 'cpdNumber';
results{1,3} = 'metaboliteName';

% Do phenotype microarray and save output
for n = 1:length(testModels)
    results{1,n+3} = models{n};
    tmpTest = changeRxnBounds(testModels{n},EXlist,0,'l');
    tmpTest = changeRxnBounds(tmpTest,carbonFreeMinimal,-100,'l');
    tmpTest = changeRxnBounds(tmpTest,'EX_cpd00036_e0',-5,'l');
    for m = 1:length(biolog)
        tmpTest2 = changeRxnBounds(tmpTest,biolog(m),-.1,'l');
        growth = optimizeCbModel(tmpTest2,'max');
        results{m+1,n+3} = round(growth.f,4);
        results{m+1,2} = metNames{m,2};
        results{m+1,3} = metNames{m,1};
        results{m+1,1} = biolog(m);
    end
end
% Transfer results to new variable
outputBIOLOG = results;

%% Save files and clean workspace

save('allOutput.mat')
clearvars -except output*
save('outputVariables.mat')
outputBIOLOG2 = cell2table(outputBIOLOG)
writetable(outputBIOLOG2,'biologModellingOutput.xlsx','Sheet',1,'WriteVariableNames',false)
