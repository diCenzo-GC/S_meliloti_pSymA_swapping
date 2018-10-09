%% Load data

load('allOutput.mat');

%% Identify all reactions across models

allReactions = union(Rm1021_Rm1021.rxns,Rm1021_BL225C.rxns);
allReactions = union(allReactions,BL225C_BL225C.rxns);

%% change variable type

FBA_Rm1021_Rm1021 = num2cell(FBA_Rm1021_Rm1021);
FBA_Rm1021_BL225C = num2cell(FBA_Rm1021_BL225C);
FBA_BL225C_BL225C = num2cell(FBA_BL225C_BL225C);

minFlux_Rm1021_Rm1021 = num2cell(minFlux_Rm1021_Rm1021);
minFlux_Rm1021_BL225C = num2cell(minFlux_Rm1021_BL225C);
minFlux_BL225C_BL225C = num2cell(minFlux_BL225C_BL225C);

maxFlux_Rm1021_Rm1021 = num2cell(maxFlux_Rm1021_Rm1021);
maxFlux_Rm1021_BL225C = num2cell(maxFlux_Rm1021_BL225C);
maxFlux_BL225C_BL225C = num2cell(maxFlux_BL225C_BL225C);

%% Combine output

combinedOutput = allReactions;

for n = 1:length(allReactions)
   IDX = strmatch(allReactions{n,1},Rm1021_Rm1021.rxns,'exact');
   if IDX > 0
       combinedOutput{n,2} = round((rxnFitness_Rm1021_Rm1021{IDX,2}/growth_Rm1021_Rm1021),2);
       combinedOutput{n,3} = (FBA_Rm1021_Rm1021{IDX,1}/growth_Rm1021_Rm1021);
       combinedOutput{n,4} = (minFlux_Rm1021_Rm1021{IDX,1}/growth_Rm1021_Rm1021);
       combinedOutput{n,5} = (maxFlux_Rm1021_Rm1021{IDX,1}/growth_Rm1021_Rm1021);
   else
       test2{n,2} = 'NA';
       test2{n,3} = 'NA';
       test2{n,4} = 'NA';
       test2{n,5} = 'NA';
   end
end

for n = 1:length(allReactions)
   IDX = strmatch(allReactions{n,1},Rm1021_BL225C.rxns,'exact');
   if IDX > 0
       combinedOutput{n,6} = round((rxnFitness_Rm1021_BL225C{IDX,2}/growth_Rm1021_BL225C),2);
       combinedOutput{n,7} = (FBA_Rm1021_BL225C{IDX,1}/growth_Rm1021_BL225C);
       combinedOutput{n,8} = (minFlux_Rm1021_BL225C{IDX,1}/growth_Rm1021_BL225C);
       combinedOutput{n,9} = (maxFlux_Rm1021_BL225C{IDX,1}/growth_Rm1021_BL225C);
   else
       test2{n,6} = 'NA';
       test2{n,7} = 'NA';
       test2{n,8} = 'NA';
       test2{n,9} = 'NA';
   end
end

for n = 1:length(allReactions)
   IDX = strmatch(allReactions{n,1},BL225C_BL225C.rxns,'exact');
   if IDX > 0
       combinedOutput{n,10} = round((rxnFitness_BL225C_BL225C{IDX,2}/growth_BL225C_BL225C),2);
       combinedOutput{n,11} = (FBA_BL225C_BL225C{IDX,1}/growth_BL225C_BL225C);
       combinedOutput{n,12} = (minFlux_BL225C_BL225C{IDX,1}/growth_BL225C_BL225C);
       combinedOutput{n,13} = (maxFlux_BL225C_BL225C{IDX,1}/growth_BL225C_BL225C);
   else
       test2{n,10} = 'NA';
       test2{n,11} = 'NA';
       test2{n,12} = 'NA';
       test2{n,13} = 'NA';
   end
end

% Replace empty fitness cells with 1
for n = 1:length(combinedOutput)
    for m = [2 6 10]
        if isempty(combinedOutput{n,m})
            combinedOutput{n,m} = 1;
        end
    end
end

% Replace empty flux cells with 0
for n = 1:length(combinedOutput)
    for m = [3 4 5 7 8 9 11 12 13]
        if isempty(combinedOutput{n,m})
            combinedOutput{n,m} = 0;
        end
    end
end

% Replace 0 FBA values with half the minimum FBA value
for n = 1:length(combinedOutput)
    for m = [2:13]
        if combinedOutput{n,m} == 0
            combinedOutputTemp{n,m-1} = 100;
        elseif abs(combinedOutput{n,m}) > 0
            combinedOutputTemp{n,m-1} = abs(combinedOutput{n,m});
        end
    end
end
minimum = (min(min(cell2mat(combinedOutputTemp)))/2);
minimum = num2cell(minimum);
for n = 1:length(combinedOutput)
    for m = [3 7 11]
        if combinedOutput{n,m} == 0
            combinedOutput{n,m} = minimum{1,1};
        end
    end
end

%% Compare essentiality

x=0;
for n = 1:length(allReactions)
    if round(combinedOutput{n,2} - combinedOutput{n,6},2) ~= 0
        x=x+1;
        reactionEssDifferences{x,1} = combinedOutput{n,1};
        reactionEssDifferences{x,2} = combinedOutput{n,2};
        reactionEssDifferences{x,3} = combinedOutput{n,6};
        reactionEssDifferences{x,4} = combinedOutput{n,10};
    elseif round(combinedOutput{n,2} - combinedOutput{n,10},2) ~= 0
        x=x+1;
        reactionEssDifferences{x,1} = combinedOutput{n,1};
        reactionEssDifferences{x,2} = combinedOutput{n,2};
        reactionEssDifferences{x,3} = combinedOutput{n,6};
        reactionEssDifferences{x,4} = combinedOutput{n,10};
    end
end

%% Compare flux

x=0;
for n = 1:length(allReactions)
    if abs((combinedOutput{n,3} - combinedOutput{n,7}) / combinedOutput{n,3}) > 0.1 
        x=x+1;
        reactionFbaDifferences{x,1} = combinedOutput{n,1};
        reactionFbaDifferences{x,2} = combinedOutput{n,3};
        reactionFbaDifferences{x,3} = combinedOutput{n,7};
        reactionFbaDifferences{x,4} = combinedOutput{n,11};
    elseif abs((combinedOutput{n,3} - combinedOutput{n,11}) / combinedOutput{n,3}) > 0.1 
        x=x+1;
        reactionFbaDifferences{x,1} = combinedOutput{n,1};
        reactionFbaDifferences{x,2} = combinedOutput{n,3};
        reactionFbaDifferences{x,3} = combinedOutput{n,7};
        reactionFbaDifferences{x,4} = combinedOutput{n,11};
    end
end

%% Compare flux variability

x=0;
for n = 1:length(reactionFbaDifferences)
    IDX = strmatch(reactionFbaDifferences{n,1},combinedOutput(:,1),'exact');
    if abs((reactionFbaDifferences{n,2} - reactionFbaDifferences{n,3}) / reactionFbaDifferences{n,2}) > 0.1
        if reactionFbaDifferences{n,2} < reactionFbaDifferences{n,3}
            if combinedOutput{IDX,5} < combinedOutput{IDX,8}
                x=x+1;
                reactionFvaDifferences{x,1} = reactionFbaDifferences{n,1};
                reactionFvaDifferences{x,2} = reactionFbaDifferences{n,2};
                reactionFvaDifferences{x,3} = reactionFbaDifferences{n,3};
                reactionFvaDifferences{x,4} = reactionFbaDifferences{n,4};
            end
        elseif reactionFbaDifferences{n,2} > reactionFbaDifferences{n,3}
            if combinedOutput{IDX,4} > combinedOutput{IDX,9}
                x=x+1;
                reactionFvaDifferences{x,1} = reactionFbaDifferences{n,1};
                reactionFvaDifferences{x,2} = reactionFbaDifferences{n,2};
                reactionFvaDifferences{x,3} = reactionFbaDifferences{n,3};
                reactionFvaDifferences{x,4} = reactionFbaDifferences{n,4};
            end
        end
    elseif abs((reactionFbaDifferences{n,2} - reactionFbaDifferences{n,4}) / reactionFbaDifferences{n,2}) > 0.1
        if reactionFbaDifferences{n,2} < reactionFbaDifferences{n,4}
            if combinedOutput{IDX,5} < combinedOutput{IDX,12}
                x=x+1;
                reactionFvaDifferences{x,1} = reactionFbaDifferences{n,1};
                reactionFvaDifferences{x,2} = reactionFbaDifferences{n,2};
                reactionFvaDifferences{x,3} = reactionFbaDifferences{n,3};
                reactionFvaDifferences{x,4} = reactionFbaDifferences{n,4};
            end
        elseif reactionFbaDifferences{n,2} > reactionFbaDifferences{n,4}
            if combinedOutput{IDX,4} > combinedOutput{IDX,13}
                x=x+1;
                reactionFvaDifferences{x,1} = reactionFbaDifferences{n,1};
                reactionFvaDifferences{x,2} = reactionFbaDifferences{n,2};
                reactionFvaDifferences{x,3} = reactionFbaDifferences{n,3};
                reactionFvaDifferences{x,4} = reactionFbaDifferences{n,4};
            end
        end
    end
end

%% Save the data

save('allParsedData.mat');
clearvars -except reactionEssDifferences reactionFbaDifferences reactionFvaDifferences combinedOutput;
save('outputData.mat');
reactionEssDifferences2 = cell2table(reactionEssDifferences);
reactionFbaDifferences2 = cell2table(reactionFbaDifferences);
reactionFvaDifferences2 = cell2table(reactionFvaDifferences);
combinedOutput2 = cell2table(combinedOutput);
writetable(reactionEssDifferences2,'modellingAllOutputData.xlsx','Sheet',1,'WriteVariableNames',false);
writetable(reactionFvaDifferences2,'modellingAllOutputData.xlsx','Sheet',2,'WriteVariableNames',false);
writetable(reactionFbaDifferences2,'modellingAllOutputData.xlsx','Sheet',3,'WriteVariableNames',false);
writetable(combinedOutput2,'modellingAllOutputData.xlsx','Sheet',4,'WriteVariableNames',false);
clear;



