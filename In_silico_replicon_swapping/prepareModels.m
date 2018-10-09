%% Load the starting files

load('startingModels.mat');
load('orthologLists.mat');
load('genomeGeneLists.mat');
Rm1021_Rm1021 = readCbModel('iGD1575b.xml')

% Note, imported iGD1575b from other computer to get same metabolite
% format.  Also remember the N2 fixation rxn modified, and I need to
% fix the stoichiometry of this reaction and remove the FALSE
% after the enhancement.  And remove the metCharge field.  Actually, I do
% not need to remove the metCharge field, it is properly imported on the
% other computer.

%% Remove a duplicated reaction in the Rm1021 model

Rm1021_Rm1021 = removeRxns(Rm1021_Rm1021, 'rxn05608_c0');

%% Enhance the draft model

enhanced_BL225C = enhanceDraftModel(BL225Cmodel_correct,Rm1021_Rm1021,corrispondentigenomesBL225C,0);

%% Fix the model

% Add the protein synthesis reaction to BL225C
BL225C_BL225C = addReaction(enhanced_BL225C, ...
    'rxn12192', ...
    '4.2 cpd00002[c] + 228 cpd12194[c] + 1197 cpd11770[c] + 730 cpd12036[c] + 93 cpd12255[c] + 843 cpd12100[c] + 210 cpd12228[c] + 546 cpd12256[c] + 1015 cpd12003[c] + 319 cpd01326[c] + 213 cpd12105[c] + 393 cpd12335[c] + 501 cpd12164[c] + 578 cpd12132[c] + 513 cpd12229[c] + 138 cpd12336[c] + 755 cpd12133[c] + 30 cpd12285[c] + 529 cpd12226[c] + 582 cpd12227[c] + 289 cpd12060[c] + 263 cpd12313[c] + 19930 cpd00038[c]  -> 228 cpd11751[c] + 1197 cpd11906[c] + 730 cpd11907[c] + 263 cpd11908[c] + 529 cpd11909[c] + 93 cpd11910[c] + 289 cpd11911[c] + 582 cpd11912[c] + 843 cpd11913[c] + 210 cpd11914[c] + 546 cpd11915[c] + 1015 cpd11916[c] + 319 cpd11917[c] + 243 cpd11918[c] + 393 cpd11919[c] + 501 cpd11920[c] + 578 cpd11921[c] + 513 cpd11922[c] + 138 cpd11923[c] + 755 cpd11924[c] + cpd11463[c] + 9964 cpd00001[c] + 19934.2 cpd00009[c] + 4.2 cpd00008[c] + 19930 cpd00031[c]');
BL225C_BL225C = changeGeneAssociation(BL225C_BL225C, ...
    'rxn12192', ...
    '(Annotated_BL225C.CDS.10484 and Annotated_BL225C.CDS.10496 and Annotated_BL225C.CDS.10526 and Annotated_BL225C.CDS.10527 and Annotated_BL225C.CDS.10609 and Unknown and Annotated_BL225C.CDS.7901 and Annotated_BL225C.CDS.7903 and Annotated_BL225C.CDS.7904 and Annotated_BL225C.CDS.8009 and Annotated_BL225C.CDS.8010 and Annotated_BL225C.CDS.8061 and Annotated_BL225C.CDS.8109 and Annotated_BL225C.CDS.8110 and Annotated_BL225C.CDS.1047 and Annotated_BL225C.CDS.8112 and Annotated_BL225C.CDS.8117 and Annotated_BL225C.CDS.8118 and Annotated_BL225C.CDS.8121 and Annotated_BL225C.CDS.8122 and Annotated_BL225C.CDS.8123 and Annotated_BL225C.CDS.8124 and Annotated_BL225C.CDS.8125 and Annotated_BL225C.CDS.8126 and Annotated_BL225C.CDS.8127 and Annotated_BL225C.CDS.8128 and Annotated_BL225C.CDS.8129 and Annotated_BL225C.CDS.8130 and Annotated_BL225C.CDS.8131 and Annotated_BL225C.CDS.8132 and Annotated_BL225C.CDS.8133 and Annotated_BL225C.CDS.8134 and Annotated_BL225C.CDS.8135 and Annotated_BL225C.CDS.8136 and Annotated_BL225C.CDS.8137 and Annotated_BL225C.CDS.8138 and Annotated_BL225C.CDS.8139 and Annotated_BL225C.CDS.8140 and Annotated_BL225C.CDS.8141 and Annotated_BL225C.CDS.8144 and Annotated_BL225C.CDS.8145 and Annotated_BL225C.CDS.8147 and Annotated_BL225C.CDS.8267 and Annotated_BL225C.CDS.8673 and Annotated_BL225C.CDS.9008 and Annotated_BL225C.CDS.9313 and Annotated_BL225C.CDS.9632 and Annotated_BL225C.CDS.9738 and Annotated_BL225C.CDS.9751 and Annotated_BL225C.CDS.9818 and Annotated_BL225C.CDS.10059 and Annotated_BL225C.CDS.10060 and Annotated_BL225C.CDS.10149 and Annotated_BL225C.CDS.10153 and Annotated_BL225C.CDS.10171 and (Unknown or Unknown or Unknown) and (Unknown or Unknown or Unknown) and (Unknown or Unknown or Unknown))');

% Change metabolite formats in Rm1021_Rm1021
Rm1021_Rm1021.mets = strrep(Rm1021_Rm1021.mets,'_c0','[c]');
Rm1021_Rm1021.mets = strrep(Rm1021_Rm1021.mets,'_e0','[e]');

% Note, found the equations above using the findRxnsFromGenes function

%% Find pSymA genes

% Pull out the pSymA genes present in iGD1575b
genesRm1021modelA = Rm1021_Rm1021.genes(strmatch('sma',Rm1021_Rm1021.genes));

% Pull out the pSymA genes present in enhanced_BL225C
genesBL225CmodelA = BL225C_BL225C.genes(transpose(ismember(BL225C_BL225C.genes',genesBL225CAB')));

%% Produce the swapped model

% Introduce the BL225C pSymA replicon
[Rm1021_BL225C,doubleRxns_BL225CpSymA_1,duplicateRxns_BL225CpSymA_1,redundantGenes_BL225CpSymA_1]=...
    repliconSwap(Rm1021_Rm1021,BL225C_BL225C,genesRm1021modelA,...
    genesBL225CmodelA,corrispondentigenomesBL225C);

%% Fix model formatting

% Remove the or False from the swapped model
Rm1021_BL225C.grRules = strrep(Rm1021_BL225C.grRules,'or False','');

% Fix reaction names for exporting
Rm1021_Rm1021.rxnNames = strrep(Rm1021_Rm1021.rxnNames,'–','_');
Rm1021_BL225C.rxnNames = strrep(Rm1021_BL225C.rxnNames,'–','_');
BL225C_BL225C.rxnNames = strrep(BL225C_BL225C.rxnNames,'–','_');

%% Save files

% Save workspace
save('allOutput.mat');
clearvars -except Rm1021_BL225C Rm1021_Rm1021 BL225C_BL225C
save('finalModels.mat');

% Export models
writeCbToSBML(Rm1021_Rm1021,'Rm1021_Rm1021_cobraExport.xml');
writeCbToSBML(Rm1021_BL225C,'Rm1021_BL225C_cobraExport.xml');
writeCbToSBML(BL225C_BL225C,'BL225C_BL225C_cobraExport.xml');
