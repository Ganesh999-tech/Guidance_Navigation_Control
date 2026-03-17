# Guidance_Navigation_Control

Lunar Anomaly Detection: Isolation Forest on ChaSTE Data

This project implements an Unsupervised Machine Learning approach to identify anomalies in lunar surface thermophysical data. Using the Isolation Forest algorithm in MATLAB, I analyzed telemetry from the Chandrayaan-3 ChaSTE (Chandra's Surface Thermophysical Experiment) instrument to detect deviations in thermal behavior.
🚀 Project Overview

The goal of this project is to distinguish between normal lunar diurnal (day/night) thermal cycles and potential anomalies such as sensor glitches, instrumentation errors, or unexpected geological thermal events.
Algorithm: Isolation Forest

The Isolation Forest works by "isolating" observations:

    Normal observations require many random partitions to be isolated.

    Anomalies are few and different, resulting in shorter paths in the decision trees.

    Key Benefit: It is highly effective for high-dimensional sensor data where "normal" behavior is complex.

🛠️ Implementation Steps
1. Data Acquisition

The dataset consists of raw telemetry from the LTA_CHASTE mission (August 30, 2023).

    Source: ISRO/Pradan Lunar Data.

    Format: CSV (Comma Separated Values).

2. Pre-processing

To ensure the model focuses purely on physical sensor readings, the non-numeric metadata (such as timestamps or packet IDs in column 1) was removed.
Matlab

CleanedData = LunarData(:, 2:end);

3. Model Training

The forest was trained using 100 trees (Learners). We assumed a 5% contamination fraction, meaning the model identifies the top 5% most "isolated" points as anomalies.
Matlab

[model, ~, scores] = iforest(CleanedData, 'NumLearners', 100, 'ContaminationFraction', 0.05);

4. Anomaly Identification & Thresholding

The model calculates an Anomaly Score. A score closer to 1 indicates a high probability of an anomaly. The threshold is automatically determined based on the statistical distribution of the scores and our 5% assumption.
📊 Results & Visualization

The plot below illustrates the calculated anomaly scores for the lunar dataset. The Red Dashed Line represents the calculated ScoreThreshold. Any data point (Blue Line) crossing above this threshold is flagged as a mission anomaly.
🔧 Tools Used

    MATLAB (Statistics and Machine Learning Toolbox)

    Dataset: Chandrayaan-3 ChaSTE Raw Telemetry

    Concepts: Unsupervised Learning, Ensemble Methods, Signal Processing

📖 How to Run

    Ensure you have the Statistics and Machine Learning Toolbox installed in MATLAB.

    Update the file path in the readtable function to your local directory.

    Run the script to generate the anomaly score plot and the tf (True/False) anomaly vector.
