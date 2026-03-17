LunarData = readtable("C:\Users\ganes\Downloads\ch3_chaste\LTA_CHASTE\data\raw\nominal_operation\20230830\ch3_cht_raw_20230830T19_008307010_v1.csv");
% change the file source location to your computer file location
CleanedData = LunarData(:, 2:end);
% 1. Train the model
% 'ContaminationFraction' is the expected % of anomalies (e.g., 0.05 = 5%)
[model, instances, scores] = iforest(CleanedData, 'NumLearners', 100, 'ContaminationFraction', 0.05);

% 2. Identify anomalies
% 'tf' will be a logical array where 1 (true) is an anomaly
tf = isanomaly(model, CleanedData);

figure
plot(scores, 'LineWidth', 1)
hold on
% Draw a red line where the model decided the cutoff is
line([0, length(scores)], [model.ScoreThreshold, model.ScoreThreshold], 'Color', 'r', 'LineStyle', '--')
title('Lunar Data Anomaly Scores')
xlabel('Observation Index (Time)')
ylabel('Anomaly Score')
grid on

